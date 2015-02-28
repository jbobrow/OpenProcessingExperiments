
int x=1;
int y=1;
void setup()
{
  size(600, 600);
  frameRate(3);
  background(0);
}
void draw()
{ 
  if (y<=1024)
  {
    while (x<=y)
    {
      float b=random(width);
      float c=random(height);
      fill(255, 0, 0);
      bezier(b, c, b+5, c-25, b+35, c-25, b+40, c);
      fill(255);
      bezier(b, c, b+5, c+25, b+35, c+25, b+40, c);
      ellipse(b+20, c, 12, 12);
      x++;
    }
  }
  if (y==1024)
  {
    pushStyle();
    strokeWeight(2);
    //head
    fill(255, 255, 0);
    ellipse(300, 300, 100, 100);
    //mouth
    stroke(0);  
    fill(147, 7, 49);
    arc(300-2, 307, 68, 60, 0, PI);
    line(300-80/2, 307, 300+60/2, 307);
    //tougue
    fill(234, 135, 233);
    pushStyle();
    noStroke();
    ellipse(300+4, 300+25, 30, 20);
    popStyle();
    //eyes
    fill(255);
    //right eyeball
    arc(300-25, 300-5, 30, 45, PI, 2*PI);
    //left eyeball
    arc(300+15, 300-5, 30, 45, PI, 2*PI);
    //right pupil
    fill(0);
    ellipse(300-20, 300-20, 10, 10);
    line(300-40, 300-5, 300-10, 300-5);
    //left pupil
    ellipse(300+20, 300-20, 10, 10);
    line(300+30, 300-5, 300, 300-5);
    popStyle();
  }
  y=y*2;
}
void mousePressed()
{
  x=1;
  y=1;
  background(0);
}
