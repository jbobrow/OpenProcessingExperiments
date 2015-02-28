
Eye eyes;

void setup() {
  size(600, 600);
  background(255);
  frameRate(10);
   eyes = new Eye();
}
 
void draw() {
  //myEye = new Eye();
  eyes.display();
//}
//void mouseclicked() {
 //Eye myEye = new Eye(width/2,height/2);
}
  
class Eye{ 
  float r;
  float g;
  float b;
  int cx;
  int cy;
  
Eye(int centerX, int centerY){ 
  cx= centerX;
  cy= centerY;
  r=random(0, 180);
  g=random(0, 150);
  b=random(0, 150);
}
 
void display() {
 stroke(0); 
 //eyelashes
 line (cx, cy,  cx - 75, cy - 10); //far left
 line (cx, cy,  cx - 60, cy - 35);//left
 line (cx, cy,  cx - 30, cy - 50);//middle left
 line (cx, cy,  cx - 0, cy - 55); //middle
 line (cx, cy,  cx + 30, cy - 50); //middle right
 line (cx, cy,  cx + 60, cy - 35);//right
 line (cx, cy,  cx + 75, cy - 10); //far right
 
 //white of eye
  fill(255);
  stroke(0);
  ellipse (cx, cy, 110, 80);
  //iris
  fill(r,g,b);
  ellipse(cx, cy, 80, 80);
  //pupil
  fill(0);
  ellipse(cx, cy, 50, 50);
 }
}



