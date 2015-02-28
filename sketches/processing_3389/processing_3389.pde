

PImage cementerio;
  
void setup (){  
  size (796,400);  
  cementerio=loadImage ("cementerio ritoke.jpg"); 
  colorMode(HSB, 255);
  background (cementerio); 
  noStroke();  
  noLoop();
  smooth();  
}  
  
  
void draw(){  
  int a=4;  
  for (int y=0; y<height; y+=a){  
    for (int x=0; x<width; x+=a){  
      color c = cementerio.get(x,y);  
      pincelFinal(x,y,c,a);  
    }  
  }  
}  
  
void pincelFinal(int x, int y, int c, int p){  
  int pincel=round (random(10,12));  
  for(int e = 0; e <= pincel; e++){  
    float h = hue(c) + random(-25, -35);  
    float s = saturation(c) + random(55);  
    float b = brightness(c) + random(15,15);  
    pushMatrix();  
    translate(x,y);  
    fill(h,s,b,155);  
    float d = random(1, p/2);  
    rect(random(-p, p),random(-p, p), d*4, d*4);  
    popMatrix();  
  }  
}  
  
void keyPressed(){  
  redraw();   
}  


