
// Jugando Con Numeros
// Seminario de Matematicas
// Jan 24, 2011: Chris Sugrue.
// Rotar por el raton

int x,y;

void setup()
{
  size(400,400);
  x = width/2;
  y = height/2;
  rectMode(CENTER);
  smooth();
}


void draw()
{
  
  background(0);
  fill(255);
  
  //calcular el angulo. returns in radians
  float angle = atan2(mouseY-y,mouseX-x);
  //println(angle);
  
  stroke(127);
  line(x,y,mouseX,mouseY);
  line(x,y,x,mouseY);
  line(x,mouseY,mouseX,mouseY);

  
  fill(255,255,255,200);
  
  // translate al centro (x,y) y rotar
  pushMatrix();
    translate(x,y);
    rotate( angle );
    rect(0,0,60,60);
  popMatrix();
  
  fill(255,0,0);
  ellipse(x,y,8,8);
  ellipse(mouseX,mouseY,8,8);
    
}


