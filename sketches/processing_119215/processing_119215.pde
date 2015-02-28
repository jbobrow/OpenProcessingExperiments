
//una bola:
//int posX, posY, velX, velY;
//int sz = 10;
//moltes bolas:
float[] posX = new float[400];
float[] posY = new float[400];
float[] velX = new float[400];
float[] velY = new float[400];
int i;
color[] colorboles = new int[400];
float[] sz = new float[400];
void setup(){
  size(800,800);
  for (i=0; i<400; i++)
 {
  posX[i] = width/2;
  posY[i] = height/2; 
  
  velX[i] = (random(4,10));
  velY[i] = (random(4,8));
  colorboles[i]= color(random(0,255),random(0,255),random(1),60);
  sz[i]= random(10,50);
 }
}

void draw(){
 // background(100);
  noStroke();
 fill (250);
 rect(0,0,width,height);
  for (i=0; i<100; i++)
  {
  //actualitzem posicions
  posX[i] = posX[i]+velX[i];
  posY[i] = posY[i]+velY[i];
  
  //dibuixem
  ellipse(posX[i],posY[i],sz[i],sz[i]);

  //comprovem la posicioX
  if((posX[i]<sz[i]/2)||(posX[i]>width-sz[i]/2)){
    velX[i] = -velX[i];
  } 
    //comprovem la posiciY
  if((posY[i]<sz[i]/2)||(posY[i]>height-sz[i]/2)){
    velY[i] = -velY[i];
  } 
  fill (colorboles[i]);
  
}}
