
PVector Pos;
 
int numAst =10;
int bullCount = 10;
 
int currshot =1;
int cannon = 0;
int score =0;
int timer = 0;
 
PVector Rocks[] = new PVector[numAst];
PVector Bulls[] = new PVector[bullCount];
 
float rot;
float rto;
 
float fallSpeed = 1.5;
 
float speedx[] = new float[bullCount];
float speedy[] = new float[bullCount];
 
Boolean Fire = true;


PImage pug_left;
PImage pug_right;
PImage castle;

int direction=0;
int pugx=0;
int pugy=0;

void setup(){
  size(800,550);

  pug_left=loadImage("pug_left.png");
  pug_right=loadImage("pug_right.png");
  castle=loadImage("Dragon_and_castle_landscape_by_grebenru.jpg");
  
  Pos = new PVector(250,600);

  for(int num =0; num<bullCount; num++) {
    Bulls[num] = new PVector(0,600);
    speedx[num] = 10*cos(rot);
    speedy[num] = 10*sin(rot);
  }
}


void draw(){
    image(castle, 0, 0);
  pushMatrix();
  translate(20,5);
 
  fill(255);
 
  if(mouseX <= Pos.x +20) rto = 180;
  else rto = 0;
 
  rot = atan( -(Pos.y-mouseY +5)/(Pos.x-mouseX +20) ) +radians(rto);
 
  if(Fire==false) timer++;
  else timer=0;
  if(timer >=15){
  Fire =true;
  timer =0;
  }
 
  missle(Rocks);
     
  translate(pugx+90,pugy+160);
  rotate(rot + radians(90));
  rect(-5,-40,10,40);
  ellipse(0,0, 20,20);
  popMatrix();
   
  
  pug();
}


void pug(){
  if(direction==0){
  image(pug_right, pugx, pugy);
  pugx+=1;
  if(pugx>600){
    direction=1;
  }
  }
  if(direction==1){
    image(pug_left,pugx,pugy);
    pugx-=1;
    if(pugx<0){
    direction=0;
 }
  }
}
  
  
  void missle(PVector[] bos) {
    float X=0;
    
  if((mousePressed && Fire ==true)) {
    Bulls[currshot].x += speedx[currshot];
    Bulls[currshot].y += speedy[currshot];
    Fire =false;
    currshot +=1;
  }
 
  for(int shoo =0; shoo < bullCount; shoo++) {
    if(currshot >= bullCount) currshot = 1;
 
    if(Bulls[shoo].dist(Pos) == 0) {
      speedx[shoo] = 10*cos(rot);
      speedy[shoo] = 10*sin(rot);
    }
 
    if(Bulls[shoo].dist(Pos) > 0) {
      Bulls[shoo].x += speedx[shoo];
      Bulls[shoo].y += speedy[shoo];
    }
    if(Bulls[shoo].x >800 || Bulls[shoo].x < -800 || Bulls[shoo].y < -800) {
      Bulls[shoo].x = 250;
      Bulls[shoo].y = 600;
    }
    ellipse((Bulls[shoo].x+pugx-160), Bulls[shoo].y-450, 20,20);
  }
}
 
void mouseReleased() {
  Fire=true;
}


