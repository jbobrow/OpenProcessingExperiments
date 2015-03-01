

float probeX = 500;
float probeY = 200;
boolean moveUp = false;
void setup(){
   size(1024, 768);
   background(255);
   smooth();
  // noStroke();
   DrawProbe();  // show the probe to start so we dont have a blank screen for the screenshot
}

void draw(){
  background(255); // clear the background
  DrawProbe();
  MoveProbe();
  
  
}

void DrawProbe(){
   fill(60);  // grey
  rect(probeX-35, probeY+30, 70, 30); // neck
  
  fill(70, 60, 60);  // red/brown
  
  ellipse(probeX, probeY, 220, 100); // head
  
  
  //*******************************************************
  // Arms
  //*******************************************************
  
  // left arm
  quad(probeX - 75, probeY+125, probeX-65, probeY+125, probeX-75, probeY+200, probeX-85,probeY+200); // top
  quad(probeX-82, probeY+200, probeX-75, probeY+200, probeX-62,probeY+275, probeX-70,probeY+275); // lower
  quad(probeX-68,probeY+275, probeX-50, probeY+270, probeX-45,probeY+270, probeX-40, probeY+285); // upper claw
  quad( probeX-68,probeY+275, probeX-50, probeY+300, probeX-65,probeY+295, probeX-70, probeY+290); // lower claw
  ellipse(probeX-80,probeY+200,20,20); //joint
  
  // middle arm
      
  quad( probeX-5,probeY+150, probeX+20, probeY+147, probeX+35,probeY+220, probeX+15, probeY+215); // upper arm
  quad(probeX+20,probeY+220, probeX+25, probeY+223, probeX-30,probeY+255, probeX-35, probeY+250); // middle arm
  quad(probeX-25, probeY+255, probeX-30, probeY+250, probeX+45,probeY+265, probeX+45, probeY+270); // lower arm
  quad(probeX+40, probeY+255, probeX+40, probeY+263, probeX+70, probeY+263, probeX+50, probeY+260); // gun
  ellipse(probeX+40, probeY+268, 13,10);// gun joint
  ellipse(probeX-30, probeY+250,15,20); //bottom joint
  ellipse(probeX+25,probeY+220,20,25); //middle joint
  ellipse(probeX+5,probeY+140,35,40); //top joint
  
  //right arm
   quad( probeX+60,probeY+110, probeX+70, probeY+107, probeX+110,probeY+170, probeX+100, probeY+165); // upper arm
   quad(probeX+105, probeY+170, probeX+110, probeY+171, probeX+95, probeY+220, probeX+90, probeY+220); // lower arm
   quad(probeX+90, probeY+220, probeX+85, probeY+215, probeX+75, probeY+220, probeX+60, probeY+228); // upper claw
   quad(probeX+92, probeY+215, probeX+80, probeY+230, probeX+75, probeY+248, probeX + 85, probeY+ 230); // lower claw
   ellipse(probeX+107,probeY+170, 10,10);// joint
  
  
 // *********************************************************
 // END arms
 //**********************************************************
 
 // body
  fill(0); 
  rect(probeX -88, probeY+55, 178, 20);  // seam between upper and lower
  fill(70, 60, 60);
  rect(probeX -108, probeY+50, 215, 20, 80,120, 0,0);  //upper
  quad(probeX -105, probeY+75, probeX+105, probeY+75, probeX+95, probeY+125, probeX-85, probeY+125); // lower
  
  // head divider
  line(probeX-110, probeY+5, probeX+110, probeY+5);
  
  // eyes
  fill(probeY-30,0,0);
  strokeWeight(4);
  ellipse(probeX+29, probeY, 40, 40);
  ellipse(probeX-35, probeY+10, 30, 30);
  line(probeX-70, probeY-40, probeX-100, probeY-100); // antenna
}

void MoveProbe(){  // makes the probe "float"
  if(probeY >= 300){
      moveUp = true;
  }
  if(probeY <= 200){
     moveUp = false; 
  }
  
  if(moveUp){
   probeY -= 0.5; 
  }
  else{
   probeY+=0.5; 
  }
 
}


