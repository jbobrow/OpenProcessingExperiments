
Keys[] keysArray = new Keys[1];

void setup(){
  noStroke();
  smooth();
  for (int i= 0; i < keysArray.length; i++){
    keysArray[i] = new Keys();
      keysArray[i].keysSetup();
  }
}

void draw(){
  for (int i = 0; i < keysArray.length; i++){
    keysArray[i].drawKeys();
  }
}

void keyPressed(){
  for (int i = 0; i < keysArray.length; i++){
    keysArray[i].keyPressed();
  }
}

