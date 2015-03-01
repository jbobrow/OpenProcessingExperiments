
/*Alina Honhala
Bubble Shooter*/

PVector mouse = new PVector(mouseX, mouseY);
PVector center = new PVector(200,550); //Centro del "shooter"

PVector bala = new PVector(0,0);

float v = 0.06;
float diam = 50;
boolean disparo = false;
PVector mouse_aux = new PVector(0,0);
  

void setup()
{
  size(400,600);
  smooth();
}


void draw()
{
  background(#CAE4FE);
  mouse.x = mouseX;
  mouse.y = mouseY;
  
  mouse.sub(center);
  mouse.normalize();
  mouse.mult(100);
  
  //Dibujamos el "shooter"
  stroke(#2FB0D7);
  strokeWeight(4);
  translate(center.x, center.y);
  line(0, 0, mouse.x, mouse.y);
  
  if (mousePressed)
  {
    mouse_aux.set(mouse.x, mouse.y);
    disparo = true;
  }
  
  if(disparo)
  {
    bala.x += v * mouse_aux.x;
    bala.y += v * mouse_aux.y;
    
    //Si la bala se sale del lienzo:
    if( ( bala.x > center.x || bala.x < (-center.x) ) || (-bala.y) > center.y)
       disparo = false; 
       
  }
  //Si no se presiona el ratón:
  else{
    bala.x = mouse.x;
    bala.y = mouse.y;
  }
  
  //Dibujamos la bala
  stroke(#74042D);
  strokeWeight(2);
  fill(#045A74);
  ellipse(bala.x, bala.y, diam, diam);
  
}


