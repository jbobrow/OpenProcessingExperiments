
int r; 
 float n,u,esp; 
PImage ciudadabierta; 
    
void setup (){    
  r=4;
  
  esp=30; 
  ciudadabierta=loadImage ("ciudadabierta.jpg"); 
  size (ciudadabierta.width, ciudadabierta.height);   
  colorMode(HSB);  
  background (255);   
  noStroke(); 
  noLoop();    
  smooth(); 
}    
    
    
void draw(){    
  background(255); 
    
  for (int y=1; y<height-esp; y+=r){    
    for (int x=1; x<width-esp; x+=r){    
      color c = ciudadabierta.get(x,y);    
      forma(x,y,c,r);    
    }    
  }    
}    
    
void forma(int x, int y, int c, int p){ 
 
 
  int pincel=round (random(10));    
  for(int e = 0; e < pincel; e++){ 
     float h = hue(c) + random(10, 32);   
    float s = saturation(c) + random(47,4);  
    float b = brightness(c) + random(11,5); 
    pushMatrix();    
    translate(x,y);    
    fill(h,s,b,150); // relleno de color,tomando los varoles(H,S,B)   
       
    ellipseMode(CORNER); 
    ellipse(random(20),random(12), 2*(5), 2*(15));    
    popMatrix();   
  }    
}    
    
void mousePressed(){  
   
}    
  


