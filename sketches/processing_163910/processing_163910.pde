
// Sets up the program to run, only runs once at begining 
void setup(){
// sets the canvas size to 750pi by 750pi  
  size(750,750);
// sets back ground color to white  
  background(255);
// sets frame rate to 60 frames per second  
  frameRate(60);
}  
  
void draw(){
  // sets back ground color to white  
  fill(mouseY, mouseX, mouseY);
  noStroke();
  rect(mouseX,0,50,100);
  
  fill(mouseX+5, mouseY, mouseX+5);
  noStroke();
  rect(mouseX,100,50,100);
  
  fill(mouseY+15, mouseX, mouseY+15);
  noStroke();
  rect(mouseX,200,50,100);
  
  fill(mouseX+20, mouseY, mouseX+20);
  noStroke();
  rect(mouseX,300,50,100);
  
  fill(mouseY+25, mouseX, mouseY+25);
  noStroke();
  rect(mouseX,400,50,100);
  
  fill(mouseX+50, mouseY, mouseX+50);
  noStroke();
  rect(mouseX,500,50,100);
  
  fill(mouseY+75, mouseX, mouseY+75);
  noStroke();
  rect(mouseX,600,50,100);
  
  fill(mouseX+100, mouseY, mouseX+100);
  noStroke();
  rect(mouseX,700,50,100);
}


