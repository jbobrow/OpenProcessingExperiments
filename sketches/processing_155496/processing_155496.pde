
int discs, oneAtATime;
float discSize, angularSpeed;
float bigCircle, timerForLines;
boolean viewLines, viewLines2, textDisplayed, individualDisks;

void setup(){
 size(800,800);
 //frame.setResizable(true);
 background(0);
 discs = (int) random(6,13);
 viewLines = false;
 viewLines2 = false;
 textDisplayed = false;
 individualDisks = false;
 oneAtATime = 1;
}
void draw(){
  //draw big circle
  //start colour at orange and change over a few frames to red
  if (123-frameCount/5 < 0){
    fill(200,0,0);
  } else {
    fill(200,123-frameCount/5,0);
  }
  
  //set 0,0 to middle of the screen
  translate(width/2,height/2);
  
  // set diameter to smaller of width or height
  if (height <= width){
    bigCircle = height;
  } else {
    bigCircle = width;
  }
  //no outline to the big circle
  noStroke();
  //draw the big circle
  ellipse(0, 0, bigCircle, bigCircle);

  // draw the discs (white circles)
  if (!textDisplayed) {
    discSize = bigCircle/discs;
    noStroke();
    for (int i=0; i<discs; i++) {
      pushMatrix();
      rotate((PI/discs)*i);
      float x = map(sin(angularSpeed+(PI/discs)*i), -1, 1, -bigCircle/2+discSize/2, bigCircle/2-discSize/2);
      fill(255);
      ellipse(x, 0, discSize, discSize);
      popMatrix();
    }
    angularSpeed += 0.015;
  }
  
  if (frameCount > 1000 && frameCount < 1200) {
    textDisplayed = true;
    background(0);
    textSize(width/40);
    fill(255);
    text("Each disc is moving in a straight line.",0-textWidth("Each disc is moving in a straight line.")/2,0);
  }

  if (frameCount == 1200) {  
    textDisplayed = false;
  }
  if (frameCount > 1240 && frameCount < 2200 || viewLines) {  
    for (int i=0; i<discs; i++){
      pushMatrix();
      rotate(PI/2 + (PI/discs)*i);
      stroke(0,0,255);
      strokeWeight(1);
      line(0, -height/2, 0, height/2);
      popMatrix();
    }
  }

  if (frameCount > 2200 && frameCount < 2400) {
    textDisplayed = true;
    background(0);
    textSize(width/40);
    fill(255);
    text("Watch as one disc is added at a time.",0-textWidth("Watch as one disc is added at a time.")/2,0);
    if (frameCount == 2399) {
      individualDisks = true;
      timerForLines = millis();
      viewLines2 = true;
    }
  }
  if (individualDisks) {
    discSize = bigCircle/discs;
    noStroke();
    for (int i=0; i<oneAtATime; i++) {
      pushMatrix();
      rotate((PI/discs)*i);
      float x = map(sin(angularSpeed+(PI/discs)*i), -1, 1, -bigCircle/2+discSize/2, bigCircle/2-discSize/2);
      fill(255);
      ellipse(x, 0, discSize, discSize);
      popMatrix();
    }
    if (viewLines2){
      for (int i=0; i<oneAtATime; i++) {
        pushMatrix();
        rotate(PI/2 + (PI/discs)*i);
        stroke(0,0,255);
        strokeWeight(1);
        line(0, -height/2, 0, height/2);
        popMatrix();
      }
    }
    if ((millis() - timerForLines)/1000 > 4 && oneAtATime <= discs){
      oneAtATime = oneAtATime + 1;
      timerForLines = millis();
    }
    if ((millis() - timerForLines)/1000 > 10) {
          viewLines2 = false;
    }
    angularSpeed += 0.015;   
  } 
}
void keyPressed(){
  if (key == 'l'){
    viewLines = true;
  } else if (key == 'n'){
    viewLines = false;
    viewLines2 = false;
  }
  if (key == '<' && discs > 4){
    discs = discs - 1;
  } else if (key == '>' && discs < 100){
    discs = discs + 1;
    oneAtATime = discs;
  }
}



