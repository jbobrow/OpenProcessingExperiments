
float xPos;
float yPos;
float diameter = 100;

void setup(){
  size(1024,768);
  smooth();
}

void draw(){
  background (0);
  
  if(mousePressed){
    xPos = lerp(xPos, mouseX, 0.1);
    yPos = lerp(yPos, mouseY, 0.1);
  }
  
  else{
    float n = frameCount*0.01;
    xPos = noise(n)*width;
    yPos = noise(n)*height;
  }
  
  diameter = height*1/6;
  
  rectMode(CENTER);
  stroke(0);
  strokeWeight(height*25/600);
  fill(255);
  rect(xPos, height/5, diameter, diameter);
  rect(width-xPos, 3*height/5, diameter, diameter);
  rect(width-xPos, 2*height/5, diameter, diameter);
  rect(width-xPos, 4*height/5, diameter, diameter);
  rect(width-xPos, 5*height/5, diameter, diameter);
  
  strokeWeight(25);
  fill(255);
  rect(width/5, yPos, diameter, diameter);
  rect(3*width/5, yPos, diameter, diameter);
  rect(2*width/5, height-yPos, diameter, diameter);
  rect(4*width/5, height-yPos, diameter, diameter);
  rect(5*width/5, height-yPos, diameter, diameter);
}
