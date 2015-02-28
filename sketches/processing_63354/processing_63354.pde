

  size(400,400);
  smooth();

  background(255);
  
   for(float xPos = 50; xPos <= width-50; xPos = xPos + random(15,33)){
     for(float yPos = 50; yPos <= height-50; yPos = yPos + random(15,33)){
     ellipse(xPos, yPos, 10, 10);
     }
   }

