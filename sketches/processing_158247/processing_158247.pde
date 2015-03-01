
int radio = 44;
int ancho = 440;
int alto = 440;
float centroX = ancho/2;
float centroY = alto/2;
float offX = radio*sin(PI/3);
float offY = radio/2;
int N = 1;

void setup()
{
  size(440,440);
  ellipseMode(RADIUS);
  noFill();
  smooth();
  noLoop();
  strokeWeight(2);
}

void draw()
{
  translate(centroX,centroY);
  background(255, 204, 0);
  stroke(100,100,100);
  for(int i=0;i <= (ancho/(2*radio))+1; i += 1)
  {
    for(int j=0; j <= (alto/radio)+2; j +=1)
    {
      for(int k=0; k < N; k += 1)
      {
        ellipse(i*offX, j*radio+(i%2)*offY-centroY, (1-(float)k/N)*radio, (1-(float)k/N)*radio);
        ellipse(-i*offX, j*radio+(i%2)*offY-centroY, (1-(float)k/N)*radio, (1-(float)k/N)*radio);
      }
    }
  }
  stroke(0);
  strokeWeight(3);
  ellipse(0, 0, 3*radio+2, 3*radio+2);
}
                                                                                                                                                                                                                                
