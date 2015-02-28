
color paintColor = color(0, 0, 0);
int paintWidth = 1;
PImage cat;

void setup() {
  cat = loadImage("cat.gif");
  size(500, 500);
  background(255);
  stroke(0,0,0);
}
 
void draw() {
  //these are my UI boxes
  strokeWeight(1);
  stroke(0);
  //red button
  fill(255, 0, 0);
  rect (0,0,30,30);
  //black button
  fill(0,0,0);
  rect(30, 0, 30, 30);
  //yellow button
  fill(229, 250, 13);
  rect(60, 0, 30, 30);
  //purple button
  fill(193, 27, 185);
  rect(90, 0, 30, 30);
  //clear screen button
  fill(255);
  rect(120, 0, 30, 30);
  //fat line button
  rect(150, 0, 30, 30);
  //skinny line button
  rect(180, 0, 30, 30);
  //eraser
  rect(210, 0, 30, 30);
  //magic button
  rect(240, 0, 30, 30);
  fill(0);
  textSize(10);
  text("clear", 120, 10, 25, 25);
  text("+", 165, 10, 25, 25);
  text("-", 195, 10, 25, 25);
  textSize(9); 
  text("Magic", 240, 10, 30, 30); 
  textSize(8);
  text("Eraser", 210, 10, 25, 25);
  
   
  //this is my interactive section
  if(mousePressed == true) {
     
    if(mouseX < 30 && mouseX > 0 && mouseY < 30 && mouseY > 0) {
      paintColor = color(255, 0, 0);
    }
    if(mouseX < 60 && mouseX >30 && mouseY <30 && mouseY >0){
      paintColor = color(0, 0, 0);
    }
    if(mouseX < 90 && mouseX >60 && mouseY <30 && mouseY >0){
      paintColor = color(229, 250, 13);
    }
    if(mouseX < 120 && mouseX >90 && mouseY <30 && mouseY >0){
      paintColor = color(193, 27, 185);
    }
    if(mouseX < 150 && mouseX >120 && mouseY <30 && mouseY >0){
      background(255);
    }
    if(mouseX < 180 && mouseX >150 && mouseY <30 && mouseY >0 && paintWidth < 20){
      paintWidth++;
    }
    if(mouseX < 210 && mouseX >180 && mouseY <30 && mouseY >0 && paintWidth > 1){
      paintWidth--;
    }
     if(mouseX < 240 && mouseX >210 && mouseY <30 && mouseY >0){
      paintColor = color(255);
      paintWidth++; 
    }
     if(mouseX < 270 && mouseX >240 && mouseY <30 && mouseY >0){
        image(cat, 50,50);
     } 
       
       
    //here is where we actually draw on the page
    strokeWeight(paintWidth);
    stroke(paintColor);
    if(mouseY > 30) line(pmouseX, pmouseY, mouseX, mouseY);
 
  }
  
}  


