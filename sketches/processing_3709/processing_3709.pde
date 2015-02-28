
PImage ritoque; 
 
void setup(){ 
  ritoque = loadImage("ritoqueprocessing chica.jpg"); 
  size(ritoque.width, ritoque.height); 
  noStroke(); 
  noLoop();  
  colorMode(HSB); 
  smooth(); 
  background(255); 
} 
 
void draw(){ 
  int spacer = 5;  
  for(int y = 0; y < height; y += spacer){ 
    for(int x = 0; x < width; x += spacer){ 
      color c = ritoque.get(x,y);
      pincelada(x, y, c ,spacer); 
    } 
  } 
} 
 
void pincelada(float x, float y, color c, float amp){ 
int puntos = 15; 
  for(int i = 0; i <= puntos; i++){ 
     
    float h = hue(c) ; 
    float s = saturation(c)  ; 
    float b = brightness(c) ; 
    float d= alpha (c);
    pushMatrix(); 
    translate(x,y); 
    float tam = amp/0.2; 
    fill(h,s+20,b, floor(120)); 
    scale (random (0.4,2)); 
    triangle(random(amp, amp),random(-amp, amp), tam, tam,0,0);  
    popMatrix(); 
 
   
} 
} 
 
void keyPressed(){ 
  redraw();  
} 
 
 
 

 
 
 
 
 


