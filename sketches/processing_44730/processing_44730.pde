
// Author: Weiyuh Li
// GreenGreenGrass & FloweryFloweryFlower of Home
// concept: 1.how does sunlight influence the growth of grass
//          2.be patient to wait for the flower bloom
//press mousebotton to move the sun at the upper of picture
//press mousebotton to make the flower bloom,press left or right botton appears different color
//reference: http://www.openprocessing.org/visuals/?visualID=44045 by Sheng-Fen Nik Chien



void setup() {
  size(800, 600);
  background(150, 220, 250);
  noStroke();
  fill(120);
  rect(0, height-50, width, height);
  smooth();
  frameRate(10);
}
//draw grass
void grass() {
  float boundary=20;
  float g=random(5, 8);
  float x=random(boundary, width-boundary);
  float y=height-boundary-28;
  float stepx=(mouseX-x)/random(40, 50);
  float stepy=mouseY/3+20+random(10);
  strokeCap(SQUARE);
  strokeWeight(2);
  noFill();
  stroke(random(50), random(150, 255), random(100), 180);

  bezier (x, y, x+stepx*0.1+random(10), y-stepy-random(10), x+stepx*2+random(15), y-stepy*2-random(15), x+stepx*7+random(20), y-stepy*3-random(20));
  bezier (x+g, y, x+stepx*0.3+random(10), y-stepy*1.2-random(10), x+stepx*2.3+random(15), y-stepy*2.5-random(15), x+stepx*7.2+random(20), y-stepy*3.5-random(20));
  bezier (x-g, y, x+stepx*0.1+random(15), y-stepy*1.5-random(20), x+stepx*1.7+random(15), y-stepy*3-random(15), x+stepx*6+random(20), y-stepy*3.8-random(20));
}
void draw() {
  float tx=mouseX;
  float ty=mouseY;
  if (mousePressed && ty<=180) {
    noStroke();
    fill(150, 220, 250, 240);
    rect(0, 0, width, 205);

    fill(250, 160, 105);
    float r1=25;
    float r2=ty/7;
    fill(255, 0, 0, 100);
    ellipse(tx, ty, r1+r2, r1+r2);
    ellipse(tx, ty, r1, r1);
    fill(255, 100, 50);
    ellipse(tx, ty, r1-10, r1-10);
    fill(250, 200, 0, 100); 
    ellipse(tx, ty, r1, r1);  
    grass();
  }
  if (mousePressed && ty>=230 && (mouseButton==LEFT)) {
    color col1;
    col1 = color(random(250, 255), random(255), 255);
    strokeWeight(2);
    stroke(col1);
    line(tx, ty, tx+random(-15, 15), ty+random(-15, 15));
  }
  if (mousePressed && ty>=230 && (mouseButton==RIGHT)) {
    color col2;
    col2 = color(255, random (115, 255), random(255));
    strokeWeight(2);
    stroke(col2);
    line(tx, ty, tx+random(-15, 15), ty+random(-15, 15));
  }
}
void mouseReleased() {
  noStroke();
  fill(150, 220, 250);
  rect(0, 0, width, 205);
}

void keyPressed() {
  saveFrame("GrassFlower.jpg");

}


