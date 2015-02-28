
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");// we call parent.document 'cause canvas are displayed in an iframe

PVector[] P = new PVector[200];
void setup() {
  size(600, 600);
  P[0] = new PVector(0, 0);
}
int r=50;
float t=0;
PVector Start = new PVector(0, 0);
void draw() {
  background(-1,20);
  translate(100, height/2);
  for (int i=0;i<P.length-1;i++) {
    P[i+1] = FFTCircle(P[i], 2*r/(i+1), (i+1)*t);
  }

  t+=0.1;
  if (t>360)t=0;
}

PVector FFTCircle(PVector Pcur, int r, float i ) {
  float g = map(i, 0, 500, 0, 255);
  fill(0, 50);
  noStroke();
  ellipse(Pcur.x, Pcur.y, 2*r, 2*r);
  stroke(255, 0, 0);
  float mx = Pcur.x + r*cos(radians(i));
  float my = Pcur.y + r*sin(radians(i));
  line(Pcur.x, Pcur.y, mx, my);
  PVector Pnext = new PVector(mx, my);
  return Pnext;
}
