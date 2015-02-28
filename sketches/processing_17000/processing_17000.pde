
class Palla{
  float diametro;
  float speed;
  float angle;
  float x;
  float y;
  float r,g,b;
  
  Palla(){
  x = mouseX;
  y = mouseY;
  speed = 0.005;
  angle = 0;
  r = random(0,255);
  g = random(0,355);
  b = random(0,255);
  }
  
  void disegno(float phase){
  angle += speed;  
  fill(r,g,b,100);
  diametro = 10 + (sin(angle + phase)*45);
  ellipse(x,y,diametro , diametro);
  }
}

