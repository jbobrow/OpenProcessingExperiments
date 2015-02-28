
PImage ritoque;  
  
void setup (){  
  ritoque=loadImage ("ritoque.JPG"); 
  size(ritoque.width, ritoque.height);  
  noStroke();  
  ellipseMode(CORNER);
  noLoop(); 
  colorMode(HSB, 255);  
  background (255);  
  smooth();  
}  
  
  
void draw(){  
  int a=5;  
  for (int y=0; y<height; y+=a){  
    for (int x=0; x<width; x+=a){  
      color c = ritoque.get(x,y);  
      pincel(x,y,c,a);  
    }  
  }  
}  
  
void pincel(int x, int y, int c, int p){  
  int pincelada=round (random(5));  
  for(int e = 0; e <= pincelada; e++){  
    float h = hue(c) + random(-20, 30);  
    float s = saturation(c) + random(50);  
    float b = brightness(c) + random(-10);  
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b);  
    float d = random(30, p); 
    ellipse(random(-p, p/4),random(-p, p), d/4, d/4);  
    popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
}  


