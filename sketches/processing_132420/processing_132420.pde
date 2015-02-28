
boolean flipFlop = false;
String keyPrompt = "Hello Kitty";
int flowerPetalR;
int flowerPetalG;
int flowerPetalB;
int bgColor;
int flowerCenter;
int eyeLeft;
int eyeRight;
 void setup () {
   size(300,300);
 }
void draw(){
  if (flipFlop == false){
    flowerPetalR = 24;
    flowerPetalG = 125;
    flowerPetalB = 133;
    bgColor = 180;
    flowerCenter = 55;
    eyeLeft = -65;
    eyeRight = 56;
  }
  if (flipFlop == true){
    flowerPetalR = 255;
    flowerPetalG = 107;
    flowerPetalB = 238;
    bgColor = 79;
    flowerCenter =45;
    eyeLeft = -60;
    eyeRight = 61;
  }
   makeFace();
  fill(0);
  textSize(25);
  text("Hello Kitty",-55,135);
}
void keyPressed(){
flipFlop =! flipFlop;
  keyPrompt = ("");
  
}

void makeFace(){
  background(bgColor,bgColor,bgColor);
  translate(150,150); 

  // head,eyes,nose 
  stroke(0);
  strokeWeight(4);
  //hat
  fill(150,150,150);
  ellipse(0,-30, 300, 250);
  //head
  fill(255);
  ellipse(0, 7, 225, 170);
  //eyes
  fill(0);
  ellipse(eyeLeft, 20, 15, 20);
  ellipse(eyeRight, 20, 15, 20);
  //nose
  fill(247, 247, 30);
  stroke(0);
  strokeWeight(3);
  ellipse(0, 50, -25, 20);  

  //flowerPetals

  fill(flowerPetalR, flowerPetalG, flowerPetalB);
  ellipse(50, -90, 30, 30);
  ellipse(105, -60, 30, 30);
  ellipse(79, -45, 30, 30);
  ellipse(53, -60, 30, 30);
  ellipse(77, -105, 30, 30);
  ellipse(105, -90, 30, 30);
  noStroke();
  
  //flowerCenter
  fill(250, 250, 152);
  ellipse(80, -75, flowerCenter, flowerCenter);
}

