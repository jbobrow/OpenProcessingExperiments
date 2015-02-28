
int x;
int y;

void setup() {
  size (600,600);
}
void draw (){
  background (0);

  x = 0;
  y = 0;

  while(y < 600){
    x=0;
    while ( x < 600){
      fill (0);
      rect (x,y,25,25);
      
      fill (random (255), random (255), random (255));
      ellipse(x,y,12,12);
      
      fill (random (255), random (255), random (255));
      rect (x+13,y+5,10,35);
      x= x + 50;
    }
    y = y +50;
  }

}

