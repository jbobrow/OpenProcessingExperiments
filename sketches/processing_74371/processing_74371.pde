
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/73150*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int counterHead = 0;
int ganonFrame = 0;
int ganonMax = 4;
int xGanon = 600;
int linkmaxFrames = 3;
int linkFrame = 0;
int slashFrames = 0;
int maxslashFrames = 3;
int xLink = 0;
int maxFrame =4;
int headframe = 0;
PImage[] ganonImage = new PImage [ganonMax];
PImage[] imagesofLink = new PImage[linkmaxFrames];//array for bouncy link
PImage[] swordCursor = new PImage[2];
PImage[] slash = new PImage[maxslashFrames];
PImage[] heads = new PImage[maxFrame];

void setup() 
{
  
  frameRate(40);
  size(800, 200);
  imagesofLink[0] = loadImage("link_zelda.png");
  imagesofLink[1] = loadImage("link_zelda_2.png");
  imagesofLink[2] = loadImage("link_zelda_3.png");
  swordCursor[1] = loadImage("sword cursor.png");
  slash[0] = loadImage("Link Slashes!.png");
  slash[1] = loadImage("Link Slashes!2.png");
  slash[2] = loadImage("Link Slashes!3.png");
  ganonImage[0] = loadImage("ganondorf.png");
  ganonImage[1] = loadImage("ganondorf2.png");
  ganonImage[2] = loadImage("ganondorf3.png");
  ganonImage[3] = loadImage("ganondorf4.png");
  heads[0] = loadImage("1.png");
  heads[1] = loadImage("2.png");
  heads[2] = loadImage("3.png");
  heads[3] = loadImage("4.png");
  noCursor();
}
void draw() 
{
  println(xLink);//shows me value of xLink
  translate(0, -50);//move link to position starting point
  background(130);

  image(swordCursor[1], mouseX, mouseY);

  linkFrame = linkFrame+1;
  if (linkFrame>=linkmaxFrames) {
    linkFrame = 0;
  }

  xLink = xLink+1;
  if (xLink<=149) {
    image(imagesofLink[linkFrame], xLink, 0);
  }

  slashFrames = slashFrames + 1;
  if (slashFrames>=maxslashFrames) {
    slashFrames=0;
  }
  if (xLink>=150) 
  {
    image(slash[slashFrames], 150, 50); //null pointer exception error no more!
  }
  ganonFrame = ganonFrame +1;
  if (ganonFrame>=ganonMax) {
    ganonFrame=0;
  }


  if (xLink>=0 && xLink!=150 && xLink<150) {
    image(ganonImage[ganonFrame], xGanon, 50);
  }
  if (xLink>=150) {
    
  }
  
  xGanon = xGanon-1;
  if (xGanon<=300) {
    xGanon=300;
  }
  
  headframe = headframe +1;
  if (headframe>=maxFrame) 
  {
    headframe=0;
  }
  if (xLink>=150){
    frameRate(.5);
  {
    
    
    if (xLink>=150){
      image(heads[headframe], xGanon,50);
    }
   
  }
  }
  if (xLink>150) {
    noLoop();
  }
  
}





