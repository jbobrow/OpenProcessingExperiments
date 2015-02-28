
boolean flipFlop = false;
int mouthShape = 40;
int mouthHeight = 18;
int mouthLine = 20;
int headShape = 200;

void setup(){
  size(300,300);
}

void draw(){
  
  if (flipFlop == false){
     mouthShape = 40;  
     mouthHeight = 18;
     mouthLine = 20;
     headShape = 200;
  }
  else {
    mouthShape = 20;
    mouthHeight = 20;
    mouthLine = 10;
    headShape = 205;
  }
  
  background(245,243,180);
  translate(150,150);
  noStroke();
  
  // hair
  fill(122,198,196);
  rect(-130,-70,260,200);
  ellipse(0,-70,260,100);
  
  // head
  fill(202,139,237);
  ellipse(0,0,175,headShape);
  ellipse(-90,4,20,30);
  ellipse(90,4,20,30);
  stroke(0);
  strokeWeight(3);
  
  // bangs
  noStroke();
  fill(122,198,196);
  rect(-85,-106,170,76);
  stroke(202,139,237);
  strokeWeight(3);
  line(35,-30,40,-70);
  strokeWeight(1);
  
  // eyes
  fill(255,255,255);
  strokeWeight(0.5);
  stroke(0,0,0);
  ellipse(-30,10,22,22);
  ellipse(30,10,22,22);
  fill(0,0,0);
  ellipse(30,12,12,12);
  ellipse(-30,12,12,12);
  
  // nose
  stroke(0,0,0);
  line(0,8,-8,35);
  line(-8,35,6,37);
  
  // mouth
  fill(252,156,10);
  noStroke();
  ellipse(0,65,mouthShape,mouthHeight);
  fill(202,139,237);
  triangle(0,61,-7,50,7,50);
  stroke(0);
  line(-mouthLine,65,mouthLine,65);
  
}

void keyPressed(){
  flipFlop =! flipFlop;
}


