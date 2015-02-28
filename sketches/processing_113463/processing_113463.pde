
color paintColor = color(0, 0, 0);
int paintWidth = 1;

void setup() {
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
  rect (0,0,20,20);
  //black button
  fill(0,0,0);
  rect(20, 0, 20, 20);
  //clear screen button
  fill(255);
  rect(40, 0, 20, 20);
  //fat line button
  strokeWeight(10);
  line(70, 0, 70, 20);
  //skinny line button
  strokeWeight(1);
  line(90, 0, 90, 20);
  fill(0);
  textSize(8);
  text("clear screen", 40, 40, 25, 80);
  
  //this is my interactive section
  if(mousePressed == true) {
    
    if(mouseX < 20 && mouseX > 0 && mouseY < 20 && mouseY > 0) {
      paintColor = color(255, 0, 0);
    }
    if(mouseX < 40 && mouseX >20 && mouseY <20 && mouseY >0){
      paintColor = color(0, 0, 0);
    }
    if(mouseX < 60 && mouseX >40 && mouseY <20 && mouseY >0){
      background(255);
    }
    if(mouseX < 80 && mouseX >60 && mouseY <20 && mouseY >0 && paintWidth < 20){
      paintWidth++;
    }
    if(mouseX < 100 && mouseX >80 && mouseY <20 && mouseY >0 && paintWidth > 1){
      paintWidth--;
    }
    //here is where we actually draw on the page
    strokeWeight(paintWidth);
    stroke(paintColor);
    if(mouseY > 30) line(pmouseX, pmouseY, mouseX, mouseY);

  }

}
