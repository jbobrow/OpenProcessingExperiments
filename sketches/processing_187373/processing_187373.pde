
float i=0;
void setup() {
 size(600,600);
 colorMode(HSB);
 noStroke();
}
void draw() {
 i=i+0.002;
}
 void mouseDragged(){
  float fondo = (127*sin(i))+127;
  float fondob = (127*sin(i+PI))+127;
   background(fondo,255,255);
  fill(fondob,255,255);

  float aleatorioX=random(50,50);
  float aleatorioY= random(50,50);
  float tamano= random(20,100);
 ellipse(mouseX+aleatorioX,mouseY+aleatorioY,tamano,tamano); 
}
