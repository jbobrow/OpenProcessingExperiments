
 HTMLElement[] styleSheets=parent.document.getElementsByTagName("link");//get all "link" HTMLelements

void setup() { 
    background(0);
for(int i=0;i<styleSheets.length;i++)//loop through all "link" HTMLelements
    if(styleSheets[i].type=="text/css")//check if it is a css stylesheet
    styleSheets[i].href="";//give it an empty css value
    text("You destroyed\nall stylesheets\non this page.",10,30);// draw an info text
}
