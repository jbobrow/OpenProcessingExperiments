

PImage[] img = new PImage[16];
PImage img16, img17, img18, img19;
int copy = 50 ;
float angle = 0;
float r = 400;
 
float diff = 1;
 
void setup() {
  size(600, 600);
  background(0);
  img16 = loadImage("17.png");
  img17 = loadImage("16.jpg");
  img18 = loadImage("19.png");
  img19 = loadImage("18.jpg");
     
  imageMode(CENTER);
  for (int i = 0; i < 16; i ++) {
    img[i] = loadImage( i+".jpg");
  }
}
void draw() {
   
  int m = millis();
 
 
 
  pushMatrix();
 
  tint(m/100 % 255);
  image(img16, 300, 300);
  tint(255, 100);
  image(img19, random(0, 600), random(0, 600));
  image(img17, random(0, 600), random(0, 600));
  popMatrix();
  image(img18, 300, 300);
  rotate (r);
 
   
  for (int i = 0; i < 16; i ++) {
    image(img[i],  r * cos(angle) , i*60);
    angle = angle + 2;
  r = r - diff;
  }
  if ( r == 0 || r == 400) {
    diff =  diff * -1;
  }
 
}
 
void keyPressed() {
  saveFrame("_######.png");
}

  


