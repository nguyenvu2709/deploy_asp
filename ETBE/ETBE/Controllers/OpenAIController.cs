using Microsoft.AspNetCore.Mvc;
using OpenAI_API.Completions;
using OpenAI_API;
using Microsoft.AspNetCore.Http;


namespace ETBE.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]

    public class OpenAIController : ControllerBase
    {
       

        [HttpGet]
        public async Task<IActionResult> GetData(string input)
        {
            string apiKey = "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";
            string response = "";
            OpenAIAPI openai = new OpenAIAPI(apiKey);
            CompletionRequest completion = new CompletionRequest();
            completion.Prompt = input;
            completion.Model = "text-davinci-003";
            completion.MaxTokens = 4000;
            var output = await openai.Completions.CreateCompletionAsync(completion);
            if (output != null)
            {
                foreach (var item in output.Completions)
                {
                    response = item.Text;
                }
                return Ok(response);
            }
            else
            {
                return BadRequest("Not found");
            }
        }
    }
}
