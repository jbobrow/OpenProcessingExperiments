
void setup () {
  size(300,300) ;
  background(0,0,0);
  frameRate(25);


}
 int x = 0 ;
 int y = 0;

void draw() {
stroke(100,x+20,y+100);
 fill(x+100,x,20) ;
  rect(width/4,height/3, x, y) ;
  x++;
  y++;
  if (x>300) {
   x=0;
    if (y>300) {
      y=0;
    }
}
}


