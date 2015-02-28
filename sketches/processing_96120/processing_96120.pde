
int step=10;

void branch(int x, int y, int length, float angle, int col)
{
  pushMatrix();
  stroke(col, 60, 90);
  translate(x, y);
  rotate(angle);
  organicLine( 0, 0, 0, length, abs(length)/12, (twistiness+ abs(length)/5));
  //rect(-length/10, 0, length/10, length); 

  if (length%2==0)
  {
    fill((200-col)*y*0.2, random(255), random(70));
    ellipse(0, 0, 10, 10);
  } 
  popMatrix();

 // println(length);

  if (length>0)

  {
    branch( int((x-sin(angle)*length)), int(y+cos(angle)*length), length-step, angle+random(0.1, 1), col+18);
    //branch(int((x-sin(angle)*length)), int(y+cos(angle)*length), length-step, angle+random(0.1, 1), col+15);
    branch(int(x-sin(angle)*length), int(y+cos(angle)*length), length-step, angle-random(0.1, 1), col+21);
  }
}



void setup()
{
  noLoop();
  size(1070, 800);
  //background(255);
  noStroke();
}



void draw()
{
  background(255);
  translate(width/2, height);
  scale(1, -1);   //invert coord

  branch(0, 0, 100, 0, 0);
}


float sect=random(10, 20);
float twistiness = 1;
void organicLine(float x1, float y1, float x2, float y2, float strokeW, float howTwisty)
{
  strokeCap(ROUND);
  strokeWeight(strokeW);

  // float numSections =sect;
  float cx = x2-x1; // change in x
  float cy = y2-y1; // change in y

  float nx1 = x1; // first x
  float ny1 = y1; // first y
  float nx2, ny2;
  for (int i =1; i <sect; i++) {
    float n =random(-1, 1);
    nx2 = x1 + i/sect * cx;
    ny2 = y1 + i/sect * cy;
    //stroke(204, 102, 0);
    line(nx1, ny1, nx2+ (n *twistiness*5), ny2);
    nx1 = nx2+ (n *twistiness*5);
    ny1 = ny2;
    if (ny2>=y2-1/sect* cy)
    {
      line(nx1, ny1, x2, y2);
    }
  }
}


void mouseMoved()
{
  if (mouseY > 0)
    twistiness = map(mouseY, 0, height, 1, 9);
  redraw();
}



