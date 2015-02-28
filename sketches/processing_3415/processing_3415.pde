
 PImage ritoque; 
 
void setup(){ 
  ritoque = loadImage("ritoque.JPG"); 
  size(ritoque.width, ritoque.height); 
  noStroke(); 
  //noLoop();  
  colorMode(HSB, 255); 
  smooth(); 
  background(255); 
} 
void draw(){  
   int spacer=6;  
  for (int y=0; y<height; y+=spacer){    
    for (int x=0; x<width; x+=spacer){    
      color c = ritoque.get(x,y);    
      pincel(x,y,c,spacer); 
 
    }    
  }    
} 
 

void pincel(float x, float y, color c, float a){ 
  

 
  float puntos = random(15);  //  aleatorio entre 0-10
  for(int e = 0; e < puntos; e++){   

  float h = hue(c) + 30;  
    float s = saturation(c) + 20;    
    float b = brightness(c) + 50;    

   
    pushMatrix();  
    translate(x, y); //se traslada segun x e y  
    fill(h,s,b);  
    float d = random(a/1);  
  ellipse(random(-a, a), random(-a, a), random(30), random(70)); //el pincel es una elipse de forma variable  
    popMatrix();         
 
     
     
  
  }  
}  


