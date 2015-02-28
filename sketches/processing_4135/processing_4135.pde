
PImage ritoque;  
  
void setup(){  
  ritoque = loadImage("torres.jpg");  
  size(ritoque.width, ritoque.height);  
  noStroke();  
  noLoop();   
  colorMode(HSB, 255);  
  smooth();  
  background(255);  
}  
  
void draw(){  
  int spacer = 5;   
  for(int y = 0; y < height; y += spacer){  
    for(int x = 0; x < width; x += spacer){  
      color c = ritoque.get(x,y);  
      pincel(x, y, c, spacer);  
    }  
  }  
}  
  
void pincel(float x, float y, color c, float amp){  
  int puntos = 20;  
  for(int i = 4; i <= puntos; i++){  
    float h = hue(c) + 300;  
    float s = saturation(c) ;  
    float b = brightness(c) + random(10, 70);  
    pushMatrix();  
    translate(x,y);  
    rotate   (0.1);
    float tam = random(2,4); 
    strokeWeight (1.9); 
    stroke(h,s,b);  
    line(3,3, 8, 8);  
    popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
}  
  
  
 


