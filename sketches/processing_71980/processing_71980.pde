


void setup(){
  size(1000, 700);
  background(0);
  noStroke();
}

void draw(){
 int xPos = mouseX; 
 int yPos = mouseY;
 
 if (mousePressed){
   background(random(255));
 }
   
 else if (keyPressed){
   background(random(255), random(255), random(255));
 }
   
 else{ 
   background(255);
 }
  //first row 
  fill(255);
  if (xPos > 500){
    fill(random(150));
  }
  else {
    fill(255);
  }
   
  rect(50, 100, 70, 50);
  rect(150, 100, 70, 50);
  rect(250, 100, 70, 50);
  rect(350, 100, 70, 50);
  rect(450, 100, 70, 50);
  rect(550, 100, 70, 50);
  rect(650, 100, 70, 50);
  rect(750, 100, 70, 50);
  rect(850, 100, 70, 50);
  //second row
  fill(128, 128, 128);
  
  if (xPos > 500){
    fill(random(150));
  }
  else {
    fill(255);
  }
  rect(50, 200, 70, 50);
  rect(150, 200, 70, 50);
  rect(250, 200, 70, 50);
  rect(350, 200, 70, 50);
  rect(450, 200, 70, 50);
  rect(550, 200, 70, 50);
  rect(650, 200, 70, 50);
  rect(750, 200, 70, 50);
  rect(850, 200, 70, 50);
  //third row
  fill(200, 300, 200);
  
  if (xPos > 500){
    fill(random(150));
  }
  else {
    fill(255);
  }
  rect(50, 300, 70, 50);
  rect(150, 300, 70, 50);
  rect(250, 300, 70, 50);
  rect(350, 300, 70, 50);
  rect(450, 300, 70, 50);
  rect(550, 300, 70, 50);
  rect(650, 300, 70, 50);
  rect(750, 300, 70, 50);
  rect(850, 300, 70, 50);
  //fourth row
  fill(50, 50, 50);
  
  if (xPos > 500){
    fill(random(150));
  }
  else {
    fill(255);
  }
  rect(50, 400, 70, 50);
  rect(150, 400, 70, 50);
  rect(250, 400, 70, 50);
  rect(350, 400, 70, 50);
  rect(450, 400, 70, 50);
  rect(550, 400, 70, 50);
  rect(650, 400, 70, 50);
  rect(750, 400, 70, 50);
  rect(850, 400, 70, 50);
  //fifth row
  fill(200, 200, 200);
  
  if (xPos > 500){
    fill(random(150));
  }
  else {
    fill(255);
  }
  rect(50, 500, 70, 50);
  rect(150, 500,70, 50);
  rect(250, 500, 70, 50);
  rect(350, 500, 70, 50);
  rect(450, 500, 70, 50);
  rect(550, 500, 70, 50);
  rect(650, 500, 70, 50);
  rect(750, 500, 70, 50);
  rect(850, 500, 70, 50);
  //sixth row
  fill(350, 350, 350);
  
  if (xPos > 500){
    fill(random(150));
  }
  else {
    fill(255);
  }
  rect(50, 600, 70, 50);
  rect(150, 600,70, 50);
  rect(250, 600, 70, 50);
  rect(350, 600, 70, 50);
  rect(450, 600, 70, 50);
  rect(550, 600, 70, 50);
  rect(650, 600, 70, 50);
  rect(750, 600, 70, 50);
  rect(850, 600, 70, 50);  
}

  

