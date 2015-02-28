
/**
 * Bee Swarm
 * by luis2048, edited by Hiro Nagaoka
 * taken from Processing demos (Unlimited Sprites Demo Effect)
 */

PGraphics[] spriteFrames = new PGraphics[6];
PImage sprite;

float x, y;
float xang = 0.0;
float yang = 0.0;
int surf = 0;

void setup() {
  size(640, 360);
  noSmooth();
  background(22,147,165);
  
 
  sprite=loadImage("bee.png");

  for (int i = 0; i < spriteFrames.length; i++)  {
    spriteFrames[i] = createGraphics(width, height, JAVA2D);
  }   
}

void draw()
{
  background(22,147,165);
  
  x = (width/2)*sin((radians(xang))*1.95);
  y = (height/2)*cos((radians(yang))*0.80);

  xang += 0.34;
  yang += 2.39;

  spriteFrames[surf].beginDraw();
  spriteFrames[surf].image(sprite, x+(width/2)-22, y+(height/2)-32);
  spriteFrames[surf].endDraw();            

  image(spriteFrames[surf], 0, 0, width, height);

  surf = (surf+1) % spriteFrames.length;

}


