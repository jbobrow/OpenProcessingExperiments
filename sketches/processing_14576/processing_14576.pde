
void setup() {
  size(300,300);
  smooth();
}

void draw() {
  background(16,174,178);
  translate(-20,-10);
  for(int y=0; y<400; y=y+50) {
    for(int x=0; x<350; x=x+40) {
      pushMatrix();
      scale(0.4);
      translate(x*2.5,y*2.5);
      rotate(radians(-frameCount));
     ssdraw();
      popMatrix();
    }
  }
}

void ssdraw() {
  noStroke();
  scale(1);
  fill(255);
  ellipse(100,90,60,60);
  ellipse(100,50,40,40);
  fill(0);
  ellipse(90,50,6,6);
  ellipse(110,50,6,6);
  fill(32,109,214);
  ellipse(100,75,5,5);
  ellipse(100,90,5,5);
   ellipse(100,105,5,5);
  fill(242,183,17);
  rect(82,62,35,5);
  rect(105,62,5,25);
}



                
                                                
