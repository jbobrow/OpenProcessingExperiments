
float theta =0;

void setup() {
  size(600,600);
  smooth();
}

void draw() {
  background (0);
  stroke(mouseX,mouseY, random(255));

  translate (width/2,height/2);

  for(float i=0; i< TWO_PI; i+=0.2) {
    pushMatrix();
    rotate(theta+i);
    line(0,0,100,0);
    for(float j=0; j < TWO_PI; j+=0.5) {
      pushMatrix();
      translate( 100,0);
      rotate (-theta-j);
      line (0,0,50,0);
      line (50,50,50,0);
      line (100,100,50,0);
      line (200,200,50,0);
    
      popMatrix();
    }
    popMatrix();
  }
  endShape();
  theta+=0.01;
}


