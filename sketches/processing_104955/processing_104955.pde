
//Global Variables
  Button redButton;
  Button orangeButton;
  Button yellowButton;
  Button greenButton;
  Button blueButton;
  Button purpleButton;
  Button pinkButton;
  Button whiteButton;
  Button brownButton;
  Button blackButton;
  Button eraserButton;
  Button clearButton;
 color lineColor=color(0);
 
 int boardX=50;
 int boardY=0;
 int boardWidth=500;
 int boardHeight=600;
 int ButtonX=50;
 int ButtonY=50;

 void setup() {
  redButton= new Button(25, 25, color(255, 0, 0));
  orangeButton= new Button(25, 70, color(255, 132, 31));
  yellowButton= new Button (25, 115, color(255, 234, 0));
  greenButton= new Button (25, 160, color(0, 255, 0));
  blueButton= new Button (25, 205, color(0, 0, 255));
  purpleButton= new Button (25, 250, color(163, 28, 255));
  pinkButton= new Button (25, 295, color(245, 0, 192));
  whiteButton= new Button (25, 340, color(255));
  brownButton= new Button (25, 385, color(116, 82, 8));
  blackButton= new Button (25, 430, color(0));
  eraserButton= new Button (575, 25, color(247, 175, 215));
  clearButton=new Button (575, 70, color( 229, 241, 255));
  size(600,600);
  background(255);
}

void draw() {
  frameRate(30);
  fill(0);
  noStroke();
  rectMode(CENTER);  
  rect((width-boardWidth)/2/2, height/2, (width-boardWidth)/2, boardHeight);
  rect((width-boardWidth)/2/2+boardWidth+50, height/2, (width-boardWidth)/2, boardHeight);
  fill(255);
  rect(25, 430, 41, 41);
  redButton.draw();
  orangeButton.draw();
  yellowButton.draw();
  greenButton.draw();
  blueButton.draw();
  purpleButton.draw();
  pinkButton.draw();
  whiteButton.draw();
  brownButton.draw();
  blackButton.draw();
  eraserButton.draw();
  clearButton.draw();
  if (mousePressed) {
    stroke(lineColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
     if (redButton.isPressed()) {
          lineColor=redButton.getColor();
     }
     else if (orangeButton.isPressed()) {
       lineColor=orangeButton.getColor();
     }
     else if (yellowButton.isPressed()) {
       lineColor=yellowButton.getColor();
     }
     else if (greenButton.isPressed()) {
       lineColor=greenButton.getColor();
     }
     else if (blueButton.isPressed()) {
       lineColor=blueButton.getColor();
     }
     else if (purpleButton.isPressed()) {
       lineColor=purpleButton.getColor();
     }
     else if (pinkButton.isPressed()) {
       lineColor=pinkButton.getColor();
     }
      else if (whiteButton.isPressed()) {
       lineColor=whiteButton.getColor();
     }
      else if (brownButton.isPressed()) {
       lineColor=brownButton.getColor();
     }
      else if (blackButton.isPressed()) {
       lineColor=blackButton.getColor();
     }
     else if (eraserButton.isPressed()) {
       lineColor=whiteButton.getColor();
     }
     else if (clearButton.isPressed()) {
       background(255);
     }
  }
if (keyPressed) {
       if (key=='a') {
          strokeWeight(1);
       }
       else if (key=='s') {
          strokeWeight(10);
       }
       else if (key=='d') {
          strokeWeight(20);
       }
       else if (key=='f') {
          strokeWeight(30);
       }
       else if (key=='g') {
          strokeWeight(40);
       }
       else if (key=='h') {
          strokeWeight(50);
       }
       else if (key=='j') {
          strokeWeight(60);
       }
       else if (key=='k') {
          strokeWeight(70);
       }
   }
}


 class Button {
  int x, y;
  color Color;
  int Width=40;
  int Height=40;
  
  Button(int xTemp, int yTemp, color c) {
    x= xTemp;
    y= yTemp;
    Color= c;
  }
  void draw() {
    fill(Color);
    rectMode(CENTER);
    rect(x, y, Width, Height);
}

  boolean isPressed() {
      if (mouseX>x-Width/2 && mouseX<(x+Width/2)) {
        if (mouseY>(y-Height/2) && mouseY<(y+Height/2)) {
          return true;
        }
      }

   return false;
  
  }
  
  color getColor() {
    return Color;
  }
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  
}
