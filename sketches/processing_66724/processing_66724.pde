
int counter;
PFont myFont;

void setup(){
  size(650, 450);
  counter =0;
  myFont = loadFont("Pacifico-25.vlw");
}

void draw() {
  fill(255);
  textFont(myFont);
  text("What is the best program at Parsons?", width/4-25, 75);
  if(mouseX >=50 && mouseX<=100 && mouseY>=150 && mouseY<=200){
    drawSquare(50, 150);
  }
  if(mouseX >=100 && mouseX<=150 && mouseY>=150 && mouseY<=200){
      drawSquare(100, 150);
  }
  if(mouseX >=300 && mouseX<=350 && mouseY>=150 && mouseY<=200){
      drawSquare(300, 150);
  }
  if(mouseX >=450 && mouseX<=500 && mouseY>=150 && mouseY<=200){
      drawSquare(450, 150);
  }
  if(mouseX >=500 && mouseX<=550 && mouseY>=150 && mouseY<=200){
      drawSquare(500, 150);
  }
  if(mouseX >=550 && mouseX<=600 && mouseY>=150 && mouseY<=200){
      drawSquare(550, 150);
  }
  if(mouseX >=50 && mouseX<=100 && mouseY>=200 && mouseY<=250){
      drawSquare(50, 200);
  }
  if(mouseX >=150 && mouseX<=200 && mouseY>=200 && mouseY<=250){
     drawSquare(150, 200);
  }
  if(mouseX >=250 && mouseX<=300 && mouseY>=200 && mouseY<=250){
     drawSquare(250, 200);
  }
  if(mouseX >=300 && mouseX<=350 && mouseY>=200 && mouseY<=250){
     drawSquare(300, 200);
  }
  if(mouseX >=350 && mouseX<=400 && mouseY>=200 && mouseY<=250){
     drawSquare(350, 200);
  }
  if(mouseX >=500 && mouseX<=550 && mouseY>=200 && mouseY<=250){
     drawSquare(500, 200);
  }
  if(mouseX >=50 && mouseX<=100 && mouseY>=250 && mouseY<=300){
     drawSquare(50, 250);
  }
  if(mouseX >=150 && mouseX<=200 && mouseY>=250 && mouseY<=300){
    drawSquare(150, 250);
  }
  if(mouseX >=300 && mouseX<=350 && mouseY>=250 && mouseY<=300) {
    drawSquare(300, 250);
  }
  if(mouseX >=500 && mouseX<=550 && mouseY>=250 && mouseY<=300){
    drawSquare(500, 250);
  }
  if(mouseX >=50 && mouseX<=100 && mouseY>=300 && mouseY<=350){
    drawSquare(50,300);
  }
  if(mouseX >=100 && mouseX<=150 && mouseY>=300 && mouseY<=350){
    drawSquare(100,300);
  }
  if(mouseX >=500 && mouseX<=550 && mouseY>=300 && mouseY<=350){
    drawSquare(500,300);
  }

}
void drawSquare(float squareX, float squareY){
  noStroke();
  fill(0);
  rect(squareX, squareY, 50, 50);

}
 


