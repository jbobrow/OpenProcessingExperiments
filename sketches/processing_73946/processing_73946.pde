
// Assignment 4 — Drawing Program Buttons and Loops
// Kari Kawachi

float lineSize;
int lineColor;
boolean fancyPants;
int strokeHue;
// int strokeType;

void setup(){
  size (1080, 720);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  background(0);
  lineSize = 1;
  lineColor = 1;
  strokeHue = 0;
//  strokeType = 1;
  fancyPants = true;
}

void draw(){
  // Rainbow Colors
  if (mousePressed && (mouseButton == LEFT)) {
    stroke(lineColor, 100, 100, 100);  
    line(pmouseX, pmouseY, mouseX, mouseY);
      if (lineColor > 360) {
//      println("Is this line working");  used for debugging
        fancyPants = true;
       }
       if (lineColor <= 0) {
        fancyPants = false;
       }

        if (fancyPants == true) {
          lineColor --;
        }
        if (fancyPants == false) {
          lineColor ++;
        }         
  } 
  
  //Stroke Size
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {       
       println(lineSize);
       strokeWeight(lineSize ++);
   }
   else if (keyCode == DOWN) {
     println(lineSize);
     strokeWeight(lineSize --);
       if (lineSize < 0) {
         lineSize = 1;
       }
   }
  }
 }
 
  //Clearing the Screen
  noStroke();
  fill(360);
  rect(25, 625, 200, 75);
  noFill();
  fill(0);
  textSize(36);
  text("Clear", 70, 675);
  if ((mouseX > 25) && (mouseX < 225) && (mouseY > 625) && (mouseY < 700)) {
    if(mousePressed){
      fill(0);
      background(0);
    } else {
      noFill();
    }
  }
  
  /* Changing the Stroke Type
  noStroke();
  fill(360);
  rect(300, 625, 200, 75);
  noFill();
  fill(0);
  textSize(28);
  text("Stroke Type", 320, 675);
  if ((mouseX > 300) && (mouseX < 500) && (mouseY > 625) && (mouseY < 700)) {
    if(mousePressed){
      strokeType ++;
      if (strokeType > 9) {
        strokeType = 1;
      }
    }
  }
  */
 // Ellipses 
  noStroke();
  fill(360);
  rect(800, 625, 200, 75);
  noFill();
  fill(0);
  textSize(32);
  text("Ellipses", 820, 675);
  if ((mouseX > 800) && (mouseX < 1000) && (mouseY > 625) && (mouseY < 700)) {
    if(mousePressed){
//      println("Test");
      fill(lineColor, 100, 100, random(100));
      ellipse(random(1080), random(720), random(100), random(100));
    } else {
      noFill();
    }
  }
  
// Triangles  
  noStroke();
  fill(360);
  rect(300, 625, 200, 75);
  noFill();
  fill(0);
  textSize(30);
  text("Triangles", 340, 675);
  if ((mouseX > 300) && (mouseX < 500) && (mouseY > 625) && (mouseY < 700)) {
    if(mousePressed){
//      println("Testing");
      fill(lineColor, 100, 100, random(100));
      triangle(pmouseX, mouseX, pmouseY, mouseY, random(0, 1080), random(0, 720));
    } else {
      noFill();
    }
  }
  
// Squares  
  noStroke();
  fill(360);
  rect(550, 625, 200, 75);
  noFill();
  fill(0);
  textSize(36);
  text("Squares", 580, 675);
  if ((mouseX > 550) && (mouseX < 750) && (mouseY > 625) && (mouseY < 700)) {
    if(mousePressed){
//      println("Testing here and there");
      fill(lineColor, 100, 100, random(100));
      rect(random(1080), random(720), random(500), random(500));
    } else {
      noFill();
    }
  }
    
// println(lineColor);
// println(fancyPants);

/*
 if (keyPressed) {
   if (key == 'c' || key == 'C') {
     background (0);
  }
 } */
 
}


