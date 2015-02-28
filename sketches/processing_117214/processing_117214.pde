
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
float bom2y = random(-200,-1); 
float bom2x = random(1,499);
float bom3y = random(-200,-1); 
float bom3x = random(1,499);
float bom4y = random(-200,-1); 
float bom4x = random(1,499);
float bom5y = random(-200,-1); 
float bom5x = random(1,499);
void draw() {
  background(255,255,255);
  fill(0,0,0);
 rect(xprik,yprik,10,10);
 if (keyPressed){
   if(key == 'd' || key == 'D'){
   xprik =xprik+5;
}

 }
  if (keyPressed){
   if(key == 'a' || key == 'A'){
   xprik =xprik-5;
}
  }
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
  if (d<5){
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
  if (d<5){
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
  if (d<5){
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
  if (d<5){
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
  if (d<5){
    fill(0,0,0);
    rect(0,0,500,500);
    exit();
  }
}
