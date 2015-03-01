
float delta = 6;
PImage img;

void setup()
{
  size(580, 800, P3D);
  colorMode(HSB);
  frameRate(60);
  img = loadImage("800.png");
}


void draw()
{
  background(0);
  tint(255, 50);
  image(img, 0, 0);
  image(img, width/3,0);
  image(img, 2*width/3,0);
  noTint();
  image(img, 520,720, 60,80);

  translate(width/2, height/3, 0);
  rotateX(radians(mouseY));
  //rotateY(radians(mouseX));
  
  //draw skull
  for (float rho = 0; rho < 210; rho +=20) {
    for (float deg1 = 0; deg1 < 360; deg1 += 3) {
      for (float deg2 =0; deg2 < 180; deg2 += 3) {
        float phi = radians(deg2);
        float theta = radians(deg1);
        float x = rho * sin(phi) * cos(theta);
        float y = rho * sin(phi) * sin(theta);
        float z = rho * cos(phi);
        stroke(255,100);
        strokeWeight(5);
        point(x, y, z);
      }
    }
  }

  //draw face

  translate(-width/2+4*width/10, 0, 0);


  for ( float r = 0; r < 150; r+=10) {
    for (float z = 0; z < 300; z+=3) {
      for (float deg = 0; deg < 360; deg += delta) {

        float theta = radians(deg);
        float x = r * cos(theta);
        float y = r * sin(theta);

        strokeWeight(5);
        stroke(255,100);
        point(x, y, z);
      }
    }
  }
  //eye1

  translate(-30, -150, 50);
  for ( float r = 0; r < 40; r+=2) {
    for (float deg2 =0; deg2 < 180; deg2 += delta) {
      float theta = radians(deg2);
      for (float deg = 0; deg < 360; deg += delta) {

        float phi = radians(deg);
        float x = r * sin(phi)*cos(theta);
        float y = r * sin(phi)*sin(theta);
        float z = r * cos(phi);

        stroke(0);
        strokeWeight(5);
        point(x, y, z);
      }
    }
  }
  
  //eye2
  translate(0, 300, 0);
  for ( float r = 0; r < 40; r+=2) {
    for (float deg2 =0; deg2 < 180; deg2 += delta) {
      float theta = radians(deg2);
      for (float deg = 0; deg < 360; deg += delta) {

        float phi = radians(deg);
        float x = r * sin(phi)*cos(theta);
        float y = r * sin(phi)*sin(theta);
        float z = r * cos(phi);

        stroke(0);
        strokeWeight(5);
        point(x, y, z);
      }
    }
  }
}

