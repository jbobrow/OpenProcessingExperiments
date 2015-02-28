
float angulo = 0.0;

void setup(){
  size(800, 800);
  smooth();
    noStroke();
}

void draw(){
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  
  angulo = angulo + 0.02;
  translate(400, 400);
  rotate(angulo);
rect(0, 0, 100, 100);
 rect (0, 0, 200, 200); 
  translate(250, 200); //probar sin translate
  fill(250, 189, 189, 100);
  rotate(angulo);
 rect(0, 0, 100, 100);
 rect(0, 0, 200, 200);
 fill (252,42,5);
 rect (0, 0, 300, 300);
  
}

