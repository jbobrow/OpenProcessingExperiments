
PImage img;
int marcador;
boolean juga;
Bola[] ataca;
Bola presa; 

void setup(){
  size(500, 500);
  marcador= 0;
  juga = true;
  presa = crea_Bola();
  ataca = new Bola[100];
  ataca[0] = crea_Bola();
  frameRate(60);
  img = loadImage ("game over.gif");
}
 
void draw()
{
  if (juga==true){
    background(0, 0, 0);
    fill(255,255,255);
    textSize(20);
    text("Puntuació: " + marcador, 20, 40);
    
    fill(255, 255, 255); 
    ellipse(mouseX, mouseY,20, 20);
     
    fill(255, 0, 0);
    ellipse(presa.x,presa.y, 20, 20);
    presa.renova();
     
    fill(255, 255, 0);
    for (int i = 0; i < marcador + 1; i++){
      ataca[i].renova();
      ellipse(ataca[i].x, ataca[i].y, random(20,100),random(20,40)); 
      
      if (dist(mouseX, mouseY, ataca[i].x, ataca[i].y) < 40 )
      {
        juga = false;    //bucle per comprovar colisions entre les grogues i la blanca.
      }
    }
     
    if (dist(mouseX, mouseY, presa.x, presa.y) <20)
    {
      marcador++;
      ataca[marcador] = crea_Bola(); //condicio per comprovar colisions entre la blanca i la vermella.
      presa = crea_Bola();
    }
  }
  else
  { 

     image (img,0,0); 
     text("Puntuació: "+marcador,200,height/2+40);
   }
}
 
Bola crea_Bola()
{
  int x, y, vx, vy;
  x = (int) random(width);
  y = (int) random(height);
  vx = (int) random(4);
  vy = (int) random(4);
  return new Bola(x, y, vx, vy);
}
 
void mousePressed()
{
  setup();
}

class Bola{
  int x, y, vx, vy;
  Bola(int xpos, int ypos, int xvel, int yvel){
    x = xpos;
    y = ypos;
    vx = xvel;
    vy = yvel;
  } 
  void renova(){
    x += vx;
    y += vy;
    if (x <= 0 || x >= width) { //rebots
      vx = -vx;
    }
    if (y <= 0 || y >= height) {//rebots
      vy = -vy;
    }
  }
}



