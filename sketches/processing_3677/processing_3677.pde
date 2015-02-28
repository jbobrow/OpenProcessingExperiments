

void setup(){  
  size(500,500); 
   stroke(230,245,133,4); 
 strokeWeight(2);

 
for (int i = 9; i  < 50; i++) {  
  for (int j = 9; j < 50; j++) { 
    stroke(i, j, 20); 
    point(i, j); 
  } 
}   
  background(random(0,90),random(0,90),random(0,90));  
 stroke(0);  
  smooth();  
    background(255);
  
}  
void draw (){  

  
float x= random(height);  
float y= random(width); 
 
 
fill(random(0,100),random(0,100),random(0,100),90);  
smooth();  
  
  ellipse(x, y,mouseX,mouseY-second());   

}  
 	 
 


