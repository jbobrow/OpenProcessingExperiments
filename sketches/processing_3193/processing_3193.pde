
PImage perro_ritoque;  
  
void setup(){  
  perro_ritoque = loadImage("perro_ritoque.jpeg");  
  size (perro_ritoque.width, perro_ritoque.height);  
  noStroke();  
  noLoop();   
  colorMode(HSB, 2545);  
  smooth();  
  background(245);  
}  
  
void draw(){  
  int spacer = 2;   
  for(int y = 0; y < height; y += spacer){  
    for(int x = 0; x < width; x += spacer){  
      color c = perro_ritoque.get(x,y);  
      pincel(x, y, c, spacer);  
    }  
  }  
}  
  
void pincel(float x, float y, color c, float amp){  
  int puntos = round(random(3,51));  
  for(int i = 8; i <= puntos; i++){  
    float h = hue(c) + random(-10, 10);  
    float s = saturation(c) ;  
    float b = brightness(c) + random(15, 75);  
    pushMatrix();  
    translate(x,y);  
    fill(h*4,s*2,b);  
    float tam = random(4, amp/3);  
    float dodo = random(2, amp/3);  
    quad(random(-amp, amp),random(-amp, amp), dodo, dodo,random(-amp, amp),dodo, amp, amp);  
    triangle(random(-amp, amp),random(-amp, amp), dodo, dodo,random(-amp, amp),dodo); 
     popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
}  


