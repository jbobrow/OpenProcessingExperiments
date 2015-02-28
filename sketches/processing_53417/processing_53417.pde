
float angle = 1.0;

PFont Simple;
String t = "Binary ";
String n = "100010001011110011110001111";
 
 
void setup ()
{
  size (400, 400);
  smooth();
  noStroke();
  Simple = loadFont ("Simple-Bold-48.vlw");
  textFont(Simple);
  
  

 
   
}
 
void draw ()
{
 background (255, 0, 0);
 
   angle+=0.1;
  
  float sinVal = sin(angle) * 50;
   
if (mousePressed == true)
{
 text(n, 150, 200);
}
 
 
else
{
  text(t,sinVal,200);
}
 
 
}

