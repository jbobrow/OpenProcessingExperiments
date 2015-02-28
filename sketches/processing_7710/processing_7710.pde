
float x, y, w, h;
float offsetX, offsetY;
boolean isNotSet = true;
boolean isDraggable = false;

float timeIn, timeOut;
float xIn, yIn, xOut, yOut;
float xSpeed, ySpeed;
float damping = .98;
float boost = 20;

void setup(){
  size(600, 600);
  smooth();
  fill(50);
  x = 100;
  y = 100; 
  w = 50;
  h = 50;
}

void draw(){
  background(255);
  rect(x, y, w, h);

  if (isDraggable){
    move();
  }
  x+=xSpeed;
  y+=ySpeed;
  xSpeed*=damping;
  ySpeed*=damping;
  collisionDetection();
}

void collisionDetection(){
  if (x > width - w){
    x = width - w;
    xSpeed*=-1;
  } 
  else if (x < 0){
    x = 0;
    xSpeed*=-1;
  }

  if (y > height - h){
    y = height - h;
    ySpeed*=-1;
  } 
  else if (y < 0){
    y = 0;
    ySpeed*=-1;
  }

}

void move(){
  x = mouseX - offsetX;
  y = mouseY - offsetY;
}


void mousePressed(){
  if (isNotSet) {
    offsetX = mouseX-x;
    offsetY = mouseY-y;
    timeIn = millis();
    xIn = mouseX;
    yIn = mouseY;
    if (drag()){
      isDraggable = true;
    }
    isNotSet = false;
  }
}

void mouseReleased(){
  isNotSet = true;
  isDraggable = false;

  timeOut = millis();
  xOut = mouseX;
  yOut = mouseY;
  float deltaX = xOut-xIn;
  float deltaY = yOut-yIn;
  float deltaTime = timeOut-timeIn;
  xSpeed = deltaX/deltaTime;
  ySpeed = deltaY/deltaTime;
  xSpeed*=boost;
  ySpeed*=boost;
}

boolean drag(){
  if(mouseX > x && mouseX < x+w
    && mouseY > y && mouseY < y+h && mousePressed){
    return true;
  }
  return false;
}

