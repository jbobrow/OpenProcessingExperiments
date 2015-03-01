
//Variables

int num_pelotas = 15;
int [] size = new int [num_pelotas];

float [] posicionX = new float [num_pelotas];
float [] posicionY = new float [num_pelotas];
float [] velocidadX = new float [num_pelotas];
float [] velocidadY = new float [num_pelotas];

color [] color_pelota = new int [num_pelotas];


//Inicio Set Up

void setup ()
{
  size(800,400);
  for(int i=0; i<num_pelotas; i++)
  {
    posicionX [i] = width/2;
    posicionY [i] = height/2;
    velocidadX [i] = random(1,10);
    velocidadY [i] = random(1,10);
    int z = int(random(60,80));
    size[i] = z;
    color_pelota [i] = color (int(random(200,255)), 150, 10);
  }
}

//Inicio Drawing

void draw ()
{
  background (100,100,255);
  strokeWeight (5);
  stroke (255);
  ellipse (width/2, height/2, 70, 70);
  line (width/2, 0, width/2, height);
  stroke(0);
  
  for (int i=0; i<num_pelotas; i++)
  {
    posiciones (i);
    limites_XY (i);
    personaje (i);
  }
}

//Modificación velocidad y posiciones

void posiciones (int _i)
{
  posicionX [_i] += velocidadX [_i];
  posicionY [_i] += velocidadY [_i];
}
  
  
//Límites del canvas
  void limites_XY (int _i)
  {
  if((posicionX [_i] < size[_i]/2) || (posicionX [_i] > width-size[_i]/2))
  {
    velocidadX [_i] = -velocidadX [_i];
  }
  
  if ((posicionY [_i] < size[_i]/2) || (posicionY [_i] > height-size[_i]/2))
  {
    velocidadY [_i] = -velocidadY [_i];
  }
  }



//Dibujo de la pelota de basquet
  void personaje (int _i)
  {
  fill(color_pelota[_i]);
  strokeWeight (2);
  smooth();
  ellipse (posicionX[_i], posicionY[_i], size[_i], size[_i]);
  noFill();
  strokeWeight (1);
  curve (posicionX[_i]-size[_i], posicionY[_i]+size[_i], posicionX[_i]-size[_i]/2,posicionY[_i], posicionX[_i]+size[_i]/2, posicionY[_i], posicionX[_i]+size[_i], posicionY[_i]+size[_i]);
  line (posicionX[_i], posicionY[_i]-size[_i]/2, posicionX[_i], posicionY[_i]+size[_i]/2);
  arc (posicionX[_i]-size[_i]+25, posicionY[_i], size[_i], size[_i], -0.856, 0.856);
  arc (posicionX[_i]+size[_i]-25, posicionY[_i], size[_i], size[_i], 2.284, 3.996);
  }
  
  
  //Inicio Mouse Pressed
  void mousePressed(){  //al hacer click se borra una pelota.
  if(num_pelotas > 0){
    num_pelotas = num_pelotas-1;
  }
  if(num_pelotas == 0){
  num_pelotas = 7; 
  }
}
