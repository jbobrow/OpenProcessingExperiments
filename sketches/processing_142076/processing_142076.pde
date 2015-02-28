
 eyEye myEye;

void setup() {
  size(600, 600);
  background(255);
  frameRate(10);
}
 
void draw() {
}

void mouseClicked() {
  myEye = new Eye(mouseX, mouseY);
  myEye.display()
}
  
class Eye{ 
  float r;
  float g;
  float b;
  int cx;
  int cy;
  
Eye(int centerX, int centerY){ 
  cx=centerX;
  cy=centerY;
   r=random(0, 180);
   g=random(0, 150);
   b=random(0, 150);
 }
 
void display() {
  if (frameCount % 10 == 0){
 stroke(0); 
//because i moved the color eye in the if statement it now just shows the eyelid first, kind of the inverse of what was happening before
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
    else {
    //eye when blinking
    //lashes
 line (cx, cy,  cx + 75, cy + 10); //far left
 line (cx, cy,  cx + 60, cy + 35);//left
 line (cx, cy,  cx + 30, cy + 50);//middle left
 line (cx, cy,  cx + 0, cy + 55); //middle
 line (cx, cy,  cx - 30, cy + 50); //middle right
 line (cx, cy,  cx - 60, cy + 35);//right
 line (cx, cy,  cx - 75, cy + 10); //far right
 //eyelid
  fill(255);
  stroke(0);
  ellipse (cx, cy, 110, 80);
  println();
    }
    //else {};
    }
  }



