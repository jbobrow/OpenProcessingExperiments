
float d;
float cirkelX1=70;
float cirkelY1=70;
float radius=80;
int baggrundR=0;
int baggrundG=0;
int baggrundB=225;
int point=0;
void setup()
{
  size(500, 500);
  frameRate(60);
  background(255, 255, 255);
}
void draw()
{

  fill(0, 0, 0);
  ellipse(cirkelX1, cirkelY1, radius, radius);
  d=sqrt((cirkelX1-mouseX)*(cirkelX1-mouseX)+(cirkelY1-mouseY)*(cirkelY1-mouseY));

  if (d<radius+point)
  {
    background(255, 255, 255);
    cirkelX1=random(40, 490);
    cirkelY1=random(40, 490);
    radius=random(20, 50);
    ellipse(cirkelX1, cirkelY1, radius, radius);
   
    
    if(d<radius)
    {
      fill(255,255,255);
      stroke(255,255,255);
      ellipse(mouseX, mouseY, radius, radius);
          point++;
          
    }
     
  }
  textSize(32);
  text("points:"+str(point), 5, 50);
}
