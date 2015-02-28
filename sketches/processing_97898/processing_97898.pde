
int start;
int z = 320;
int timer = 10;
int counter = 0;


PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

float speed = 5.5;
float d;
float f;
float r;
float s;

void setup() {
size(640, 480);
background (255);
smooth();
frameRate(60);
textFont(createFont("Arial",50));
start = millis();

img = loadImage ("background.png");
img2 = loadImage ("playerfront.png");
img3 = loadImage ("playerleft.png");
img4 = loadImage ("playerright.png");
img5 = loadImage ("Ghost2.png");
}

void draw() {
  
  
    float d = dist(width/2, height/2, mouseX, mouseY);
  float maxDist = dist(0, 0, width/2, height/2);
  float gray = map(d, 0, maxDist, 0, 255);
  rect(0, 0, width, height);
  
  image(img, 0, 0);    //background image
 
  
  
  if (mousePressed == true){
  line(z + 25, 420 + 25, mouseX, mouseY);
  fill(0, 0, 225);
  strokeWeight(20);
}
  
  textSize(20);
    text("Ghosts", 543, 250);
    text("Time", 550, 350);
    text(timer/1000, 550, 370);
    timer = millis()-start;
  
   
  
  textSize(24);
  fill(75, 255, 88);
  text("hello world", 230, 590);
  
if (keyPressed && (key == CODED)) {    //player movement
  if (keyCode == LEFT) {
    z--;
  } else if (keyCode == RIGHT) {
    z++;
  }
}
image(img2, z, 420);               //player
if (keyPressed && (key ==CODED)) {  //player sprite change
  if(keyCode ==LEFT){
    image(img3, z, 420);
  } else if (keyCode == RIGHT){
    image(img4, z, 420);
    
  }
}

d += random(-1, 3); //ghostmove
f += random(-5, 5); //ghostmove

image(img5, d, f); //ghost upload

d += random(-2, 4); //ghostmove
f += random(-2, 6); //ghostmove

image(img5, d + 40, f - 40); //ghost upload

}


 




