
PImage ritoque;  
  
void setup(){  
  ritoque = loadImage("ritoque.jpg");  
  size(500,350);  
  noStroke();  
  noLoop();   
  colorMode(HSB, 255);  
  smooth();  
  background(255);  
}  
  
void draw(){  
  int spacer = 40;   
  for(int y = 0; y < height; y += spacer){  
    for(int x = 0; x < width; x += spacer){  
      color c = ritoque.get(x,y);  
      pincelada(x, y, c, spacer);  
    }  
  }  
}  
  
void pincelada(float x, float y, color c, float t){  
  int puntos = round(random(300,300));  
  for(int i = 15; i <= puntos; i++){  
    float h = hue(c) + random(-20, 20);  
    float s = saturation(c) + random(40);  
    float b = brightness(c) + random(-50, 70);  
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b,90);  
    float tam = random(60, 30);  
    ellipse(random(-30, 30),random(-30, 30), tam, tam); 
       popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
} 

