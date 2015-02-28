
int x=0;
int y=55;

void setup() {
  size(300,100);
}

void draw() {
  background(204);
  line(x,y,x+20,y-40);
  line(x+10,y,x+30,y-40);
  line(x+20,y,x+40,y-40);
  x=x+4;
  println(x);
  if(x>300) {
    x=-40;
  }
}



