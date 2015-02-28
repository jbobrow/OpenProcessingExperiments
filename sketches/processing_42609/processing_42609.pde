
PImage rosso;
PImage verde;
PImage nero;
PImage giallo;
int gx;
int gy;

int vx=200;
int vy=200;

int nx=0;

void setup() {

  size(600, 600);
  background(255);
  rosso = loadImage("rosso.jpg");
  verde = loadImage("verde.jpg");
  nero = loadImage("nero.jpg");
  giallo = loadImage("giallo.jpg");
}

void draw () {

  background(255);
  image(rosso, 0, 0, 200, 200);
  image(verde, width-200, 200, vx, vy);
  image(nero, nx, 200, 200, 200);
  image(giallo, 0, 400, 200, 200);

  //red
  if ((mousePressed==true) 
    && (mouseX <= 200) 
    && (mouseY <= 200)) {

    image(rosso, 200, 0, 200, 200);
    image(rosso, 400, 0, 200, 200);
    image(rosso, 200, 200, 200, 200);
    image(rosso, 400, 200, 200, 200);
    image(rosso, 400, 400, 200, 200);
    image(rosso, 200, 400, 200, 200);
  }
  else {
    image(rosso, 0, 0, 200, 200);
  }

  //black
  if ((mousePressed==true) 
    && (mouseX < 200) 
    && (mouseY > 200) && (mouseY <= 400)) {

    background(255);
    nx += 4;
    image(nero, nx, 200, 300, 300);
    tint(255);
    image(verde, nx+300, 200, 200, 200);
  }
  else {
    nx=0;
    image(nero, nx, 200, 200, 200);
  }

  //yellow
  if ((mousePressed==true) 
    && (mouseX < 200) 
    && (mouseY > 400) ) {
    tint(255, 227, 0, 100);
    background(255, 227, 0, 50);
    image(giallo, int(random(width)), int(random(height)), int(random(200)), int(random(200)));
    image(verde, 200, 200, vx, vy);
  }
  else {
    noTint();
  }

  //green
  if ((mousePressed==true) 
    && (mouseX > 400) && (mouseX <= width) 
    && (mouseY > 200) && (mouseY <= 400)) {

    if (vx >= 200) {
      vx += 10;
      vy += 10;
      image(verde, width-200, 200, -vx, vy);
      stroke(255, 227, 0);
      fill(0);
      ellipse(98, 140, 40, 50);
    }
  }
  else {

    vx=200;
    vy=200;
  }
}


