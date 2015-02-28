
final int Inc = 5;
final int StepTime = 20; 
int X = 0;
int Y = 0;
int XDir = 1;
int YDir = 1;
int LastTime = 0; 
PFont Font; 
String letters = "Champion of the World";  
float angle = 0.0; 
float speed = 1;
float radius = 40.0;
float sx = 1.0; float sy = 1.0; 
float a;
float b;
float a2;
float b2;



void setup()
{
  noStroke(); 
  smooth();
  float a2=a+50;
  float b2=b+50;
  smooth();
  size(400, 300);
  textAlign(CENTER);
  Font = loadFont("Aharoni-Bold-20.vlw");
  fill(255, 0, 0);
  textFont(Font);
  
}
 
void draw()
{
   fill(0, 4); 
  rect(0, 0, width, height); 
  angle += speed;
  float sinval = sin(angle); 
  float cosval = cos(angle);
  float a = 115 + (cosval * radius); 
  float b = 130 + (sinval * radius); 
  fill(35,195,255); 
  ellipse(a, b, 5, 5); 
  fill(100); 
  ellipse(a+90, b, 5, 5); 
  fill(255,0,0); 
  ellipse(a+180, b, 5, 5); 
  fill(255,247,35); 
  ellipse(a+45, b+50, 5, 5); 
  fill(71,189,0); 
  ellipse(a+135, b+50, 5, 5); 
   int xpos = int(random(width)); 
  int ypos = int(random(height));
  float scalefactor = random(1,3);
   
  fill(random(255),random(255),random(255));

  ellipse(xpos,ypos,5,5);
  int thisTime = millis();
   
  
  if (thisTime - LastTime >= StepTime) {
   
   
    drawChar();
    LastTime = thisTime;
  }
}
void drawChar()
{
  fill(255,0,0);
  text(letters, X, Y);
   
 
  X += (Inc * XDir);
  Y += (Inc * YDir);
   
 
  if (X >= width || X <= 0) {
    XDir = -XDir;
  }
  if (Y >= height || Y <= 0) {
    YDir = -YDir;
  }
}
 

