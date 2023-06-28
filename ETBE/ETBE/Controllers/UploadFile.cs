
using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Mvc;

namespace ETBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadFile: ControllerBase
    {
        [HttpPost]
        public async Task<IActionResult> UploadFileName(IFormFile file)
        {
            //Save File In Local
            if (file != null && file.Length > 0)
            {
                //Create Path representing file name
                string fileName = Path.GetFileName(file.FileName);

                //Grab the file path from wwwroot of local project
                string path = Path.Combine(Directory.GetCurrentDirectory(), @"Images", fileName);

                // Create a file stream to read a file
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    //Copy file to stream from IFormFile
                    await file.CopyToAsync(stream);
                }
            }
            return Ok();
        }

    }
}
