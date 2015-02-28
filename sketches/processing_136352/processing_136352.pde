
int x, y;
int xValue = 300, yValue = 300;

//setup

void setup(){
  size(600, 600);
}

//draw

void draw() {
  // x = width/2;
  // y = height/2;
  
  x = mouseX;
  y = mouseY; 
  
//orange  
  if (x < width/2 && y < height/2) {
    println("you are in quadrant 1");
    background(255, 244, 237);
  }
  
//red
  if (x > width/2){
    background(255, 240, 240);
    println("you are in quadrant 2");
  }  

//blue
    if (y > width/2) {
    background(229, 255, 250);
    println("you are in quadrant 4");
  } 
  
//purple
  if (x > width/2 && y > height/2){
    background(243, 219, 255);
    println("you are in quadrant 3");
  }  
  
 
 
  ellipse(xValue, yValue, 600, 600); //huge circle
  noStroke();
  //orange
  if (x < width/2 && y < height/2) {
    println("you are in quadrant 1");
    fill(255, 192, 152);
  }  
  //red
  if (x > width/2){
    fill(255, 214, 214);
    println("you are in quadrant 2");
  }  

  //blue
  if (y > width/2) {
    fill(203, 255, 245);
    println("you are in quadrant 4");
  } 
    //purple
  if (x > width/2 && y > height/2) {
    fill(231, 183, 255);
    println("you are in quadrant 3");
  }
  
  ellipse(xValue/2, yValue/2, 300, 300); //top left circle
  ellipse(450, yValue/2, 300, 300); //top right circle
  ellipse(xValue/2, 450, 300, 300); //bottom left circle
  ellipse(450, 450, 300, 300); //bottom right circle
  noStroke();
 //orange
  if (x < width/2 && y < height/2) {
    fill(255, 173, 121);
    println("you are in quadrant 1");
  }   
 //red
  if (x > width/2){
    fill(255, 185, 185);
    println("you are in quadrant 2");
  } 
 //blue
  if (y > width/2) {
    fill(160, 255, 237);
    println("you are in quadrant 4");
  }
 //purple
   if (x > width/2 && y > height/2){
    fill(219, 149, 255);
    println("you are in quadrant 3");
  }
  ellipse(xValue/3, yValue/3, 150, 150); //top left mini circle
  ellipse(500, yValue/3, 150, 150); //top right mini circle
  ellipse(xValue/3, 500, 150, 150); //bottom left mini circle
  ellipse(500, 500, 150, 150); //bottom right mini circle
  noStroke();
  //orange
  if (x < width/2 && y < height/2) {
    fill(255, 149, 82);
    println("you are in quadrant 1");
  } 
  //red
  if (x > width/2){
    fill(255, 147, 147);
    println("you are in quadrant 2");
  }
//blue
  if (y > width/2) {
    fill(116, 255, 228);
    println("you are in quadrant 4");
  } 
  //purple
  if (x > width/2 && y > height/2){
    fill(209, 118, 255);
    println("you are in quadrant 3");
  }
  
  rectMode(CENTER);
  rect(xValue, yValue, 150, 150); //center square
  noStroke();
  //orange
  if (x < width/2 && y < height/2) {
    fill(255, 131, 54);
    println("you are in quadrant 1");
  } 
  //red
  if (x > width/2){
    fill(255, 113, 113);
    println("you are in quadrant 2");
  }
  //blue
  if (y > width/2) {
    fill(88, 255, 223);
    println("you are in quadrant 4");
  } 
  //purple
    if (x > width/2 && y > height/2){
    fill(199, 90, 255);
    println("you are in quadrant 3");
  }
  
  rect(xValue-75, yValue-75, 75, 75); //top left square
  rect(xValue-75, yValue+75, 75, 75); //top right square
  rect(xValue+75, yValue+75, 75, 75); //bottom right square
  rect(xValue+75, yValue-75, 75, 75); //bottom left square
  noStroke();
  //orange
  if (x < width/2 && y < height/2) {
    fill(255, 115, 28);
    println("you are in quadrant 1");
  } 
  //red
  if (x > width/2){
    fill(255, 80, 80);
    println("you are in quadrant 2");
  }
  //blue
  if (y > width/2) {
    fill(54, 255, 216);
    println("you are in quadrant 4");
  } 
  //purple
    if (x > width/2 && y > height/2){
    fill(188, 57, 255);
    println("you are in quadrant 3");
  }
  
  rect(xValue-37.5, yValue-37.5, 37.5, 37.5);
  rect(xValue-37.5, yValue+37.5, 37.5, 37.5);
  rect(xValue+37.5, yValue-37.5, 37.5, 37.5);
  rect(xValue+37.5, yValue+37.5, 37.5, 37.5);
 noStroke();
 //orange
  if (x < width/2 && y < height/2) {
    fill(255, 100, 3);
    println("you are in quadrant 1");
  } 
  //red
  if (x > width/2){
    fill(255, 46, 46);
    println("you are in quadrant 2");
  }
  //blue
  if (y > width/2) {
    fill(23, 255, 210);
    println("you are in quadrant 4");
  } 
 //purple 
  if (x > width/2 && y > height/2){
    fill(178, 26, 255);
    println("you are in quadrant 3");
  }
    
}


