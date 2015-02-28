
int distance = 30;
int boxNum = 6;
int halfDis;
int switchNum = 1;//Switch
int z, x, y;
int posz, posy, posx;
int culik = 0;
void setup() {
  size(700, 500, P3D);
  halfDis = distance * (boxNum - 1)/2;

  noStroke();
}
void draw() {
  randomSeed(culik);
  background(0);

  
  translate(width/2, height/2);
  rotateX(radians(-mouseY));
  
  rotateY(radians(-mouseX));

  for ( z = 0; z < boxNum; z ++) {
    for ( y = 0; y < boxNum; y ++) {
      for ( x = 0; x < boxNum; x ++) {
        posz = z;
        posy = y;
        posx = x;
        move();
        pushMatrix();
        translate(posx * distance - halfDis, 
        posy * distance - halfDis, posz * distance );
        color c = randomC();
        boxR(c);
        popMatrix();
        rotateX(radians(-mouseY*0.005));
        rotateY(radians(-mouseX*0.005));
      }
    }
  }
}



void move() {

  switch(switchNum) {
  case 1:
    posz = z;
    posy = y;
    posx = x;
    break;

  case 2:
    posz = x;
    posy = z;
    posx = y;
    break;

  case 3:
    posz = y;
    posy = x;
    posx = z;
    break;

  case 4:
    posz = z;
    posy = z;
    posx = z;
    break;

  case 5:
    posz = y;
    posy = y;
    posx = y;
    break;

  case 6:
    posz = x;
    posy = x;
    posx = x;
    break;

  case 7:
    posz = x;
    posy = x;
    posx = z;
    break;

  case 8:
    posz = y;
    posy = y;
    posx = z;
    break;

  case 9:
    posz = z;
    posy = z;
    posx = x;
    break;
  }
}

color randomC() {
  colorMode(HSB, 360, 100, 100);
  color c = color(random(150, 200), random(100), random(100), 100);
  return c;
}

void boxR(color cc) {
  fill(cc);
  int s = int(random(10, 30));
  box(s, s, s);
}

void mouseDragged() {
  culik =int(random(1000));
}

void keyReleased() {
  if (key == 'z') switchNum = 1;
  if (key == 'x') switchNum = 2;
  if (key == 'c') switchNum = 3;
  if (key == 'v') switchNum = 4;
  if (key == 'b') switchNum = 5;
  if (key == 'n') switchNum = 6;
  if (key == 'm') switchNum = 7;
  if (key == ',') switchNum = 8;
  if (key == '.') switchNum = 9;
}

void keyPressed() {
  if (keyCode == UP) culik = int(random(1000));
  if (keyCode == RIGHT) halfDis += 20;
  if (keyCode == LEFT) halfDis -= 20;
  if (keyCode == ENTER) halfDis  = distance * ( boxNum -1)/2;
  
}



