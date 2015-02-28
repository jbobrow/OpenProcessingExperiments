
void setup(){   
  size(500,500);   
   colorMode(RGB, 250,10,567,500);    
     background(50, 0, 355); 
  smooth();   
  
}   
void draw (){   
   
   int m= millis()*666;  
   fill (random(200, 255), random(125,255), random(350));   
 

float y= random(width^22); 
 float x= random  (height^22); 
 strokeWeight(4);  
stroke(x/100,y/100,100,150);   
  ellipse(x,y, second(), second());   
    
 stroke(0);  
  strokeWeight(2);  
  
  if(mousePressed) {
  
    stroke(500);

  }
  triangle(mouseX+30, mouseY+75, mouseX+58, mouseY+20, mouseX+86, mouseY+75);
   
}   
  


