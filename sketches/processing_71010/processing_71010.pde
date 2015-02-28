
/*****************************************
 * Assignment 2
 * Name:         Louis Cipriano
 * E-mail:       lciprian@haverford.edu
 * Course:       CS 110 - Section 001
 * Submitted:    September 19, 2012
 * 
 * The following code depicts a randomly colored hot air balloon with a pinstripe basket in an orang sky. 
 * Different sized birds, clouds, and a sun appear when the mouse is pressed at according Y values. 
 * The sketch is reset when a key is pressed.
 * Please see the attached word document for a more full description.
 ***********************************************/

/*Declare Variables
 int rect = 195;
 int x = 195;
 int y = 420;
 int spacing = 10;
 int len = 75;
 boolean sunDrawn = false; */

boolean sunDrawn = false;

void setup() {


  size(500, 500);
  drawBackground() ; 
  background(250, 120, 31);


  //basket
  
  stroke(0, 0, 255);
  fill(250, 250, 0);
  rect(195, 420, 95, 75);

  //pinstripes on basket

  int rect = 195;
  int x = 195;
  int y = 420;
  int spacing = 10;
  int len = 75;

  stroke(0, 0, 255);
  while (x <= rect + 95) {
    strokeWeight(2);
    line(x, y, x, y+len);
    x=x+spacing;
  }

  //attachments from basket to balloon
  
  stroke(255, 0, 0);
  line (195, 420, 215, 375);
  line (290, 420, 270, 375);
  line (215, 375, 270, 375);
  line(215, 375, 185, 300);
  line(270, 375, 300, 300);


  //balloon
  
  frameRate(5);
  fill(random(255), random(255), random(255));
  bezier(185, 300, -103, -99, 633, -60, 300, 300);
}


void draw() {
}


void mousePressed() {

  //sun
  
  if ((mouseY < 200) && (sunDrawn==false)) { 
    stroke(200, 200, 0);
    fill(200, 200, 0);
    ellipse (mouseX, mouseY, 80, 80);    

    //sun rays
    
    line(mouseX, mouseY+40, mouseX, mouseY+70);
    line (mouseX, mouseY-40, mouseX, mouseY-70);
    line(mouseX+40, mouseY, mouseX+70, mouseY);
    line(mouseX-40, mouseY, mouseX-70, mouseY);
    line(mouseX+35, mouseY-15, mouseX+65, mouseY-45);
    line(mouseX-30, mouseY-15, mouseX-50, mouseY-45);
    line(mouseX-30, mouseY+15, mouseX-50, mouseY+45);
    line(mouseX+35, mouseY+15, mouseX+55, mouseY+45);
    line(mouseX+10, mouseY-15, mouseX+35, mouseY-45);
    line(mouseX-10, mouseY, mouseX-15, mouseY-30);
    line(mouseX-5, mouseY+15, mouseX-30, mouseY+55);
    line(mouseX+10, mouseY+15, mouseX+35, mouseY+55);
    line(mouseX+40, mouseY+10, mouseX+60, mouseY+20);
    line(mouseX, mouseY+10, mouseX-20, mouseY+20);
    sunDrawn = true;
  }

  //clouds
  
  if ((mouseY >= 200) & (mouseY <= 350)) {
    fill(0);
    frameRate(20);
    fill(255);
    ellipse(mouseX, mouseY, 80, 30);
    ellipse(mouseX+60, mouseY, 80, 30);
    ellipse(mouseX+120, mouseY, 80, 30);
    ellipse(mouseX+180, mouseY, 80, 30);
    ellipse(mouseX+240, mouseY, 80, 30);
    ellipse(mouseX-30, mouseY+15, 80, 30);
    ellipse(mouseX+30, mouseY+15, 80, 30);
    ellipse(mouseX+90, mouseY+15, 80, 30);
    ellipse(mouseX+150, mouseY+15, 80, 30);
    ellipse(mouseX+210, mouseY+15, 80, 30);
  }

  //big bird
  
  if ((mouseY > 350)&& (mouseX > 250)) {
    //big bird wings
    
    strokeWeight(3);
    stroke(0, 0, 255);
    line(mouseX, mouseY, mouseX-70, mouseY-70);
    line(mouseX, mouseY, mouseX+70, mouseY-70);   

    //big bird head
    
    fill(0, 0, 255);
    ellipse(mouseX, mouseY, 40, 40);   

    //big bird eyes
    
    fill(0);
    ellipse(mouseX-10, mouseY-5, 10, 10);
    ellipse(mouseX+10, mouseY-5, 10, 10);    

    //big bird beak
    
    triangle (mouseX-10, mouseY, mouseX, mouseY+15, mouseX+10, mouseY);
  }

  //small bird
  
  if ((mouseY >350) && (mouseX <= 250)) {  
    //small bird wings
    
    strokeWeight(3);
    stroke(0, 0, 255);
    line(mouseX, mouseY, mouseX-35, mouseY-35);
    line(mouseX, mouseY, mouseX+35, mouseY-35);    

    //small bird head
    
    fill (0, 0, 255);
    ellipse(mouseX, mouseY, 20, 20);

    //small bird eyes
    
    fill(0);
    ellipse(mouseX-5, mouseY-2.5, 7, 7);
    ellipse(mouseX+5, mouseY-2.5, 7, 7);

    //small bird beak
    
    triangle(mouseX-5, mouseY, mouseX, mouseY+11, mouseX+5, mouseY);
  }





  //balloon
  
  frameRate(5);
  fill(random(255), random(255), random(255));
  bezier(185, 300, -103, -99, 633, -60, 300, 300);
}





void keyPressed() {
  drawBackground();
}



void drawBackground() { 
  background(250, 120, 31);
  
  sunDrawn = false; 
  
  //basket
  
  stroke(0, 0, 255);
  fill(250, 250, 0);
  rect(195, 420, 95, 75);

  //pinstripes on basket

  int rect = 195;
  int x = 195;
  int y = 420;
  int spacing = 10;
  int len = 75;

  stroke(0, 0, 255);
  while (x <= rect + 95) {
    strokeWeight(2);
    line(x, y, x, y+len);
    x=x+spacing;
  }

  //attachments from basket to balloon
  
  stroke(255, 0, 0);
  line (195, 420, 215, 375);
  line (290, 420, 270, 375);
  line (215, 375, 270, 375);
  line(215, 375, 185, 300);
  line(270, 375, 300, 300);


  //balloon
  
  frameRate(5);
  fill(random(255), random(255), random(255));
  bezier(185, 300, -103, -99, 633, -60, 300, 300);
}
