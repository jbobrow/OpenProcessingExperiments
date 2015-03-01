
int DISPLAY_WIDTH = 320;
int DISPLAY_HEIGHT = 180;
int numBlobs = 30;
Blob blobs[] = new Blob[numBlobs];

PGraphics pg;
int num = 0;
boolean flag = false;

void setup() 
{
  //size(DISPLAY_WIDTH*2, DISPLAY_HEIGHT*2);
  size(640,360); //16:9
 
  colorMode(HSB,255);
  
  pg = createGraphics(DISPLAY_WIDTH, DISPLAY_HEIGHT);
  
  for (int i=0; i<numBlobs; i++) 
  {
    blobs[i] = new Blob(random(DISPLAY_WIDTH),random(DISPLAY_HEIGHT),random(-.7,.7),random(-.7,.7));
  }
}

void draw() 
{
  for (int i=0; i<numBlobs; ++i) 
  {
    blobs[i].update();
  }
  
  pg.beginDraw();
  pg.loadPixels();
  
  if(num>360*6)flag = true;
  if(num<0)flag = false;
  
  if(flag == false){
    num++;
  }else{
    num--;
  }
  
    for (int y=0; y<DISPLAY_HEIGHT; y++) 
    {
      for (int x=0; x<DISPLAY_WIDTH; x++) 
      {
        int m = 1;
        
        for (int i=0; i <numBlobs; i++) 
        {
          m += 20000 / (blobs[i].bx[x] + blobs[i].by[y] + 1);
        }
       
       pg.pixels[x+y*pg.width] = color(num*.05, m+x, (x+m+y)/3)+100; 
       // pg.pixels[x+y*pg.width] = color(50, m+x, (x+m+y)/3)+100;
       //pg.pixels[x+y*pg.width] = color(0, 0, m);
       
      }
    }
    
  pg.updatePixels();
  pg.endDraw();

  image(pg, 0, 0, width, height); 
}

class Blob 
{
  float x,y;
  float vx,vy; 
  int[] bx,by;
  
  Blob(float x, float y, float vx, float vy) 
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.bx = new int[DISPLAY_WIDTH];
    this.by = new int[DISPLAY_HEIGHT];
  }

  void update() 
  {
    x+=vx;
    y+=vy;
    
    if (x<0 || x>DISPLAY_WIDTH) vx=-vx;
    if (y<0 || y>DISPLAY_HEIGHT) vy=-vy;
    
    for (int i=0; i<DISPLAY_WIDTH; i++) bx[i] = int((x-i)*(x-i));
    for (int i=0; i<DISPLAY_HEIGHT; i++) by[i] = int((y-i)*(y-i)); 
  }
}


