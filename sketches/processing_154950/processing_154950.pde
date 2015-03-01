
int numClouds, numStars;
Stars[] strs;
Clouds[] fluffies;

void setup() {
 size(800, 600);
 numStars = 300;
 numClouds = (int)random(6, 11);
 fluffies = new Clouds[numClouds];
 strs = new Stars[numStars];
 
 for(int i=0; i < numClouds; i++){
   fluffies[i] = new Clouds(random(width), random(300));
 }
 
 for (int i=0; i < numStars; i++){
   strs[i] = new Stars(random(width), random(550));
 } 
}

void draw() {
  //background(0);
  
  if(hour() >= 20 || hour() < 5 ){
    showNightSky();
  } 
  
  if(hour()> 5 && hour() < 20){
    showDaySky();
  }
  
  drawMountains();
}

void showDaySky(){
  background(199, 234, 250); // light blue
  
  noStroke();
  fill(255, 200, 77); // sun's color
  ellipse(100,100, 100,100); // Sun
  
  for(int i=0; i < numClouds; i++){
    fluffies[i].init(); //clouds
    fluffies[i].setSpeed(.03);
  }
}

void showNightSky(){
  background(0);
  for(int i=0; i < numStars; i++){
    strs[i].init();
    if(frameCount % 16 == 0){ //twinkle effect
      strs[i].display((int)random(4));
    }
  }
    
  fill(234, 234, 232); // moon
  arc(100,100,100,100, radians(60), radians(240)); 
  noStroke();
  
  // craters on the moon
  fill(183,187,189); 
  ellipse(72,76,25,15);
  stroke(160);
  ellipse(70,90,21,17);
  noStroke();
  ellipse(77,95,20,10);
  fill(186,187,189);
  ellipse(74,101,20,10);   
  
  stroke(175);
  ellipse(95,106,16,10);
  noStroke(); 
  ellipse(91,109,13,10); 
  ellipse(90,113,16,10); 
}

void drawMountains(){  
  fill(36, 30, 20); 
  stroke(30, 30, 20);
  pushMatrix();
    translate(0,390);
    rotate(radians(45));
    rect(0, 0, 300, 400, 50);
  popMatrix();
  
  pushMatrix();
    translate(280,420);
    rotate(radians(45));
    rect(0, 0, 300, 340, 50);
  popMatrix();
  
  pushMatrix();
    translate(500,400);
    rotate(radians(45));
    rect(0, 0, 230, 300, 50);
  popMatrix();
  
  pushMatrix();
    translate(740,390);
    rotate(radians(45));
    rect(0, 0, 300, 320, 50);
  popMatrix();
}
class Clouds{
  float x, y;  // postion
  float size = 45;
  float sizeAugmenter = random(5,100);
  color fillColor = color(240,243,252); // color of clouds
  color strokeColor = color(240, 243, 255);
  
  Clouds(float xcord, float ycord){
    x = xcord;
    y = ycord;
  }
  
  void init(){
    this.drawClouds();
  }
  
  void drawClouds(){
    fill(fillColor);
    ellipse(x-8, y+12, size+sizeAugmenter, size);
    stroke(strokeColor);
    ellipse(x, y, size, size);
    
    noStroke();
    ellipse(x+8, y+12, size+sizeAugmenter, size);
  }
  
  void setSpeed(float num){
    x += num;
    if(x > width){
      x = 0;
    }
  }

}
class Stars{
  float x, y;        // position
  color fillColor = color(255, 250, 250);
  int size = 2;

  Stars(float xcor, float ycor){
    x = xcor;
    y = ycor;
  }
  
  void init(){
    this.setColor(fillColor);
    this.display(size);
  }
  
  void display(float sz){
    ellipse(x, y, sz, sz);
  }
  
  void setColor(color clr){
    fill(clr);
  }

}


