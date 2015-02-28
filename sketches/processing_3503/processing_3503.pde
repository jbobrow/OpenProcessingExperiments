
PImage haciatorre; 
 
void setup(){ 
  haciatorre = loadImage ("haciatorre.JPG"); 
  size(640,480); 
  noLoop(); 
  smooth(); 
  noStroke();  
  colorMode(HSB); 
} 
 
void draw(){ 
  float sp = 4; 
    for(int y = 10; y < height; y += sp){ 
    for(int x = 10; x < width; x += sp){ 
      color c = haciatorre.get(x,y);  
      pincel(x, y, c, sp); 
     
} 
  } 
} 
 
void pincel(float x, float y, color c, float pam){ 
  int puntos = round(random(8)); 
  for(int i  = 0; i <= puntos; i++){ 
    float h = hue(c);  
    float s = saturation(c) + random(10); 
    float b = brightness(c) + random(-10,10); 
    pushMatrix(); 
    translate(x, y); 
    rotate(pam*b); 
    fill(h,s,b); 
    float tam = random(pam/2); 
    ellipse(random(-pam, pam), random(-pam, pam), random(60), random(tam)); 
    popMatrix();        
 
  } 
} 
 

