

  int space = 35;

  size(400,400);
  smooth();
  noStroke();

  background(255);
  
   for(float xPos = 60; xPos <= width-50; xPos = xPos + space){
     for(float yPos = 60; yPos <= height-50; yPos = yPos + space){
       if(random(100) > 30){
         fill(random(50,250), 100, 100, 100);
         rectMode(CENTER);
         rect(xPos, yPos, random(20,50), random(50,20));
       }else{
         //fill(100, 100, random(50,250), 100);
         rectMode(CENTER);
         rect(xPos, yPos, random(20,10), random(10,20));
       }
     }
   }

