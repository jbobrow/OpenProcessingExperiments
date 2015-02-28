

void setup() {
  size (600, 600);
  background(0, 0, 0);
}

void draw() {

  pushMatrix();

  for ( int z=0; z<360; z=z+180) {

    float a=random(-z, z);
    float thetaY=width*sin(radians(a));
    float thetaX=height*cos(radians(a));

    stroke(#FFB62E, 100);
    strokeWeight(2);
    fill(#2E8AFF, 10);

    float centerX=mouseX;
    float centerY=mouseY;

    rect(centerX, centerY, thetaX, thetaY);
  }
  popMatrix();

  translate(width/2, height/2);
  fill(255, 255, 255);

  for ( float a=1; a<width; a=(a+1)*1.618) {

    strokeWeight(3);
    ellipse(a, 0, a, a);
    ellipse(0, -a, a, a);
    ellipse(-a, 0, a, a);
    ellipse(0, a, a, a);
  }
}




