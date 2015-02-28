
float pupilR;
float topToungeCurves;
float tounge;
float toungeLine;
float whitesL;
float nose;
float brows;
float pupilL; 
float head;
float whitesR;
float topNose;
float toungeside;
float othertoungeside;
float toungelineY;


void setup(){
  size(300,300);
  background(153,0,51);
  noStroke();
}

void draw(){
  makeFace();
}

void makeFace(){
  translate(150,150);
  fill(153,204,255);
  ellipse(-1,-3,170,68);
   
  fill(0,0,0);
  ellipse(80,20,7,10);
  
  background(153,0,51);
  
  fill(153,204,255); 
  rect(-75,-89,150,190,head);
  
  
  fill(153,204,255);
  ellipse(-75,13,13,15);
  
  fill(153,204,255);
  ellipse(75,13,13,15);
  
  //pupilL
  
  fill(255,255,255);
  ellipse(20,-20,whitesL,whitesL);
  
  fill(255,255,255);
  ellipse(-20,-20,whitesR,whitesR);
  
  fill(0,0,0);
  ellipse(-20,-20,pupilR, pupilR);
  
  fill(0,0,0);
  ellipse(20,-20,pupilL,pupilL);
  
  //nose
  
  fill(255,255,255);
  triangle(0,topNose,-7,nose,7,nose);
  
  //mouth
  
  fill(255,102,153);
  rect(tounge,30,toungeside,othertoungeside,topToungeCurves,topToungeCurves,30,30);
  
  fill(0,0,0);
  rect(-20,30,40,3);
  
  fill(255,255,255);
  rect(5,32,7,10);
  
  
  //cheeks
  
  fill(200,150,200);
  ellipse(-40,10,30,30);
  
  fill(200,150,200);
  ellipse(40,10,30,30);
  
  //eyebrows
  fill(0,0,0);
  rect(-30,brows,28,5);
  
  fill(0,0,0);
  rect(10,brows,20,5);
  
  //hair
  
  fill(0,0,0);
  quad(-40, -130, 0, -140, 15, -93, -17, -93);
  
  fill(0,0,0);
  quad(-30, -140, 10, -150, 25, -90, -7, -93);
  
  fill(0,0,0);
  quad(-20, -110, 30, -120, 35, -86, 0, -93);
  
  fill(0,0,0);
  triangle(-18,-96,27,-92,0,-60);
  
  fill(255,0,0);
  triangle(-28, -110,0,-102,-19,-97);
}


void keyPressed(){

  whitesL = random(20,40);
  pupilR = random(1,19);
  pupilL = random(1,19);
  nose = random(1,30);
  topToungeCurves = random(40);
  tounge = random(-26,-4);
  brows = random(-65,-40);
  whitesR = random(20,40);
  topNose = random(-10,10);
  head = random(1,150);
  toungeside = random(30,40);
  othertoungeside = random(1,70);
}



