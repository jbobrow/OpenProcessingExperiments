
PImage casota;    
 
void setup (){    
  casota=loadImage ("casota.JPG");   
  size(700, 525); 
  colorMode(HSB);    
  background (255);   
  noStroke(); 
  noLoop();    
  smooth();    
}    
 
void draw(){    
 
  int spacer=4;  
  for (int y=0; y<height; y+=spacer){    
    for (int x=0; x<width; x+=spacer){    
      color c = casota.get(x,y);    
      pincelote(x,y,c,spacer); 
 
    }    
  }    
}    
 
void pincelote(float x, float y, color c, float f){   
 
  float puntos = random(3,20);    
  for(int e = 3; e < puntos; e++){   
 
 
    float h = hue(c) +50;
    float s = saturation(c) *3;    
    float b = brightness(c) + 20 ;    
 
    pushMatrix();    
    translate(x,y);    
    fill(h,s,b,30);  
    float d = random(f, 1);    
    ellipse(random(f, -f),random(-f, f), d*4, d*4);    
    popMatrix();    
 
  }    
 
} 

