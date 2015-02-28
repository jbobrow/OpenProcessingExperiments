
PImage zi; 
 
void setup (){ 
  size (604,367); 
  zi=loadImage ("ritoque.jpg"); 
  noStroke(); 
  noLoop(); 
  colorMode(HSB, 255); 
  smooth(); 
  background (zi); 
} 
 
void draw(){ 
  int e=5; 
  for (int y=0; y<768; y+=e){ 
    for (int x=0; x<1024; x+=e){ 
      color c = zi.get(x,y); 
 pincel(x, y, c, e); 
    } 
  } 
} 
 
void pincel(float x, float y, color c, float w){ 
  int puntos=round (random(3,6)); 
  w = noise(random(20,35));
  for(int l=0; l<= puntos; l++){ 
    float h = hue(c) + random(10,10);
    float s = saturation(c) + random(50); 
    float b = brightness(c) + random(-1, 30); 
    pushMatrix(); 
    translate(x,y);
    rotate(random(millis()));
    fill(h,s,b); 
    float k = random(2, 5); 
    rect(random(w, w),random(w, w), k, k); 
    popMatrix(); 
  } 
} 
 
void keyPressed(){ 
  redraw();  
} 
 
 


