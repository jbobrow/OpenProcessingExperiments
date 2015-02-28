
PImage img;
PImage img2;
PImage img3;
PImage img4;
float angerposX  = -50;
float angerposY = 325;
float angerposX2 = 380;
float angerposY2 = 325;
float angerposX3 = -50;
float angerposY3 = 150;
float angerposX4 = 380;
float angerposY4 = 150;
float angerposX5 = -50;
float angerposY5 = 0;
float angerposX6 = 380;
float angerposY6 = 0;

void setup() {
  size(500,500);
  img = loadImage("anger.png");
  img2 = loadImage("compassion.png");
  img3 = loadImage("background.png");
  img4 = loadImage("compassion2.png");
}

void draw() {
  background(img3);
 if (mouseX<251) {
  image(img2,mouseX-150,mouseY-25,200,50);
 }
  image(img,angerposX,angerposY,250,200);
  angerposX = angerposX + .75;
  image(img,angerposX2,angerposY2,250,200);
  angerposX2 = angerposX2 -.75;
  image(img,angerposX3,angerposY3,250,200);
  angerposX3 = angerposX3 + .75;
  image(img,angerposX4,angerposY4,250,200);
  angerposX4 = angerposX4 -.75;
  image(img,angerposX5,angerposY5,250,200);
  angerposX5 = angerposX5 + .75;
  image(img,angerposX6,angerposY6,250,200);
  angerposX6 = angerposX6 -.75;
  
  if (mouseX>250) {
    image(img4,mouseX-50,mouseY-25,200,50);
  }
  
  
  if (mouseX-angerposX<150 && 325-mouseY<1) {
    angerposX = angerposX-50;
  }
   if (angerposX2-mouseX<1 && 325-mouseY<1) {
    angerposX2 = angerposX2+50;
  }
  if (mouseX-angerposX3<150 && 200<mouseY && mouseY<275) {
    angerposX3 = angerposX3-50;
  }
  if (angerposX4-mouseX<1 && 200<mouseY && mouseY<275) {
    angerposX4 = angerposX4+50;
  }
  if (mouseX-angerposX5<150 && 50<mouseY && mouseY<150) {
    angerposX5 = angerposX5-50;
  }
  if (angerposX6-mouseX<1 && 50<mouseY && mouseY<150) {
    angerposX6 = angerposX6+50;
  }
  
  if (angerposX<-100) {
    angerposX = -100;
  }
  if (angerposX3<-100) {
    angerposX3 = -100;
  }
  if (angerposX5<-100) {
    angerposX5 = -100;
  }
  if (angerposX2>380) {
    angerposX2 = 380;
  }
  if (angerposX4>380) {
    angerposX4 = 380;
  }
  if (angerposX6>380) {
    angerposX6 = 380;
  }
  
  if (angerposX > 180 || angerposX2 < 180 || angerposX3 > 180 || angerposX4 < 180 || angerposX5 > 180 || angerposX6 < 180) { 
    fill(255,0,0);
    rect(0,0,500,500);
  }
}

