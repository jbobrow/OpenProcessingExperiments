
float x = 100, y = 100;
float xSpeed = random (2,4);
float ySpeed = random (2,4);
float r= random (7,10);
//score, G/B value of the bg, transparancy of bg image
int s = 0, g = 0, b = 0, t = 0;
PFont f;  
PImage img; 

void setup(){
  size (300,300);
  noStroke ();
    f = loadFont( "BerlinSansFB-Reg-48.vlw" ); 
    img = loadImage("Corbis-42-28360761.jpg");
}

void draw(){
  background (0,g,b);
  image(img,0,0);
  img.resize(300, 300);
  tint(255,t);  
  image(img, 0, 0);
  textFont(f,30);
  text ("Score",10,30);
  text (s,10,60);
  fill(255,255,255);
  ellipse (x,y,r,r);
  
  fill(255);
  rect(mouseX,height-40,70,10);
  
  x = x + xSpeed;
  y = y + ySpeed;
  

  if (xSpeed>0 && x>width-5){
    xSpeed = -((xSpeed+1)*.95);
     }
  
    if (xSpeed<0 && x<5){
    xSpeed = -((xSpeed+1)*.95);
    r = r*1.05;
  }
  
  if (ySpeed>0 && y>height-5){
    ySpeed = -((ySpeed+1.5)*.95);
    r = r*1.05;
  }
  
    if (ySpeed<0 && y<5){
    ySpeed = -((ySpeed+1)*.95);
    r = r*1.05;
  }
  
  
  if ((y>height-40) && (y<height-30) && (x>mouseX) && (x-mouseX<70)) {
    ySpeed = -(ySpeed+1.5);
    xSpeed = -(xSpeed+1);
    r = min(50, r*0.9);
    s++;   
    t+=5;
    g = mouseX;
    b = mouseY;
  }
    
    if ((y>height-30) && (x>mouseX) && (x-mouseX<70)) {
    ySpeed = -(ySpeed);
    xSpeed = -(xSpeed);
  }
  
  if (r>15){
    r=15;
  }
  
  if (x<2){
    x=2;
  }
  
  if (y<2){
    y=2;
  }
  
   g -=20;
   b -=20;
}



