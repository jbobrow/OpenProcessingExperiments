
size ( 400, 500);
  smooth();
  background(random(180,255),200,0);
 
 
    //  layer of multiple objects "black ones"
  for ( int i = 0; i < 50; i = i +1)
  {
    float yellowSize = random (100,250); // random number
    noStroke();
    fill (random(255), random (255), 0);
    ellipse ( random(width), random(350,600), yellowSize, yellowSize);
  } 
  
  for ( int i = 0; i < 10000; i = i +1)
  { 
    float redSize = random (10); // random number
    noStroke();
    fill (random(255), 0, 0);
    ellipse ( random(width), random(height),redSize,redSize);
  }
 
 
 
  //  layer of multiple objects "black ones"
  for ( int i = 0; i < 50; i = i +1)
  {
    float backSize = random (80,150); // random number
    noStroke();
    fill (0);
    ellipse ( random(width), random(400,600), backSize, backSize);
  } 
 

  //saveFrame ( "3layersCircleComposition0005.jpg"); 
 

