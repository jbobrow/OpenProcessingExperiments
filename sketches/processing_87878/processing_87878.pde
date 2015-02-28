
float x;
float y;
float conter = 0;
int largeur = 60;
int hauteur = 60;

void setup() {
  size(1200, 1200);
  smooth();
  frameRate(30);

  x = width*0.5;
  y = height*0.5;
}

void draw() {
  background(255);
  translate(x, y);

translate(-300,0);

  pushMatrix(); 
  for (int i = 0; i < 300; i= i+30) {
    rotate(cos(conter)*0.3);
    translate(40, 0);
    rect(i, 0, 60 - (i/10), 60 - (i/10));
  }
  popMatrix();

  conter += 0.02;
  //println(conter);
}
