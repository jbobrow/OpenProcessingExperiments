
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");// we call parent.document 'cause canvas are displayed in an ifram


String time="";
void setup() {
  size(800, 300);
}

void draw() {
  getTime();
  color c = unhex("FF" + time);
  background(c);
  fill(-1);
  textAlign(CENTER);
  textSize(30);
  text("#"+time, width>>1, height>>1);
}

void getTime() {
  int s = second();
  int m = minute();
  int h = hour();
  time = nf(h, 2) + "" + nf(m, 2) + "" + nf(s, 2);
}
