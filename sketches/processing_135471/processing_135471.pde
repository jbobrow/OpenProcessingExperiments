

void setup() {
  size (700,700);
  background(255);
 
}
void draw(){
  
  beginShape(TRIANGLES);
  
vertex(random(100), 600);
vertex(random(200), 700);
vertex(600, random(200));
vertex(100, random(50));
vertex(random(200), 700);
vertex(100, random(500));
endShape();


beginShape(LINES);

vertex(600, random(0));
vertex(200, 800);
vertex(random(600), 200);
vertex(-800, random(50));
vertex(random(200), 800);
vertex(700, random(500));



vertex(0, random(700));
vertex(random(700), 5);
vertex(random(10), 700);
vertex(100, random(50));
vertex(random(20), 700);
vertex(10, random(600));
endShape();
  

  float aleatorioX= random(-50,50);
  float aleatorioY= random(-50,50);
  float tamano= random(5,50);
 ellipse(mouseX+aleatorioX,mouseY+aleatorioY,tamano,tamano);
}

