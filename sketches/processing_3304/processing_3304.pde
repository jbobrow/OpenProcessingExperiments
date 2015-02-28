
int r;
 float n,u,esp;
PImage pic;
   
void setup (){   
  r=4;
  n=0;
  u=0;
  esp=15;
  size (682,511);  
  pic=loadImage ("P7220050 copia.jpg");
  colorMode(HSB); 
  background (255);  
  noStroke();
  noLoop();   
  smooth();
}   
   
   
void draw(){   
  background(255);
   
  for (int y=1; y<height-esp; y+=r){   
    for (int x=1; x<width-esp; x+=r){   
      color c = pic.get(x,y);   
      forma(x,y,c,r);   
    }   
  }   
}   
   
void forma(int x, int y, int c, int p){
  n+=0.039;
  u+=0.1;
  float N = noise(n); 
  int pincel=round (random(2*N,5));   
  for(int e = 0; e <= pincel; e++){
    float h = hue(c) + random(3, 32);   
    float s = saturation(c) + random(4,47); 
    float b = brightness(c) + random(4,10);
    pushMatrix();   
    translate(x,y);   
    fill(h,s,b,150); // relleno de color,tomando los varoles(H,S,B)  
      
    ellipseMode(CORNER);
    ellipse(random(12),random(12), 2*(N*4), 2*(N*4));   
    popMatrix();   
  }   
}   
   
void mousePressed(){ 
  redraw();
}   
 
 

