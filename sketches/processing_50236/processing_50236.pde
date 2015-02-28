

//Processing HW 2 
//copyright Allison Tran, 2012
float a, b, d;
void setup( ) //setup argument list must be empty 
{ //brace 
size(400,400);
background (10);
frameRate(25);
a = 0;
b = -42;
}

void draw( )
{
  noStroke();
  a = a + 5;
  b = b + 1;
  fill(0,255,0,50);
  stroke(255,255,255,10);
  strokeWeight(.5);
  line(200,200,mouseX,mouseY); 
  float d = random(1,5);
  stroke(0, 255, 0);
  strokeWeight(5);
  noStroke();
  fill( random(0), random(250), random(250));
  float x = random(mouseX-width/10,mouseX+width/10);
  float y = random(mouseY-width/10,mouseY+width/10);
  ellipse(x,y,d,d); 
  ellipse(mouseX,mouseY,5,5);


}


