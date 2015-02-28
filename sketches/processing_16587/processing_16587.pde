
int xpos, ypos;
  float r = 0;
  
void setup()
{
 size (600, 600);
  smooth();
 strokeWeight(5);
 strokeCap(SQUARE); 
  
}
void draw()
{
  background (255);
  
  xpos = width/2;
  ypos = height/2;
  
  for (float y = height/6; y < height; y = y + height/3){
    for (float x = width/6; x < width; x = x + width/3){
  drawChair(x, y, 100);
  r = random(-30,30);
    }
  }
//  noLoop();
}

void drawChair(float x, float y, float s)
{
  stroke(20);
  line(x-30, y+r, x+30+r, y);
  line(x-30, y+r, x-35, y-80+r);
  line(x-30+r, y, x-35+r, y+80);
  line(x+30+r, y+r, x+35+r, y+80+r);

}

