
//this is a spaceship that rises into the sky, when you press the mouse the spaceship crashes and explodes into the ground.//

Boolean nocrash;

void setup() {
  size(300, 300);
  nocrash= true;
}

int x=0;


void draw() {
  background(66, 188, 224);
  
  // blue background//
  if (nocrash) {
    fill(255, 255, 255);
    triangle(width/2, height/2+x--, width/2-15, height/2+25+x--, width/2+15, height/2+25+x--);
    rect(width/2-15, height/2+25+x--, 30, 130);
    fill(255, -x, 0);
    rect(width/2-10, height/2+155+x--, 20, height);
    //spaceship rising to the sky//
  }
  else
  {
    fill(255, 255, 255);
    rect(width/2-15, 0+130+x++, 30, 130);
    fill(255, -x, 0);
    ellipse(width/2, 260+x++, width, x++);
    rect(width/2-10, height/2-height+x++, 20, height);
    //spaceship crashing//
  }
  fill(32, 100, 36);
  rect(0, 280, width, 20);
  //land//
}

void mousePressed() {
  if (nocrash) {
    nocrash=false;
  }
  else {
    nocrash=true;
  }
}
//this mousepress makes the spaceship explode//


