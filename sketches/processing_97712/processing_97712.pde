
int longi=20;
int numcos = 10;
 
float[] posx= new float[numcos];
float[] posy= new float[numcos];
 
float[] velx= new float[numcos];
float[] vely= new float[numcos];
 
void setup(){
  colorMode(RGB,600);
  size(600,600);
  for (int i=0; i < numcos; i++){
    posx[i]=random(width-longi);
    posy[i]=random(height-longi);
     
    velx[i]=random(-20,20);
    vely[i]=random(-20,20);
  }
}
 
void draw(){
  fill(0);
rect(0,0,width,height);
  //AFEGIR VELOCITAT***************************
for(int i=0; i<numcos;i++){
  posx[i]+=velx[i];
  posy[i]+=vely[i];
  //CANTONADES**********/
  if((posx[i]<0)||(posx[i]>(width-longi))){
    velx[i]=-velx[i];
  }
  if((posy[i]<0)||(posy[i]>(height-longi))){
    vely[i]=-vely[i];
  }
  //COSOS**************************
  noStroke();
  
  fill(random(600),random(600),random(600));
  ellipse(posx[i]+longi/2,posy[i]+longi/2,longi,longi);
    if(mousePressed){
   posx[i]=mouseX;
   posy[i]=mouseY;
 }
}

}
