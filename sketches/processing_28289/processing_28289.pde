
float sizex = 75;
float sizey = 100;
float tsize = 0;
int xmove = 0;
int ymove = 0;
PImage logs;
PImage [] flames;
int frame = 0;
float oldX,oldY;
int x = 250;
int y = 250;


float fend = 250;
float fendy = 250;
int counter = 1%2;

 
void setup() {
  size (500, 500);
  //minim = new Minim(this);
  //stomp = minim.loadSample("BD.mp3", 2048);
  flames = new PImage[4];
  for(int i = 0; i<flames.length; i++) {
    flames[i] = loadImage("flame"+ (i+1) +".png");
  }
  logs = loadImage("logs.jpg");
  
}
 
 
void draw() {

  
  if(frame > 3) frame = 0;
  
  fend += random (-100,100);
  if(fend<-20)fend = -10;
  if(x < 0) x = 1;
  if(fend>520)fend = 10;
  if(x > 520) x = 499;
  x += (fend-x)*0.01;
  
  fendy += random (-100,100);
  if(fendy<-20)fendy = -10;
  if (y < 0) y = 1;
  if(fendy>520)fendy = 10;
  if(y > 520) y = 499;
  y += (fendy-y)*0.01;
 // y += (fend-y)*0.01;
  
  image(logs, 0,0, 500, 500);
   
  pushMatrix();
  
  translate(x, y-40);
  image(flames[frame], -38, -30, sizex, sizey);
  popMatrix();
  
  if (counter > 4){
    frame ++;
    counter = 0;
  }
  counter ++;
  
  if (mousePressed){
    sizex += (tsize - sizex)*0.1;
    sizey += (tsize - sizey)*0.1;
  }
  else{
    if (sizex < 75){
      sizex += (tsize + sizex)*0.1;
    }
    if (sizey < 100){
      sizey += (tsize + sizey)*0.1;
    }
  }
  
}


