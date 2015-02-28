
size ( 800, 600);
background(255); 

smooth();

float circleSize;
circleSize=random (350);

for ( int i = 0; i < 50; i = i +1)
  {
    float yellowSize = random (20,20); 
    noStroke(); 
    fill (188, random (150,166), 85);
    ellipse ( random(width), random(350,600), yellowSize, yellowSize); 
  }  


for ( int i = 0; i < 10000; i = i +1)
  {
      float redSize = random (7); 
      noStroke(); 
      fill (random(150,90),73,9);
      ellipse ( random(width), random(height),redSize,redSize);
  
  }

for ( int i = 0; i < 800; i = i +1)
  {
    float backSize = random (8,10);  
    noStroke(); 
    fill (227,206,128);
    ellipse ( random(width), random(90,70), backSize, backSize); 
  }  
                
