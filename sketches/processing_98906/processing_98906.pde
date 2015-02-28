
int longi=30;
int numcos = 50;
 
float[] posx= new float[numcos];
float[] posy= new float[numcos];
 
float[] velx= new float[numcos];
float[] vely= new float[numcos];
 
void setup(){
  colorMode(RGB,400);
  size(400,400);
  for (int i=0; i < numcos; i++){
    posx[i]=random(width-longi);
    posy[i]=random(height-longi);
     
    velx[i]=random(-5,5);
    vely[i]=random(-5,5);
  }
}
 
void draw(){
  //FONS************************************
fesElFons();
  //AFEGIR VELOCITAT***************************
for(int i=0; i<numcos;i++){
  posicionaElCos(posx[i],posy[i]);
  actualitzaLaPosicio(i);
}
  //CANTONADES**********/
 
  //COSOS**************************
 // posiconaElCos(mouseX,mouseY);
}
 

   
 //-----------------------------------------------
 // FONS FONS FONS FONS FONS FONS FONS FONS  
void fesElFons(){
    for(int i=0; i<width; i++){
 stroke(i/2,i,i/2);
 line(i,0,i,height);
 line(0,i,height,i);
}
for(int i=0; i<=width ; i+=20){
  
  line(0,i,i,i);
   line(i,0,i,i);
}
}
//FONS FONS FONS FONS FONS FONS FONS FONS FONS 
//------------------------------------------------

void posicionaElCos(float posx,float posy){
    noStroke();
  fill(0);
  rect(posx,posy,longi,longi);
  fill(400);
  ellipse(posx+longi/2,posy+longi/2,longi,longi);
}


void actualitzaLaPosicio(int i){

   posx[i]+=velx[i];
  posy[i]+=vely[i];
   if((posx[i]<0)||(posx[i]>(width-longi))){
    velx[i]=-velx[i];
  }
  if((posy[i]<0)||(posy[i]>(height-longi))){
    vely[i]=-vely[i];
  }
  }
