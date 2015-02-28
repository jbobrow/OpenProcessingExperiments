
PGraphics overlay;
PImage base;

void setup()
{
  int a = 800;
  size (500,1000);
  noStroke();
  smooth();
  noLoop();
  background(0);
  
  overlay = createGraphics(width,height,P2D);
  
}

float opacity = 100;
int level = 1;
int count = 1;
float randomfill;

void draw()
{
  int x = width;
  int y = height;
  int diam = width;
  if (width<height){diam=height;}
  
  save("base.tif");
  

    base = loadImage("base.tif");

  
  overlay.beginDraw();
    overlay.fill(0);
    overlay.rect(0,0,width,height);
    drawCircle(x, y, diam, level);
  overlay.endDraw();
  
  overlay.blend(base,0,0,width,height,0,0,width,height,DIFFERENCE);
  image(overlay,0,0);
  //overlay.blend(base,0,0,width,height,0,0,width,height,SCREEN);
  //image(overlay,0,0);
 
}

void drawCircle(int x, int y, int diam, int level)
{

  if (level == 1)
  {
      opacity = random(y/2,height);
      if (opacity<8.5*height/10){overlay.fill(255);}
      else {      
      overlay.fill(255,50,50);}
      
      if (y/2>=8.5*height/10){
        opacity=random(10);
        if (opacity>=9){overlay.fill(255);}
      }        
      


//      overlay.fill(255,random(100-x/4,100));
      overlay.ellipse(x/2,y/2,diam,diam);
//      overlay.fill(0);
//      overlay.ellipse(x/2,y/2,15*diam/16,15*diam/16);
//      overlay.rect((x/2)-(diam/2),(y/2)-(diam/6),diam,diam/3);
//      overlay.rect((x/2)-(diam/6),(y/2)-(diam/2),diam/3,diam);
//      overlay.fill(0);
//      overlay.rect(x/2,y/2,(6*diam)/16,(6*diam)/16);
//      overlay.fill(255);
//      overlay.ellipse(x/2,y/2,(5*diam)/16,(5*diam)/16);
      overlay.fill(0);
      overlay.ellipse(x/2,y/2,diam/4,diam/4);
    }
if (level>1)
  {
    level = level - 1;  
    
    drawCircle(x-diam/2,y-diam/2,diam/2,level);
    drawCircle(x+diam/2,y-diam/2,diam/2,level);
    drawCircle(x+diam/2,y+diam/2,diam/2,level);
    drawCircle(x-diam/2,y+diam/2,diam/2,level);
  }
}

void mouseClicked(){
if (mouseButton == LEFT){

  if (level>= 8)
  {
    //fill(0);
    //rect(0,0,width,height);
    level = 0;
  }
   level = level + 1;
   if (count == 1){count = 0;}
   else {count = 1;}
   redraw();
}
else if (mouseButton == RIGHT){fill(0);rect(0,0,width,height);}
} 


