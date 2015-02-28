
int x = 0;
int r;
int g;
int b;
int speed = 5;
int state = 0;

void setup ()
{size(400,400);
}

void draw()
{  background (r,g,b);
  
  fill (100);
  rect (x,50,50,50);
  
  fill(100);
  rect(x+50,100,50,50);
  
if(state == 0){
 x = x + speed;
 if (x > width-100){
  x = width-100;
  state = 1;
 }
}else if (state == 1) {
  x = x - speed;
  if (x < 0){
    x = 0;
    state = 0;
  }
}
}
void mousePressed () {
  r = int(random(0,255));
  g = int(random(0,255));
  b = int(random(0,255));

}


