
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  int offset = 20; 
  int bodyLength = 100; 
  counter++;
  //noStroke();
  fill(random(255),100,255,50);
  float firstX = width/6;
  float firstY = height/2;
  float secondX = firstX+offset;
  float secondY = firstY+offset; 
  float thirdX = firstX+offset; 
  float thirdY = firstY-offset;
  triangle(secondX, secondY, firstX, firstY, thirdX, thirdY);
  
  ellipse(thirdX+bodyLength/2, firstY, bodyLength,secondY-thirdY);
  float endX = thirdX+bodyLength; 
  float endY = firstY; 
  
  rect(endX, endY, 60,2);
  line (endX, endY, endX + 60, endY + 20); 
  line (endX, endY, endX +60, endY - 20);  
  strokeWeight(3); 
  //bezier(thirdX+bodyLength, firstY, x-10.00, mouseY-10.00, mouseX-5.00, mouseY-5.00, (float)mouseX, (float)mouseY); 
   
}
         
                                                                                
