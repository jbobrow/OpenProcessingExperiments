
// Dimenções da matriz de simulação.
int COLUNAS = 360/2;
int LINHAS = 180/2;

// Raio e expessura do toro.
float raio = 100;
float g = 50;

// Informações da câmera.
float alpha = 1, beta = 1;
float zoom = 300;

// Cores da simulação.
color COR_FUNDO = color(0);
color COR_LINHAS = color(0, 50, 50, 200);
color COR_CELULAS = color(0, 255, 255);
color COR_CELULAS_MORTA = color(0);

// Posição v(x, y, z).
float x, y, z;
int contador;
// Matrizes da estrutura do toro.
Face toro[][] = new Face[COLUNAS][LINHAS];
Ponto vertices[][] = new Ponto[COLUNAS][LINHAS];

// Matriz de simulação do autonomato celular.
boolean matriz[][] = new boolean[COLUNAS][LINHAS];

void setup()
{

  size(800, 600, P3D);
  background(COR_FUNDO);
  stroke(COR_LINHAS);
  frameRate(120);
  strokeWeight(1);
  noCursor();
  
  
  // Gera as matrizes de simulação do autonomato celular e dos vértices
  for(int i = 0; i < COLUNAS; i++)
  for(int j = 0; j < LINHAS; j++)
  {
    matriz[i][j] = (random(0, 100) >= 50);
    x = (sin(radians(j * 360/LINHAS)) * g + raio) * cos(radians(i * 360/COLUNAS));
    z = (sin(radians(j * 360/LINHAS)) * g + raio) * sin(radians(i * 360/COLUNAS));
    y = cos(radians(j * 360/LINHAS)) * g;
    vertices[i][j] = new Ponto(x, y, z);
  }

  // Gera as faces do autonomato celular.
  for(int i = 0; i < COLUNAS; i++)
  for(int j = 0; j < LINHAS; j++)
  {

    toro[i][j] = new Face(
    vertices[i][j],
    vertices[i][limite(j+1, 0, LINHAS-1)],
    vertices[limite(i+1, 0, COLUNAS-1)][j],
    vertices[limite(i+1, 0, COLUNAS-1)][limite(j+1, 0, LINHAS-1)]);

  }
}

void draw()
{

  background(COR_FUNDO);

  beta += 0.4;
  alpha += 0.4;
  camera(cos(radians(beta)) * zoom,
         sin(radians(alpha)) * zoom,
         sin(radians(beta)) * zoom,
         0, 0, 0,
         0, 1, 0);

  simular();

  for(int i = 0; i < COLUNAS; i++)
  for(int j = 0; j < LINHAS; j++)
    toro[i][j].desenhar(matriz[i][j] ? COR_CELULAS : COR_CELULAS_MORTA);

  contador++;
  if (contador > 1500)
   {
     contador = 0;
     resetar();
   }
}

void simular()
{
  boolean buffer[][] = new boolean[COLUNAS][LINHAS];
  int num;
  for(int i = 0; i < COLUNAS; i++)
  for(int j = 0; j < LINHAS; j++)
  {
    num = nVizinhos(i, j);
    if (matriz[i][j])
      if (num > 3 || num < 2)
        buffer[i][j] = false;
      else
        buffer[i][j] = true;
    else if (num == 3)
        buffer[i][j] = true;
  }
  matriz = buffer;
}

int nVizinhos(int k, int l)
{
  int num = 0;
  int val[][] = {{+1, +0}, {-1, +0}, {+0, +1}, {+0, -1},
                 {+1, +1}, {-1, +1}, {+1, -1}, {-1, -1}};

  for(int n = 0; n < 8; n++)
    if (matriz[limite(k + val[n][0], 0, COLUNAS-1)][limite(l + val[n][1], 0, LINHAS-1)]) num++;

  return num;
}

void resetar()
{
  for(int i = 0; i < COLUNAS; i++)
  for(int j = 0; j < LINHAS; j++)
    matriz[i][j] = (random(0, 100) >= 50);
}

int limite(int num, int min, int max)
{
  return ((num < min) ? max : (num > max) ? min : num);
}

class Face
{
  
  private Ponto a = new Ponto(0,0,0);
  private Ponto b = new Ponto(0,0,0);
  private Ponto c = new Ponto(0,0,0);
  private Ponto d = new Ponto(0,0,0);
  
  Face(Ponto a, Ponto b, Ponto c, Ponto d)
  {
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
  }
  
  void desenhar(color cor)
  {
    fill(cor);
        
    pushMatrix();
    beginShape(QUAD_STRIP);
    
    vertex(a.x, a.y, a.z);
    vertex(b.x, b.y, b.z);
    vertex(c.x, c.y, c.z);
    vertex(d.x, d.y, d.z);
    
    endShape();
    popMatrix();

  }
}
class Ponto
{
  
  float x, y, z;
  Ponto(float x, float y, float z)
  {
    
    this.x = x;
    this.y = y;
    this.z = z;
    
  }
}



