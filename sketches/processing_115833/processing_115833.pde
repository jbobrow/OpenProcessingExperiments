
float x, y;
float r = 2;
float r1 = 2;
float angle = 0;
float diff = 3;

PImage[] img = new PImage[20]; 
int copy = 50 ; 

void setup() {
  size(1200, 800); 
  background(0, 10);
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".png");
  }
}
void draw() {
  fill(0, 10);
  rect(0,0,1200,800);

  x = r1 * cos(angle);
  y = r * sin(angle);
  translate(mouseX, mouseY);
  rotate(r*2);
  image(img[10], x*2, y);
  image(img[15], mouseX, mouseY);
  
  noStroke();
  fill(0, 5);
  rect(0,0,1200,800);

  for (int i = 0; i < 20; i ++) {
    image(img[i], copy*i, mouseY/3);
  }

  angle = angle +5;
  r = r - diff;

  if ( r == 0 || r == 400) {
    diff =  diff * -1;
  }
}



void keyPressed() {
  saveFrame("_######.png");
}



