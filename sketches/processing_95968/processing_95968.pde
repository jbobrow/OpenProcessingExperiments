
class Face {
float x;
float y;
float eyesize;
Face(float randomx){
  x = randomx;
  y = randomx;
  eyesize = random(20,80);
}
void drawFace() {
    // move to the center of canvas:
    pushMatrix();
    translate(x, y);

    // paint in white:
    fill(255);
    // head:
    ellipse(0, 0, 300, 300);        

    // paint in black:
    fill(0);
    // mouth
    rect(-100, 50, 200, 20);
    // nose
    line(0, 0, 0, 20);
    // eyes
    ellipse(-70, -50,eyesize,eyesize);
    ellipse( 70, -50,eyesize,eyesize);
    popMatrix();
}
void move(float amount){
  x= x + random(-amount,amount);
  y= y + random(-amount,amount);
}
}
Face[] myfaces;
int numfaces = 100;

Face jack;

void setup(){
  size(600,600);
  myfaces = new Face[numfaces];
  for (int i =0; i < numfaces; i++){
    myfaces[i] = new Face(i*4);
  }
  jack = new Face (width/2);
}


void draw(){
  background(255);
  strokeWeight(10);
  jack.drawFace();
  jack.move(5);
  for(int i = 0; i <numfaces; i++){
    myfaces[i].move(50);
    myfaces[i].drawFace();
  }
    

}
