
// Beatriz Bukvic - February 18th, Creative Computing B, Benjamin Bacon

void setup() { 
  size(825, 750); 
  background(255);
  smooth();
} 

void draw() { 
  
  background(255);
  
  int r = round( map(mouseX, 0,width, 150,220) );
  noStroke();
  fill(0,r+50,r-10);
  
  rect(50,700,25 ,-mouseY*1.2);
  rect(100,50,25,mouseY*2);
  rect(150,700,25,-mouseY);
  rect(200,50,25,mouseY* 1.6);
  rect(250,700,25,-mouseY*1.4);
  rect(300,50,25,mouseY*1.8);
  rect(350,700,25,-mouseY*2);
  rect(400,50,25,mouseY*2.2);
  rect(450,700,25,-mouseY*1.8);
  rect(500,50,25,mouseY*2);
  rect(550,700,25,-mouseY*1.2);
  rect(600,50,25,mouseY*1.8);
  rect(650,700,25,-mouseY*1.4);
  rect(700,50,25,mouseY*1.6);
  rect(750,700,25,-mouseY);
  
  noStroke();
  fill(255);
  rect(0,0,825,50);
  rect(0,700,825,50);
}


