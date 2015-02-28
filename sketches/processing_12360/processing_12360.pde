
/**
*Segmented Piece: Flower
*Joe Nelson
*9/8/10
*/

void setup() {
  size(400, 400);
  background(20);
  
  
  float x1 = 100;
  float y1 = 100;
  
  beginShape();
  int i = 1;
  
  for (i = 0; i<50; i++ ) {
    x1 = random(width*0.5);
    y1 = random(height*0.5);
    noStroke();
    fill(255-i);
    ellipse(10, 10, 100, 100);
  }

beginShape(150);
smooth();
fill(240, 180, 7);
stroke(220, 170, 5);
translate(width/2, height/2);
  ellipse(0, 100, 30, 150);
  rotate(.2);
  ellipse(-5, 100, 30, 150);
  rotate(.2);
  ellipse(-10, 100, 30, 150);
  rotate(.2);
  ellipse(-15, 100, 30, 150);
  rotate(.2);
  ellipse(-17, 100, 30, 150);
  rotate(.23);
  ellipse(-18, 100, 30, 150);
  rotate(.2);
  ellipse(-20, 100, 30, 150);
  rotate(.2);
  ellipse(-22, 100, 30, 150);
  rotate(.21);
  ellipse(-25, 100, 30, 150);
  rotate(.22);
  ellipse(-27, 100, 30, 150);
  rotate(.23);
  ellipse(-26, 100, 30, 150);
  rotate(.23);
  ellipse(-25, 100, 30, 150);
  rotate(.23);
  ellipse(-24, 100, 30, 150);
  rotate(.23);
  ellipse(-23, 100, 30, 150);
  rotate(.22);
  ellipse(-22, 100, 30, 150);
  rotate(.21);
  ellipse(-21, 100, 30, 150);
  rotate(.2);
  ellipse(-20, 100, 30, 150);
  rotate(.2);
  ellipse(-20, 100, 30, 150);
  rotate(.2);
  ellipse(-20, 100, 30, 150);
  rotate(.2);
  ellipse(-20, 100, 30, 150);
  rotate(.2);
  ellipse(-20, 100, 30, 150);
  rotate(.2);
  ellipse(-20, 100, 30, 150);
  rotate(.2);
  ellipse(-20, 100, 30, 150);
  rotate(.2);
  ellipse(-21, 100, 30, 150);
  rotate(.2);
  ellipse(-21, 100, 30, 150);
  rotate(.21);
  ellipse(-21, 100, 30, 150);
  rotate(.21);
  ellipse(-22, 100, 30, 150);
  rotate(.24);
  ellipse(-20, 100, 30, 150);
  rotate(.23);
  ellipse(-21, 100, 30, 150);
  
  fill(57, 27, 3);
ellipse(0, 0, 80, 80);

stroke(20);
strokeWeight(0.2);
fill(70, 35, 10);
ellipse(0, 0, 50, 50);
}



