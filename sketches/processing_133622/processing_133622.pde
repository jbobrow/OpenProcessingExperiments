

int anz = 500;
int counter = 0;
int objcounter = 0;
float[] MousePositionsX;
float[] MousePositionsY;
Hair[] myHairArray;
Hair myHair;

void setup() {
  size(512,512);
  background(255);
  myHairArray = new Hair[100000];
  MousePositionsX = new float[myHairArray.length];
  MousePositionsY = new float[myHairArray.length];

  /*for (int i=0; i<anz; i++) {
    float newX = map(i,0,anz,0,width);
    color newColor = color(map(i,0,anz,0,100),100,100);
    myHairArray[i] = new Hair(newX, height/2, newColor);
  }*/
}

void draw() {
  
  int numFrames=5;
  
  MousePositionsX[counter] = mouseX;
  MousePositionsY[counter] = mouseY;
  if (counter > numFrames) {
    float deltaX = MousePositionsX[counter-numFrames]-MousePositionsX[counter];
    float deltaY = MousePositionsY[counter-numFrames]-MousePositionsY[counter];
    float angle = atan2(deltaX, deltaY) * 180 / PI;
    float speed = sqrt(sq(deltaX)*sq(deltaY));

    colorMode(RGB, 255);
    fill(255,13);
    //rect(0,0,width,height);
    //background(255);
    
    // SPAWN NEW OBJECTS
    if (mousePressed) {
      colorMode(HSB, 100);
      color newColor = color(counter,100,100);
      Hair myHair = new Hair(mouseX, mouseY, newColor, angle, speed);
      myHairArray[objcounter] = myHair;
      colorMode(RGB, 255);
      objcounter++;
    }
    
    
    
    // UPDATE ALL OBJECTS
    for (int i=0; i<objcounter; i++) {
      myHairArray[i].display();
      myHairArray[i].update();
    }
  }

  
  counter++;
  if (counter >= 100) counter = 0;
  
  // BLUR OVER TIME
  /*if(float(counter) % 10 == 0) {
    filter(BLUR,1);
  }*/

}

class Hair {
  
  float x;
  float y;
  color fillColor;
  float speed = 5;
  float size = 5;
  float lastX;
  float lastY;
  float origAngle;
  
  float easing;
  float counter;
  float random1;
  float random2;
  float randomAngle;
  
  // CONSTRUCTOR
  Hair(float in_x, float in_y, color in_color, float in_angle, float in_speed) {
    x = in_x;
    y = in_y;
    fillColor = in_color;
    random1 = random(0,1000);
    random2 = random(0,1000);
    origAngle = in_angle;
    //randomAngle = random(0,360);
    speed = in_speed;
  }

  void update() {
    counter++;
    easing+=.25;
    
    if(size > 0) size/=1.2;
    else size = 0;
        
    float angle = origAngle + 180 + counter*25*(noise(counter*.01+random1)-.5);
    float moveX = sin(radians(angle))*(speed*.002+5);
    float moveY = cos(radians(angle))*(speed*.002+5);
    
    if(abs(moveX/easing) < .5 && abs(moveY/easing) < .5) {
      moveX = moveY = 0;
    } else {
      lastX = x;
      lastY = y;
      x+= moveX/easing;
      y+= moveY/easing;

    }
  }
  
  void display() {
    noStroke();
    fill(fillColor);
    ellipse(x,y,size,size);
    /*stroke(fillColor);
    strokeWeight(size);
    if(lastX != 0 && lastY != 0) line(lastX,lastY,x,y);*/
  }
}




