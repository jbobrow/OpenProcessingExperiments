
boolean flipFlop = false;
int eyeBallDiam = 10;

void setup(){
  size(300, 300);
}

void draw(){
  if (flipFlop == false){
    eyeBallDiam = 10;
  }
  else{
    eyeBallDiam = 20;
  }
translate(150, 150);
background(152, 232, 240);
noStroke();
fill(174, 122, 242);
ellipse(0,-60,90,90);
ellipse(-30,-20,100,100);
ellipse(30,-25,100,100);
ellipse(-40,40,110,110);
ellipse(40,40,110,110);
ellipse(0,95,55,55);
ellipse(-30,90,40,40);
ellipse(35,90,40,40);
fill(137,19,188);
ellipse(-20,-30,eyeBallDiam,eyeBallDiam);
ellipse(20,-30,eyeBallDiam,eyeBallDiam);
stroke(0,0,0);
line(-30,-42,-10,-37);
line(30,-37,10,-37);
ellipse(0,-10,30,15);
line(-50,20,20,30);
line(-50,35,20,40);
line(21,15,21,70);
line(27,15,30,70);
fill(241,255,59);
triangle(-10,-60,0,-90,10,-60);
triangle(-20,-70,0,-80,20,-70);
}

void keyPressed(){
  flipFlop =! flipFlop;
}


