
/*
*  Isometric Contour Lines, kof 12
 */


float sc = 10.0;
float X = 0;

void setup() {
  size(500, 400, P3D);
  smooth();
  noiseSeed(19);
  ortho();
}

//
void draw() {

  sc += ((mouseY/10.0+5.0)-sc)/4.1;
  X += (mouseX-X)/3.0;
  background(0);

  pushMatrix();

  translate(width, height+30);
  scale(0.75);
  rotateX(radians(30));
  rotateZ(radians(X));

  for (int y = -200; y < 200;y+=1) {
    for (int x = -200; x < 200;x+=1) {

      float z = (-0.5+noise(x/300.0+frameCount/300.0, y/300.0+frameCount/200.0))*300.0+100.0;

      stroke(map(z, 0, 100, 15, 255));

      if ((z+200)%(sc)<0.4) {
        point(x, y, z);
        if (x==-200 || x==199||y==-200||y==199) {
          stroke(255, 150);
          line(x, y, 0, x, y, z);
        }
        stroke(#ffcc00, 15);

        line(x, y, 0, x, y, z);
      }
    }
  }

  popMatrix();
}


