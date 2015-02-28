
PFont myfont;
PFont letter;
PFont word;
 
void setup()
{
  size(250,250);
}
 
void draw() {
  background(0);
 
  myfont = createFont("AppleCasual", 8);
  //this is the loop that changes the y position
  for (int ypos=0; ypos<400; ypos=ypos+20) {
    //this is the loop that changes the x postion
    for(int xpos=0; xpos<400; xpos=xpos+50) {
      textFont(myfont);
      textSize(20);
      fill(255,255,255);
      text("M2",xpos,ypos+30);
    }
  }
  letter = createFont("Helvetica", 10);
  //this is the loop that changes the y position
  for (int ypos=0; ypos<400; ypos=ypos+20) {
    //this is the loop that changes the x postion
    for(int xpos=0; xpos<400; xpos=xpos+40) {
      textFont(letter);
      textSize(12);
      fill(255,255,255);
      text("M4",xpos,ypos+30);
    }
  }
 
  word = createFont("Times New Roman", 5);
  //this is the loop that changes the y position
  for (int ypos=0; ypos<400; ypos=ypos+20) {
    //this is the loop that changes the x postion
    for(int xpos=0; xpos<400; xpos=xpos+20) {
      textFont(word);
      textSize(37);
      fill(100,100,100,100);
      text("H9",xpos,ypos+30);
    }
  }
}

