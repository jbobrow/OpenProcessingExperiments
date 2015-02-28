
int value = 0;
int x = 350;
int y = 50;
int k = 0;

void setup(){
 size(700,400); 
 rectMode(CENTER);
}
  
void draw() {
  fill(value,50);
  rect(350, 200, x, y);
}

void mouseDragged() 
{
  value = value + 5;
  x = x+10;
  y = y+15;
  if (value > 255) {
    value = 0;
  }
  if (x==700 || y==400){
    x = 0;
    y = 0;
    k = 1;
    }
    if (k==0){
      k=1;
    }
}

