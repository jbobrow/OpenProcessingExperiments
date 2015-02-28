
PImage ciudadAbierta; 
 
void setup (){ 
  size (640,480); 
  ciudadAbierta=loadImage ("ciudadabierta.JPG");
  colorMode(HSB, 255); 
  background (ciudadAbierta);
  noStroke(); 
  noLoop(); 
  smooth(); 
} 
 
 
void draw(){ 
  int a=2; 
  for (int y=0; y<height; y+=a){ 
    for (int x=0; x<width; x+=a){ 
      color c = ciudadAbierta.get(x,y); 
      pincelTotal(x,y,c,a); 
    } 
  } 
} 
 
void pincelTotal(int x, int y, int c, int p){ 
  int pincel=round (random(7,11)); 
  for(int e = 0; e <= pincel; e++){ 
    float h = hue(c) + random(-20, 20); 
    float s = saturation(c) + random(50); 
    float b = brightness(c) + random(-10, 25); 
    pushMatrix(); 
    translate(x,y); 
    fill(h,s,b); 
    float d = random(1, p); 
    ellipse(random(-p, p),random(-p, p), d*2, d*2); 
    popMatrix(); 
  } 
} 
 
void keyPressed(){ 
  redraw();  
} 

