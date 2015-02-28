

PFont myfont;
PFont letter;
PFont word;

void setup()
{
  size(400,400);
}

void draw() {
  background(0);

  myfont = createFont("AppleCasual", 72);
  //this is the loop that changes the y position
  for (int ypos=0; ypos<400; ypos=ypos+20) {
    //this is the loop that changes the x postion
    for(int xpos=0; xpos<400; xpos=xpos+50) {
      textFont(myfont);
      textSize(72);
      fill(255,255,255);
      text("U",xpos,ypos+30);
    }
  }
  letter = createFont("Helvetica", 80);
  //this is the loop that changes the y position
  for (int ypos=0; ypos<400; ypos=ypos+20) {
    //this is the loop that changes the x postion
    for(int xpos=0; xpos<400; xpos=xpos+40) {
      textFont(letter);
      textSize(80);
      fill(255,255,255);
      text("s",xpos,ypos+30);
    }
  }

  word = createFont("Times New Roman", 50);
  //this is the loop that changes the y position
  for (int ypos=0; ypos<400; ypos=ypos+20) {
    //this is the loop that changes the x postion
    for(int xpos=0; xpos<400; xpos=xpos+20) {
      textFont(word);
      textSize(50);
      fill(100,100,100,100);
      text("o",xpos,ypos+30);
    }
  }
}


