
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
  int a=5;  
  for (int y=0; y<height; y+=a){  
    for (int x=0; x<width; x+=a){  
      color c = ritoque.get(x,y);  
      pincelTotal(x,y,c,a);  
    }  
  }  
}  
  
void pincelTotal(int x, int y, int c, int p){  
  int pincel=round (random(5,7));  
  for(int e = 0; e <= pincel; e++){  
    float h = hue(c) + random(-50, 10);  
    float s = saturation(c) + random(10);  
    float b = brightness(c) + random(-10, 60);  
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b);  
    float d = random(40, p);  
    ellipse(random(-p, p),random(-p, p), d*3, d/3); 
    triangle(random(-p,p),random(-p, p), d, d,random(-p,p),d); 
    popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
}  


