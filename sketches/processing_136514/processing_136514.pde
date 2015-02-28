

void setup(){
  size(500,500);
  smooth();
  frameRate(50);
  noCursor();
  colorMode(RGB);
}

float t = 0.18;
float x = 10;



void draw(){
  
  
  strokeWeight(5);
 
  rect(0, 0, width, height);
 
  if (key == 'z') {
    stroke(random(50), 20, 15, 10);
  }
  else {
    stroke(random(20), 150, 300, 80);
  }
 
  if (mousePressed == true) {
    //background(random(110, 250));
    background(200,200,210);
    //stroke(random(20), 10, 10, 20);
  }
 
  for (int i= 0; i< 2; i++) {
  
    stroke(random(width), random(height), random(width), random(height));
    rect(random(width), random(height), random(width), random(height));
    ellipse(random(width), random(height), random(width), random(height));
   line(random(width), random(height), random(width), random(height));
   triangle(random(width), random(height), random(width), random(height),random(width), random(height));
  }
  
  
  

  fill(30,200,100);
  float x = map(noise(t), 0.1, 2.5, 18,height);
  ellipse(x,250,300,500);
  fill(255);
  ellipse(x +100,100,150,150);
  ellipse(x,100,150,150);
  fill(0);
  ellipse(x,100,20,20);
  ellipse(x +100,100,20,20);
  fill(30,200,100);
  noStroke();
  ellipse(x+200,200,400,200);
  fill(0);
  ellipse(x+90,200,50,50);
  ellipse(x+100,350,50,random(50));
 
  t =t+.05;
}


