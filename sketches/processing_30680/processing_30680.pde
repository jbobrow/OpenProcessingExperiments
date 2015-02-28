
size ( 700, 700);
  smooth(); 
  background(random(180,255),200,0);
  
  
    //  layer of multiple objects "black ones"
  for ( int i = 0; i < 50; i = i +1)
  {
    float yellowSize = random (20,250); // random number 
    noStroke(); 
    fill (random(90), random (255), 0);
    ellipse ( random(width), random(350,600), yellowSize, yellowSize); 
  }  
   
  for ( int i = 10; i < 10000; i = i +1)
  {  
    float redSize = random (60); // random number 
    noStroke(); 
    fill (random(255), 0, 0);
    ellipse ( random(width), random(height),redSize,redSize);
  }
  
 
  
  //  layer of multiple objects "black ones"
  for ( int i = 0; i < 50; i = i +1)
  {
    float backSize = random (80,70); // random number 
    noStroke(); 
    fill (0);
    ellipse ( random(width), random(40,600), backSize, backSize); 
  }  

