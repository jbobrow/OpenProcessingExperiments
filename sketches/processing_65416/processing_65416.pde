

PFont Laser;
//PImage Ecchi;
PShape Debian;
int sonicX = 0;
int segaCDY = 0;
int Kx = width - 10;
int Ky = 10;
char charmander = A;

void setup() {
  size (640, 480);
  Laser = loadFont ("AgencyFB-Reg-48.vlw");
 //Ecchi = loadImage ("Boing_boing_boing.png");
  Debian = loadShape("slime.svg");
  textFont(Laser);
}
void draw () {
  background(255);
  smooth ();

  float fireRed = random (255);
  float blueSea = random (255);
  float leafGreen = random (255);
  fill (fireRed, blueSea, leafGreen);
  stroke (fireRed, blueSea, leafGreen);
  //image (Ecchi, width - 150, height - 150);
  float diameter = map(mouseX, 0, width, 10, 800);
  shape(Debian, width/2, height/2, diameter, diameter);
  rect (Kx, Ky, 45, 45);
  textSize(36);
  text("Daniel Paim de Mattos!!!", 15, height - 10);
  
  triangle (mouseX, mouseY, mouseX+40, mouseY +55, mouseX - 40, mouseY +55);
  if ((keyPressed) && (key != CODED)) {
    text(charmander, width - 35, 35);
  }
  if ((keyPressed) && (key == CODED)) {
    if (keyCode == LEFT) {
      fill(#E82121);
      rect(Kx, Ky, 50, 50);
      Kx--;
    }
    if (keyCode == RIGHT) {
      fill(#21E822);
      rect(Kx, Ky, 50, 50);
      Kx++;
    }
    if (keyCode == UP) {
      fill(#2321E8);
      rect(Kx, Ky, 50, 50);
      Ky--;
    }
    if (keyCode == DOWN) {
      fill(#DA21E8);
      rect(Kx, Ky, 50, 50);
      Ky++;
    }
  }
  if ((keyCode == DOWN) && (keyCode == LEFT)) {
    fill(#DA21E8);
    rect(Kx, Ky, 50, 50);
    Ky++;
    Kx--;
  }
  if (Kx == 0) {
    Kx = width;
  }
  if (Kx == width + 1) {
    Kx = 0;
  }
  if (Ky == height) {
    Ky = 0;
  }
  if (Ky == -1) {
    Ky = height;
  }
  rect(Kx, Ky, 50, 50);
  smooth ();
  stroke(0);
  for (int sonicX = 0; sonicX < width; sonicX += 25) {
    for (int segaCDY = 0; segaCDY < height ; segaCDY +=45) {
      stroke(255);
      stroke(0);
      line (sonicX, height/2, width/2, segaCDY);
    }
  }
}


