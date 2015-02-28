
PImage ritoque2;  
  
void setup(){  
  ritoque2 = loadImage("ritoque2.jpg");  
  size(ritoque2.width, ritoque2.height);  
  noStroke();  
  noLoop();   
  colorMode(HSB, 200);  
  smooth();  
  background(5);  
}    
  
void draw(){  
  float spacer = 4;   
  for(int y = 5; y < height; y += spacer){  
    for(int x = 5; x < width; x += spacer){  
      color c = ritoque2.get(x,y);  
      pincelada(x, y, c, spacer);  
    }  
  }  
}  
  
void pincelada(float x, float y, color c, float p){  
  int pincel = round(random(120, 50));  
  for(int i = 70; i <= pincel; i++){  
    float h = hue(c); 
    float s = saturation(c) + random(90);  
    float b = brightness(c) + random(-10, 100);  
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b,50);  
    float tam = random(p*10);  
  
    ellipse(random(-p, p),random(-p, p),random(40),random(tam));  
      
    popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
}  

