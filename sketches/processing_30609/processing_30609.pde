
size ( 500, 500);
  smooth(); 
  background(238,193,164);
  
    //  Layer de objectos multiplos (pintas vermelhas grandes)
 
  for ( int i = 0; i < 20; i = i +1)
  {
        float spot2Size2 = random (80,100);
    noStroke(); 
    fill (random(200,255), 0, 0,random(200,255));
    ellipse ( random(width), random(height), spot2Size2, spot2Size2); 
  }  
  
    //  Layer de objectos multiplos (pintas vermelhas pequenas)
  
  for ( int i = 0; i < 1000; i = i +1)
  {
        float spot2Size2 = random (40);
    noStroke(); 
    fill (random(200,255), 0, 0,random(125));
    ellipse ( random(width), random(height), spot2Size2, spot2Size2); 
  }  
   // Layer de objectos multiplos (pintas pretas pequenas)
 
  for ( int i = 0; i < 500; i = i +1)
  {  
    float spotSize = random (13);  
    fill (0,random(255));
    ellipse ( random(width), random(height),spotSize,spotSize);
  }
  
 // Joaninha estatica

fill(0);
ellipse (250,145,75,75);
arc (340, 150, 150, 150, radians(90), radians (135));
arc (160, 150, 150, 150, radians(45), radians (90));
arc (400, 215, 200, 200, radians(130), radians (175));
arc (100, 215, 200, 200, radians(5), radians (50));
triangle (120,360,260,150,240,300);
triangle (380,360,240,150,260,300);

  fill(245,0,0,238);
  ellipse(width/2,height/2,200,200);
 
  fill(0,random(100,255));
  ellipse (205,200,50,50);
  fill(0,random(100,255));
  ellipse (295,200,50,50);
  
  fill(0,random(100,255));
  ellipse (185,250,40,40);
  fill(0,random(100,255));
  ellipse (315,250,40,40);
  
  fill(0,random(100,255));
  ellipse (205,300,50,50);
  fill(0,random(100,255));
  ellipse (295,300,50,50);

fill(255,100);
arc (250, 200, 40, 300, radians(45), radians (135));
arc (250, 200, 20, 275, radians(45), radians (135));

ellipse(226,136,20,30);
ellipse(274,136,20,30);
ellipse(222,136,10,20);
ellipse(278,136,10,20);

  


