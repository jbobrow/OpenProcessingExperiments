
float margen, top;  
  
void setup(){  
  margen = 50;  
  top = 25;  
  size(500, 500);  
  smooth();  
  stroke(15);  
}  
  
  
void draw(){  
  background(255);  
  for(float y =margen; y <= height-margen; y += top){  
    for(float x = margen; x <= width-margen; x += top){  
      float d;   
      d = 50 - sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));  
      

noStroke(); 
      fill(x,y, 255, 150); 
       float value = d; 
      map(d,5,850,90,width);  
      ellipse(x,y,d,d); 
      fill(70,100,d); 
      stroke(10,30,140,d); 
      fill(70,150,253,d);  
      strokeWeight(2); 

      strokeWeight(2); 
      stroke(5); 
      fill(230,10,50,d);

   

 
    } 
  } 
} 
void mousePressed(){  
  println("vertex("+mouseX+", "+mouseY+");");  
}  


       
       



