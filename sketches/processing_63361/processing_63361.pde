
  float space = 33;

  size(400,400);
  smooth();

  background(255);
  
   for(float xPos = 50; xPos <= width-50; xPos = xPos + space){
     for(float yPos = 50; yPos <= height-50; yPos = yPos + space){
       if(random(100) > 30){
         ellipse(xPos - 10, yPos, 10, 10);
       }else{
         ellipse(xPos, yPos - 10, 10, 10);
       }
     }
   }

