
//declarem les variables
int i=0;
int num_boles= 10;//definim el numero de boles que volem
int sz = 20;
float[] posX = new float[num_boles];
float[] posY = new float[num_boles];
float[] velX = new float[num_boles];
float[] velY = new float[num_boles];

void setup(){
  size(500,500);
background(0);
strokeWeight(5);
frameRate(15);// definim el temps d'intercanvi de colors
//inicialitzem les posicions i les velocitats
for(int i=0; i<num_boles; i++){
  posX[i] = int(random(width));
  posY[i] = int(random(height));
  velX[i] = 10;
  velY[i] = 10;
}
}

void draw(){
  background(0);
  //Definim la xarxa dels colors
for( i=0; i<width+500; i+=width/10){
  stroke(random(-200,300),random(-200,300),random(-200,300));
  line(i,0,i-100,height);
}
for( i=0; i<height+500; i+=height/10){
  stroke(random(-200,300),random(-200,300),random(-200,300));
  line(0,i-300,width,i-200);
}
//iniciem el bucle amb els valors definits anteriorment
//anunciem les posicions
for(int i=0; i<num_boles; i++){
  posX[i] += velX[i];
  posY[i] += velY[i];
  //limit del rebot en X
  if((posX[i]<15)||(posX[i]>width-15)){
    velX[i] = -velX[i];
  }
  //límit del rebot en Y
  if((posY[i]<10)||(posY[i]>height-10)){
    velY[i] = -velY[i];
  }
  //Definim com volem que sigui la pilota
  fill(255);
  strokeWeight(2);
  ellipse(posX[i],posY[i],sz,sz);
}
}


