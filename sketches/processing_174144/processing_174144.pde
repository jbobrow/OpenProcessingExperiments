
float mediaX, mediaY;
float somaX=0, somaY=0;

float varianciaX, somaVariacaoX;
float varianciaY, somaVariacaoY;

float dpX, dpY;

int count=0;
float time;

int[] posicaoX = new int[200];
int[] posicaoY = new int[200];

void setup()
{
  background(150);
  noStroke();
  size(800, 800);
  frameRate(20);
}

void draw()
{
  posicaoX[count] = mouseX;
  posicaoY[count] = mouseY;
  background(150);
  fill(255, 0, 0);
  ellipse(posicaoX[count], posicaoY[count], 10, 10);
  fill(255);
  textSize(20);
  text("Desvio Padrão X:", 20, 40);
  text("Desvio Padrão Y:", 20, 70);
  text(dpX, 185, 40 );
  text(dpY, 185, 70);
  text(int(time) + " segundos até próximo cálculo.", 20, 100); 
  somaX = somaX + posicaoX[count];
  somaY = somaY + posicaoY[count];

  count++;
  time = count/20;

  if (time == 10)
  {
    mediaX = somaX/200;
    mediaY = somaY/200;

    for (int i = 0; i < 200; i++)
    {
      somaVariacaoX = somaVariacaoX + sq(posicaoX[i] - mediaX);
      somaVariacaoY = somaVariacaoY + sq(posicaoY[i] - mediaY);
    }

    varianciaX = (sq(somaVariacaoX))/200;
    varianciaY = (sq(somaVariacaoY))/200;

    dpX = sqrt(varianciaX);
    dpY = sqrt(varianciaY);    

    count = 0;
    somaX = 0;
    somaY = 0;
    somaVariacaoX = 0;
    somaVariacaoY = 0;
    background(150);
  }
}

