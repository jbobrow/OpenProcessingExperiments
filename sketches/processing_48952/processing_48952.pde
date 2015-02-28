

void setup() { 
  size(400,400); 
  smooth(); 
  
  
}

void draw() { 
  
  background(0,0,100); 
  
  drawCircle(300, 200, getRandomNumber(), color(255)); 
  drawCircle(200, 200, getRandomNumber(), color(255, 150,0)); 
  drawCircle(100, 300, getRandomNumber(), color(150, 0,150)); 
  drawCircle(150, 200, getRandomNumber(), color(50, 120, 160)); 
  drawCircle(100, 200, getRandomNumber(), color(255,255,0)); 
  
}


// returnType functionName (type name, type name)

float sum(float a, float b, float c) { 
  float total = a+b+c;
 
  return total;   
  
}


int getRandomNumber() {
  
  float randomNum = random(50,100); 
  return (int) randomNum; 
  
}


void drawCircle(int x, int y, int circleSize, color c) { 

  fill(c); 
  ellipse(x, y, circleSize, circleSize); 
  
}
