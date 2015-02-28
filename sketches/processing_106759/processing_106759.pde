
int[] userXPos = new int[0];
int[] userYPos = new int[0];
int[] potatoX = {
  194, 154, 122, 154, 79, 108, 79, 138, 286, 287, 208, 203, 355, 230, 319, 216, 299, 230, 239, 290, 370, 447, 452, 482, 490, 522, 482, 389
};
int[] potatoY = {
  147, 208, 208, 317, 401, 392, 467, 487, 87, 119, 178, 211, 196, 271, 280, 299, 309, 343, 396, 438, 152, 192, 226, 309, 396, 397, 491, 486
};
boolean[] circleHit = new boolean[28];
boolean wins=false;
PImage circle;
PImage paper;
int correct;
int level=1;


void setup() {
  circle = loadImage("Potatomockanswers5.png");
  size(circle.width, circle.height);
  background (0);
  paper = loadImage("paper.png");


  for (int i=0; i < circleHit.length; i++) {
    circleHit[i] = false;
    //length=number of arrays
  }
}
void draw() {

  if (level==1) {
    background(0);
    image(paper, 0, 0);
    textSize (35);
    fill (180);
    text ("Draw Mr. Potato head!", 70, 150);
    text ("When you're finished,", 70, 220);
    text ("Press Enter", 70, 290);
    text ("Good Luck!", 70, 360);
    fill (240, 0, 0);
    text ("BEGIN", 260, 450);
  }
  if (level==2) {
    background(0);
    image(circle, 0, 0);
    for (int i=0; i<28; i++) {
      //fill (255,0,0);
      ellipse (potatoX[i], potatoY[i], 10, 10);
    }
    for ( int i=0; i<circleHit.length; i++) {
      //  for (int j=0; j<userXPos.length; j++) {
      //userxpos and ypos are exactly the sa,e
      if (dist(potatoX[i], potatoY[i], mouseX, mouseY)<20 && mousePressed) {
        circleHit[i]=true;


        println ("circle number " + i + " has been hit");
      }
    }

    //draw white circles where mouse is
    if (mousePressed) {
      fill (0);
      noStroke();
      ellipse(mouseX, mouseY, 10, 10);
      userXPos = (int[])append(userXPos, mouseX);
      userYPos = (int[])append(userYPos, mouseY);
    }
    //fill(0);
    noFill();
    stroke(0);
    beginShape();
    for (int x=0; x < userXPos.length; x++) {
      //for (int y=0; y < userYPos.length; y++) {
      //ellipse(userXPos[x], userYPos[x], 5, 5);
      vertex(userXPos[x], userYPos[x]);
      //}
    }
    endShape();

    if (wins==true) {
      text("GOOD JOB!", 230, 30);
      fill(240, 0, 0);
      textSize(30);
    }
  }
}
void keyPressed() {
  for (int i=0; i < circleHit.length; i++) {
    if (circleHit[i] == true) {
      correct++;
    }
  }
  if (correct>21) {
    wins=true;
    println("OMG YOU WIN!!!1!");
  } 
  else {
    correct = 0;
  }
}
void mouseClicked() {
  level=2;
}
