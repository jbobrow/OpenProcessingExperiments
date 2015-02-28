
PImage img;
int numStar;
float ranNum;
float time;

void setup() {
  size(1024, 359);
  img = loadImage("in1.jpg");
  image(img,0,0);
}
 
void draw() {
  smooth();
  noStroke();
 
  //aurora
  fill(random(255),100,255,15);
  rect(mouseX,mouseY,30,mouseY);
  
  //reset
  if(mousePressed == true) {
  fill(random(255),100,255,15);
    image(img,0,0);
    time = 0;
    numStar = 0;
    ranNum = 0;
  }
}


