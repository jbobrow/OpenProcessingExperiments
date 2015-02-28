

PImage piazza;


void setup()
{
  size(800,500);
  piazza= loadImage("piazza.jpg");
  
}

void draw() {
  background(55,255,55,15);
  image(piazza, 0,0);
  tint(249,39,89,200);


  for(int ypos=0; ypos<500; ypos=ypos+10) {
    for(int xpos=0; xpos<850; xpos=xpos+15) {
      fill(52,185,xpos, 25);
      ellipse(xpos-30,ypos+10,10,9);
      rect(xpos-15,ypos+10,29,9);
    }
  }
}


