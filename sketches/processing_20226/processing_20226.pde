
String myText = "L5S 3S8";
PFont fnt1;
PFont fnt2;
int mover=30;
int one=0; // first correct
int two=0; // second correct
int three=0; // third correct
int four=0; // fourth correct
int five=0; // fifth correct
int six=0; // sixth and final correct
PImage x; // image of the "x"/cross
boolean turn=true; // to determine win or lose
int counter=0;
 
void setup(){
  size(250,250);
  smooth();
  background(0);
  x = loadImage("cross.png");
  imageMode(CENTER);
    for(int a=0; a<270; a+=20) {
    for(int b=0; b<270; b+=20){
      noStroke();
      fill(color(random(255),random(255),random(255),random(75)));
      ellipse(a,b,50,50); //random ellipses to fill bkgrd
  }
}
  // background bezier
  noFill();
  stroke(255,90);
  bezier (0, 50, 40, 90, 180, 40, 250, 180);
  bezier (0, 60, 40, 90, 180, 40, 250, 190);
  bezier (0, 70, 40, 90, 180, 40, 250, 200);
  bezier (0, 80, 40, 90, 180, 40, 250, 210);
  bezier (0, 90, 40, 90, 180, 40, 250, 220);
  bezier (0, 100, 40, 90, 180, 40, 250, 230);
  bezier (0, 110, 40, 90, 180, 40, 250, 240);
  bezier (0, 120, 40, 90, 180, 40, 250, 250);
  
  // square letter holders
  rectMode(CENTER);
  fill(255);
  noStroke();
  rect(30,140,28,28);
  rect(60,140,28,28);
  rect(90,140,28,28);
   
  rect(150,140,28,28);
  rect(180,140,28,28);
  rect(210,140,28,28);
  
  // instructions on how many chances you have until you lose
  fill(0);
  rect(125,45,225,40);
  fill(255);
  fnt2 = loadFont("HelveticaNeueLTCom-Hv-48.vlw");
  textFont(fnt2, 16);
  text("You lose on the 7th cross!",22,50); 
}
 
void draw(){
  fnt1 = loadFont("HelveticaNeueLTCom-Roman-48.vlw");
  
  // lines under letters
  fill(255);
  stroke(0);
  strokeWeight(2);
   
  line(20,150,40,150);
  line(50,150,70,150);
  line(80,150,100,150);
   
  line(140,150,160,150);
  line(170,150,190,150);
  line(200,150,220,150);
  
  // font of correct letters
  textFont(fnt1, 20);
}
 
void keyPressed(){
  fill(color(random(225),random(200),random(225)));
  if(counter==0){
  if(key=='l' || key=='L'){
    text("L",25,145);
    one=+1;
  } 
  if(key=='5'){
  text("5",55,145);
  two=+2;
  }
  if(key=='a' || key=='A'){
  text("A",85,145);
  three=+3;
  }
  if(key=='3'){
  text("3",145,145);
  four=+4;
  }
  if(key=='s' || key=='S'){
  text("S",175,145);
  five=+5;
  }
  if(key=='8'){
  text("8",205,145);
  six=+6;
  }
  if(key=='b' || key=='c' || key=='d' ||
  key=='e' || key=='f' || key=='g' || key=='h' || key=='i' ||
  key=='j' || key=='k' || key=='m' || key=='n' || key=='o' ||
  key=='p' || key=='q' || key=='r' || key=='t' || key=='u' ||
  key=='v' || key=='w' || key=='x' || key=='y' || key=='z' ||
  key=='1' || key=='2' || key=='4' || key=='6' || key=='7' ||
  key=='9' || key=='0')
  {    if(turn==true){
    image(x,mover,90);
      mover=mover+30;
  }
    if(mover>225){
      fill(255);
      noStroke();
      rect(120,190,210,35);
      fill(255,0,0);
      fnt2 = loadFont("HelveticaNeueLTCom-Hv-48.vlw");
      textFont(fnt2, 30);
      text("YOU LOSE!",40,200);
      textFont(fnt1,15);
      fill(255);
      text("Hit the spacebar to play again",20,225);
      turn=false;
      counter=+1;
    }
  }
     
    if(one==1 && two==2 && three==3 && four==4 &&
    five==5 && six==6){
      if(turn==true){
      fill(255);
      noStroke();
      rect(120,190,210,35);
      fill(102,205,0);
      fnt2 = loadFont("HelveticaNeueLTCom-Hv-48.vlw");
      textFont(fnt2, 30);
      text("YOU WIN!",50,200);
      textFont(fnt1,15);
      fill(255);
      text("Hit the spacebar to play again",20,225);
      turn=false;
    }
    }
}

// reset game
if(key==' '){
  turn=true;
  one=0;
  two=0;
  three=0;
  four=0;
  five=0;
  six=0;
  counter=0;
  mover=30;
  setup();
 }
  }

