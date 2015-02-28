
int redcentrewidth = 400; 
int redcentreheight = 60; 
void setup () { 
size(800, 400);  
background(250,225,225);

color lawn = color(40, 93, 70);  
color walkway = color(1, 26, 46);  
color redcentre = color(216, 9, 16);  
color oval = color(40, 93, 70);  
color pathway = color(1, 26, 46);   
  
fill(redcentre);  
rect(200, 160, 200, 60);  
fill(walkway);  
rect(0, 120, 800, 40);  
fill(lawn);  
rect(160, 40, 200, 80);  
fill(oval);  
ellipse(65, 230, 90, 90); 
fill(pathway);  
rect(140, 160, 10, 140); 
 
} 
 
void draw() { 

  fill(204, 34, 20); 
  for (int y= 5; y<height; y += 30){   
    for (int x= 5; x<width; x += 30){   
        rect(160, 160, redcentrewidth, redcentreheight); 
       
      if (mousePressed) { 
        float redcentre = random(0, 100); 
        stroke(25); 
        fill(5); 
        rect(160, 160, redcentrewidth, redcentreheight);
      
      } 
      fill(204, 34, 20); 
    } 
  } 
  } 


