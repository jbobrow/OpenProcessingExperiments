

PImage a;
PImage b;
PImage c;
PImage d;
int position1 = 259;
int position2 = 341;
int switchX = 2;
int slumber = 1;

void setup() {
  size(600, 600);
  background(255);
  a= loadImage("Puerta.png");
  b= loadImage("Puerta1.jpg");
  c= loadImage("Puerta2.jpg");
  d= loadImage("Proyeccion.png");
  imageMode(CENTER);
}

void draw() {

  background(255);
  
  if (mousePressed) {
    switchX = 0;
  }

  if (mousePressed) {
    switchX = 0;
  }

  if (position1 == 176) {
    switchX = 1;
  }

  if (position1 == 260) {
    switchX = 2;
  }

  if (position2 == 424) {
    switchX = 1;
  }

  if (position2 == 340) {
    switchX = 2;
  }

  if (switchX == 0) {
    position1--;
    position2++;
  }
  
   if (switchX == 2) {
    position1 = 259;
    position2 = 341;
  }
  else if (switchX == 1) {
    position1++;
    position2--;
  }
  image(a, width/2, height/2, a.width/3, a.height/3);
  image(b, position1, height/2, b.width/3, b.height/3);
  image(c, position2, height/2, c.width/3, c.height/3);
  
  if (slumber == 2) {
    image(d, width/2, height/2, d.width/3, d.height/3);
    fill(73,38,66);
    textSize(20);
    text("WHO DISTURBS MY SLUMBER?",222,500);
  }
}
void mouseReleased() {
slumber = 2;

}



