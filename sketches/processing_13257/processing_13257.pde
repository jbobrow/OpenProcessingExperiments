
PImage loanbody, loansarm, loansarmup, king, scaredking, halfdeadking, deadking,
bang, anvil, versailles, theend;
int frame;

void setup() {
  size(1076, 720);
//  frameRate(2);
  frame = 1;
  loanbody = loadImage("loanbody.png");
  loansarm = loadImage("loansarm.png");
  loansarmup = loadImage("loansarmup.png");
  king = loadImage("king.png");
  scaredking = loadImage("scaredking.png");
  halfdeadking = loadImage("halfdeadking.png");
  deadking = loadImage("deadking.png");
  bang = loadImage("bang.png");
  anvil = loadImage("anvil.png");
  versailles = loadImage("versailles.jpg");
  theend = loadImage("end.png");
}

void draw() {
    background(versailles);
//  background(128, 128, 128);
//  println(mouseX);
//  println(mouseY);
if(frame == 1){
  frame1();
} else if(frame == 2){
  frame2();
} else if(frame == 3){
  frame3();
} else if(frame == 4){
  frame4();
} else if(frame == 5){
  frame5();
} else if(frame == 6){
  frame6();
} else if(frame == 7){
  frame7();
} else if(frame == 8){
  frame8();
} else if(frame == 9){
  frame9();
}
}

void mouseClicked(){
  frame = frame + 1;
  if(frame == 10) {
    frame = 1;
  }
}

void frame1() {
  image(loanbody, 250, 360);
  image(loansarmup, 375, 375);
  image(king,700,300);
} 

void frame2() {
  image(loanbody, 250, 360);
  image(loansarm, 415, 405);
  image(scaredking, 700, 300);
}

void frame3() {
  image(loanbody, 250, 360);
  image(loansarm, 415, 405);
  image(halfdeadking, 700, 300);
  image(bang, 450, 335);
}

void frame4() {
  image(loanbody, 250, 360);
  image(loansarm, 415, 405);
  image(deadking, 700, 370);
}

void frame5() {
  image(loanbody, 250, 360);
  image(loansarm, 415, 405);
  image(deadking, 700, 370);
  image(anvil, 225, 100);
}

void frame6() {
  image(loanbody, 250, 360);
  image(loansarm, 415, 405);
  image(deadking, 700, 370);
  image(anvil, 225, 250);
}  

void frame7() {
  image(loanbody, 250, 460);
  image(loansarm, 415, 505);
  image(deadking, 700, 370);
  image(anvil, 225, 350);
}

void frame8() {
  image(loanbody, 250, 560);
  image(loansarm, 415, 605);
  image(deadking, 700, 370);
  image(anvil, 225, 450);
}

void frame9() {
  image(loanbody, 250, 560);
  image(loansarm, 415, 605);
  image(deadking, 700, 370);
  image(anvil, 225, 450);
  image(theend, 475, 150);
}


