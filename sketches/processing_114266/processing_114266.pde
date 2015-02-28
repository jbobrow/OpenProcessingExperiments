
color paintColor = color(0, 0, 0);
int paintWidth = 1;
int kal = 0;
 
void setup() {
  size(500, 500);
  background(255);
  stroke(0,0,0);
}
 
void draw() {
  noStroke();
  fill(128);
  rect(0, 0, 500, 45);
  //these are my UI boxes
  fill(0);
  textSize(7);
  text("Colors", 35, 5, 25, 80);
  strokeWeight(1);
  stroke(0);
  //red button
  fill(255, 0, 0);
  rect (5, 20, 20, 20);
  //yellow button
  fill(255, 255, 0);
  rect(25, 20, 20, 20);
  //green button
  fill(0, 255, 0);
  rect(45, 20, 20, 20);
  //blue button
  fill(0, 0, 255);
  rect(65, 20, 20, 20);
  //black button
  fill(0);
  rect(85, 20, 20, 20);
  //lineweight label
  fill(0);
  textSize(8);
  text("Line Weight", 160, 5, 80, 80);
  //lineweight line
  strokeWeight(1);
  stroke(paintColor);
  fill(paintColor);
  ellipse(180, 30, paintWidth, paintWidth);
  //strokeWeight(paintWidth);
  //stroke(paintColor);
  //line(180, 37, 180, 23);
  //fat line button
  strokeWeight(2);
  stroke(255);
  line(205, 30, 215, 30);
  line(210, 25, 210, 35);
  //skinny line button
  strokeWeight(2);
  line(145, 30, 155, 30);
  //eraser label
  fill(0);
  textSize(8);
  text("Eraser", 255, 5, 25, 80);
  //eraser button
  strokeWeight(0);
  fill(255, 155, 155);
  rect(252, 22, 30, 15);
  //kaleidoscope label
  fill(0);
  textSize(8);
  text("Kaleidoscope!", 330, 5, 80, 80);
  //kaleidoscope on button
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(330, 20, 20, 20);
  fill(0);
  text("On", 335, 26, 20, 20);
  //kaleidoscope off button
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(355, 20, 20, 20);
  fill(0);
  text("Off", 360, 26, 20, 20);
  //clear screen label
  fill(0);
  textSize(8);
  text("Clear screen", 445, 5, 80, 80);
  //clear screen button
  strokeWeight(1);
  stroke(0);
  fill(255);
  rect(460, 20, 20, 20);
  stroke(255, 0, 0);
  line(461, 21, 479, 39);
  line(461, 39, 479, 21);
   
  //this is my interactive section
  if(mousePressed == true) {
     
    if(mouseX < 25 && mouseX > 5 && mouseY < 40 && mouseY > 20) {
      paintColor = color(255, 0, 0);
    }
    if(mouseX < 45 && mouseX >25 && mouseY <40 && mouseY >20){
      paintColor = color(255, 255, 0);
    }
    if(mouseX < 65 && mouseX >45 && mouseY <40 && mouseY >20){
      paintColor = color(0, 255, 0);
    }
    if(mouseX < 85 && mouseX >65 && mouseY <40 && mouseY >20){
      paintColor = color(0, 0, 255);
    }
    if(mouseX < 105 && mouseX >85 && mouseY <40 && mouseY >20){
      paintColor = color(0);
    }
    if(mouseX < 480 && mouseX >460 && mouseY <40 && mouseY >20){
      background(255);
    }
    if(mouseX < 215 && mouseX >205 && mouseY <35 && mouseY >25 && paintWidth < 20){
      paintWidth++;
    }
    if(mouseX < 155 && mouseX >145 && mouseY <35 && mouseY >25 && paintWidth > 1){
      paintWidth--;
    }
    if(mouseX < 282 && mouseX >252 && mouseY <37 && mouseY >22) {
      paintWidth = 15;
      paintColor = color(255);
    }
    if(mouseX < 350 && mouseX >330 && mouseY <40 && mouseY >20){
      kal = 1;
    }
    if(mouseX < 375 && mouseX >355 && mouseY <40 && mouseY >20){
      kal = 0;
    }
    //here is where we actually draw on the page
    strokeWeight(paintWidth);
    stroke(paintColor);
    if(mouseY > 45) line(pmouseX, pmouseY, mouseX, mouseY);
    if(kal == 1) {
      stroke(255, 0, 0);
      line(pmouseY, pmouseX, mouseY, mouseX);
      stroke(0, 255, 0);
      line(500-pmouseY, 500-pmouseX, 500-mouseY, 500-mouseX);
      stroke(0, 0, 255);
      line(500-pmouseX, 500-pmouseY, 500-mouseX, 500-mouseY);
    }
 
  }
 
}



