
float x, y;
float m = 1;
float m1 = 1;
float angle = 0;
float diff = 1;
 
PImage[] img = new PImage[20];
int copy = 100 ;
 
void setup() {
  size(800, 800);
  background(0);
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".png");
  }
}
void draw() {
  fill(0,15);
  rect(0,0,800,800);

  pushMatrix();
  translate(width, 0);
  rotate(-radians(angle));
  imageMode(CENTER);
  image(img[0], 0, 0, 300, 300);
  popMatrix();  
 
  pushMatrix();
  translate(0, height);
  rotate(radians(angle));
  imageMode(CENTER);
  image(img[8], 0, 0, 300, 300);
  popMatrix();
 
  pushMatrix();
  rotate(radians(angle));
  imageMode(CENTER);
  image(img[14], 0, 0, 300, 300);
  popMatrix();
 

  pushMatrix();
  translate(width, height);
  rotate(-radians(angle));
  imageMode(CENTER);
  image(img[15], 0, 0, 300, 300);
  popMatrix();
  
  x = m1 * cos(angle);
  y = m * sin(angle);
  translate(mouseX, mouseY);
  rotate(m*3);
  image(img[15], x*2, y*2);

  noStroke();
  fill(0, 25);
  rect(0,0,800,800);
 
  for (int i = 0; i < 20; i ++) {
    image(img[i], copy*i, mouseY/2);
  }
 
  angle = angle + 5;
  m = m - diff;
 
  if ( m == 0 || m == 100) {
    diff =  diff * -1;
  }
}
 
 






