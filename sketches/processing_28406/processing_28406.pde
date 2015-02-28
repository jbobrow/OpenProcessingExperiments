
float aheight = 90;
boolean win = false;
float picX, picY;
float picXprev, picYprev;
int picW=90, picH=90;
int picNum;
int[] score = new int[3];
PImage[] pics = new PImage[9];
PImage mom;
int timer = 1000;

PFont f;

void setup() {
  size(750,500);
  f = createFont("Arial Bold",20);
  
  score[0]=200;score[1]=200;score[2]=200;
  
  picX = random(width-picW);
  picY = random(aheight,height-picH);
  picNum = int(random(9));
  for (int i=0;i<9;i++) {
    pics[i]=loadImage(i+".jpg");
  }
  mom=loadImage("mom.jpg");
}

void draw() {
  background(204,51,255);
  fill(255);
  rectMode(CORNERS);
  noStroke();
  rect(0,aheight,width,height);
  
  drawScore();
  drawTitle();
  if (!win) {
    drawByron();
  }
}

void drawByron() {
  image(pics[picNum], picX, picY, picW, picH);
  
  if (mouseX >= picX && mouseX<=picX+picW &&
      mouseY >= picY && mouseY<=picY+picH) {
    noFill();
    stroke(204,255,51);
    strokeWeight(3);
    rect(picX-4,picY-4,picX+picW+3,picY+picH+3);
  }
  
  if (timer<70) {
    fill(0);
    textSize(14);
    textAlign(CENTER,CENTER);
    text("*nag!*",picXprev+picW/2,picYprev+picH/2);
    timer++;
  }
}

void mousePressed() {
  // ************** PLAY AGAIN BUTTON *****************
  if (!win) {
    if (mouseX >= picX && mouseX<=picX+picW &&
        mouseY >= picY && mouseY<=picY+picH) {
      picXprev = picX;
      picYprev = picY;
      timer = 0;
      
      picX = random(width-picW);
      picY = random(aheight,height-picH);
      picNum = int(random(9));
      
      int scoreNum = int(random(3));
      while (score[scoreNum] >= 800) 
        scoreNum = int(random(3));
      score[scoreNum] += 100;
    }
        
    if (score[0]>=800 && score[1]>=800 && score[2]>=800) {
      win = true;
    }
  } else {
    //play again button
    if (mouseX >=20 && mouseX <=140 &&
        mouseY >=height-50 && mouseY <=height-20) {
      win=false;
      score[0]=200;score[1]=200;score[2]=200;
    }
  }
}

void drawTitle() {
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(f);
  if(!win) {
    textSize(20);
    text("Nag (click) Byron to increase his SAT score!",width/2,40);
  } else {
    textSize(30);
    text("YOU WIN!",width/2,40);
    fill(0);
    textSize(40);
    text("Happy Mother's Day!",width/2,380);
    textSize(20);
    text("Love,\nThe other two",width/2,450);
    image(mom,width/2-170,aheight+20,340,240);
    // "play again button"
    noStroke();
    fill(204,255,51);
    rect(20,height-50,140,height-20);
    fill(0);
    textSize(16);
    textAlign(CENTER,CENTER);
    text("Play Again!",80,height-37);
    if (mouseX >=20 && mouseX <=140 &&
        mouseY >=height-50 && mouseY <=height-20) {
      noFill();
      stroke(204,51,255);
      strokeWeight(3);
      rect(16,height-54,143,height-17);
    }
  } 
}

void drawScore() {
  fill(255);
  textFont(f);
  textSize(16);
  textAlign(LEFT,TOP);
  text("Verbal: "+score[0],12,10);
  text("Writing: "+score[1],12,35);
  text("Math: "+score[2],12,60);
}




