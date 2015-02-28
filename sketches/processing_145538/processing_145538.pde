
boolean flipFlop = false;
int eyeBallDiam; 
int  pupilDown;




void setup (){
    size(600,600);
  }

void draw (){
  
  if (flipFlop == false){
    eyeBallDiam = 60;
  }
  
  else {
    eyeBallDiam = 65;
  }
 
   
  if (flipFlop == false){
    pupilDown = 7;
  }
  
  else {
    pupilDown = 9;
  }
 
  translate(150,150);
  noStroke();
  
  //face
  fill(247,238,90);
  ellipse(150,97,127,127);
  rect(87,97,127,107);
  
  //neck
  fill(247,238,90);
  rect(87,127,87,127);
  
  //eyes
  fill(0,0,0);
  ellipse(197,140,eyeBallDiam,eyeBallDiam);
  
  //nose
  fill(247,238,90);
  rect(206,159,20.5,17.5);
  ellipse(226,167,17.5,17.5);
  
  //eyeballback
  fill(255,255,255);
  ellipse(197,140,eyeBallDiam,eyeBallDiam);
  
  //pupil
  fill(0,0,0);
  ellipse(187,140, pupilDown, pupilDown);
  
  //mouth
  fill(168,105,40);
  ellipse(197,207,67.5,47.5);
  ellipse(185,207,77.5,67.5);
  
  //hair
  stroke(2);
  line(83, 155, 95, 125);
  line(95, 125, 115, 155);
  line(103, 155, 115, 125);
  line(115, 125, 135, 155);
  
  //mouthline
  stroke(4);

  
  noFill();
  arc(150, 45, 50, 50, PI+QUARTER_PI, TWO_PI);
  arc(150, 45, 50, 50, PI, PI+QUARTER_PI);
  arc(158, 45, 58, 50, PI+QUARTER_PI, TWO_PI);
  arc(158, 45, 58, 50, PI, PI+QUARTER_PI);

}

void keyPressed (){
  flipFlop =! flipFlop;
}


