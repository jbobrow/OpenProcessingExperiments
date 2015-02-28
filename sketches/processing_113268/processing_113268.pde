
//try 
//lin wenyu

void setup() {
  size(500, 500);
  background(0, 0, 0);
  smooth();
}

void draw() {
 // background(0, 0, 0);

  strokeWeight(2); 
  
  if (mousePressed) {
    stroke(150, 250, 120,50);//fill(150,250,120,50);
  } 
  else {
    stroke(255, 210, 0,50);//fill(255,210,0,50);
  }
    
  float centerX = mouseX/3;
  float centerY = mouseY/2;
  
 //ellipse(mouseX,mouseY,50,50);

  line(mouseX, mouseY, centerX+70, centerY+70);
  line(centerX+70,centerY+70,mouseX, mouseY);

  //fill(255);
  //ellipse(centerX, centerY, 50, 50);
  
  }

void keyPressed() {
  saveFrame (" screen-####.jpg");
}


