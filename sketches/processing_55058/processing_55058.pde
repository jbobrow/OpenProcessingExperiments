
//spiral taken from Christos mousas from open processing
int counter=0;
boolean drawSpiral=false;
int spiralDelay = 150;

int i, j, c1, c2, imin=2, imax=80, k=0;
float nx, ny, u, ox=0.0, oy=0.0, a=PI/3, aa=-TWO_PI/10;

float posX = 320;
float posY = 240;
float speedX = -5;
float speedY = -5;

float posXx = 300;
float posYy = 400;
float speedXx = -2;
float speedYy = -2;

int fps = 60;
 
void setup(){
  size(640,480);
  frameRate(fps);
  smooth();
  background(255);
  c1=width/2;
  c2=height/2;
  u=c1/20;
  spiralInit();
}
 
void draw(){
  frameRate(100);
  if(counter%spiralDelay==0){
  drawSpiral=true;
  spiralInit();
  }
  
  if(drawSpiral){
   j = j + 1;
  if (j==i-1) {
    j=1; i+=1; a=PI*(i-2)/i;     
  }
  if (i<=imax) {
    newside(10,100);
  }else{
    drawSpiral=false;
  }
  }
  
  noStroke();
  fill(0,2); //generates the fading follow line
  rectMode(CORNER);
  rect(0,0,width,height);
  
  //blue/green circle
  if(posX<0 || posX > width){
  speedX *= -1;
  } 
  if(posY<0 || posY > height){
  speedY *= -1;
  } 
  posX += speedX;
  posY += speedY;
  stroke(0,random(100,255),random(100,255)); //color change
  strokeWeight(5);
  point(posX,posY);
  
  //second one
  if(posXx<0 || posXx > width){
  speedXx *= -1;
  } 
  if(posYy<0 || posYy > height){
  speedYy *= -1;
  } 
  posXx += speedXx;
  posYy += speedYy;
  stroke(random(100,255),random(100,255),0);
  strokeWeight(5);
  point(posXx,posYy);
  
  counter++;
}

void spiralInit(){
  i=imin;
  j=0;
}

void newside(float _x, float _y) {
  pushMatrix();
  translate(_x,_y);
  nx=ox+u*cos(aa);
  ny=oy+u*sin(aa);
  smooth();
  noStroke();
  fill(random(100,255),random(100,255),0);
  ellipse(ox+c1, oy+c2, 2, 2);
  ox=nx;
  oy=ny;
  aa-=(PI-a) % TWO_PI/3;///////
  k = k + 1;
  popMatrix();
}

