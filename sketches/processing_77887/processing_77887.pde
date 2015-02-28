
float angle=0.5;
float xpos;

void setup(){
size(800, 500);
background(255, 82, 0);
}

void draw(){
  
  float x =random (0, 800);
  float y =random (0, 500);
  float posicion = random (0, 0);
  
  
  //círculos amarillos
  frameRate(100);
   noStroke();
  fill(255,255,0);
  pushMatrix();
  translate(x + posicion, y + posicion);
  ellipse (x, y, 20, 20);  
  popMatrix();
  
  // círculos de colores 
  xpos+= 3;
  float valorSeno = sin(angle);
  float valorCoseno = cos(angle);
  float r = map(valorSeno, 2, -1, 0, 50);
  float g = map(valorSeno, -1, 1, 150, 0);
  float b = map(valorCoseno, -1, 1, 0, 200);
  float a = random(80,10);
  float d = random(11,22);
  float noiseval = 0;
  angle += 0.1;
  noiseval +=1;
  stroke(1);
  fill(255, 110, 0); 
  ellipse(xpos-100, random(-150,120), d, d);
  fill(200, 100, 0);
  ellipse(xpos-200, random(200,400), d, d);
  fill(255,0,0);
  ellipse(xpos-50, random(300,500), d, d);
  fill(255, 255, 0);
  ellipse(xpos, random(50,1000), d, d);
  fill(240, 220,0);
  ellipse(xpos-50, random(100,300), d, d);
  
}
