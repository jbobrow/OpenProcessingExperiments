

// -----------------
// Ad Heinhardt
// Number 5 (Red Wall, 1952)
// -----------------
int counter = 0;
float x = 0;
float y = 0;
color[]   c = {#bd3825,#c74126,#cb4927};
int vector_size = 50;
PVector[] v = new PVector[vector_size]; 
boolean go = false;
boolean passed = true;
PImage img;
PGraphics pg;


// -----------------
void setup()
{
  size(400,600);
  pg = createGraphics(400,600);
  cursor(CROSS);
  background(#bd3825);
  frameRate(60);
}

// -----------------
void draw()
{
  if (go)
  {
    pg.noStroke();
    color sorted_color = c[round(random(2))];
    int quad_width  = 120 + (int)random(20);
    int quad_height = 50  + (int)random(10);
    x = random(width);
    y = random(height);
        
    float distance = 0;
    passed = true;
    color c1 = pg.get((int)x+quad_width/2,(int)y+quad_height/2);
    color c2 = pg.get((int)x+3*quad_width/4,(int)y+3*quad_height/4);
    color c3 = pg.get((int)x+quad_width/3,(int)y+quad_height/3);
    color c4 = pg.get((int)x+quad_width,(int)y+quad_height);
    pg.fill(200);
    while (sorted_color == c1 && 
           sorted_color == c2 && 
           sorted_color == c3 &&
           sorted_color == c4)
    { 
      sorted_color = c[round(random(2))];
    }
    pg.fill(sorted_color);
    for (int i=0; i<counter; i++)
    {
       distance = dist(x,y,v[i].x,v[i].y);
       if (distance < 40)
       {
          passed = false;
       }
    }
 
    if (passed)
    {
      if (counter == vector_size)
      {
         counter = 0;
         go = false; 
      }
      
      // Place a new Vector inside the Array
      v[counter] = new PVector(x,y);
      counter ++;

      pushMatrix();
      pg.quad(x + random(3), y + random(3),
       x + quad_width + random(3), y + random(3),
       x + quad_width + random(3), y + quad_height + random(3),
       x + random(3), y + quad_height + random(3));
       popMatrix();
       pg.endDraw();
       image(pg.get(),0,0);
    }
  }
}

void mouseClicked()
{
  go = true;
  background(#bd3825);
  pg.beginDraw();
  pg.background(#bd3825);
}



