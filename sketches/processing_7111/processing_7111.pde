
int x = 2;
int y = 2;
int holder = 1000;
color colour = color(255, 165, 255);

void setup(){
  size (800, 600);
  background(0);
}

void draw(){
  
  for (int i = 0; i < holder; i+=5)
  {
  set(x,(x ^ y) % 3 + i, colour);
  }
  
  if(x < width)
  {
    x++;
  }
  else{
    x = 0;
    y++;
    colour = color(random(255), random(255), random(255));
  }
}

