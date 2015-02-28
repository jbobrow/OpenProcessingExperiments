
void setup(){   
  size(500,500);   
   colorMode(RGB);    
     background(6); 
  smooth();   
  
}   
void draw (){   
   circulo();
  int m= millis()*50;  
   fill(m% 255);  // rama de los blancos
 
float y= random(width^10); // variación de tamaños
 float x= random(height^33); 
 strokeWeight(4);  
stroke(x/10,y/50,100,150);   
  rect(x,y, second(), second());   
     
 stroke(0);  
  strokeWeight(2);  
}   
  void circulo(){
  beginShape();
    ellipse(250,250,random(600),random(600));
    endShape();
}


