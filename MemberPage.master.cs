using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using WebMatrix.WebData;
using WebMatrix.Data;
using System.Web.Security;
using System.Net;
using System.Web.WebPages;

public partial class MemberPage : System.Web.UI.MasterPage
{



    protected void Page_Load(object sender, EventArgs e)
    {
        WebSecurity.RequireAuthenticatedUser();
        ldate.Text = DateTime.Now.ToLongDateString();
        luser.Text = WebSecurity.CurrentUserName;


        var isauthenticated = WebSecurity.IsAuthenticated;
    }
}
