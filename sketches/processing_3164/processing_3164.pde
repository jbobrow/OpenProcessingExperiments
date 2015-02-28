
PImage haciatorre; 
 
void setup(){ 
  haciatorre = loadImage("haciatorre.JPG"); 
  size(640, 480); 
  noStroke(); 
  noLoop();  
  colorMode(HSB); 
} 
void draw(){ 
  int spacer = 10;  
  for(int y = 0; y < height; y += spacer){ 
    for(int x = 0; x < width; x += spacer){ 
      color c = haciatorre.get(x,y); 
      pincelada(x, y, c, spacer); 
    } 
  } 
} 
void pincelada(float x, float y, color c, float pam){ 
  int puntos = round(random(3,30)); 
  for(int i = 2; i <= puntos; i++){ 
    float h = hue(c) + random(-5, 5);
    float s = saturation(c) + random(200); 
    float b = brightness(c) + random(-5, 5); 
    pushMatrix(); 
    translate(x,y); 
    rotate(pam*s); 
    fill(h,s*2,b); 
    float tam = random(2, pam/2); 
    ellipse(random(pam, pam*2),random(-pam, pam*2), tam, tam*4); 
    popMatrix(); 
  } 
} 
 
void keyPressed(){ 
  redraw();  
} 



