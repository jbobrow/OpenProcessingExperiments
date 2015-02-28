
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");// we call parent.document 'cause canvas are displayed in an iframe

/*Processing Like Graphics / Visuals" by Abhinav, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID= 113430   
License: 
http://creativecommons.org/licenses/by-sa/3.0/
http://creativecommons.org/licenses/GPL/2.0/
*/
Cirlces[] c = new Cirlces[20];
void setup()
{
  size(500, 500);
  smooth();
  for (int i=0;i<c.length; i++) {
    c[i] = new Cirlces(random(0, width), random(0, width), random(20, 40));
  }
}


void draw() {
  background(-1,20);
  for (int i=0;i<c.length; i++) {
    c[i].display();
    c[i].update();
    for (int j=i+1;j<c.length; j++) {
      c[j].update();
      if(dist(c[i].x,c[i].y,c[j].x,c[j].y) < 100 ){
        stroke(0,50);
        line(c[i].x,c[i].y,c[j].x,c[j].y);
      }
    }
  }
}

  void mouseDragged() {
    for (int i=0;i<c.length; i++) {
      if (dist(mouseX, mouseY, c[i].x, c[i].y)<c[i].r) {
        c[i].x =mouseX;
        c[i].y =mouseY;
      }
    }
  }


  class Cirlces {
    float x, y, r;
    color c;
    int i=1, j=1;
    Cirlces(float _x, float _y, float _r) {
      x = _x;
      y = _y;
      r = _r;
      int i = (int)random(0, 4);
      if (i==0) c = color(#00BDFF); // blue
      if (i==1) c = color(#FF0051); // pink
      if (i==2) c = color(#FFC400); // yellow
      if (i==3) c = color(#B2FF00); // green
    }

    void display() {
      noStroke();
      fill(c,90);
      ellipse(x, y, r*2, r*2);
      fill(0);
      ellipse(x, y, r/10, r/10);
    }

    void update() {
      if (x > width-r) i = -1;
      if (x < 0+r) i = 1;
      if (y > height-r) j = -1;
      if (y < 0+r) j = 1;
      x = x + i*0.05;
      y = y + j*0.05;
    }
  }
