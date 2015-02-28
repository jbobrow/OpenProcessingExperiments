
ArrayList ondas;
int tiempo;
Maxim maxim2;
AudioPlayer player2;
boolean playBoton;
PImage sonidoON;
PImage sonidoOFF;
int R, G, B;

void setup()
{
  tiempo = 1;
  size( 1000, 500); 
  frameRate(30);
  background(#91B1F0);
  ondas = new ArrayList();
  smooth();


  sonidoON = loadImage("S1.png");
  sonidoOFF = loadImage("S2.png");

  maxim2 = new Maxim(this);
  player2 = maxim2.loadFile("fondo.wav");
  player2.setLooping(true);
  player2.volume(1.0);
  R = 145;
  G = 177;
  B = 240;
}

void draw()
{  
  if( tiempo % 50 == 0)
  {
    R = random(65,216);
    G = random(190,249);
    B = random(214,255);
  }
  
  background(R,G,B);

  if(playBoton)
  {
    image(sonidoON, 950, 450,32,32);
  }
  else
  {
    image(sonidoOFF, 950, 450,32,32);
  }

  
  if(ondas.size()>0)
  {
    for(int i = ondas.size()-1; i >= 0; i--)
    {
       Onda onda = (Onda) ondas.get(i); 
       int diametro = onda. Diametro();
       onda.Dibuja(diametro +5);
       onda.Dibuja(diametro +8);
       onda.Dibuja(diametro +10);
       
       if(onda.Existe()== false)
       {  
         ondas.remove(i);
       }
    }

    if(tiempo == 60)
    {
      tiempo =1;
    }
    else
    {
      tiempo = tiempo+1;
    }
  }
}

void mousePressed()
{  
  Onda onda = new Onda(mouseX, mouseY);
  ondas.add(onda);
  onda.Dibuja(5);
  
  if( mouseX >= 950 && mouseX <= 1000)
  {
    if( mouseY >= 450 && mouseY <= 500)
    {
      playBoton = !playBoton;
    }
  }
  if (playBoton) {
    player2.play();
  } 
  else {
    player2.stop();
  }
  
}

class Onda 
{ 
  float centroX, centroY;
  int ondas;
  int DiametroO;
  Maxim maxim;
  AudioPlayer player;

  Onda (float x, float y) 
  {  
    centroY = y; 
    centroX = x; 
    ondas = 250;
    DiametroO = 5;
    
    maxim = new Maxim(this);
    player = maxim.loadFile("waterdrop.wav");
    player.volume(0.5);
    player.setLooping(false);
  } 
  
  void Dibuja(int diametro)
  {
    noStroke();
    fill(30,86,247,10);
    ellipse(centroX,centroY,diametro, diametro);
    ondas = ondas -1;
    DiametroO = diametro;
    player.play();
  }
  
  float Diametro()
  {
    return DiametroO;
  }
  
  boolean Existe()
  {
    if(ondas==0)
        return false;
      else
        return true;
  }
} 



