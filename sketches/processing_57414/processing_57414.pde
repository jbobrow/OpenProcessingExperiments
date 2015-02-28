
PImage space;
float easing = 0.04;

void setup() {
  size(440, 480);
  smooth();
}

void draw() {
  //mouse position
  background(0);
float x = mouseX;
float y = mouseY;
  //int targetX = mouseX;


  //adjusted colour values (0<= colour <= 255)
 // float colourX = X/400*255;
  //float colourY = y/600*255;
  //float colourZ = x*y/400/600*255;

  //mouse determined background colour
  //background(colourX, colourY, colourZ);


  // Head 
  noStroke();
  fill(224, 255, 255);                
  ellipse(x+40, 155, 120, 120);  // Head 
  fill(0, 115, 0);              //nose 
  ellipse(x+50, 150, 8, 8);    

//eyes
  if (mousePressed == true) {
    //mouse is down
    fill(0);
    fill(mouseX, mouseY, 100);
    //draw a blinked eye here
  } else {
    //mouse is up
    //draw the open eye
    ellipse(x+70, 126, 20, 20);    // left
    fill(mouseY, mouseX, 100);
    ellipse(x+10, 126, 20, 20);    // right 
    noFill();

    }

  //body
  fill(180);
  ellipse(x+25, 400, 250, 250);
  fill(80);
  ellipse(x+26, 350, 70, 70);
  fill(0, 90, 100);
  ellipse(x+26, 350, 50, 50);
  fill(220, 100, 100);
  ellipse(x+26, 350, 30, 30);
  fill(224, 255, 255);
  rect(x-99, 416, 248, 100);
  fill(80);
  rect(x-99, 440, 248, 30);
  
  // Neck 
  strokeWeight(3);
  fill(220);
  rect(x, 220, 50, 6);
  rect(x-5, 230, 60, 6);
  rect(x-10, 240, 70, 6);
  rect(x-5, 250, 60, 6);
  rect(x, 260, 50, 6);    
  
    // Antennae 
  fill(255, 150, 250);
  ellipse(100, 50, 10, 10);
  ellipse(270, 40, 10, 10);
  ellipse(400, 80, 10, 10);  

}





