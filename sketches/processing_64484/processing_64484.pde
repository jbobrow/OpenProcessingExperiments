

//ledplux logo+light waves

PImage logo; //upload logo image


//lightwave variables
int X;
int Y;
int cX;
int cY;
int rand;
color colorVariation;
int ang;
 
void setup() {
  size(600, 600);
  background(255);
  smooth();
  
    colorMode(HSB,255);

  logo= loadImage("ledplux01.png");
  image(logo,300,276);


  
  X = width/5;
  Y = height/2;

  
}
 
void draw() {
  if (mouseX==0 && mouseY==0) {
     mouseX = width/2;
     mouseY = width/2;
   }
  
  drawBez(1, 2, 50, 50, 100, 100);
}
 
void mousePressed(){
   X = mouseX;
   Y = mouseY;
}
 
 
void mouseReleased(){
  fill(0, 5);
  rect(0, 0, width, height);
}
 
void drawBez(int sW, int speed, int control1X, int control1Y, int control2X, int control2Y) {
 
  cX = mouseX;
  cY = mouseY;
  
   float radX = mouseX + cos(radians(ang)) * control1X;
  float radY = mouseY + sin(radians(ang)) * control1Y;
   
  float handX = 2 + cos(radians(ang)) * 15;
   
  float radX2 = width/2 + cos(radians(ang)) * control2X;
  float radY2 = height/2 + sin(radians(ang)) * control2Y;

 
  noFill();
  stroke(random(50, 100),100,100,75);
  stroke(50,150,200,75);
   
    bezier(X, Y, radX2, radY2, radX, radY, mouseX,mouseY);
  ang = ang + speed/2;

  noStroke();
  fill(0,2);
  rect(0, 0, width, height);
}


