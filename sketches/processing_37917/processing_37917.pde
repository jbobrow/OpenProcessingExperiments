
import processing.pdf.*;

int x, y;

void setup()
{
  size(1024,768);
  smooth();
  noStroke();
}
void draw()
{ 
  fill(255);
    drawLines();
  for (x=10;x<=width;x+=250)
  {
    for (y=0;y<=height;y+=250)
    {
    
      drawMoose();
    }
  }
  noLoop();

}

void drawMoose()
{
  noStroke();
  ellipse(x+100, y+100, 50, 50);
  ellipse(x+110, y+120, 40, 40);
  rect(x+120, y+85, 70, 40);
  ellipse(x+150, y+120, 75, 50);
  ellipse(x+190, y+115, 60, 60);
  triangle(x+100, y+130, x+130, y+130, x+90, y+170);
  quad(x+90, y+170, x+100, y+160, x+110, y+210, x+100, y+210);
  rect(x+110, y+130, 10, 80);
  quad(x+200, y+170, x+210, y+160, x+210, y+210, x+200, y+210);
  quad(x+180, y+130, x+216, y+130, x+210, y+160, x+200, y+170);
  quad(x+90, y+80, x+90, y+120, x+50, y+100, x+50, y+70);
  ellipse(x+50, y+75, 30, 30);
  ellipse(x+10, y+90, 25, 25);
  ellipse(x+50, y+90, 30, 30);
  quad(x+12, y+80, x+12, y+100, x+50, y+100, x+50, y+65);
  quad(x+210, y+95, x+210, y+110, x+230, y+110, x+230, y+105);
  rect(x+180, y+100, 10, 110);
  triangle(x+180, y+150, x+180, y+180, x+200, y+150);

  //antler
  strokeWeight(10);
  stroke(0);
  line(x+55, y+30, x+55, y+70);
  line(x+45, y+45, x+85, y+45);
  line(x+70, y+45, x+70, y+35);
  line(x+85, y+45, x+85, y+40);
  triangle(x+70, y+50, x+55, y+55, x+55, y+45);
}

void drawLines()
{

  for (int i=120;i<=height+300;i+=250)
  {  strokeWeight(225);
  stroke(100);
    line(0, i, width, i);
    strokeWeight(5);
    stroke(50);
    line(0,i+112,width,i+112);
    line(0,i-112,width,i-112);
    stroke(0);
    strokeWeight(2);
    line(0,i+125,width,i+125);
  }
}


                
                                
