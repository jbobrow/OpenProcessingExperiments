
boolean flipFlop = false;
String keyPrompt = "Press any key";
int eyeDire;
int eyeBrowLoc;
int bgColor;
int hairBase;
int hairShade;

void setup(){
  size(300, 300);
  background(104, 216, 234);
  textSize(15);
}
 
void draw(){
  if (flipFlop == false){
    eyeDire = 10;
    eyeBrowLoc = -25;
    bgColor = 216;
    hairBase = 255;
    hairShade = 203;
  }
  if (flipFlop == true){
    eyeDire = -7;
    eyeBrowLoc = -35;
    bgColor = 0;
    hairBase = 155;
    hairShade = 103;
  }
  
  makeFace();
  smooth();
  text(keyPrompt, -145, -135);
}
 
void keyPressed(){
  flipFlop =! flipFlop;
  keyPrompt = ("");
}
 
void makeFace(){
  background(104, bgColor, 234);
  noStroke();
  rectMode(CENTER);
  translate(150, 150);
  
  //hair base
  fill(255, 0, 0);
  ellipse(-80, 0, 90, 60);
  ellipse(80, 0, 90, 60);
  ellipse(-80, -50, 70, 50);
  ellipse(80, -50, 70, 50);
  ellipse(80, -20, 120, 75);
  ellipse(-80, -20, 120, 75);

  //hair shade
  fill(203, 8, 8);
  ellipse(-80, 5, -55, -40);
  ellipse(80, 5, -55, -40);
  ellipse(-70, -15, -55, -40);
  ellipse(70, -15, -55, -40);

  //base head
  fill(255); 
  rect(0, 0, 150, 200, 40);
  ellipse(0, 100, 50, 25);   
  ellipse(-75, 0, 30, 20); 
  ellipse(75, 0, 30, 20);

  //eyebrows
  fill(255, 0, 0);
  ellipse(40, -30, 70, 20);
  ellipse(-40, -30, 70, 20);
  fill(255);
  ellipse(40, eyeBrowLoc, 70, 20);
  ellipse(-40, eyeBrowLoc, 70, 20);

  //eyes
  fill(0);
  ellipse(-38, 0, 25, 25);
  ellipse(38, 0, 25, 25);
  fill(255);
  ellipse(-38, eyeDire, 25, 25);
  ellipse(38, eyeDire, 25, 25);

  //nose
  fill(225, 0, 0); 
  ellipse(0, 30, 50, 50);
  fill(255, 120, 108);
  ellipse(9, 25, 20, 20);
  fill(255);
  ellipse(10, 25, 10, 10);

  //mouth
  fill(255, 0, 0);
  arc(0, 70, 55, 55, 0, PI, CHORD);
  fill(255);
  arc(0, 74, 45, 40, 0, PI, CHORD);

}


