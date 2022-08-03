using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Text;
using System.Threading.Tasks;
using TestCLI.Models;

namespace TestCLI.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        public ActionResult AutoMigrate(IFormCollection form)
        {
            //  ProcessStartInfo startInfo = new ProcessStartInfo();

            string _endUserRepository = Convert.ToString(form["txtRepo"]);
            string _repoToken = Convert.ToString(form["txtRepoToken"]);
            string _appSvcName = Convert.ToString(form["txtAppName"]);
            string _resGroupName = Convert.ToString(form["txtRGName"]);
            string _sourceBranch = Convert.ToString(form["txtSourceName"]);

            string _resGroupName1 = Convert.ToString(form["txtRGName"]);
            string _sourceBranch2 = Convert.ToString(form["txtSourceName"]);

            string _repo = Convert.ToString(form["txtRepo"]);
            string _repTok = Convert.ToString(form["txtRepoToken"]);
            string _orgName = Convert.ToString(form["txtOrgName"]);
            string _orgPAT = Convert.ToString(form["txtPAT"]);
            string _orgProj = Convert.ToString(form["txtAzProject"]);
            string _ProjID = Convert.ToString(form["txtAzProjectId"]);

            string _repoName = Convert.ToString(form["txtAzRepo"]);
            var scriptfile = "";
            string _repoId = "";
            if (string.IsNullOrEmpty(_sourceBranch))
            {

                scriptfile = @".\wwwroot\lib\Automate_CICDAzure.ps1";

            }
            else
            {

                scriptfile = @".\wwwroot\lib\Automate_CICDAzure.ps1";
            }



            PowerShell powershell = PowerShell.Create();

            //RunspaceConfiguration runspaceConfiguration = RunspaceConfiguration.Create();
            //Runspace runspace = RunspaceFactory.CreateRunspace(runspaceConfiguration)
            try
            {

                using (Runspace runspace = RunspaceFactory.CreateRunspace())
                {
                    runspace.Open();
                    ////RunspaceInvoke scriptInvoker = new RunspaceInvoke(runspace);
                    ////scriptInvoker.Invoke("Set-ExecutionPolicy Unrestricted");
                    powershell.Runspace = runspace;
                    ////powershell.Commands.AddScript("Add-PsSnapin Microsoft.SharePoint.PowerShell");
                    System.IO.StreamReader sr = new System.IO.StreamReader(scriptfile);
                    StringBuilder st = new StringBuilder();
                    st.Append(sr.ReadToEnd());
                    st.Replace("stry", _endUserRepository);
                    st.Replace("isat", _repoToken);
                    st.Replace("svcname", _appSvcName);
                    st.Replace("resgroup", _resGroupName);
                    st.Replace("sourcebrnch", _sourceBranch);

                    //st.Replace("azorg", string.Concat("https://dev.azure.com/" + _orgName));
                    //st.Replace("aztoken", _orgPAT);
                    //st.Replace("azrepon", _repoName);
                    //st.Replace("azprjc", _orgProj);

                    powershell.AddScript(st.ToString());

                    try
                    {
                        var results = powershell.Invoke();
                        if (powershell.Streams.Error.Count > 1)
                        {

                            ViewBag.Result = "Failed to Host your application in Azure." + 2 + (powershell.Streams.Error[0]).Exception.Message.ToString(); ;
                        }
                    }
                    catch (Exception ex)
                    {
                        ViewBag.Result = ex.Message + 99;
                    }
                }

                //if (!string.IsNullOrEmpty(_orgName) && !string.IsNullOrEmpty(_orgProj))
                //{


                //    var res = Task.Run(() => CreateRepo(_orgName, _orgProj, _ProjID, _orgPAT, _repoName));
                //    Thread.Sleep(5000);

                //    if (res.Result != "")
                //    {
                //        _repoId = res.Result;
                //        var outpt = Task.Run(() => ImportRepo(_orgName, _orgProj, _orgPAT, _repoId, _repoName, _endUserRepository));
                //        Thread.Sleep(5000);
                //    }

                //    var t = Task.Run(() => GetRepositoryId(_orgName, _orgProj, _repoName, _orgPAT));
                //    Thread.Sleep(5000);
                //    string numericPipId = "";
                //    string PipelineId = "";
                //    dynamic t1 = "";
                //    string commitId = "";
                //    string repoID = t.Result;
                //    string refBranch = "";
                //    if (!string.IsNullOrEmpty(repoID))
                //    {
                //        var x = Task.Run(() => GetLastCommitId(_orgName, _orgProj, _repoName, _orgPAT));
                //        //x.Wait(1000);
                //        // t.Wait(10000);

                //        commitId = x.Result;
                //    }
                //    if (!string.IsNullOrEmpty(commitId) && !string.IsNullOrEmpty(repoID))
                //    {
                //        var x1 = Task.Run(() => GetRefBranch(_orgName, _orgProj, _repoName, _orgPAT));

                //        //if (!string.IsNullOrEmpty(x1.Result))
                //        {
                //            refBranch = x1.Result;
                //            var x = Task.Run(() => AddFileToRepository(_orgName, _orgProj, _repoName, commitId, _orgPAT, refBranch));
                //            Thread.Sleep(5000); string s12 = "";
                //        }

                //    }

                //    //if (t.Result != "")
                //    {
                //        t1 = Task.Run(() => CreatePipeline(_orgProj, t.Result, _orgName, _orgPAT));//creating pipeline
                //        Thread.Sleep(5000);                                                                        //  t1.Wait(5000);
                //        PipelineId = t1.Result;

                //        //executing pipeline
                //    }
                //    if (PipelineId != "")
                //    {
                //        PipelineId = PipelineId;
                //        string s11 = PipelineId.ToString().Substring(PipelineId.ToString().IndexOf("pipelines"));
                //        string s12 = s11.Substring(s11.IndexOf('/'));
                //        string des = s12.Substring(0, s12.IndexOf('?'));
                //        numericPipId = new String(des.Where(Char.IsDigit).ToArray());
                //        if (!string.IsNullOrEmpty(numericPipId))
                //        {
                //            var t23 = Task.Run(() => ExecutePipeline(_orgProj, numericPipId, _orgName, _orgPAT, refBranch));
                //        }
                //    }
                //}

                //}
            }
            catch (Exception ex)
            {
                ViewBag.Result = ex.Message + 3;
            }

            return View();
            //}
        }
    }
}
