
void setup(){
  size(400,400);
  background(255);
}

int R = 255;
int G = 255;
int B = 255;

void draw(){
  rectMode(CENTER);
  fill(50);
  rect(145,180,60,50,50);
  rect(240,180,60,50,50);
  stroke(50);
  rect(193,170,40,5);
  rect(115,180,10,20);
  rect(270,180,10,20);
  rect(293,180,36,18);
  fill(100,161,252,20);
  ellipse(210,190,200,250);
  fill(R, G, B);
}

  void mousePress(){
    if( R == 75 && G == 75 && B == 75){
    R = (int)random(150);
    G  = (int) random(150);
    B = (int) random(150);
    } else {
      R = 75;
      G = 75;
      B = 75;
    }
}
  


