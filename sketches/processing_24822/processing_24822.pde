
//EXERCISE 6.7//

//variables
int arcX = 115;
int arcY = 110;
int ellipseY = 115;
int eyeX = 5;
int eyeY = 13;
int lip1 = 100;
int XP = 80;
int YP = 100;

//floats
float r; 
float g; 
float b; 
float a;
float diam; 
float x; 
float y;

//turtle floats
float eyeR; 
float eyeG; 
float eyeB;

void drawBall() {
  smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  ellipse(mouseX,mouseY,20,20);

 smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  ellipse(mouseX,mouseY,10,10);

  smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  ellipse(mouseX,mouseY,10,10);
}

void drawTurtle() {
   //body//
 strokeWeight(3);
 fill(143,209,168,255);
 arc(arcX, arcY, XP+40, YP+8, 0, PI/2);
 arc(arcX, arcY, XP+40, YP+8, PI/2, PI);
 
 //head//
  smooth();
  strokeWeight(3);
  fill(200,246,243,255);
  ellipse(XP,YP,80,80);
  
  //eye
  smooth();
  strokeWeight(2);
    
  if (mousePressed) {
    eyeR = random(255); 
    eyeG = random(255); 
    eyeB = random(255); 
    fill(eyeR,eyeG,eyeB);
    ellipse(XP+20,YP-5,eyeY,eyeY);
  }else{
    ellipse(XP+20,YP-5,eyeX,eyeX);
  }
  
  //mouth 
   if (mousePressed) {
    line(XP+40,YP,ellipseY,105);
  }else{
    line(XP+40,YP,lip1,105);
  }
  
  //hands//
  fill(143,209,168,255);
  strokeWeight(2);
  stroke(0,0,0);
  ellipse(XP+45,YP+15,20,20);
  
  strokeWeight(2);
  stroke(0,0,0);
  ellipse(XP+92,YP+15,20,20);
}
  
void setup(){
  size(255,255);
  background(0);
  
  }

void draw () {
  background(0);
  
   // Fill all variables with random values 
  r = random(255); 
  g = random(255); 
  b = random(255); 
  a = random(255); 
  diam = random(20); 
  x = random(width); 
  y = random(height);
// Use values to draw an ellipse 
stroke(0); 
ellipse(x,y,diam,diam);
int x = 0;
while (x < width) {
  int y = 0;
  while (y < height) {
    noStroke();
    fill(r,g,b,a);
    ellipse(x,y,diam,diam);;
    y += 10;
  }
  x += 10;
} 
  drawTurtle();
  drawBall();
 }


