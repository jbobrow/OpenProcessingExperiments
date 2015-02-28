
int patternSeperationX = 10;
int patternSeperationY = 10;

void setup(){
  size(500,500);
  background(255);
  
  for(int i = 0; i < width/patternSeperationX; i++){
  for(int j = 0; j < height/patternSeperationY; j++){
    pushMatrix();
    translate(i*patternSeperationX, j*patternSeperationY);
    yourFunction();
    popMatrix();
  }
}
}

void draw(){
  fill(76,85,101,random(50));
  noStroke();
  smooth();
  ellipse(mouseX,mouseY,20,20);
  
  fill(181,204,241,random(10));
  noStroke();
  smooth();
  ellipse(mouseX+10,mouseY+10,50,50);
  
  fill(57,64,75,random(50));
  noStroke();
  smooth();
  ellipse(mouseX+30,mouseY-30,25,25);
}

void yourFunction(){
  
  
  fill(57,64,75,random(255));
  noStroke();
  smooth();
  ellipse(5,5,10,10);
  
  fill(0,0,0,random(128));
  noStroke();
  smooth();
  ellipse(10,10,5,5);
  
  fill(45,152,144,random(255));
  noStroke();
  smooth();
  ellipse(20,20,10,10);
  
}

