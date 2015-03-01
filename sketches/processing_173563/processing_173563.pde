
float angulo = 0.0;

void setup(){
  size(1000, 1000);
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
  fill (85,46,78);
  rect (0,0,150,150);
  fill (200,38,125);
  rect (0,0,400,400);
}
