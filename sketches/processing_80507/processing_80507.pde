
int x, y;
void setup()
  {
    size(800,400);
  }

void draw()
  {
    background(200,60,100);
    noFill();
    strokeWeight(8);
    smooth();
  
    stroke(0);
    strokeWeight(8);
    ellipse(400, 150, 100, 100);
 
    stroke( 0, 0, 255);
    strokeWeight(8);
    ellipse( 290, 150, 100, 100);
 
    x = int(random(700));//random genera numeros aleatorios 
    y = int(random(400));
    if((x != 1) && (y != 1)) //este if da el movimiento de los aros hasta que x & y sean iguales a los valores predeterminados.
      {
        stroke(255, 0, 0);
        strokeWeight(8);
        ellipse(x, y, 100, 100);
      }
      
    else                        // dibuja el aro cuando los valores en x & y son los predeterminados
       {
        stroke(255, 0, 0);
        strokeWeight(8);
        ellipse(510, 150, 100, 100);
        noLoop();        //para el ciclo predefinido por el draw.
      }
    
  stroke(255, 255, 0);
  strokeWeight(8);
  ellipse(345, 200, 100, 100);
 
  stroke(0, 255, 0);
  strokeWeight(8);
  ellipse(455, 200, 100, 100);
}


