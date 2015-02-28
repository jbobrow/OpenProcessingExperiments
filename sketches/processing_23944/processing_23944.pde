
void setup() {
  
  size(500, 500); //size of the canvas
  smooth();
  frameRate(30);
  
}

void draw(){
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  if(mousePressed) { 
    
    //make background a random colour
    background(random(255), random(255), random(255));
    
    //move zoog randomly
    mouseX = pmouseX + 10 - int(random(20));
    mouseY = pmouseY + 10 - int(random(20));
    
  } else {
    
    //make background red
    background(255, 0, 0);
    
  }
  
  stroke(0);

//zoog body
  fill(127, 0, 0);
  rect(mouseX, mouseY, 20, 100);

//zoog head
  fill(255, 200, 200);
  ellipse(mouseX, mouseY - 30, 60, 60);

//zoog eyes
  fill(0);
  ellipse(mouseX - 19, mouseY - 30, 16, 32);
  ellipse(mouseX + 19, mouseY - 30, 16, 32);
  fill(255);
  ellipse(mouseX - 19, mouseY - 20, 10, 10);
  ellipse(mouseX + 19, mouseY - 20, 10, 10);
  
//zoog mouth
  line(mouseX - 10, mouseY - 10, mouseX + 10, mouseY - 10);
  
//zoog arms
  line(mouseX - 10, mouseY, mouseX - 40, mouseY + 15);
  line(mouseX + 10, mouseY, mouseX + 40, mouseY + 15);

//zoog legs
  line(mouseX - 10, mouseY + 50, mouseX - 20, mouseY + 80);
  line(mouseX + 10, mouseY + 50, mouseX + 20, mouseY + 80);

}

void mousePressed() {
  //slow down when zoog is moving
  frameRate(15);
}

void mouseReleased() {
  //return to normal speed
  frameRate(30);
}

