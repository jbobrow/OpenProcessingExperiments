
int Y_AXIS = 1;
int X_AXIS = 1;
int RAD = 1;
int TRANS = 1;
color a1, a2, b1, b2, c1, c2, d1, d2, e1, e2;

void setup()
{
  size(600, 600);

  a1 = color(60); // PODIUM
  a2 = color(0);

  b1 = color(255, 255, 100); // BACKGROUND
  b2 = color(255, 100, 100);

  c1 = color(255, 255, 200); // CANDLE
  c2 = color(255, 255, 100);

  d1 = color(255, 0, 0); // FLAME
  d2 = color(255, 255, 0);
  
  e1 = color(0);
  e2 = color(0,0);

  //noLoop();
}

void draw()
{
  background(100);

  pushMatrix();
  //translate(width/2, height/2);
  setGradient(0, 0, width, height, b1, b2, RAD);
  popMatrix();


  noStroke();
  fill(0);
  setGradient(210, 591, 200, 20, a1, a2, X_AXIS); //GROUND

  setGradient(280, 340, 60, 250, c1, c2, X_AXIS); //CANDLE
  //rect(280, 340, 60, 250);

  stroke(255, 120, 120); 
  fill(255, 120, 0);
  bezier(295, 268, 251, 399, 397, 339, 299, 265);
  
  setGradient(0,0,width,height,e2,e1,TRANS);
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis)
{
  noFill();

  if (axis == X_AXIS) // Side to side
  {
    for (int i = x; i <= x+w; i++) 
    {
      float inter = map(i, x, x+w, 0, 1);
      color a = lerpColor(c1, c2, inter);
      stroke(a);
      line(i, y, i, y+h);
    }
  }
  if (axis == TRANS)  // gRADiant
  {
    for (int i = y; i <= w*2; i++)
    { 
      float dis = dist(width/2, height/2, mouseX, mouseY);
      float inter3 = map(dis, 0, 255, 0, 1);
      color c = lerpColor(c1, c2, inter3);
      stroke(c);
      ellipse(width/2, height/2, i, i);
    }
  }
  if (axis == RAD)  // gRADiant
  {
    for (int i = y; i <= w*2.5; i++)
    {   
      float inter2 = map(i, 0, 600, 0, 1);
      color c = lerpColor(c1, c2, inter2);
      stroke(c);
      ellipse(width/2, height/2, i, i);
    }
  }
  
}
