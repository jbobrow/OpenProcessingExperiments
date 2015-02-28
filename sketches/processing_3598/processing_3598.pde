
PImage ritoque;  
  
void setup(){  
  ritoque = loadImage("ritoque.jpg");  
  size(500,350);  
  noStroke();  
  noLoop();   
  colorMode(HSB, 270);  
  smooth();  
  background(255);  
}  
  
void draw(){  
  int spacer = 55;   
  for(int y = 0; y < height; y += spacer){  
    for(int x = 0; x < width; x += spacer){  
      color c = ritoque.get(x,y);  
      pincelada(x, y, c, spacer);  
    }  
  }  
}  
  
void pincelada(float x, float y, color c, float t){  
  int puntos = round(random(100,70));  
  for(int i = 65; i <= puntos; i++){  
    float h = hue(c) + random(-100, 10);  
    float s = saturation(c) + random(90);  
    float b = brightness(c) + random(-10, 70);  
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b,90);  
    float tam = random(t);  
    triangle(random(-t, t),random(-t, t), tam, tam,random(-t,t),tam);
       popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
} 

