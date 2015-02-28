
PImage ritoque; 
 
void setup(){ 
  ritoque = loadImage("ritoque_futbol.jpg"); 
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
      pincel(x, y, c, spacer); 
    } 
  } 
} 
 
void pincel(float x, float y, color c, float amp){ 
  int puntos = 4; 
  for(int i = 3; i <= puntos; i++){ 
    float h = hue(c) + random(-10, 10); 
    float s = saturation(c) ; 
    float b = brightness(c) + random(10, 70); 
    pushMatrix(); 
    translate(x,y); 
  
    float tam = random(2,4);
    strokeWeight (0.7);
    stroke(h,s,b); 
    line(-2,1, 2, 4); 
    popMatrix(); 
  } 
} 
 
void keyPressed(){ 
  redraw();  
} 
 
 


