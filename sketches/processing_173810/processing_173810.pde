
float x,y;

void setup()
{
  size(600,600);
  background(255);
  x=width/2;
  y=height/2;
  
}
void draw()
{
  background(255);
  fill(0);
  textSize(30);
 text("press",mouseX,mouseY);
  strokeWeight(0);
  fill(255,0,0);
  //stroke(0);
//ellipse(x,y,mouseX,mouseY);
//line(x,y,mouseX,mouseY);
// point(x,y);
//triangle(x,y,300,300,mouseX,mouseY);
  x = x + random(1,1.2);
  y = y + random(1,1.2);
  
  if (mousePressed==true) //((x>width)||(y>height))
  {
  x= random(100,width);
  y= random(0,height);
  background(255);
  fill(random(255),random(255),random(255));
  text("Ciao signori",mouseX,mouseY);
fill(255,0,0,250);  
  strokeWeight(0);
 ellipse(x,y,mouseX,mouseY);
  }
   
  
  }

  
  
