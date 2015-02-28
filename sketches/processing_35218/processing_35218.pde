
void setup(){
  size(300,300);
}

int x = 1;
int y = 300;

void draw(){
  background(200);
  strokeWeight(2);
  line(0,x,x,0);
  x++;
  strokeWeight(6);
  line(300,y,y,300);
  y--;
}



