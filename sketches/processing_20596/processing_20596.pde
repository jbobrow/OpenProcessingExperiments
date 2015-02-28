

  float secondsRadius;
  void setup()
  {
    size (300,300);
    smooth();
    int radius = min(width, height)/2;
    secondsRadius = radius * 0.75;
    
  }
  
  void draw() 
  {
    noFill ();
    noStroke();
 PImage sec;
   sec= loadImage ("Untitled-1.png");

   
    float s= map(second(), 0, 60, 0, TWO_PI)- HALF_PI;
    float m= map(minute(), 0, 60, 0, TWO_PI)- HALF_PI;
    float h= map(hour() + norm(minute(),0,60), 0, 12, 0, TWO_PI)- HALF_PI;

   PImage b;
     b= loadImage ("bg.png");
     image (b,0,0);

  
   tint (255,255,255, (h*10)+20);
 
      stroke(47,202,247);
    strokeWeight (25);
    point (cos(h) * 110+150, sin(h) * 110 + 150);
    

    stroke(247,129,10);
   strokeWeight (15); 
    point (cos(m) * 110+150, sin(m) * 110 + 150);

   
 // clock points
 stroke(255);
 strokeWeight(5);
  beginShape(POINT);
  for (int a = 0; a < 360; a+=30) {
    float x = width/2 + cos(radians(a)) * secondsRadius;
    float y = height/2 + sin(radians(a)) * secondsRadius;
    vertex(x, y);
  }
  endShape();

     // sec round

translate (width/2, height/2);
   rotate (s);
   s += PI/12;
   image (sec,-sec.width/2,-sec.height/2);
  }
 
 
  
  
   
 
  

