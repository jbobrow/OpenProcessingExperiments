
PImage ritoque;

void setup(){
ritoque = loadImage("021.JPG"); 
  size(500,500); 
  noStroke(); 
  noLoop();  
  colorMode(HSB, 255); 
  smooth(); 
  background(255); 
} 
 
void draw(){ 
  int spacer = 6;  
  for(int y = 0; y < height; y += spacer){ 
    for(int x = 0; x < width; x += spacer){ 
      color c = ritoque.get(x,y); 
      pincel(x, y, c, spacer); 
    } 
  } 
} 
 
void pincel(float x, float y, color c, float amp){ 
  int puntos = round(random(5,56)); 
  for(int i = 5; i <= puntos; i++){ 
    float h = hue(c) + random(-10, 10); 
    float s = saturation(c) ; 
    float b = brightness(c) + random(10, 70); 
    pushMatrix(); 
    translate(x,y); 
    fill(h,s,b); 
    float tam = random(4, amp*2); 
    ellipse(random(-amp, amp),random(-amp, amp), tam, tam); 
    rect (random (10,45), random (10,40), tam, tam); 
    popMatrix(); 
  } 
} 
 
void keyPressed(){ 
  redraw();  
} 
 
 

