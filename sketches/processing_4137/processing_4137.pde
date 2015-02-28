
PImage ritoque; 
 
void setup(){ 
  ritoque = loadImage("torres.jpg"); 
  size(ritoque.width, ritoque.height); 
  noStroke(); 
  noLoop();  
  colorMode(HSB, 255); 
  smooth(); 
  background(255); 
} 
 
void draw(){ 
 
  int spacer = 2;  
  for(int y = 0; y < height; y += spacer){ 
    for(int x = 0; x < width; x += spacer){ 
      color c = ritoque.get(x,y); 
      pincelada(x, y, c, spacer); 
    } 
  } 
} 
 
void pincelada(float x, float y, int c, int p){ 
   
   
  int puntos = round(random(5,9)); 
  for(int i = 0; i <= puntos; i++){ 
 
    float h = hue(c) + 30; 
    float s = saturation(c)+ 20; 
    float b = brightness(c)+ 10; 
    pushMatrix(); 
    translate(x,y); 
     
      fill( h,s,b,10); 
    
rotate(1.5); 
  
  float n = random(2,p*2); 
 
  rect(random(-p,p),random(-p,p),n,n*4); 
    
    
    popMatrix(); 
  } 
} 
 
void keyPressed(){ 
  redraw();  
} 


