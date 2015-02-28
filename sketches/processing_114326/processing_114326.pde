
color paintColor = color(0, 0, 0);
int paintWidth = 1;
//paintShape

void setup() {
  size(500,500);
  background(255);
  stroke(0);
}

void draw() {
  stroke(0);
  strokeWeight(1);
  
  //text above color boxes
  fill(0);
  textSize(20);
  text("Colors", 0, 20);
  
  //color boxes
  fill(80, 210, 255); //cyan fill
  rect(0, 20, 20, 20); //1st box rect
  fill(255, 46, 137); //pink
  rect(20, 20, 20, 20); //2nd box 
  fill(235, 240, 12); //yellow
  rect(40, 20, 20, 20); //3rd box 
  fill(18, 255, 87); //sea foam
  rect(0, 40, 20, 20); //2nd row 1st box ()
  fill(255, 136, 15);//orange
  rect(20, 40, 20, 20); //2nd row 2nd box ()
  fill(0, 0, 0);//black
  rect(40, 40, 20, 20); //2nd row 3rd box ()
  fill(28, 22, 222); //
  rect(0, 60, 20, 20); //3rd row 1st box ()
  fill(133, 37, 245); //
  rect(20, 60, 20, 20); //3rd row 2nd box
  fill(245, 7, 51); //reddish
  rect(40, 60, 20, 20); //3rd row 3rd box
  fill(255, 255, 255); //white
  rect(0, 80, 20, 20); //4th row 1st box (blue)
  fill(170);//gray
  rect(20, 80, 20, 20); //4thy row 2nd box (brown)
  fill(85);//dark gray fill
  rect(40, 80, 20, 20); //4th row 3rd box (white)
  
  //text above shapes
  fill(0);
  textSize(20);
  text("Shapes", 0, 120);
  
  //Shapes
  fill(255, 255, 255); //white fill
  triangle(0, 145, 10, 125, 20, 145); //triangle shape
  fill(255, 255, 255); //white fill
  ellipse(30, 135, 20, 20); //circle shape
  fill(255, 255, 255); //white fill
  rect(40, 125, 20, 20); //square shape
  
  //text above clear screen
  fill(0);
  textSize(20);
  text("Clear", 0, 167);
  
  //gray clear screen box
  
  fill(200);//gray fill
  rect(0, 175, 60, 25); //
  stroke(255, 0, 0);//diag line color red
  line(0, 175, 60, 200);//diagonal line bforward lash
  line(0, 200, 60, 175);//diagonal line back slash
  
  //text above sizes
  stroke(0);
  fill(0);
  textSize(20);
  text("Sizes", 0, 220);
  
  //Sizes
  fill(0);
  ellipse(10, 230, 3, 3); //small size
  ellipse(25, 230, 10, 10); //mediup size
  ellipse(50, 230, 20, 20); //large size
  ellipse(30, 275, 60, 60); //super size
  
  if(mousePressed == true) {
    if(mouseX < 20 && mouseX > 0 && mouseY <40 && mouseY > 20) {
      paintColor = color(80, 210, 255); //1st row 1st box cyan
    }
    if(mouseX < 40 && mouseX > 20 && mouseY <40 && mouseY > 20) {
      paintColor = color(255, 46, 137); //1st row 2nd box pink,
    }
    if(mouseX < 60 && mouseX > 40 && mouseY <40 && mouseY > 20) {
      paintColor = color(235, 240, 12); //1st row 3rd box yellow
    }
    
    
    if(mouseX < 20 && mouseX > 0 && mouseY <60 && mouseY > 40) {
      paintColor = color(18, 255, 87); //2nd row 1st box sea foam
    }
    if(mouseX < 40 && mouseX > 20 && mouseY <60 && mouseY > 40) {
      paintColor = color(255, 136, 15); //2nd row 2nd box orange
    }
    if(mouseX < 60 && mouseX > 40 && mouseY <60 && mouseY > 40) {
      paintColor = color(0, 0, 0); //2nd row 3rd box black
    }
    
    
    if(mouseX < 20 && mouseX > 0 && mouseY <80 && mouseY > 60) {
      paintColor = color(28, 22, 222); //
    }
    if(mouseX < 40 && mouseX > 20 && mouseY <80 && mouseY > 60) {
      paintColor = color(133, 37, 245); //1st row 2nd box purple
    }
    if(mouseX < 60 && mouseX > 40 && mouseY <80 && mouseY > 60) {
      paintColor = color(245, 7, 51); //1st row 3rd box green
    }
    
    
    if(mouseX < 20 && mouseX > 0 && mouseY <100 && mouseY > 80) {
      paintColor = color(255, 255, 255); //2nd row 1st box
    }
    if(mouseX < 40 && mouseX > 20 && mouseY <100 && mouseY > 80) {
      paintColor = color(170); //2nd row 2nd box
    }
    if(mouseX < 60 && mouseX > 40 && mouseY <100 && mouseY > 80) {
      paintColor = color(85); //2nd row 3rd box
    }
    
    
    if(mouseX < 60 && mouseX > 00 && mouseY <200 && mouseY > 175) {
      background(255); //Gray clear screen action
     
    }  
    
    
    if(mouseX < 20 && mouseX > 0 && mouseY <240 && mouseY > 220) {
      paintWidth = 1;
    }
    if(mouseX < 40 && mouseX > 20 && mouseY <240 && mouseY > 220) {
      paintWidth = 7; //sets SW to 7
    }
    if(mouseX < 60 && mouseX > 40 && mouseY <240 && mouseY > 220) {
      paintWidth = 20; //sets SW to 7
    }
    if(mouseX < 60 && mouseX > 0 && mouseY <300 && mouseY > 240) {
      paintWidth = 60; //sets SW to 10
    }
  strokeWeight(paintWidth);
  stroke(paintColor);
    if(mouseY > 20) line(pmouseX, pmouseY, mouseX, mouseY); //draw line from old to new mouse pos.
    
  }
  
}


