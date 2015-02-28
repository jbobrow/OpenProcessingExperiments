

int patternSeperationX = 75;
int patternSeperationY = 75;

void setup(){
  size(500,500);
  background(0);
  smooth();
  
  for(int i = 0; i < width/patternSeperationX; i++){
 for(int j = 0; j < height/patternSeperationY; j++){
   pushMatrix();
   translate(i*patternSeperationX, j*patternSeperationY);
   yourFunction();
   popMatrix();
  }
}
}

void yourFunction(){
 
  
  noStroke();
  scale(random(2));
  rotate(random(180));
  smooth();
  fill(68,93,102,random(250));
  ellipse(50,50,50,50);
  
  noStroke();
  scale(1,1,random(3));
  smooth();
  fill(143,152,176,random(250));
  ellipse(50,0,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(250));
  ellipse(50,100,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(250));
  ellipse(5,25,50,50);
  
  noStroke();
  scale(1,1,random(2));
  smooth();
  fill(115,113,128,random(250));
  ellipse(95,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(250));
  ellipse(5,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(250));
  ellipse(95,25,50,50);
}

