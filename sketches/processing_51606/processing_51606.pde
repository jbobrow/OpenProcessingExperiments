
void setup() {
  size(400, 400);
  colorMode(HSB);
  loop();
  
}

float a = 0;
float e = 0;
float b = 0;
float c = 0;
float d = 0;
float f = 0;
float g = 0;
float h = 0;
float i = 0;
int col = 20;

void draw() {
  background(col,255,255);
  smooth();
fill(255);
    ellipse (25, a, 25, 25);
    ellipse (50, a, 25, 25);
    ellipse (75, a, 25, 25);
    ellipse (100, a, 25, 25);
    ellipse (125, a, 25, 25);
    ellipse (150, a, 25, 25);
    ellipse (175, a, 25, 25);
    ellipse (200, a, 25, 25);
    ellipse (225, a, 25, 25);
    ellipse (250, a, 25, 25);
    ellipse (275, a, 25, 25);
    ellipse (300, a, 25, 25);
    ellipse (325, a, 25, 25);
    ellipse (350, a, 25, 25);
    ellipse (375, a, 25, 25);
    
    fill(0);
  
    ellipse (50, b, 25, 25);
    ellipse (75, b, 25, 25);
    ellipse (100, b, 25, 25);
    ellipse (125, b, 25, 25);
    ellipse (150, b, 25, 25);
    ellipse (175, b, 25, 25);
    ellipse (200, b, 25, 25);
    ellipse (225, b, 25, 25);
    ellipse (250, b, 25, 25);
    ellipse (275, b, 25, 25);
    ellipse (300, b, 25, 25);
    ellipse (325, b, 25, 25);
    ellipse (350, b, 25, 25);
    
    fill(255);
    ellipse (50, c, 25, 25);
    ellipse (75, c, 25, 25);
    ellipse (100, c, 25, 25);
    ellipse (125, c, 25, 25);
    ellipse (150, c, 25, 25);
    ellipse (175, c, 25, 25);
    ellipse (200, c, 25, 25);
    ellipse (225, c, 25, 25);
    ellipse (250, c, 25, 25);
    ellipse (275, c, 25, 25);
    ellipse (300, c, 25, 25);
    ellipse (325, c, 25, 25);
    ellipse (350, c, 25, 25);
    
     fill(0);
    
    ellipse (75, d, 25, 25);
    ellipse (100, d, 25, 25);
    ellipse (125, d, 25, 25);
    ellipse (150, d, 25, 25);
    ellipse (175, d, 25, 25);
    ellipse (200, d, 25, 25);
    ellipse (225, d, 25, 25);
    ellipse (250, d, 25, 25);
    ellipse (275, d, 25, 25);
    ellipse (300, d, 25, 25);
    ellipse (325, d, 25, 25);
    
     fill(255);
    ellipse (100, f, 25, 25);
    ellipse (125, f, 25, 25);
    ellipse (150, f, 25, 25);
    ellipse (175, f, 25, 25);
    ellipse (200, f, 25, 25);
    ellipse (225, f, 25, 25);
    ellipse (250, f, 25, 25);
    ellipse (275, f, 25, 25);
    ellipse (300, f, 25, 25);

 fill(0);
    ellipse (125, g, 25, 25);
    ellipse (150, g, 25, 25);
    ellipse (175, g, 25, 25);
    ellipse (200, g, 25, 25);
    ellipse (225, g, 25, 25);
    ellipse (250, g, 25, 25);
    ellipse (275, g, 25, 25);
    
     fill(255);

    ellipse (150, h, 25, 25);
    ellipse (175, h, 25, 25);
    ellipse (200, h, 25, 25);
    ellipse (225, h, 25, 25);
    ellipse (250, h, 25, 25);

    
     fill(0);
    ellipse (175, i, 25, 25);
    ellipse (200, i, 25, 25);
    ellipse (225, i, 25, 25);
    
   
 
    
    
 fill(0);
    ellipse (0, e, 25, 25);
    ellipse (25, e, 25, 25);
    ellipse (50, e, 25, 25);
    ellipse (75, e, 25, 25);
    ellipse (100, e, 25, 25);
    ellipse (125, e, 25, 25);
    ellipse (150, e, 25, 25);
    ellipse (175, e, 25, 25);
    ellipse (200, e, 25, 25);
    ellipse (225, e, 25, 25);
    ellipse (250, e, 25, 25);
    ellipse (275, e, 25, 25);
    ellipse (300, e, 25, 25);
    ellipse (325, e, 25, 25);
    ellipse (350, e, 25, 25);
    ellipse (375, e, 25, 25);
    ellipse (400, e, 25, 25);
    
  a = a - 1; 
  if (a < 0) { 
    a = height; 
  } 
   b = b - 1.1; 
  if (b < 0) { 
    b = height; 
   } 
   c = c - 1.2; 
  if (c < 0) { 
    c = height; 
  } 
  
  d = d - 1.3; 
  if (d < 0) { 
    d = height; 
  } 
  
  f = f - 1.4; 
  if (f < 0) { 
    f = height; 
  } 
  
  g= g - 1.5; 
  if (g < 0) { 
    g = height; 
  } 
  
  h= h - 1.6; 
  if (h < 0) { 
    h = height; 
  } 
  
  i= i - 1.7; 
  if (i < 0) { 
    i = height; 
  } 
    e = e - .9; 
  if (e < 0) { 
    e = height; 
  } 
  
  
}

void mousePressed(){
col+=10;
col%=255;
println("KeenanGratch (:D)");
}

