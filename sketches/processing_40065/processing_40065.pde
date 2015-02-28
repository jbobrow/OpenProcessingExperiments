
int x,y;

void setup() {
  size(440,220);
  fill(0);
  smooth();
}

void draw() {
  background(0);
    pushMatrix();
    fill(255,255,0);
  translate(width/2,height/2);
  //rotate(angle);
  ellipse(x,y, 50, 50);
 popMatrix();
 //angle+=0.1;
  //x++;y--;
 pushMatrix();
 fill(255,0,255);
  translate(width/2,height/2);
 rotate(radians(frameCount));
 
  
 rect(0,0, 100, 100);
popMatrix();

}
