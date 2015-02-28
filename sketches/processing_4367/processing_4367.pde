
void setup() { 
  size(500, 300); 
  fill(255); 
  background(255);

color inside = color(255, 13, 45); 
color middle = color(160, 158, 158); 
color outside = color(153, 51, 0); 
color field= color (115,255,41); 
color walkway2= color (160,158,158);


fill(outside); 
rect(0, 0, 500, 300); 
fill(middle); 
rect(0, 100, 500, 20); 
fill(inside); 
rect(155, 140, 130, 80); 
fill (field); 
ellipse(37.5,205, 100, 100); 
fill (walkway2); 
rect (300,0,50,300); 
}

void draw (){ 
if(mousePressed) { 
  
    stroke(155); 
    
  } else { 
    stroke(0); 
  } 
  
  ellipse(mouseX-66, mouseY, 20,20); 
    if (mousePressed)    {  
  float redc = random(0, 100); 
      stroke(250);   
      fill(0);  
       
rect(155, 140, 130, 80); 
      }  
      fill(204, 34, 46);  }


