
//character properties
float[] LengthC = new float[2];
float[] PosC = new float[2];

//ground properties
float[] gPos = new float[2];
float[] gLength = new float[2];

void setup(){
  size(500,500);
  background(0,0,0);
  frameRate(70);
  smooth();
  
//character properties define
LengthC[0] = 20;
LengthC[1] = 20;
PosC[0] = 250;
PosC[1] = 450;

//ground properties define
gLength[0] = 500;
gLength[1] = 50;
gPos[0] = -1;
gPos[1] = 470;
}

void draw(){
//controlls
  textSize(10);
  fill(0,0,0);
  text("Q = Up+Left", 20, 50);
  text("W = Up", 20, 60);
  text("E = Up+Right", 20, 70);
  text("A = Left", 20, 80);
  text("D = Right", 20, 90);
  
//fade
  fill(200,10);
  rect(0,0,500,500);
//rain splash
  stroke(100,100,255);
  fill(190,190,190);
  ellipse(random(500), random(400,500), random(30, 50), random(10, 15));
//rain
  noStroke();
  fill(0,0,250);
  ellipse(random(500), random(0,400), 1, 50);
  
//character draw 
  noFill();
  stroke(0,0,250);
  rect(PosC[0],PosC[1],LengthC[0],LengthC[1]);

//gravty
if(PosC[1] < 470){
  PosC[1] = PosC[1] + 1;
}else{
  PosC[1] = PosC[1];
}
//end gravity

//boundaries
if(PosC[0] < 0){
  PosC[0] = PosC[0] + 10;
}else if(PosC[0] > 485){
  PosC[0] = PosC[0] - 10;
}else if(PosC[1] < 0){
  PosC[1] = PosC[1] + 10;
}
//end boundaries
  
//move buttons
if(keyPressed == true){
  if(key == 'e' || key == 'E'){
    PosC[1] = PosC[1] - 3;
    PosC[0] = PosC[0] + 3;
    stroke(0,0,250);
  }
}else{
  PosC[1] = PosC[1];
  noStroke();
}

if(keyPressed == true){
  if(key == 'q' || key == 'Q'){
    PosC[1] = PosC[1] - 3;
    PosC[0] = PosC[0] - 3;
    stroke(0,0,250);
  }
}else{
  PosC[1] = PosC[1];
  noStroke();
}

if(keyPressed == true){
  if(key == 'd' || key == 'D'){
    PosC[0] = PosC[0] + 3;
    stroke(0,0,250);
  }
}else{
  PosC[1] = PosC[1];
  noStroke();
}

if(keyPressed == true){
  if(key == 'a' || key == 'A'){
    PosC[0] = PosC[0] - 3;
    stroke(0,0,250);
  }
}else{
  PosC[1] = PosC[1];
  noStroke();
}

if(keyPressed == true){
  if(key == 'w' || key == 'W'){
    PosC[1] = PosC[1] - 3;
    stroke(0,0,250);
  }
}else{
  PosC[1] = PosC[1];
  noStroke();
}
//end move buttons
}
