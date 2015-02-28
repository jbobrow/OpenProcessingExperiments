
void setup() {
 size(500,500);
   
}
int xprik = 250;
int yprik = 489;
float bomy = random(-200,-1); 
float bomx = random(1,499);
float d =sqrt((bomx-xprik)*(bomx-xprik)+(bomy-yprik)*(bomy-yprik));
float fart = random(1,20);
float fart2 = random(1,20);
float fart3 = random(1,20);
float fart4 = random(1,20);
float fart5 = random(1,20);
float fart6 = random(1,20);
float fart7 = random(1,20);
float fart8 = random(1,20);
float fart9 = random(1,20);
float fart10 = random(1,20);
float bom2y = random(-200,-1); 
float bom2x = random(1,499);
float bom3y = random(-200,-1); 
float bom3x = random(1,499);
float bom4y = random(-200,-1); 
float bom4x = random(1,499);
float bom5y = random(-200,-1); 
float bom5x = random(1,499);
float bom6y = random(-200,-1); 
float bom6x = random(1,499);
float bom7y = random(-200,-1); 
float bom7x = random(1,499);
float bom8y = random(-200,-1); 
float bom8x = random(1,499);
float bom9y = random(-200,-1); 
float bom9x = random(1,499);
float bom10y = random(-200,-1); 
float bom10x = random(1,499);
int farezone =12;
int fartBoost;
int e = 1;

void draw() {
 Start();
 styring();
 farezone = 8;
 Bombefald();
}
  void Start()
  {
   background(255,255,255);
  fill(0,0,0);
 rect(xprik,yprik,10,10);
  }
 void styring()
 {
 if (keyPressed){
   if(key == 'd' || key == 'D'){
   fartBoost=xprik+rumskibsfart(xprik,e);
     xprik =xprik+5;
}
 }
  if (keyPressed){
   if(key == 'a' || key == 'A'){
   fartBoost=xprik+rumskibsfart(xprik,e);
     xprik =xprik-5;
}
  }
 }
 void Bombefald()
  {
  fart = random(1,20);
   stroke(0,0,0);
  ellipse(bomx,bomy,5,5);
  bomy = bomy + fart;
  if (bomy >=501){
    bomy = random(-200,-1);
    bomx = random(0,499);
    ellipse(bomx,bomy,5,5);
  }
  d =sqrt((bomx-xprik)*(bomx-xprik)+(bomy-yprik)*(bomy-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
  fart2 = random(1,20);
   stroke(0,0,0);
  ellipse(bom2x,bom2y,5,5);
  bom2y = bom2y + fart2;
  if (bom2y >=501){
    bom2y = random(-200,-1);
    bom2x = random(0,499);
    ellipse(bom2x,bom2y,5,5);
  }
  d =sqrt((bom2x-xprik)*(bom2x-xprik)+(bom2y-yprik)*(bom2y-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
  fart3 = random(1,20);
stroke(0,0,0);
  ellipse(bom3x,bom3y,5,5);
  bom3y = bom3y + fart3;
  if (bom3y >=501){
    bom3y = random(-200,-1);
    bom3x = random(0,499);
    ellipse(bom3x,bom3y,5,5);
  }
  d =sqrt((bom3x-xprik)*(bom3x-xprik)+(bom3y-yprik)*(bom3y-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
  fart4 = random(1,20);
stroke(0,0,0);
  ellipse(bom4x,bom4y,5,5);
  bom4y = bom4y + fart4;
  if (bom4y >=501){
    bom4y = random(-200,-1);
    bom4x = random(0,499);
    ellipse(bomx,bomy,5,5);
  }
  d =sqrt((bom4x-xprik)*(bom4x-xprik)+(bom4y-yprik)*(bom4y-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
  fart5 = random(1,20);
  stroke(0,0,0);
  ellipse(bom5x,bom5y,5,5);
  bom5y = bom5y + fart5;
  if (bomy >=501){
    bom5y = random(-200,-1);
    bom5x = random(0,499);
    ellipse(bom5x,bom5y,5,5);
  }
  d =sqrt((bom5x-xprik)*(bom5x-xprik)+(bom5y-yprik)*(bom5y-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
   fart6 = random(1,20);
   stroke(0,0,0);
  ellipse(bom6x,bom6y,5,5);
  bom6y = bom6y + fart6;
  if (bomy >=501){
    bom6y = random(-200,-1);
    bom6x = random(0,499);
    ellipse(bom6x,bom6y,5,5);
  }
  d =sqrt((bom6x-xprik)*(bom6x-xprik)+(bom6y-yprik)*(bom6y-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
}
fart7 = random(1,20);
   stroke(0,0,0);
  ellipse(bom7x,bom7y,5,5);
  bom7y = bom7y + fart7;
  if (bom7y >=501){
    bom7y = random(-200,-1);
    bom7x = random(0,499);
    ellipse(bom7x,bom7y,5,5);
  }
  d =sqrt((bom7x-xprik)*(bom7x-xprik)+(bom7y-yprik)*(bom7y-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
  fart8 = random(1,20);
   stroke(0,0,0);
  ellipse(bom8x,bom8y,5,5);
  bom8y = bom8y + fart;
  if (bom8y >=501){
    bom8y = random(-200,-1);
    bom8x = random(0,499);
    ellipse(bom8x,bom8y,5,5);
  }
  d =sqrt((bom8x-xprik)*(bom8x-xprik)+(bom8y-yprik)*(bom8y-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
  fart9 = random(1,20);
   stroke(0,0,0);
  ellipse(bom9x,bom9y,5,5);
  bom8y = bom9y + fart9;
  if (bom9y >=501){
    bom9y = random(-200,-1);
    bom9x = random(0,499);
    ellipse(bom9x,bom9y,5,5);
  }
  d =sqrt((bom9x-xprik)*(bom9x-xprik)+(bom9y-yprik)*(bom9y-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
  fart10 = random(1,20);
   stroke(0,0,0);
  ellipse(bom10x,bom10y,5,5);
  bom10y = bom10y + fart;
  if (bom10y >=501){
    bom10y = random(-200,-1);
    bom10x = random(0,499);
    ellipse(bom10x,bom10y,5,5);
  }
  d =sqrt((bom10x-xprik)*(bom10x-xprik)+(bom10y-yprik)*(bom10y-yprik));
  if (d<farezone){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
  }
  int rumskibsfart(int x,int y)
  {
    int poul = x +y;
    return poul;
}
