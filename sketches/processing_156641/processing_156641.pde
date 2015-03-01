
boolean isLightOn = true;
PImage atkinson;
PImage lamp;

void setup() {
  size(500,500);
  atkinson = loadImage("atkinson.png");
  lamp = loadImage("lamp.png");
}
void draw() {
  
  
  if(isLightOn){
    background(0);
    for(int i = 0; i < 9; i = i+1){
      if(dist(mouseX, mouseY,50*i+50,450)<=25){
        fill(random(255), random(255), random(255));
      } else {
        fill(255);
      }
      ellipse(50+i*50,450,50,50); 
    } 
  } else {
    background(#ffea00);
    for(int i = 0; i < 9; i = i+1){
      if(dist(mouseX, mouseY,50*i+50,450)<=25){
        fill(random(255), random(255), random(255));
      } else {
        fill(255);
      }
      ellipse(50+i*50,450,50,50); 
    }
  }
  
  
  noStroke();
  fill(255);
  imageMode(CENTER);
  image(lamp,70, 70, 100, 100);
  
}
void mousePressed() {
  if(dist(mouseX,mouseY,70,70) <= 50) {
    isLightOn=!isLightOn;
    imageMode(CORNER);
    image(atkinson,100,100,300,300);
  }
}
  


