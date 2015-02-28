
/* Berta Aracil López 
   Informàtica - Practica 4
   2n GEDI - Grup 02 */


//Declaració de les variables pel fons
int distanciaX,distanciaY;
int nh,nv,nhh,nvv;
color colorflor;
int abelles= 10;

//Matriu de posicions X i Y amb "abelles" elements:
float[] posX = new float[abelles];
float[] posY = new float[abelles];
//i per les velocitats X i Y:
float[] velX = new float[abelles];
float[] velY = new float[abelles];

//Declaració de les variables pel dibuix de l'abella
int sz1,sz2;
int u1,u2;
boolean mides,mides2;



void setup() {
  //Mesures per al fons estàtic
  distanciaX=25;
  distanciaY=25;
  nh=22;nv=22;
  nhh=10;nvv=10;
  size(distanciaX*nh+nh,distanciaY*nv+nv);
  frameRate(30);
  
  //Inicialitzem les posicions i les velocitats:
  for(int i=0; i<abelles; i++){ 
  posX[i]= int(random(50,width-50));
  posY[i]= int(random(50,height-50));
  velX[i]= random(2,10);
  velY[i]= random(2,10);
  }
  
  //Mesures per les abelles
  sz1=50;sz2=40;
  u1=20;u2=10;
  noStroke(); 
}



void draw() {
  //Fons estàtic  
  background(85,200,30);
  colorflor=int(color(255,2,80));
  //Bucle per dibuixar el fons
  for (int x=nh; x<width; x+=distanciaX) for (int y=nv; y<height; y+=distanciaY){
  fill(colorflor,120); //Color transperent dels cercles més grans
  ellipse(x,y,nh,nv);
  fill(colorflor);
  ellipse(x,y,nhh,nvv);
  }
  
  //Bucle per dibuixar les abelles en moviment
  for(int i=0; i<abelles; i++){
    posX[i] += velX[i];
    posY[i] += velY[i];
    
    //Comprobem limits X perquè rebotin
    if((posX[i]<0+45)||(posX[i]>width-38)){
      velX[i] = -velX[i];
    } 
    //Comprobem limits Y perquè rebotin
    if((posY[i]<0+35)||(posY[i]>height-35)){
      velY[i] = -velY[i];
    } 
  
  //Dibuix de l'abella
  noStroke();fill(250,255,25);
  ellipse(posX[i],posY[i],sz1,sz2);
  
    //ulls
    stroke(0);strokeWeight(2); fill(255);
    ellipse(posX[i]-20,posY[i]-10,u1,u1); ellipse(posX[i]-20,posY[i]+10,u1,u1);
    noStroke(); fill(0);
    ellipse(posX[i]-20,posY[i]-10,u2,u2); ellipse(posX[i]-20,posY[i]+10,u2,u2);
    //cos
    stroke(0);
    line(posX[i],posY[i]+16,posX[i],posY[i]-16);
    line(posX[i]+5,posY[i]+16,posX[i]+5,posY[i]-16);
    line(posX[i]+10,posY[i]+14,posX[i]+10,posY[i]-14);
    line(posX[i]+15,posY[i]+12,posX[i]+15,posY[i]-12);
    triangle(posX[i]+25,posY[i]+5,posX[i]+25,posY[i]-5,posX[i]+30,posY[i]); 
    //ales
    fill(10,60,150,80); noStroke();
    ellipse(posX[i]+15,posY[i]+10,45,25);ellipse(posX[i]+15,posY[i]-10,45,25);
  }
}
void mousePressed(){
  /*En clicar amb el ratolí els uls de les abelles augmentaran les dimensions. 
  Amb un segon clic, recuperaran les dimensions originals.*/
  mides=mides==false;
  if(mides){
    u1=u1+10;
  }
  else{
    u1=u1-10;
  }
  mides2=mides2==false;
  if(mides2){
    u2=u2+5;
  }
  else{
    u2=u2-5;
  }

}



