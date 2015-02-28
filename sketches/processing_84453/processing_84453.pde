
//Rotated Ellipses by James 
// Elliptical Universe by Dale Adams

int k, z, vert, elpWidth, elpHeight, colorR, colorG, colorB;


void setup() {
  size(750, 750, P3D);
  vert = 17;
  noFill();
}

void draw() {
  background(0);
  smooth();
  lights();
  translate(mouseX, mouseY);

  for (int j=0; j<vert; j++) {
    rotateX(noise(radians(j)));
    rotateY(noise(radians(j)));
    rotateZ(noise(radians(j)));


    for (int i=0; i<j; i++) {
      stroke(255, i*j);
      colorR = int(map(i, 0, vert, 135, 255));
      colorG = int(map(j, 0, vert, 0, 255));
      colorB = int(map(i*j, 0, vert*vert, 135, 255));
      stroke(colorR, colorG, colorB, 200);
      elpWidth = int(cos(i)*width/k*z);
      elpHeight = int(tan(i)*height/z*k);
      //sphere(10);
      ellipse(0, 0, elpWidth, elpHeight);
    }
    
    for (k = int(100*mouseY/height); k > 100; k--) {
      }
    for (z = int(100*mouseX/width); z < 1; z++) {
    }
  }
  println(z);
  println(k);
}



