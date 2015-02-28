
Eye[] eyeballs = new Eye[55];

void setup() {
  size (800, 600);
    
  smooth();
  imageMode(CENTER);
  
  for (int i = 0; i < eyeballs.length; i++) {
    color eyeColor = color(random(0,255),random(0,255),random(0,255),random(0,255));
    eyeballs[i] = new Eye(random(0,width), random(0,height), eyeColor);
  }
}

void draw() {
  
  background(255, 204, 0);
  
  for (int i = 0; i < eyeballs.length; i++) {
    eyeballs[i].drawstalk();
  }

  for (int i = 0; i < eyeballs.length; i++) {
    eyeballs[i].draweyeball();
  }
}

class Eye{
  float x;
  float y;
  color eye_color;
  
  Eye(float init_x, float init_y, color init_color) {
    x = init_x;
    y = init_y;
    eye_color = init_color;
  }
  
  void drawstalk(){
    //draw stalk
    stroke(255);
    strokeWeight(15);
    line(width/2, height/2, x, y);
  }
  
  void draweyeball(){
    //shaking
    x = x + random(-1,1);
    y = y + random(-1,1);
    
    //draw eyeball
    pushMatrix();
   
    translate(x,y);
    
    //draw white
    noStroke();
    fill(255);
    ellipse(0, 0, 100, 100);
    
    float angle = atan2(mouseY-y, mouseX-x);
    
    //draw iris
    rotate(angle);
    translate(25,0);
    fill(eye_color);
    ellipse(0, 0, 50, 50);
    
    //draw pupil
    fill(0);
    ellipse(0, 0, 30, 30);
    
    popMatrix();
  }
}

