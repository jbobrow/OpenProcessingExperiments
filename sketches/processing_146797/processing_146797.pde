
boolean flipFlop = false;
float eyeBallDiam = 10;
float MouthDiam = 35;
float CrownDiam = 26;
float HeadDiam = 90;
float EyeBrow = -46;
float RightSide = 100;
float LeftSide = 100;
float Bottom = 55;
 
void setup(){
  size(300, 300);
}
  
void draw(){
  if (flipFlop == false){
    //eyeBallDiam = 10;
    //MouthDiam = 35;
    //CrownDiam = 26;
    //HeadDiam = 90;
    //EyeBrow = -46;
    //LeftSide = 100;
    //RightSide = 100;
    //Bottom = 55;
  }
  else{
    //eyeBallDiam = 20;
    //MouthDiam = 15;
    //CrownDiam = 32;
    //HeadDiam = 100;
    //EyeBrow = -49;
    //LeftSide = 115;
    //RightSide = 115;
    //Bottom = 40;
  }
translate(150, 150);
background(152, 232, 240);
noStroke();
fill(174, 122, 242);
ellipse(0,-60,HeadDiam,HeadDiam);
ellipse(-30,-20,LeftSide,LeftSide);
ellipse(30,-25,RightSide,RightSide);
ellipse(-40,40,110,110);
ellipse(40,40,110,110);
ellipse(0,95,Bottom,Bottom);
ellipse(-30,90,40,40);
ellipse(35,90,40,40);
fill(137,19,188);
ellipse(-20,-30,eyeBallDiam,eyeBallDiam);
ellipse(20,-30,eyeBallDiam,eyeBallDiam);
stroke(0,0,0);
rect(-35,EyeBrow,25,7);
rect(10,EyeBrow,25,7);
ellipse(0,-10,MouthDiam,MouthDiam);
line(-50,20,20,30);
line(-50,35,20,40);
line(21,15,21,70);
line(27,15,30,70);
fill(241,255,59);
ellipse(0,-71,CrownDiam,CrownDiam);
triangle(-10,-60,0,-90,10,-60);
triangle(-20,-70,0,-80,20,-70);
}
  
void keyPressed(){
  flipFlop =! flipFlop;
  MouthDiam = random(5, 50);
  eyeBallDiam = random(10,50);
  CrownDiam = random(26,60);
  HeadDiam = random(90,120);
  EyeBrow = random(-46,-86);
  RightSide = random(80,130);
  LeftSide = random(75,120);
  Bottom = random(40,75);
}



