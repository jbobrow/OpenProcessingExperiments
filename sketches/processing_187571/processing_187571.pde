
U[] u = new U[5];

void setup() {
  //basic parameters
  size(800, 800);
  background(255, 0, 0);
  for(int i = 0; i < u.length; i++){
    u[i] = new U(i*160 + 50, random(width/7, width * 6/7), random(50, 70), 76, random(255));
  }
  frameRate(30);
}

void draw() {
  background(150);
  for(int i = 0; i < u.length; i++){
    u[i].upDown();
    u[i].displayThrust(10);
    u[i].display();
    u[i].drawBubble();
  }
}

void mousePressed() {
  for(int i = 0; i < u.length; i++){
      u[i].giggle(mouseX, mouseY);
  }
}



class U{
  //U's variables
  float centerX, centerY, headW, headH, eyeColor, giggleL, giggleR;
  
  //constructor
  U(float centerX_, float centerY_, float headW_, float headH_, float eyeColor_){
    centerX = centerX_; 
    centerY = centerY_;
    headW = headW_;
    headH = headH_; 
    eyeColor = eyeColor_;
    giggleL= -3;
    giggleR= 3;
  }
  
  void display(){
    rectMode(CENTER);
    ellipseMode(CENTER);
    strokeWeight(2);
    stroke(0);
    
    //head
    fill(195, 196, 194);
    rect(centerX, centerY, headW, headH);
    
    //eyes
    fill(eyeColor);
    noStroke();
    rect(centerX - 15, centerY - 20, 15, 20);
    rect(centerX + 15, centerY - 20, 15, 20);
    
    //body
    float red = map(mouseX, 0, width, 0, 255);
    float blue = map(mouseY, 0, height, 255, 0);
    float green = dist(mouseX, mouseY, centerX, centerY);
    fill(red, blue, green);
    
    // use giggle level to determine how much the object shakes
    quad(centerX - 60 + random(giggleL, giggleR), centerY + 38 + random(giggleL, giggleR), centerX + 60+ random(giggleL, giggleR), centerY + 38+ random(giggleL, giggleR), centerX + 30, centerY + 200, centerX - 30, centerY + 200);
    fill(255);
    rectMode(CORNER);
    rect(centerX - 30, centerY + 38, 60, 162);
    
    // tail
    rectMode(CORNER);
    fill(0);
    rect(centerX - 30, centerY + 200, 60, 20);
  }
  
   
  void drawBubble(){  //power bubbles
    noFill();
    float g = random(50, 255);
    float b = random(50, 255);
    stroke(200, g, b);
    strokeWeight(2);
    ellipse(centerX, centerY + 210, 18, 18);
  }
  
  void displayThrust(int gap){
    stroke(random(170, 255), 20, 30);
    float thrustVibe = random(-1, 1);
    for(float i = centerX - 20; i < centerX + 30; i += gap){
      line(i, centerY + headH/2 + 162 + 20, i, centerY + headH/2 + 162 + 20 +20 + thrustVibe);
    }
  }
  
  void upDown(){
    centerY += random(-1, 1);
  }
  
  void giggle(int x, int y){
    if(x > centerX -15 && x < centerX + 15 && y > centerY - 20 && y < centerY + 20){
      giggleL = -10;
      giggleR = 10;
    }
  }
}


