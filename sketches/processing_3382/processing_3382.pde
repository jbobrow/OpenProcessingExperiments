
PImage ritoque2; 
 
void setup(){ 
  ritoque2 = loadImage("ritoque2.JPG"); 
  size(ritoque2.width, ritoque2.height); 
  noStroke(); 
  noLoop();  
  colorMode(HSB, 255); 
  smooth(); 
  background(0); 
} 
 
void draw(){ 
  int sp = 7;  
  for(int y = 0; y < height; y += sp){ 
    for(int x = 0; x < width; x += sp){ 
      color c = ritoque2.get(x,y); 
      pincelada(x, y, c, sp); 
    } 
  } 
} 
 
void pincelada(float x, float y, color c, float amp){ 
  int pincel = round(random(5, 30)); 
  for(int i = 0; i <= pincel; i++){ 
    float h = hue(c) + random(-10, 10); 
    float s = saturation(c) + random(70); 
    float b = brightness(c) + random(-10, 40); 
    pushMatrix(); 
    translate(x,y); 
    fill(h,s,b,70); 
    float tam = random(3, amp*2); 
 
    rect(random(-amp, amp/2),random(-amp, amp), tam/2, tam/2); 
     
    popMatrix(); 
  } 
} 
 
void keyPressed(){ 
  redraw();  
} 
 
 


