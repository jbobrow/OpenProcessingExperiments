
void setup()
{
  size( 500,500 );
  background( 10,250,250);
  stroke(0);
  //fill(250,255,250);
}

int[] posX = new int[30];
int[] posY = new int[30];

void draw() {
  if (mousePressed) {
translate(mouseX,mouseY);
  rotate(frameCount/10.0);
  if (mousePressed) {
      fill(250,100,250);
    ellipse(30,10, 30,10);
  rotate(frameCount/20.0); 
      fill(250,255,150);    
      ellipse(60,30, 50,10);
  rotate(frameCount/15.0); 
     fill(100,255,50);
    ellipse(20,30, 25,30);
  }
}
}

void keyReleased()
{
  if (key=='c' || key=='C') {
    background(10,250,250);
} }
