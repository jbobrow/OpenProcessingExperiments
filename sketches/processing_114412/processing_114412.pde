
color paintColor = color(0, 0, 0);
int paintWidth = 1;

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
  //black box
  fill(0,0,0);
  rect(0,0,20,20);
  // red box
  fill(255, 0, 0);
  rect(20, 0, 20, 20); 
  // yellow box
  fill(255, 243, 0);
  rect(40, 0, 20, 20);
  // blue box
  fill(0, 23, 255);
  rect(60, 0, 20, 20);
  // heavy stroke box
  fill(255);
  rect(80, 0, 20, 20);
  fill(0);
  rect(85, 5, 10, 10);
  // light stroke box
  fill(255);
  rect(100, 0, 20, 20);
  fill(0);
  rect(107, 8, 5, 5);
  // stamp
  fill(255);
  rect(120, 0, 20, 20);
  fill(245, 15, 195);
  rect(125, 5, 10, 10);
  // eraser box
  fill(255);
  stroke(0);
  rect(140, 0, 40, 20);
  textSize(10);
  fill(0);
  text("eraser", 145, 15); 
  // clear all box
  fill(255);
  rect(180, 0, 50, 20);
  fill(0);
  text("clear all", 185, 15); 
  
  // INTERACTIVE SECTION
  if(mousePressed == true) {
    
    if(mouseX < 20 && mouseX > 0 && mouseY < 20 && mouseY > 0) {
      paintColor = color(0, 0, 0);
    }
    if(mouseX < 40 && mouseX >20 && mouseY <20 && mouseY >0){
      paintColor = color(255, 0, 0);
    }
    if(mouseX < 60 && mouseX >40 && mouseY <20 && mouseY >0){
      paintColor = color(255, 243, 0);
    }
    if(mouseX < 80 && mouseX >60 && mouseY <20 && mouseY >0){
      paintColor = color(0, 23, 255);
    }
    if(mouseX < 100 && mouseX >80 && mouseY <20 && mouseY >0 && paintWidth < 20){
      paintWidth++;
    }
    if(mouseX < 120 && mouseX >100 && mouseY <20 && mouseY >0 && paintWidth > 1){
      paintWidth--;
    }
    if(mouseX < 140 && mouseX >120 && mouseY <20 && mouseY >0){
   
    }
    if(mouseX < 180 && mouseX >140 && mouseY <20 && mouseY >0){
      paintColor = color(255);
      paintWidth = 20;
    }
    if(mouseX < 230 && mouseX >180 && mouseY <20 && mouseY >0){
      fill(255);
      stroke(255);
      rect(0, 20, 500, 480);
      rect(230, 0, 270, 20);
    }
   
    strokeWeight(paintWidth);
    stroke(paintColor);
    if(mouseY > 30){
      line(pmouseX, pmouseY, mouseX, mouseY);
    }

  }
  
}
