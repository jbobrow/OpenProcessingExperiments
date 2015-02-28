
PFont elle;
PFont one;
 
void setup() {
  size(250,250);
 elle = createFont("Arial",50);
 one = createFont("Arial",50);
  smooth();
 
}

void draw() {
  background(0,0,0);
  fill(random(255),255);
  
  textFont(elle);
  text("L",150,20);
 
  textFont(elle,40);
  text("L",149,158);
  
  textFont(one);
  text("3",150,60);
 
  textFont(one,15);
  text("1",150,85);
  
  textFont(elle);
  text("X",150,100);
 
  textFont(elle,20);
  text("X",150,120);
 
  textFont(elle,20);
  text("R",165,120);
  
  textFont(one,50);
  text("1",160,160);
  
  textFont(elle,50);
  text("R",150,200);
  
  textFont(one,50);
  text("3",156,226);
 
  textFont(elle,10);
  text("X",10,210);
 
  textFont(elle,10);
  text("X",17,210);
 
  textFont(elle,10);
  text("X",24,210);
 
  textFont(elle,10);
  text("X",31,210);
}

