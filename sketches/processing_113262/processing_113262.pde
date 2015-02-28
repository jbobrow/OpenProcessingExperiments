
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");// we call parent.document 'cause canvas are displayed in an iframe

PFont font;
String[] lines;
void setup()
{
  size(600, 600);
  font = loadFont("Meiryo-12.vlw");
  textFont(font, 12);
  String str = ""+"slefload.pde";
  lines = loadStrings(str);
  background(-1,20);
  frameRate(20);
}
int i=0, j=0;
int x=10, y=15;
String message;

void draw() {
  translate(0, 20);
  fill(255, 0, 0);
  //-----------------------------
  if (i<lines.length) {
    message = lines[i];
  }

  //-----------------------------
  if (j < message.length()) {
    text(message.charAt(j), x*j+10, y*i);
    j++;
  }
  else { 
    j=0;
    i++;
  }
}

void mousePressed()
{
  draw();
}

