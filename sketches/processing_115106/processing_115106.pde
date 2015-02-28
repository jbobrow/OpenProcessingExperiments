
color paintColor = color(0, 0, 0);
int paintWidth = 1;
PShape flare;
int penTip = 1;

void setup() {
    size(500, 500);
    background(255);
    stroke(0, 0, 0);
    flare = loadShape("flare.svg");
    
}

void draw() {
  //these are my UI boxes
    strokeWeight(1);
    stroke(252, 251, 250);
    fill(194);
    rect(0, 0, 500, 70);
  //orange
    fill(250, 133, 23);
    rect(10, 10, 20, 20);
  //yellow
    fill(255, 246, 139);
    rect(40, 10, 20, 20);
  //teal
    fill(75, 196, 201);
    rect(70, 10, 20, 20);
  //blue
    fill(32, 67, 167);
    rect(100, 10, 20, 20);
  //gray
    fill(142, 142, 142);
    rect(130, 10, 20, 20);
  //black
    fill(0, 0, 0);
    rect(160, 10, 20, 20);
  //fat eraser
    strokeWeight(10);
    line(210, 15, 210, 25);
  //skinny eraser
    strokeWeight(1);
    line(230, 12, 230, 30);
  //flare
    stroke(237, 229, 220);
    strokeWeight(10);
    fill(0, 0, 0);
    ellipse(350, 21, 28, 28);
  //clear
    stroke(255);
    strokeWeight(3);
    fill(237, 229, 220);
    rect(415, 10, 35, 20);
  //text
    textSize(15);
    fill(255);
    text("color palette", 10, 52);
    textSize(15);
    text("erase", 201, 52);
    textSize(15);
    text("shape", 329, 52);
    text("clear", 416, 52);
    line(0, 70, 500, 70);
    
//this is my interactive section
  if(mousePressed == true) {
//orange
    if(mouseX < 30 && mouseX > 10 && mouseY < 30 && mouseY > 10) {
      paintColor = color(255, 0, 0);
      paintWidth = 1;
      penTip = 0;
    }
//yellow
    if(mouseX < 60 && mouseX > 40 && mouseY < 30 && mouseY > 10) {
      paintColor = color(255, 246, 139);
      penTip = 0;
    }
//teal
    if(mouseX < 90 && mouseX > 70 && mouseY < 30 && mouseY > 10) {
      paintColor = color(75, 196, 201);
      penTip = 0;
    }
//blue
     if(mouseX < 120 && mouseX > 100 && mouseY < 30 && mouseY > 10) {
       paintColor = color(32, 67, 167);
       penTip = 0;
    }
//gray
    if(mouseX < 150 && mouseX > 130 && mouseY < 30 && mouseY > 10) {
       paintColor = color(142, 142, 142);
       penTip = 0;
    }
//black
    if(mouseX < 180 && mouseX > 160 && mouseY < 30 && mouseY > 10) {
       paintColor = color(0, 0, 0);
       penTip = 0;
    }
//wide eraser
    if(mouseX < 220 && mouseX > 210 && mouseY < 30 && mouseY > 15 && paintWidth < 20) {
      paintColor = color(255, 255, 255);
      paintWidth++;
      penTip = 0;
    }
//thin eraser
    if(mouseX < 235 && mouseX > 225 && mouseY < 30 && mouseY > 10 && paintWidth > 1) {
      paintColor = color(255, 255, 255);
      paintWidth--;
      penTip = 0;
    }
//flare
    if(mouseX < 380 && mouseX > 350 && mouseY < 51 && mouseY > 21) { 
      penTip = 1;
    }
//clear
    if(mouseX < 450 && mouseX > 415 && mouseY < 35 && mouseY > 20) {
      fill(255);
      stroke(255);
      rect(0, 70, 500, 430);
  }   
      
 //here where we actually draw  
    strokeWeight(paintWidth); 
    stroke(paintColor);
    if(mouseY > 70)
    if(penTip == 1) shape(flare, mouseX, mouseY, 50, 50);
    if(penTip == 0) line(pmouseX, pmouseY, mouseX, mouseY);
  }
    
}


