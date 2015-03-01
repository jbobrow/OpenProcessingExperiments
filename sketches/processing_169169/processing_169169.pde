
// Informações da câmera.
float alpha = 45, beta = -101;
float zoom = 75;

boolean auto = false;
boolean caixa = true;
boolean borboleta = true;

final int NUM_PONTOS = 50;
final int TAMANHO = 64;

final float SIGMA = 10; // 10
final float RHO = 28; // 28
final float BETA = 8/3; // 8/3 

Ponto particulas[] = new Ponto[NUM_PONTOS];

void setup()
{

  size(600, 600, P3D);
  frameRate(320);
  background(0);
  stroke(255);
 // noCursor();
  noFill();
  
    for(int i = 0; i < NUM_PONTOS; i++)
      particulas[i] = new Ponto(new PVector(random(-1E-4, 1E-4), 0, 25), color(int(random(0, 10)), int(random(0, 128) + 128), int(random(0, 128) + 128)));
    
}

void draw()
{

  background(0);

  if(auto)
  {
    beta += 0.4;
    alpha += 0.4;
  }
  
    camera(sin(radians(beta)) * zoom,
           sin(radians(alpha)) * zoom,
           cos(radians(beta)) * zoom,
           0, 0, 25,
           0, -1, 0);

  for(int i = 0; i < NUM_PONTOS; i++)
  {
    particulas[i].simular();
    particulas[i].desenhar();
  }
 
  if(caixa)
  {
     pushMatrix();
     stroke(255);
     translate(0, 0, 30); 
     box(50);   
     popMatrix(); 
  }
}

void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP) {
      alpha += 1;
    } else if (keyCode == DOWN) {
      alpha -= 1;
    } else if (keyCode == RIGHT) {
      beta += 1;
    }else if (keyCode == LEFT) {
      beta -= 1;
    }  
  }else if (key == '-') {
      zoom += 1;
  }else if (key == '+') {
      zoom -= 1;
  }else if (key == 'a' || key == 'A') {
      auto = !auto;
  }else if (key == 'c' || key == 'C') {
      caixa = !caixa;
  }else if (key == 'b' || key == 'B') {
      borboleta = !borboleta;
      
  }else if (key == 'r' || key == 'R') {

    for(int i = 0; i < NUM_PONTOS; i++)
      particulas[i] = new Ponto(new PVector(random(-25, 25), random(-25, 25), random(-25, 25)+30), color(int(random(0, 10)), int(random(0, 128) + 128), int(random(0, 128) + 128)));
  
      beta = -101;
      alpha = 45;
      zoom = 75;

  }

}


class Ponto
{
  
  ArrayList<PVector> p = new ArrayList<PVector>();
  color c;
  
  Ponto(PVector posicao, color cor)
  {
    
    p.add(posicao);
    p.add(posicao);
    c = cor;
    
  }
  
  void desenhar()
  {
    
    int t = p.size() - 1;

    stroke(c, 255);
    strokeWeight(6);
    point(p.get(t).x, p.get(t).y, p.get(t).z);
    strokeWeight(1.5);

    rastro();
    
  }
  
  void rastro()
  {

    for(int i = 0; i < p.size() - 1; i++)
    {
      //stroke(c, i * 256/TAMANHO);
      line(p.get(i).x, p.get(i).y, p.get(i).z, p.get(i + 1).x, p.get(i + 1).y, p.get(i + 1).z);      
    }
  }
  
  void simular()
  {
    
    int t = p.size() - 1;
    
    float x = p.get(t).x;
    float y = p.get(t).y;
    float z = p.get(t).z;
    
    float dt = 0.007;
    
    float dx = SIGMA * (y - x) * dt;
    float dy = (x * (RHO -  z) - y) * dt; 
    float dz = (x * y - BETA * z) * dt;
    
    x += dx;
    y += dy;
    z += dz;
    
    if(t > TAMANHO)
      p.remove(0);

    p.add(new PVector(x, y, z));
    
  }
  
}


