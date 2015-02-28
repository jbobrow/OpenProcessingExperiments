
void setup() {
  size(419, 419);
  smooth();
}
void draw() {
  //stand
  background(255);
  if (mousePressed) { 
    noStroke();
    fill(255);
    rect(0, 0, width, height);
    stroke(0,200,0);
    for (int x = 60; x <= width; x = x+60) {
      for (int y = 60; y <= height; y = y+120) {
        ellipse(x, y, 20, 24+random(3));
        strokeWeight(2);
        //body
        line(x, y+12, x, y+60);
        //feet
        line(x-5, y+60+random(2), x+5, y+60);
        //left arm
        line(x, y+14, x-10, y+24);
        line(x-10, y+24, x-20  +random(5), y+14 +random(2));
        //right arm
        line(x, y+14, x+10, y+24);
        line(x + 20, y+30 -random(10), x+10, y+24);
        //music
        strokeWeight(1);
        stroke(0,200,0,40);
        //sopra
        line(0,15+random(10),width,15+random(10));
        //sx
         line(15+random(10),0,15+random(10),height);
         //sotto
          line(0,height-15-random(10),width,height-15-random(10));
          //dx
           line(width-15-random(10),0,width-15-random(10),height);
        strokeWeight(2);
        stroke(0,200,0);
      }
    }
  }
  else {
    for (int x = 60; x <= width; x = x+60) {
      for (int y = 60; y <= height; y = y+120) {
        ellipse(x, y, 20, 24);
        strokeWeight(2);
        stroke(0);
        line(x, y+12, x, y+60);
        line(x-5, y+60, x+5, y+60);
        line(x, y+14, x-10, y+24);
        line(x, y+30, x-10, y+24);
        line(x, y+14, x+10, y+24);
        line(x, y+30, x+10, y+24);
        line(0,20,width,20);
        line(20,0,20,height);
        line(0,height-20,width,height-20);
        line(width-20,0,width-20,height);
      }
    }
  }
}


