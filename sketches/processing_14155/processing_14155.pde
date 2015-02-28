
float x = 0;
float speed_t = 10;
float t;
PImage a, b, c;

void setup(){   
size(800, 600);  
background(0);
frameRate(10);
t = 100;
a = loadImage("frase.png");
b = loadImage ("frase2.png");
c = loadImage("frase3.png");
}

void draw ()
{
  noCursor();
   println(frameCount);  
   
  if (frameCount < 600)
  {
  smooth();
  image(a, 0 , 0);
 circulo();
 display();
  }


if (frameCount == 600)
 {
  background(0); 
 }
 
  
  if (frameCount > 600 && frameCount < 1200)
  {
  smooth();
  image(b, 0 , 0);
 circulo();
 display();
  }
  
  if (frameCount == 1200)
 {
  background(0); 
 }
 
  
  if (frameCount > 1200 && frameCount < 1800)
  {
  smooth();
  image(c, 0 , 0);
 circulo();
 display();
  }
  
    
  if (frameCount == 1800)
 {
  background(0); 
  frameCount = 0;
 }
 
 }


 

  
void circulo()
{
  x = x + speed_t;
  if (x > random(100,1500)) {
    x = 0;   
  }
}
  
  
  
void display() {
  noFill();
 float c1 = random(255);
float c2 = random(255);
float c3 = random(255);
 smooth();
  stroke(c1,c2,c3);
  ellipse(mouseX,mouseY,x,x);
 
}

  
  
  
  
  
  
  
  


