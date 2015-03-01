
import fisica.*;

FWorld planeta;
FBox caixa;
FCircle pum;
PImage nave;
PImage fundo;

void setup()
{ 
  size(600,600);
  
  Fisica.init(this);
  planeta = new FWorld();
  planeta.setEdges();
  
  caixa = new FBox(80,80);
  nave = loadImage("nave1.png"); 
  caixa.attachImage(nave);
  
  caixa.setPosition(300,550);
  caixa.setStatic(true);
  caixa.setGrabbable(false);
  planeta.add(caixa);

}

void draw()
{
  
  fundo = loadImage("fundo.png");
  image(fundo,0,0);
  planeta.step();
  planeta.draw();
}

void contactStarted(FContact colisao)
{
  if(colisao.getBody1()!= planeta.left && colisao.getBody1() != planeta.right && colisao.getBody1()!= planeta.top && colisao.getBody1()!= planeta.bottom)
  {
    planeta.remove(pum);
    //daqui pra baixo pro tiro sumir :3 
  }
  if(colisao.getBody2() == pum && colisao.getBody1()== planeta.top)
  {
    planeta.remove(pum);
  }
    
}

void keyPressed()
{
  if(keyCode == LEFT)
{
  caixa.adjustPosition(-15,0);
}
  
  if(keyCode == RIGHT)
{
  caixa.adjustPosition(15,0);
}
  if(keyCode == UP)
{
  caixa.adjustPosition(0,-15);
}
  if(keyCode == DOWN)
{
  caixa.adjustPosition(0,15);
 
}
  if(keyCode == TAB)
{
  pum = new FCircle(10);
  pum.setFill(255,0,0);
  pum.setPosition(caixa.getX(),caixa.getY());
  pum.setVelocity(0,-1000);
  planeta.add(pum);
}}


