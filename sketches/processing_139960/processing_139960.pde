
float t;
void setup()
{
  size (600,500);
  frameRate(18);
  background(255);
}

void mousePressed()
{
 fill(255,255);
 noStroke();
 rect(0,0,width,height);
 }

void draw()
{
  fill(255,0.5);
 noStroke();
 rect(0,0,width,height);
 noStroke(); 
 fill(mouseY/2,random(255),mouseX/2);
 smooth(8);
 t=random(5,50);
 ellipse(random(mouseX-20,mouseX+20), random(mouseY-20,mouseY+20), t,t);
}




