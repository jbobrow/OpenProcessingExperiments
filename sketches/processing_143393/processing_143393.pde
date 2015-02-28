
/*Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name:CHOI Joo Hee
 ID:201420114
 */
 
float xW = 100;
float direction =1;
float angle=1;

void setup() {
  size (600, 600);
  smooth();
  background(255);
}

void draw() {

  //basic elements
  translate(width/2, height/2);
  for (int j=30; j<width; j+=60) {
  for (int c=30; c<height; c+=60) {
  rotate(angle);
  scale(0.9);

  // ellipses
  stroke(255);
  strokeWeight(random(5));
  fill(0, 0, 0, 100);
  ellipse(j, c, xW, xW);
  fill(0, 0, 0, 180);
  ellipse(j+100, c+100, xW, xW);
  fill(0, 0, 0, 220);
  ellipse(j*2, c*2, xW+20, xW+20);
  fill(0, 0, 0, 40);
  ellipse(j+120, c+120, xW/7, xW/7);
  ellipse(j-200, c-200, xW, xW);
   }
  
  //other 
  scale(0.2);
  angle += 0.002;
  }

  //change
  xW = xW + (1*direction);
  if ((xW <0)||(xW>150)) {
   direction*=-1;
  }
}
void mousePressed() {
  noLoop();
}
void mouseReleased() {
  loop();
}
