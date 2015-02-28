
float angulo = 0.0;


void setup(){
 size (1200,800);
 background (7,31,36);
}

void draw(){
 
   
  angulo = angulo + 0.85;
  smooth ();
  noStroke ();
  rotate (angulo);
 
  fill(255,239,173);
  //translate(150, 400);
  rotate(angulo);
  rect(50, 50, 800, 1);
  
  fill(250,234,99);
  rotate(angulo);
  translate(250, 200);
  rect(10, 100, 800, 1);
  
  
  fill(255);
  translate(250, 200);
  rotate(angulo);
  rect(200, 200, 700, 1);
  
}
  

