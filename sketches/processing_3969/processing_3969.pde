
PImage ritoque; 
 
void setup(){ 
  ritoque = loadImage("ritoque.jpg"); 
  size(400, 300); 
  noStroke(); 
  noLoop();  
  colorMode(HSB, 225); 
  
  background(#FFFFFF); 
} 
 
void draw(){ 
  int spacer = 10;  
  for(int y = 2; y < height; y += spacer){ 
    for(int x = 1; x < width; x += spacer){ 
      color c = ritoque.get(x,y); 
      pincelada(x, y, c, spacer); 
    } 
  } 
} 
 
void pincelada(float x, float y, color c, float k){ 
  int puntos = round(random(30,40)); 
  for(int i = 0; i <= puntos; i++){ 
    float h = hue(c);
    float s = saturation(c) + random(100); 
    float b = brightness(c)+70; 
     
     
    pushMatrix(); 
    translate(x,y); 
   rotate(k*s);
    fill(h,s,b,100); 
    float tam = random(3, k/2); 
    ellipse(random(k, k),random(-k, k), tam, tam*5); 
    popMatrix(); 
  } 
} 
 
void keyPressed(){ 
  redraw();  
} 
 

