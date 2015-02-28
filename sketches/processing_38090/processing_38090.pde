
float r = random(100, 255);
float g = random(100, 255);
float b = random(100, 255);
float shft = 20;
int stweight = 1;
boolean doit = true;

void setup()
{
size(900, 450);
background(r-150,g-150,b-150);
strokeWeight(0);
smooth();
noFill();
}


void draw()
{
if(doit == true){
  
for(int x=0; x<=width; x+=50)
{
  for(int y = 0; y <= height; y+= 50)
  {
      r += random(-shft, shft);
      g += random(-shft, shft);
      b += random(-shft, shft);
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain (b, 0, 255);      
      stroke(r,g,b);
//      ellipse(x, y, 10, 10);
      for(int c = 0; c<=360; c+=15)
      {
      pushMatrix();
      rotate(radians(c+30));
      ellipse(x, y, c, c);
      popMatrix();
      }
      
  }
}
}
doit = false;
}
