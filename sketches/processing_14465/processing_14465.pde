
//drawing and animating my creature
//mouseclick to change eyecolor
//move mouse left or right to animate eyes
//move mouse up or down to change size of eyes
//press button on keyboard to open mouth
//by: Thomas Gerling

void setup() {
  size(200, 200);
  smooth();
}

void draw() {
  noStroke();
  background (255);
  
  draw_Mickey();
  move_eyes();
  open_mouth();
}

void draw_Mickey(){
  //head
   fill(0);
    ellipse (100,100,60,60);
    //ears
    ellipse (75,70,50,50);
    ellipse (125,70,50,50);
  fill(255,224,191);
    ellipse(89,90,28,35);
    ellipse(112,90,28,35);
    ellipse(100,115,48,22);
  fill(255);
    ellipse (89,90,18,30);
    ellipse (112,90,18,30);
  fill(0);
    ellipse(100,100,10,10);
    curve(86, 110, 95 , 120, 105 , 120, 116, 110);
  }
    //move eyes and change eye color
void move_eyes(){
  if(mousePressed){
    fill(255,0,0);
  } else{
    fill(0);
  }
  int lefteye;
  lefteye = mouseX;
  lefteye = constrain(lefteye,85,95);
  int sizeeye;
  sizeeye = mouseY/12;
  sizeeye = constrain(sizeeye,2,15);
  ellipse(lefteye, 95, sizeeye, sizeeye);
  int righteye;
  righteye = mouseX + 22;
  righteye = constrain (righteye, 108, 118);
  ellipse(righteye, 95, sizeeye, sizeeye);
}
//open mouth
void open_mouth(){
  if (keyPressed == true){
  fill(0);
  ellipse(100,115,30,16);
  fill(255,0,0);
  ellipse(100,118,10,4);
}
}

