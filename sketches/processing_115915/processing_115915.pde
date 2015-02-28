

PImage[] img = new PImage[20]; 
PImage img2;
int copy = 20 ; 
color col = color(0,220,random(255));
float a = 0;
float A = 100;

void setup() {
  size(800, 800); 
  background(col);
  frameRate(30);
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".gif");
  }
  img2 = loadImage( "toast.gif" );
}
void draw() {
  
  image(img[3], mouseX, mouseY);
  image(img[1], mouseX * cos(a), mouseY * sin(a),100,100);

  float r = random(0, 800); 
  
  for (int i = 0; i < 20; i ++) {
    image(img[i], r, copy*i);
  }
  
  image(img2, A, 300, 200, 150);


  A = A + 1;
  a = a + 0.5;
  
  
}

void keyPressed() {
  saveFrame("_######.png");
}



