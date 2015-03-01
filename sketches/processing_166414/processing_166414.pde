
PImage smile;

void setup() {
  background(255);
  size(600, 700);
}

void draw() {

  if (key == 'q' || key == 'Q') {
      shortterm();
  }
  if (key == 'w' || key == 'W') {
      recognition();
  }
  if (key == 'e' || key == 'E') {
      goal();
  }
 
}

void shortterm() {
 background(255);

  
  if (mouseX > width/2){
  }else{
  fill(245, 25, 142);
  textSize(35);
  text("1 4 9 2 3 3", 350, 300);}
  
  fill(255);
  rect(mouseX, 150, mouseX, 300);
  
  
  if(mouseX < width/2){
  }else{
    
  fill(31, 25, 245);
  textSize(35);
  text("9 9 5 6 7 7", 90, 300);
  }
}
  


void recognition() {
  noStroke();
  fill(8, 245, 255);
  ellipse(300, 300, 300, 300);
  fill(15, 198, 216);
  ellipse(240, 240, 60, 60);
  ellipse(360, 240, 60, 60);
  fill(21, 149, 152);
  ellipse(300, 325, 200, 40);
 

  noStroke();
  fill(random(255),255,255);
  translate (mouseX,mouseY);
  ellipse(-25,0,50,50);
}


void goal() {
  noStroke();
  fill(255);
  rect(0, 0, 600, 700);
  
  fill(15, 240, 170);
  rect(0, 500, 400, 350);
  rect(460, 500, 400, 350);
  rect(400, 550, 400, 350);
  rect(0, 0, 600, 500);
  
  textSize(15);
  fill(234, 26, 82);
  text("STAY IN LINE!", mouseX, mouseY);
  
  fill(15, 240, 170);
  rect(10, 0, 100, 150);
  rect(10, 100, 250, 100);
  rect(200, 100, 100, 300);
  rect(300, 300, 160, 100);
  
  fill(255);
  rect(360, 400, 100, 150);
  
   
  
  //sets up if statement for if mouse is pressed
  if (mousePressed) {
    textSize(20);
    fill(0);
    text("GOAL!!", 380, 520);
  }else{
    textSize(18);
    fill(15, 240, 170);
    text("Click here!", 365, 520);
  
  }
  
  
  fill(255);
  rect(10, 0, 100, 150);
  rect(10, 100, 250, 100);
  rect(200, 100, 100, 300);
  rect(300, 300, 160, 100);
  
  
  textSize(15);
  fill(35);
  text("START", 35, 15);
}
