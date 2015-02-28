
PacMan pac;
Fantasma fantasma;
Bolita bolita;
Score  score;
PImage backgroundPAC;
int mort = 1 ;
int tamano = 50;
int time = 2;
import ddf.minim.analysis.*;
import ddf.minim.*;    
AudioSample opening;
AudioPlayer opening1;
AudioSample die;
AudioSample cherry;
AudioPlayer eye;
AudioPlayer ghost;
AudioPlayer mortal;
AudioPlayer star;
AudioPlayer marty;
AudioPlayer teamA;

Minim minim;

void setup()
{
  smooth();
  ellipseMode(CENTER);
  size(1000,600);
  pac = new PacMan(width/2,height/2);
  fantasma = new Fantasma();
  bolita = new Bolita();
  score = new Score();
  backgroundPAC = loadImage("Star-Game.gif");
  minim = new Minim(this);      
  opening = minim.loadSample("Opening.mp3", 2048);
  opening1 = minim.loadFile("Opening.mp3", 2048);
  die = minim.loadSample("Pacman-Die.mp3", 2048);
  cherry = minim.loadSample("EatingCherry.mp3", 2048);
  eye = minim.loadFile("Eye of the tiger.mp3", 2048);
  ghost = minim.loadFile("Ghostbusters Theme Song.mp3", 2048);
  mortal = minim.loadFile("Mortal kombat.mp3", 2048);
  star = minim.loadFile("Star Wars.mp3", 2048);
  marty = minim.loadFile("MARTY MCFLY .mp3", 2048);
  teamA = minim.loadFile("The A-Team.mp3", 2048);
   
  opening1.play();   
    
}
void draw()
{
  background(backgroundPAC);
  score.displayScore();
  matar();
  comer();
  vidas();
  if (keyPressed)
    {      
        if (key == 's')
        {
          time = 1;
        }
        if (key == 'c')
        {
          time = 2;
          opening.trigger();
        }  
        if (key == '1')
        {
          eye.play();
        }
        if (key == '2')
        {
          ghost.play();
        }
        if (key == '3')
        {
          mortal.play();
        }
        if (key == '4')
        {
          star.play();
        }
        if (key == '5')
        {
          marty.play();
        }
        if (key == '6')
        {
          teamA.play();
        }
    } 
  if ( time == 1 )
  {    
    backgroundPAC = loadImage("Pac-Man.gif");
    pac.dibujar();
    pac.mover();
    fantasma.dibujar();
    fantasma.seguir(pac);
    bolita.dibujar();    
  } 
  if ( time == 2 )
  {
    backgroundPAC = loadImage("Star-Game.gif"); 
    
    score.resetScore();       
  } 
    
  
      
}
void matar()
{
  float distancia;
  distancia = sqrt(pow(pac.x-fantasma.x,2) + pow(pac.y-fantasma.y,2));
  if(distancia < 47)
  {
    pac = new PacMan();
    muerte();
    die.trigger();
  } 
} 
 void comer()
 {
    float dis;
    dis = sqrt(pow(pac.x-bolita.x,2) + pow(pac.y-bolita.y,2));
    if(dis < 25)
    {
      bolita = new Bolita();
      score.updateScore();
      cherry.trigger();
    }
 }
 void muerte()
{
  if ( mort == 1 )
  {  
    println("Usted ha muerto "+(mort++)+" vez "); 
  }
  else 
  {
    println("Usted ha muerto "+(mort++)+" veces ");
  }  
  if ( mort >= 4 )
  {
    println("GAME OVER");
    backgroundPAC = loadImage("Game-Over.gif");
    mort=1;
    time=0;
  }     
} 
  void vidas()
{
    color col = #FFE203;
    if ( mort == 1 )
    {
      noStroke();
      fill(col);
      arc(820,35,tamano,tamano,PI/4,7*PI/4);
      arc(870,35,tamano,tamano,PI/4,7*PI/4);
      arc(920,35,tamano,tamano,PI/4,7*PI/4);      
    } 
    if ( mort == 2 )
    {
      noStroke();
      fill(col);
      arc(820,35,tamano,tamano,PI/4,7*PI/4);
      arc(870,35,tamano,tamano,PI/4,7*PI/4);
    } 
    if ( mort == 3 )
    {
      noStroke();
      fill(col);
      arc(820,35,tamano,tamano,PI/4,7*PI/4);
    } 
}  
  void stop()
{
   opening.close();
   opening1.close();
   die.close();
   cherry.close();
   minim.stop();      
   super.stop();
}
        



