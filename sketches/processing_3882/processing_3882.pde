
PImage imagen;  
  
void setup(){  
  imagen = loadImage("alcoba.jpg");  
  size(imagen.width,imagen.height);  
  noStroke();  
  colorMode(HSB, 255);  
   background(255);  
}  
  
void draw(){  
  int spacer = 5;   
  for(int y = 0; y < height; y += spacer){  
    for(int x = 0; x < width; x += spacer){  
      color c = imagen.get(x,y);  
      pincel(x, y, c, spacer);  
    }  
  }  
}  
  
void pincel(float x, float y, color c, float amp){  
  int puntos = round(noise(10,30));  
  for(int i = 0; i <= puntos; i++){  
    float h = hue(c)+150; 
    float s = saturation(c);  
    float b = brightness(c);  
      
      
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b, 4);  
  float tam = random(1, 10);  
   rect(random(amp, amp*2),random(-amp, amp*2), tam, tam*4);  
    popMatrix();  
  }  
}  
  
void mousePressed(){  
  redraw();   
}  
  
  
  


