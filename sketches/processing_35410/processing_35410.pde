
void setup () {
  size(300, 300);
}


void draw() {
  
  //this controls the sky
  noStroke();
  fill(mouseX, mouseX, 0); 
  rect(0, 0, 300, 150);
  
  //this controls the moon
  fill(255, 255, 255);
  ellipse(250, mouseX, 50, 50);
  
  //this controls the ground
  noStroke();
  fill(0, mouseX, 0);
  rect(0,150,300,150);
  
  //this controls the shadow of the wall
  noStroke();
  fill(200);
  quad(150, 200, mouseX, 200, mouseX, 250, 300, 250);
  
  //this controls the horizon line
  stroke(0);
  strokeWeight(3);
  line(0, 150, width, 150);
  
  //this controls the wall
  fill(100);
  quad(150, 100, 150, 200, 300, 250, 300, 50);
  
  //this controls the window
  fill(255,255,mouseX);
  quad(200,120,200,180,235,190,235,110);
  
  //this controls the stars
  stroke(250,240,0);
  point(50,50);
  point(40,60);
  point(20,45);
  point(150,20);
  point(170,35);
  point(110,10);
  point(90,90);
}


