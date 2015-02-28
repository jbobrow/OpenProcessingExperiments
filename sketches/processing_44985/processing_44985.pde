
PImage s;

int logoColor = 255;
int cols=8;
int rows=8;
float x, y;

void setup() {
  size(600, 600);
  smooth();
  s = loadImage("final_logo_orator.png");
  colorMode(HSB);
  imageMode(CENTER);
  frameRate(2);
}
 
void draw() {
  background(255);
   
  for (int i=0;i<cols;i++) {
    for (int j=0;j<rows;j++) {
      drawLogo(i*width/cols, j*height/rows);
    }
  }
}

void drawLogo(int _x, int _y){
  pushMatrix();
  translate(_x+40, _y+10);
  scale(random(0.5));
  for (int i=0;i<2;i++) {
    tint(random(logoColor), random(128,255), random(128,255), random(180));
    float ypos = random(125, 275);
    logo(-160+(160*i), ypos);
  }
  popMatrix();
}
 
void logo(float _xpos, float _ypos) {
 
  x=_xpos+random(-10,10);
  y=_ypos+random(-10,10);

 image(s, x, y, 400, 400);

}
 
void mousePressed() {
   logoColor=(logoColor+32)%255;
  println(logoColor);
}

