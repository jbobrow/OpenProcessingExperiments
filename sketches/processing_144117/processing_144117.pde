
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeBallDiam;
int eyeBrowLoc;
int mouthWidth;
int noseWidth;
float mouthLoc;



void setup(){
  size (300,300);
  background (166,166,166);
  textSize(12);
  
}

void draw(){
  if (flipFlop == false){
    eyeBallDiam = 40;
    eyeBrowLoc = -24;
    mouthWidth = 35;
    noseWidth = 40;
  }
  

  if (flipFlop == true){
    eyeBallDiam = 50;
    eyeBrowLoc = -32;
    mouthWidth = 70;
    noseWidth = 60;
    
    
  }
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}

  void keyPressed(){
  flipFlop =! flipFlop;
  mouthLoc = random(30,50);
  keyPrompt = ("");
}

void makeFace(){
  background(166,166,166);
  noStroke();
  rectMode(CENTER);
  // this is important - changes zero location for all future coordinates
  translate(150,150);
  

  float shapeColor[] = {random(0,255), random(0,255), random(0,255)};
  fill(shapeColor[0], shapeColor[1], shapeColor[2]);
  noStroke();
  ellipse(0,0,200,200);
  rect(0,0,200,200,0,0,50,50);
  
  //hair
  float stuff[] = {random(0,255), random(0,255), random(0,255)};
  fill(stuff[0], stuff[1], stuff[2]);
  rect(0,-90,200,50,50,50,0,0);
  
  //hair extra
  triangle(-30,-95,-58,-40,-100,-70);
  
  //hair extra
  triangle(20,-95,58,-40,100,-70);
  
  //eye
  fill(255,255,255);
  ellipse(-30,-5,eyeBallDiam,eyeBallDiam);
  
  //eye2
  fill(255,255,255);
  ellipse(30,-5,eyeBallDiam,eyeBallDiam);
  
  //strap
  fill(stuff[0], stuff[1], stuff[2]);
  rect(0,-49,120,15);
  
  //pupil
  fill(0,0,0);
  ellipse(-30,-5,10,10);
  
  //pupil2
  fill(0,0,0);
  ellipse(30,-5,10,10);
  
  //eyebrow
  fill(15,255,231);
  rect(-30,eyeBrowLoc,50,15,10,10,10,10);

  
  //eyebrow2
  fill(15,255,231);
  rect(30,eyeBrowLoc,50,15,10,10,10,10);
  
  //nose
  fill(224,175,144);
  ellipse(0,10,noseWidth,30);
  
  //top lip
  fill(242,206,203);
  ellipse(0,mouthLoc,mouthWidth,5);
  fill(242,206,203);
  ellipse(0,mouthLoc,mouthWidth,5);
   
   
  
  
  

 
  
/*  
  //hair
  fill(79,40,16);
  pushMatrix();
  rotate(PI/rotate);
  arc(0, 0, 250, 200, 0, PI+QUARTER_PI, PIE);
  noStroke();
  popMatrix();
  */
}



