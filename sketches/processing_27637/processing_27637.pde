
float x, y;    
float vx, vy;   
float ax, ay;

void setup() {
 size(400, 400); 
 stroke(#1189F0);
 strokeWeight(0);
 fill(#3BA3FC);
 smooth();

 resetParticle(); 
}

void draw() {
  background(#2A5376);

  ellipse(x, y, 10, 10); 

  vx += ax;
  vy += ay;
 

  x += vx;               
  y += vy;
  
}


void mousePressed() {
  resetParticle();
}

void resetParticle() {

  x = y = width/2f;    
  

  vx = vy = 0f;
  
  ax = random(-0.01, 0.01);
  ay = random(0.003, 0.01);
}






