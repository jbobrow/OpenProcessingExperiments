
PImage ritoque2;  
  
void setup(){  
  ritoque2 = loadImage ("ritoque2.jpg");  
  size(450,300);  
  noLoop();  
  smooth();  
  noStroke();   
  colorMode(HSB); 
 background(225); 
} 

void draw(){  
  float sp = 2;  
    for(int y = 0; y < height; y += sp){  
    for(int x = 0; x < width; x += sp){  
      color c = ritoque2.get(x,y);   
      pincel(x, y, c, sp);  
      
}  
  }  
}  
  
void pincel(float x, float y, color c, float p){  
  int puntos = round(random(8));  
  for(int i  = 0; i <= puntos; i++){  
    float h = hue(c)+100;   
    float s = saturation(c) ;  
    float b = brightness(c)+20 ;  
    pushMatrix();  
    translate(x, y);  
    rotate(p);  
    fill(h,s,b);  
    float tam = random(p);  
    ellipse(random(-p, p), random(-p, p), random(20), random(tam));  
    popMatrix();         
  
  }  
}  
  

