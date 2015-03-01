
float rectSize = 50;  
float rx, ry; 
float x, y;  
float angle;  
float distance; 
float rotAngle = PI/6; 
float counter = 0; 
int num; 

void setup() {
  size(500, 500); 
  background(255); 
  frameRate(20); 
  
  noFill(); 
  strokeWeight(2);     
}

void draw() {
  //background(255);
  fill(255, 65);  
  rect(0, 0, width, height); 
  noFill(); 

  if(mousePressed){
    rotAngle = map(mouseX, 0, width, PI/12, PI/3); 
  }

  distance = sin(rotAngle) * rectSize - (rectSize - rectSize * cos(rotAngle));

  num = ceil( width / ( 2 * rectSize + 2 * distance ) );
  
  counter += 0.1; 

  float d; 

  rx = distance; 
  ry = distance; 

  for (int j = 0; j < num; j++) {
    rx = distance; 
    for (int i = 0; i < num; i++) {                   
       
      pushMatrix();
      angle = abs(sin(counter)) * -rotAngle;       
      d = rectSize - cos(angle) * rectSize; 
      x = rx + d; 
      y = ry + rectSize; 
      translate(x, y);
      rotate(angle); 
      rect(0, -rectSize, rectSize, rectSize);  
      popMatrix();   

      pushMatrix();
      angle = abs(sin(counter)) * rotAngle;
      d = cos(angle) * rectSize; 
      x = rx + rectSize + d; 
      y = ry + rectSize; 
      translate(x, y);
      rotate(angle); 
      rect(-rectSize, -rectSize, rectSize, rectSize);  
      popMatrix();

      pushMatrix();
      angle = abs(sin(counter)) * rotAngle;
      d = rectSize - cos(angle) * rectSize; 
      x = rx + d; 
      y = ry+rectSize; 
      translate(x, y); 
      rotate(angle); 
      rect(0, 0, rectSize, rectSize); 
      popMatrix(); 

      pushMatrix(); 
      angle = abs(sin(counter)) * -rotAngle;
      d = cos(angle) * rectSize; 
      x = rx + rectSize + d; 
      y = ry+rectSize; 
      translate(x, y); 
      rotate(angle); 
      rect(-rectSize, 0, rectSize, rectSize);  
      popMatrix();

      rx += 2 * rectSize + 2 * distance;
    }
    
    ry += 2 * rectSize + 2 * distance;
  }
}




