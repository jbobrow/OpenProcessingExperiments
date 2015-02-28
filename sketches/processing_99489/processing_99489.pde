
//definim les variables
int longitud=20;
int Ncercles = 10;
  
float[] posx= new float[Ncercles];
float[] posy= new float[Ncercles]; 
float[] velx= new float[Ncercles];
float[] vely= new float[Ncercles];
  
void setup(){
  colorMode(RGB,600);
  size(600,600);
  for (int i=0; i < Ncercles; i++){
    posx[i]=random(width-longitud);
    posy[i]=random(height-longitud);
      
    velx[i]=random(-20,20);
    vely[i]=random(-20,20);
  }
}
  
void draw(){
  
//DECLAREM LES FUNCIONS
  dibuixar_elFons();
 
  for(int i=0; i<Ncercles; i++){
    posiciona_elCercle(posx[i],posy[i]); //posicionarem el cercle en funció de la posició x i y (les quals hem definit anteriorment)
    actualitzar_laPosicio(i); //per cada "i" actualitzem la posició perquè es vagi repetint la funció
  }
}
////////////////////FUNCIONS///////////////////////////

void dibuixar_elFons(){ //funció de dibuiar el fons estatic

background(0);
strokeWeight(2); //gruix linies
  
 for (int i=0; i<600; i= i+6 /*separació entre linies*/) {
      
    stroke(#D3F766);
    line(width/2,width/2, 0,i);
    line(height/2,height/2,height,i);      
    stroke(#5A6C2C);
    line(width/2,width/2, i,0);
    line(height/2,height/2,i,height);      
  }
}

void posiciona_elCercle(float posx,float posy){ //funció per dibuixar els cercles en funció de posx i posy
noStroke();
   
  fill(random(600),random(600),random(600));
  ellipse(posx+longitud/2,posy+longitud/2,longitud,longitud);

}
 
 
void actualitzar_laPosicio(int i){ //en funció de i actualitzem la posició dels cercles
 
  //velocitat i límits 
  posx[i]+=velx[i];
  posy[i]+=vely[i];
  
  if((posx[i]<0)||(posx[i]>(width-longitud))) {  
    velx[i]=-velx[i]; }
  
  if((posy[i]<0)||(posy[i]>(height-longitud))) {
    vely[i]=-vely[i]; }
    
  if(mousePressed){ //al clicar a pantalla, es reuniran totes les boles, i al soltar, comenaran a rebotar d
    posx[i]=mouseX;
    posy[i]=mouseY;
 }
}




