
float Bcolor1 = 0;
float Bcolor2 = 0;
float Bcolor3 = 0;
int blue = 1;
int red = 0;
int green = 0;
int orange = 0;
int startOver = 0;
int fill1 = 0;
int fill2 = 0;
int fill3 = 0;
int fill1X = 5;
int fill2X = 271;
int fill3X = 537;
int bSize = 20;
int bSizeY = 20;


void setup() {

  size(800, 600); 
  background(255);
}
void draw() {
  if (mousePressed && mouseButton == LEFT && mouseY > 100 && mouseY < 500 && mouseX < 700) {
    noStroke();
    fill(Bcolor1, Bcolor2, Bcolor3);
    ellipse(mouseX, mouseY, bSize, bSize);
  } 


  if (mousePressed && mouseButton == RIGHT) {
    noStroke();
    fill(255);
    ellipse(mouseX, mouseY, bSize, bSize);
  }
  stroke(0);
  fill(0);
  rect(0, 0, 100, 100);
  fill(255, 0, 0);
  rect(100, 0, 100, 100);
  fill(0, 0, 255);
  rect(200, 0, 100, 100);
  fill(80, 255, 0);
  rect(300, 0, 100, 100);
  fill(255, 150, 0);
  rect(400, 0, 100, 100);
  fill(fill1, fill2, fill3);
  rect(500, 0, 100, 100);
  fill(255);
  rect(600, 0, 100, 100);
  fill(195, 195, 195);
  
  rect(0, 500, 266, 100);
    rect(266, 500, 266, 100);
      rect(532, 500, 266, 100);
      fill(120, 120, 120);
      rect(0, 545, 800, 10);
      fill(195, 195, 195);
      rect(fill1X, 530, 20, 40);
      rect(fill2X, 530, 20, 40);
      rect(fill3X, 530, 20, 40);
      rect(700, 0, 100, 500);
      fill(120, 120, 120);
      rect(745, 0, 10, 500);
      fill(195, 195, 195);
      rect(730, bSizeY, 40, 20);
      rect(620, 460, 80, 40);
      fill(0);
      text("Refresh", 638, 485);
      
      
      
      if(mousePressed && mouseY > 500 && mouseX < 266) {
        
        fill1X = mouseX - 10;
        fill1 = mouseX;
        
        
      }
      if(mousePressed && mouseY > 500 && mouseX < 532 && mouseX > 266) {
        fill2X = mouseX - 10;
        fill2 = mouseX - 270;
        
      }
      if(mousePressed && mouseY > 500 && mouseX < 800 && mouseX > 533) {
        fill3X = mouseX - 10;
        fill3 = mouseX - 535;
        
      }
      if(mousePressed && mouseY > 0 && mouseY < 500 && mouseX > 700 && mouseX < 800) {
        bSizeY = mouseY - 10;
        bSize = mouseY - 10;
        
        
      }
      fill(0);
      text(fill1, 20, 590);
      text(fill2, 286, 590);
      text(fill3, 560, 590);
      text(bSize, 710, 490);
      text("How Much Red", 20, 520);
      text("How Much Green", 285, 520);
      text("How Much Blue", 550, 520);
      fill(255);
      text("Custom\n  Color", 525, 13);
      fill(0);
      textSize(13);
      text("Use Left Click\nFor Buttons\nAnd Drawing,\nUse Right Click\nFor The Erasor.", 603, 14);
      
      if(mousePressed && mouseX > 620 && mouseX < 700 && mouseY > 460 && mouseY < 500) {
        noStroke();
        fill(255);
        rect(0, 100, 700, 360);   
    rect(0, 460, 620, 40);    
        
      }
      
      
      
      
      stroke(0);
      
      
      
  if (mousePressed && mouseX < 100 && mouseX > 0 && mouseY > 0 && mouseY < 100) {
    Bcolor1 = 0;
    Bcolor2 = 0;
    Bcolor3 = 0;
  }
  if (mousePressed && mouseX > 100 && mouseX < 200 && mouseY > 0 && mouseY < 100) {
    Bcolor1 = 255;
    Bcolor2 = 0;
    Bcolor3 = 0;
  }
  if (mousePressed && mouseX > 200 && mouseX < 300 && mouseY > 0 && mouseY < 100) {
    Bcolor1 = 0;
    Bcolor2 = 0;
    Bcolor3 = 255;
  }
  if (mousePressed && mouseX > 300 && mouseX < 400 && mouseY > 0 && mouseY < 100) {
    Bcolor1 = 0;
    Bcolor2 = 255;
    Bcolor3 = 30;
  }
  if (mousePressed && mouseX > 400 && mouseX < 500 && mouseY > 0 && mouseY < 100) {
    Bcolor1 = 255;
    Bcolor2 = 150;
    Bcolor3 = 0;
  }
  if(mousePressed && mouseX > 500 && mouseX < 600 && mouseY > 0 && mouseY < 100) {
    Bcolor1 = fill1;
    Bcolor2 = fill2;
    Bcolor3 = fill3;
    
    
  }


  
}
