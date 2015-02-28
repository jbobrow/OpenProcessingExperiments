
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
  int spacer = 7;   
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
    fill(h,s,b);  
    float tam = random(4, amp/2);  
    ellipse(random(-amp, 2/amp),random(-amp, 2/amp), tam, tam);  
    rect (random (10,45)*45, random (10,40)*16, tam, tam);  
    popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
}  


