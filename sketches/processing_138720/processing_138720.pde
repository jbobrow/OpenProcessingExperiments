
boolean f = false;
int num=0;

void setup () {
  smooth();
  size (1000, 1000);
  background (252, 252, 250);
  stroke (1000);
}

void draw () { 

  if (f==false) {
    noFill();
    //stroke(30, 40, 35);
    arc (40,400, mouseX, mouseY,90,90);
  }
  else if (f==true) {
   // stroke(39, 36, 38);
   ellipse(500, mouseY,mouseX/2,50);
    noFill();
  }
}

void mouseReleased () {

  if (f==false) {
    f=true;
  }

  else if (f==true) {
    f=false;
  }
}

void mouseMoved() {
  stroke(random(40), random (10), 10);
}





