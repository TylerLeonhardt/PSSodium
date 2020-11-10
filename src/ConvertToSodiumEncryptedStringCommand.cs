using System;
using System.Text;
using System.Management.Automation;
using Sodium;

namespace PSSodium
{
    [Cmdlet(VerbsData.ConvertTo,"SodiumEncryptedString")]
    [OutputType(typeof(string))]
    public class ConvertToSodiumEncryptedStringCommand : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string Text { get; set; }

        [Parameter(
            Mandatory = true,
            Position = 1,
            ValueFromPipelineByPropertyName = true)]
        public string PublicKey { get; set; }

        // This method gets called once for each cmdlet in the pipeline when the pipeline starts executing
        protected override void BeginProcessing()
        {
        }

        // This method will be called for each input received from the pipeline to this cmdlet; if no input is received, this method is not called
        protected override void ProcessRecord()
        {
            byte[] byteArr = Encoding.UTF8.GetBytes(Text);
            byte[] publicKey = Convert.FromBase64String(PublicKey);
            byte[] sealedPublicKeyBox = SealedPublicKeyBox.Create(byteArr, publicKey);
            WriteObject(Convert.ToBase64String(sealedPublicKeyBox));
        }

        // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
        }
    }
}
