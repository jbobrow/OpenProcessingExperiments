
  size(600, 600);
  background(255);
  smooth();
 
  PImage b;
  b = loadImage("texture.jpg");
  image(b, 0, 0);
 
 //LIGHT BLUE GRADIENT
  for (int i =600; i>width/2; i--)
    {
      int alp= 300-(width-i);
      stroke( 218, 244, 251, alp );
      line(i, 0, width, width-i);
      
      stroke( 218, 244, 251, alp );
      line(0, i, width-i, width);
      
      stroke( 218, 244, 251, alp );
      line(0, width-i, width-i, 0);
      
      stroke( 218, 244, 251, alp );
      line(i, 600, 600, i);
    }
    
   //YELLOW PATCH
   stroke(244, 188, 13, 180);
   strokeWeight(1);
   fill(244, 188, 13, 180);
   beginShape();
   vertex(0, 0);
   vertex(15, 0); 
   vertex(600, 480);
   vertex(600, 600);
   vertex(460, 600);
   vertex(0, 15);
   endShape(CLOSE); 
    
   //BLACK ARC 
   pushMatrix(); 
   translate (-60, -60);
   noFill();
   stroke(0);
   strokeWeight(70);
   ellipse(180, 180, 860, 860);
   popMatrix(); 
   
   //RANDOM CIRCLES
   for(int i=0; i<12; i++)
   {
     float rad= random(0,200);
     stroke(random(0, 100), random(100, 200));
     strokeWeight(random(0,10));
     fill(random(50, 255), random(50, 255), random(20, 255), random(100, 255));
     ellipse(random(0, 300), random(0, 400), rad, rad );
     
   }
   
   //RANDOM LINES
   for(int i=0; i<7; i++)
   {
    stroke(0, random(100, 200)) ; 
    strokeWeight(random(0,5));
    line(random(300, 700),random(400, 800), random( 580, 700), random(0, 700));
    
   }
   

