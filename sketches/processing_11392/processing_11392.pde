
//////
float [] fibonacci = {0,1,12,3,5,8,13,21,34};
agente_[] agentes_ = new agente_[100]; 
 color [] arraycolor = {#ADADAD,#A2A2A2,#898989,#787979,#6B6C6C,#616262,#585858,#FAFAFA,#DBDBDB,#0A0A0A,
 #212121,#3E3D3D,#AFDADB,#9EC3C4,#92B3B4,#85A4A5,#789293,#6F8586,#7C8889,#657676,#566767,#4D5555,#323B3B};
void setup(){
  size (900,600);
background (255); 
 for(int i=0;i<100;i=i+1){ 

agentes_[i] = new agente_( (width/2),( height/2)); 
}

}

void draw(){
if (mousePressed){
 saveFrame ();
}

  for(int i=0;i<100;i++){
agentes_[i].mover_(); 
agentes_[i].dibujar_();

}

}



