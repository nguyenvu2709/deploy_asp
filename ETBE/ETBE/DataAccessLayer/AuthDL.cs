
using ETBE.DataAccessLayer;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using ETBE.Models;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.AspNetCore.Identity;
using System.Data;
using System.Reflection.PortableExecutable;

namespace ETBE.DataAccessLayer
{
    public class AuthDL : IAuthDL
    {
        public readonly IConfiguration _configuration;
        public readonly SqlConnection _mySqlConnection;

        public AuthDL(IConfiguration configuration)
        { 
            _configuration = configuration;
            _mySqlConnection = new SqlConnection(_configuration["ConnectionStrings:MySqlDBConnection"]);
        }

        public async Task<SignInResponse> SignIn(SignInRequest request)
        {
            SignInResponse response = new SignInResponse();
            response.IsSuccess = true;
            response.Message = "Successful";
            try
            {

                if (_mySqlConnection.State != System.Data.ConnectionState.Open)
                {
                    await _mySqlConnection.OpenAsync();
                }

                string SqlQuery = @"SELECT * 
                                    FROM Users
                                    WHERE UserName=@UserName AND PassWord=@PassWord And RoleID=@RoleID;"
                ;

                using (SqlCommand sqlCommand = new SqlCommand(SqlQuery, _mySqlConnection))
                {
                    sqlCommand.CommandType = System.Data.CommandType.Text;
                    sqlCommand.CommandTimeout = 180;
                    sqlCommand.Parameters.AddWithValue("@UserName", request.UserName);
                    sqlCommand.Parameters.AddWithValue("@PassWord", request.Password);
                    sqlCommand.Parameters.AddWithValue("@RoleID", request.RoleID);
                    using (DbDataReader dataReader = await sqlCommand.ExecuteReaderAsync())
                    {
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                var userId = (int)dataReader[0];
                                string message = userId.ToString();
                                response.Message = message;

                                //Do something with the user_id
                            }
                        }
                        else
                        {
                            response.IsSuccess = false;
                            response.Message = "Login Unsuccessfully";
                            return response;
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            finally
            {

            }

            return response;
        }
        public async Task<SignInResponse> SignInAll(SignInAll request)
        {
            SignInResponse response = new SignInResponse();
            response.IsSuccess = true;
            response.Message = "Successful";
            try
            {

                if (_mySqlConnection.State != System.Data.ConnectionState.Open)
                {
                    await _mySqlConnection.OpenAsync();
                }

                string SqlQuery = @"SELECT  * 
                                    FROM Users
                                    WHERE UserName=@UserName AND PassWord=@PassWord;"
                ;


                using (SqlCommand sqlCommand = new SqlCommand(SqlQuery, _mySqlConnection))
                {
                    sqlCommand.CommandType = System.Data.CommandType.Text;
                    sqlCommand.CommandTimeout = 180;
                    sqlCommand.Parameters.AddWithValue("@UserName", request.UserName);
                    sqlCommand.Parameters.AddWithValue("@PassWord", request.Password);
                    using (DbDataReader dataReader = await sqlCommand.ExecuteReaderAsync())
                    {
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                var userId = (int)dataReader[0];
                                string message = userId.ToString();
                                response.Message = message;

                                //Do something with the user_id
                            }
                            
                        }
                        else
                        {
                            response.IsSuccess = false;
                            response.Message = "Login Unsuccessfully";
                            return response;
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            finally
            {

            }

            return response;
        }

        public async Task<SignUpResponse> SignUp(SignUpRequest request)
        {
            SignUpResponse response = new SignUpResponse();
            response.IsSuccess = true;
            response.Message = "Successful";
            try
            {
                if (_mySqlConnection.State != System.Data.ConnectionState.Open)
                {
                    await _mySqlConnection.OpenAsync();
                }

#pragma warning disable CS8602 // Dereference of a possibly null reference.
                if (!request.Password.Equals(request.ConfigPassword))
                {
                    response.IsSuccess = false;
                    response.Message = "Password & Confirm Password not Match";
                    return response;
                }
#pragma warning restore CS8602 // Dereference of a possibly null reference.

                string query = "SELECT COUNT(*) FROM Users WHERE Username = @username";
                
                string SqlQuery = @"INSERT INTO Users (UserName, PassWord, FullName, Email, Phone, Address) 
                                        VALUES (@UserName, @PassWord,@FullName, @Email, @Phone, @Address)";

                using (SqlCommand command = new SqlCommand(query, _mySqlConnection))
                {
                    command.Parameters.AddWithValue("@username", request.UserName);
                 

                    int count = (int)command.ExecuteScalar();
                    if (count > 0)
                    {
                        response.IsSuccess = false;
                        response.Message = "User name Exist";
                        return response;
                       
                    }
                    else
                    {

                        using (SqlCommand sqlCommand = new SqlCommand(SqlQuery, _mySqlConnection))
                        {
                            sqlCommand.CommandType = System.Data.CommandType.Text;
                            sqlCommand.CommandTimeout = 180;
                            sqlCommand.Parameters.AddWithValue("@UserName", request.UserName);
                            sqlCommand.Parameters.AddWithValue("@PassWord", request.Password);
                            sqlCommand.Parameters.AddWithValue("@FullName", request.FullName);
                            sqlCommand.Parameters.AddWithValue("@Email", request.Email);
                            sqlCommand.Parameters.AddWithValue("@Phone", request.Phone);
                            sqlCommand.Parameters.AddWithValue("@Address", request.Address);
                            int Status = await sqlCommand.ExecuteNonQueryAsync();
                            if (Status <= 0)
                            {
                                response.IsSuccess = false;
                                response.Message = "Something Went Wrong";
                                return response;
                            }
                        }
                    }
                }
            }
                
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            finally
            {

            }

            return response;
        }

    }
}

