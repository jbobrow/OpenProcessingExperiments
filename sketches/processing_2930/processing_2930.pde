
float margen, sp; 
 
void setup(){ 
  margen = 20; 
  sp = 30; 
  size(500, 500);
 background(97,87,100); 
  smooth(); 
} 
 
void draw(){  
   for(float y =margen; y <= height-margen; y += sp){ 
    for(float x = margen; x <= width-margen; x += sp){ 
      float d; 
      d = dist(mouseX, mouseY, x, y); 
     float diam; 
    diam = map(d,0, 3.5*width, 5, 100);  
    stroke(231,218,242);
      fill(40,23,54,90); 
 
    ellipse(x,y,diam,diam); 
    } 
  } 
} 


