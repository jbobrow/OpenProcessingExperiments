

float delta=3; 
float r1=200;
float r2=190;
float r3=180;

void setup() {
  size(600, 600, P3D);
  frameRate(10);
  smooth();
  strokeWeight(5);
}

void draw() {
  background(0);

  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  rotateZ(radians(mouseX+mouseY));


  for (float deg1 =0; deg1<360; deg1+=delta) {
    for (float deg2 =0; deg2<360; deg2+=delta) {
      float theta = radians(deg1);
      float vega = radians (deg2);

      float redX = r1 * sin(theta) * cos(vega);
      float redY = r1 * sin(theta) * sin(vega);
      float redZ = r1 * cos(theta);
      stroke(255, 0, 0);
      point(redX, redY, redZ);

      if (mousePressed) {
        float greenX = r2 * sin(theta) * cos(vega);
        float greenY = r2 * sin(theta) * sin(vega);
        float greenZ = r2 * cos(theta); 
        stroke(0, 255, 0); 
        point(greenX, greenY, greenZ);

        float blueX = r3 * sin(theta) * cos(vega);
        float blueY = r3 * sin(theta) * sin(vega);
        float blueZ = r3 * cos(theta);
        stroke(0, 0, 255);
        point(blueX, blueY, blueZ);
      }
    }
  }
}
