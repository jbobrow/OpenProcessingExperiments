
import processing.pdf.*;

float x,y,ox,oy,age,freq,rad;
int rand;

void setup()
{
  size(600,600);
  background(0,5,10);
  freq = .1;
  noLoop();

}

void draw()
{
translate(width * .6, height *.6);
//  pushMatrix();

for (int k = 0; k < 4; k++)
{rectMode(RADIUS);
for (int j = 0; j < 20; j++)
  {
    x=0;
    y=j;
    beginShape();
    for (int i=0; i < 300; i++)
    {
      ox = x;
      oy = y;
      x += noise( (x-50)*freq, y* freq)*200-100;
      y += noise( (y-10000)*freq, x*freq)*200-100;

      rand = int(random(1, 7));
      if( x < -i-30 && y < -i-50 && rand == 1 )
      {
        pushMatrix();
        rotate(PI/2.5);
        stroke(10,80,30, 150 - (dist(0,0,ox,oy)*.18));
        fill(10,80,30, 120 - (dist(0,0,ox,oy)*.16));
        rect(ox,oy, 16 - (dist(0,0,ox,oy)*.025), 16 - (dist(0,0,ox,oy)*.025));
        popMatrix();
        
        
      }
      stroke(0,50,10,120);
      fill(50,160,80,140);
      ellipse(ox,oy,3,3);
      fill(45,10,10,30);
      stroke(30,80,40,60);
      vertex(ox,oy);
    }
    endShape();
  }
  rotate((tan(1.49 * (k^5))));
  translate(width * .03, height *-.03);
}
}

