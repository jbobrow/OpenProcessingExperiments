

float [] fibonacci = {2,1,4,3.3,5.43224,.444,.666,.67644,.55555,.21,1.2222,3.423,3,5,8,5,3,9,3.567543,3.33,2,1,7,2,1.7,2,3.141617,3,3.5,3.4};
agente_[] agentes_ = new agente_[120]; 
 color [] arraycolor = {#9D1515,#980909 ,#240101,#390909,#900303,#C90404,#0A0A0A,#BCBCBC,#9D9D9D,#982222,#C13737,#5D5858,#8E8C8C,#080707,#242424,
 #831D1D,#6A2222,#766901,#BCAA1E,#BCAA1E,#938E68,#818079,#080806,#080806,#080806,#232925,#232925,#414642};

void setup(){
  size (1100,650);
 for(int i=0;i<120;i=i+1){ 
background (255); 
agentes_[i] = new agente_( random (0), height); 
}

}

void draw(){
if (mousePressed){
  saveFrame ();
}

  for(int i=0;i<120;i++){
agentes_[i].mover_(); 
agentes_[i].dibujar_();

}

}



