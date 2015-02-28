
float x = 0;
float y = 0;
float dx = 1.0;
float dy = 1.0;
float r = 60;
int n = 2;

void setup (){
  size(250,250);
  smooth();
  background(0,210);
  frameRate(60);
  fill(222,222,222,220);
}

void draw (){
  x = x + dx;
  y = y + dy;
  if (x < 0){
    x = 0;
    dx = 1.0;
    n+=n;
    r = (3*r)/4;
  }
  else if (x > 125){
    x = 125;
    dx = -1.0;
  }
    
  if (y < 0){
    y = 0;
    dy = 1.0;
    n+=n;
    r = (3*r)/4;
  }
  else if (y > 125){
  y = 125;
  dy = -1.0;
  }
    
    ellipse(125 + x,125 + y,r,r);
    ellipse(65 + x, 185 + y,r,r);
    ellipse(185 + x, 65 + y,r,r);
    ellipse(125 - x,125 - y,r,r);
    ellipse(65 - x, 185 - y,r,r);
    ellipse(185 - x, 65 - y,r,r);
}


