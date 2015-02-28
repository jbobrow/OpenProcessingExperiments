
//Aubrey Isaacman and Rashmi Sehgal

int look = 0;
int x = 0;
color Blinky = color(255, 0, 0);
int userInput = 0;
int speed = 5;
int xLocationBlinky = 134;
int yLocationBlinky = 72;

void setup(){
  size(500,500);
}

void draw(){
  background(150);
  //NES controller
  fill(224,224,224);
  rect(150, height/2,200,100); //outter body
  fill(64);
  rect(160, height/2+10,180,80); //inner body
  fill(255);
  rect(188,285,15,38); //outter Dpad
  rect(177,298,38,15);
  fill(0);
  rect(190,290,10,30); //inner Dpad
  rect(180,300,30,10);
  fill(131);
  rect(230,260,50,2); //grey middle;make edges round
  rect(230,262,50,8);
  rect(230,273,50,8);
  rect(230,284,50,8);
  rect(230,330,50,8);
  fill(255);
  rect(230,300,50,25); //white middle; make this round too
  fill(131);
  rect(232,310,20,10); //dark grey buttons
  rect(257,310,20,10);
  fill(255);
  rect(290,300,20,20); //white squares
  rect(315,300,20,20);
  fill(255,0,0);
  ellipse(300,310,15,15); //red circles
  ellipse(325,310,15,15);
  textSize(5);
  text("SELECT",232,290);
  text("START",262,290);
  text("Nintendo",300,280);
  
  noStroke;
  rect(50+xLocationBlinky, 70+yLocationBlinky,10,90);
  rect(60+xLocationBlinky, 40+yLocationBlinky,10,130);
  rect(70+xLocationBlinky, 30+yLocationBlinky,10,140);
  rect(80+xLocationBlinky, 20+yLocationBlinky,10,140);
  rect(90+xLocationBlinky, 20+yLocationBlinky,10,130);
  rect(100+xLocationBlinky, 10+yLocationBlinky,10,150);
  rect(110+xLocationBlinky,10+yLocationBlinky,10,160);
  rect(120+xLocationBlinky,10+yLocationBlinky,10,160);
  rect(130+xLocationBlinky,10+yLocationBlinky,10,150);
  rect(140+xLocationBlinky, 20+yLocationBlinky,10,130);
  rect(150+xLocationBlinky, 20+yLocationBlinky,10,140);
  rect(160+xLocationBlinky,30+yLocationBlinky,10,140);
  rect(170+xLocationBlinky,40+yLocationBlinky,10,130);
  rect(180+xLocationBlinky,70+yLocationBlinky,10,90);
  //left eye
  fill(255);
  rect(60+look*10+xLocationBlinky, 50+yLocationBlinky, 10,30);
  rect(70+look*10+xLocationBlinky, 40+yLocationBlinky,10,50);
  rect(80+look*10+xLocationBlinky,40+yLocationBlinky,10,50);
  rect(90+look*10+xLocationBlinky,50+yLocationBlinky,10,30);
  //right eye
  rect(120+look*10+xLocationBlinky, 50+yLocationBlinky,10,30);
  rect(130+look*10+xLocationBlinky,40+yLocationBlinky,10,50);
  rect(140+look*10+xLocationBlinky, 40+yLocationBlinky, 10,50);
  rect(150+look*10+xLocationBlinky,50+yLocationBlinky,10,30);
  //pupils
  fill(0,0,255);
  rect(60+look*20+xLocationBlinky,60+yLocationBlinky,20,20);
  rect(120+look*20+xLocationBlinky,60+yLocationBlinky,20,20);
  
  //Pacman
  fill(255,266,0);
  translate(20,320);
  arc(90+userInput,90,80,80,PI/4,1.8*PI);
  //Eyeball
  fill(0);
  strokeWeight(2);
  ellipse(85+userInput,65,10,10);
}

//if keypressed, pacman moves
void keyPressed(){
  if (userInput <110) {look=0;}
  else if (userInput<256){look = 1;}
  else {look = 2;}
  println("userInput: "+userInput);
  if(keyCode==LEFT) {userInput -=speed;}
  if(keyCode == RIGHT) {userInput +=speed;}
}

