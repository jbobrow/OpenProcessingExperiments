
 
   
//Feilds
int patternSeperationX = 20;  
int patternSeperationY = 20;  
   
//Setup
void setup(){  
  
  size(500,500);       
  background(255);
  
  fill(0, 100);
  stroke(0); 
  smooth();
     
//Loop
  for(int i = 0; i < width/patternSeperationX; i++){  
      for(int j = 0; j < height/patternSeperationY; j++){  
        pushMatrix();  
        translate(i*patternSeperationX, j*patternSeperationY);  
        yourFunction();  
        popMatrix();  
      }  
  }      
}     
   
void draw(){}  
   
void yourFunction(){   
  
  float r = random(-5, 5);
  float s = random(-5, 5);
  float t = random(2, 10);
  float u = random(2);
  
  strokeWeight(u);
  ellipse(15+r,15+s,3*t,3*t); 
}  
 

