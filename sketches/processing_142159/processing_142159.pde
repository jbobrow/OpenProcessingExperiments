
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");// we call parent.document 'cause canvas are displayed in an iframe

Points[] P = new Points[50];
int len = 5;
void setup() {
  size(800, 400);
  for (int i=0;i<P.length;i++) {
    P[i] = new Points();
  }
}

void draw() {
  background(-1, 10);
  P[0].move(mouseX, mouseY);
  P[0].display(#F20055);
  for (int i=1;i<P.length;i++) {
    float t = atan2(P[i].y-P[i-1].y, P[i].x-P[i-1].x);
    float sx = P[i-1].x + len*cos(t);
    float sy = P[i-1].y + len*sin(t);
    sx+=0.2; // for fluidic motion
    sy+=0.5; // for fluidic motion
    P[i].move(sx, sy);
    P[i].display(#C5F200);
    //stroke(0);
    //line(P[i].x, P[i].y, P[i-1].x, P[i-1].y);
  }
}


class Points {
  float x=0, y=0;
  void display(color c) {
    fill(c);
    noStroke();
    ellipse(x, y, 5, 5);
  }
  void move(float x, float y) {
    this.x = x; 
    this.y = y;
  }
}
