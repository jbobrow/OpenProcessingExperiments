
PImage ran;
   
void setup (){   
  size (768, 1024);
  ran = loadImage("road.JPG");
  colorMode(HSB, 255); 
  background (255);  
  noStroke();  
  noLoop();   
  smooth(); 
}   
   
   
void draw(){   
  int a=14;   
  for (int y=0; y<height; y+=a){   
    for (int x=0; x<width; x+=a){   
      color c = ran.get(x,y);   
      pincelTotal(x,y,c,a);   
    }   
  }   
}   
   
void pincelTotal(int x, int y, int c, int p){ 
  int pincel=round (random(6,4));   
  for(int e = 0; e <= pincel; e++){ 
    float h = hue(c) + random(-10, 20);   
    float s = saturation(c) + random(300);   
    float b = brightness(c) + random(-10,10);;   
    pushMatrix();   
    translate(x,y);   
    fill(h,s,b,150);  
    float d = random(1, p/2);   
    ellipse(random(-p, p),random(-p, p), d*4, d*3);   
    popMatrix();   
  }     
}   
void keyPressed(){  
  redraw();
}   



