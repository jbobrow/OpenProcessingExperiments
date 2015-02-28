
PImage img;
int numStar;
float ranNum;
float time;
boolean flag;
 
void setup() {
  img = loadImage("in1.jpg");
  size(1024, 359);
  image(img,0,0);
  colorMode(HSB);
  flag = true;
}
 
void draw() {
  smooth();
  noStroke();
 
  //aurora
  fill(random(255),100,255,30);
  rect(10,10,mouseX,mouseY);
  
  //star
  if(numStar < 200) {
    fill(255);
    ellipse(random(width),random(height),random(1,3),random(1,3));
    numStar++;
  }
 
 
  //reset
  if(mousePressed == true) {
    image(img,0,0);
    time = 0;
    numStar = 0;
    ranNum = 0;
  }
}



