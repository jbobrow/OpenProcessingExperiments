
float angel = 0; 
float s = 2; 
float scaleSpeed = 0.01; 
float t = 0; 
float hue = 0.10; 
float offset = 10; 

void setup() 
{
  size(500, 500);
 background(#6C1313); 
} 

void draw() 

{ 
  t += 0.0167; 
  frameRate(100); 
  colorMode(HSB, 360, 100, 100); 
  angel += 0.1; 
  s += scaleSpeed; 
  if (s > 3 || s < 0) 
  
  { 
    scaleSpeed = -scaleSpeed; 
  } 
    

  float degrees = radians(45); 
  rectMode(CENTER); 

     
   hue += offset; 
  if (hue >= 360) 

  { 
     offset = -offset; 
     hue = 360; 
  } 

  else if (hue < 0) 
  { 

    offset = -offset; 

    hue = 0;  

  } 

  fill(hue, 100, 100); 

  if (t > 25 && t < 50) 

  { 
    fill (hue, 100, 100); 

    pushMatrix(); 

    translate(width/2, height/2); 

    rotate(angel); 

    scale(s); 

    triangle(0, 0, 100, 100); 

    popMatrix(); 

  } 


   if (t > 0 && t < 25) 

   { 

     angel -= 0.4; 

    fill (hue, 100, 100); 

    pushMatrix(); 

    translate(width/3, height/3); 

    rotate(angel); 

    scale(s); 

    triangle(0, 0, 100, 100); 

    popMatrix(); 

   } 

     if (t > 50 && t >=18) 

  { 

    angel += 3; 

    fill (hue, 100, 100); 

    pushMatrix(); 

    translate(width/4, height/4); 

    rotate(angel); 

    scale(s); 

    triangle(0, 0, 100, 100); 

    popMatrix(); 

  } 


  
} 
 

