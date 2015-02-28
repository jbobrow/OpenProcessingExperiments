
color paintColor = color(0, 0, 0);
int paintWidth = 1;
boolean fillMode = false;
boolean triMode = false;

int oldX = 0;
int oldY = 0;



void setup() {
  size(500, 500);
  background(255);
  stroke(0,0,0);
 
}

void draw() {
  // UI menu boxes
  strokeWeight(1);
  stroke(0);
  fill(206, 204, 204);
  rect(0,0, 500, 40);
  //black box
  fill(0,0,0);
  rect(40,5,20,20);
  // red box
  fill(255, 0, 0);
  rect(60, 5, 20, 20); 
  // yellow box
  fill(255, 243, 0);
  rect(80, 5, 20, 20);
  // blue box
  fill(0, 23, 255);
  rect(100, 5, 20, 20);
  // green box
  fill(29, 222, 49);
  rect(120, 5, 20, 20);  
  //pink box//
  fill(252, 8, 192);
  rect(140, 5, 20 , 20);

  // heavy stroke box
  fill(255);
  rect(190, 5, 20, 20);
  fill(0);
  rect(195, 10, 10, 10);
  // light stroke box
  fill(255);
  rect(210, 5, 20, 20);
  fill(0);
  rect(217, 13, 5, 5);
  
  text("+ stroke -", 187, 37);
  
  // tri-tool
  fill(255);
  rect(260, 5, 20, 10);
  textSize(8);
  fill(0);
  text("fill", 265, 13);
  fill(255);
  rect(260, 15, 20, 10);
  stroke(255, 0, 0);
  line(260, 25, 280, 15);
  stroke(0);
  fill(255);
  rect(280, 5, 20, 20);
  triangle(285, 20, 290, 10, 295, 20);
  rect(300, 5, 20, 10);
  fill(0);
  text("on", 306, 14);
  fill(255);
  rect(300, 15, 20, 10);
  fill(0); 
  text("off", 305, 24);
  fill(0);
  textSize(10);
  text("Tri-tool", 273, 37);
  
  
  // eraser box
  fill(255, 191, 251);
  stroke(0);
  quad(365, 10, 390, 10, 385, 20, 360, 20);
  textSize(10);
  fill(0);
  text("eraser", 357, 37); 
  // clear all box
  fill(255);
  rect(410, 5, 50, 20);
  fill(0);
  text("clear all", 415, 20); 
  
  // INTERACTIVE SECTION
  if(mousePressed == true) {
   //black box 
    if(mouseX < 60 && mouseX >40 && mouseY <25 && mouseY >5) {
      paintColor = color(0, 0, 0);
    }
    //red box
    if(mouseX < 80 && mouseX >60 && mouseY <25 && mouseY >5){
      paintColor = color(255, 0, 0);
    }
    //yellow box
    if(mouseX < 100 && mouseX >80 && mouseY <25 && mouseY >5){
      paintColor = color(255, 243, 0);
    }
    //blue box
    if(mouseX < 120 && mouseX >100 && mouseY <25 && mouseY >5){
      paintColor = color(0, 23, 255);
    }
    //green box
    if(mouseX < 140 && mouseX >120 && mouseY <25 && mouseY >5){
      paintColor = color(29, 222, 49);
    }
    //pink box
    if(mouseX < 160 && mouseX >140 && mouseY <25 && mouseY >5){
      paintColor = color(252, 8, 192);
    }
    // stroke + box
    if(mouseX < 210 && mouseX >190 && mouseY <25 && mouseY >5 && paintWidth < 20){
      paintWidth++;
    }
    //stroke - box
    if(mouseX < 230 && mouseX >210 && mouseY <25 && mouseY >5 && paintWidth > 1){
      paintWidth--;
    }
   //triangle/mountain tool
   //fill
    if(mouseX < 280 && mouseX >260 && mouseY <15 && mouseY >5){
      fillMode = true;
      triMode = true;
    }
    //nofill
    if(mouseX < 280 && mouseX >260 && mouseY <25 && mouseY >15){
      fillMode = false;
      triMode = true;
    }
    //on
    if(mouseX < 320 && mouseX >300 && mouseY <15 && mouseY >5){
      triMode = true;
    }
    
    //off
    if(mouseX < 320 && mouseX >300 && mouseY <25 && mouseY >15){
      triMode = false;
    }
    
    
    // eraser
    if(mouseX < 390 && mouseX >360 && mouseY <20 && mouseY >10){
      paintColor = color(255);
      paintWidth = 20;
    }
    // clear all box
    if(mouseX < 460 && mouseX >410 && mouseY <25 && mouseY >5){
      fill(255);
      stroke(255);
      rect(0, 40, 500, 460);
      
    }
   
    strokeWeight(paintWidth);
    stroke(paintColor);
    if(mouseY > 40){
      if(!triMode){
      line(pmouseX, pmouseY, mouseX, mouseY);
      }else{
      translate (mouseX, mouseY);
        if(mousePressed == true && !fillMode) {
      noFill();
       triangle(0, -45, 75, 75, -75, 75);
      }else{
        fill(paintColor);
        triangle(0, -45, 75, 75, -75, 75);
      }
               
      }
    
      }
      
      }
    
  }
