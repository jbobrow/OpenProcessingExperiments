
int Yrectangulo = 80;
int Velocidad = 2;

void setup()
{
  size(192,157); 
}

void draw() 
{
  background(255);

  smooth();
  noStroke();
  fill(100,100,250);

  rect(80,Yrectangulo,30,50);

  fill(250,100,100,150);

  rect(10,50,60,30);
  
  fill(250,100,100,150);

  rect(120,50,60,30);

 //para mover el rectangulo azul
  Yrectangulo = Yrectangulo + Velocidad;

 if (Yrectangulo < 5 || Yrectangulo > 105) 
 {
    Velocidad = Velocidad * -1;

  }
}
                
                
