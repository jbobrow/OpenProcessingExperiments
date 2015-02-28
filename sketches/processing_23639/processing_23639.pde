
//jo gibbs variables
//randomising exercise 4+8



float r;
float g;
float b; 
float a;
float diam;
float x; 
float y;
void setup() { 
  size(400,400); background(0); smooth();
}
void draw() { 
  
 // Fill all variables with random values
 r = random(255); 
 g = random(285); 
 b = random(255); 
 a = random(285); 
 diam = random(20); 
 x = random(width); 
 y = random(height);
 
// Use values to draw an ellipse 

noStroke(); 
fill(r,g,b,a); 
ellipse(x,y,diam,diam);

rect(x,y,x,y);


}

