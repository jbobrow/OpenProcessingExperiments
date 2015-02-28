
int counter;float posx,posy,vx,vy,cor1,cor2,cor3;
void setup () {
  size (screen.width,screen.height);
  smooth ();
  posx = 5;
  posy = 6;
  cor1 = 10;
  cor2= 25;
  cor3= 9;

    background (255,0,0);
}
void draw() {

  
  stroke (0,0,0);
  strokeWeight(5);

strokeWeight(8);
fill(255,255,255);

ellipse (mouseX,mouseY,mouseY-400/4,mouseX-400/4);
cor1 = cor1 + 2;


}






//xy 700/5;xy 700/5

