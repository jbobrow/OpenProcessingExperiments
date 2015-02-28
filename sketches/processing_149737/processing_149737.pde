
class pacman {
  int x=200;
  int y=300;
  int r=30;
  void draw(){
    fill(255,230,36);
    ellipse(x,y,r,r);
  }
}
void setup(){
  size(800,600);
}
void draw(){
  background(0);
  pacman.draw();
  
}
