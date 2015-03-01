
///PRÀCTICA FINAL RELLOTGE//////
//Taller de creació de videojocs
//Clara Borràs Coll


///VARIABLES GENERALS/////


//Variables moviments i tamanys

float mida = 150;
float minimida = 15;

float bolaHY = map(hour(),0,23,0,height);
float bolaMY = map(minute(),0,59,0,height);
float bolaSY = map(second(),0,59,0,height);

int totalbolesH = 23;

//Colors

color grisbarra = (#7C7873);
color griscorda = (#797272);


    ///fresa
color fresafort = (#ED3524);

color fresa = (#E84B4B);
color fresaclaret = color(246,206,190);

   ///turqueses
color turquesafort = color(93,179,133);
color turquesa = color(36,204,139);
color turquesaclaret = color(185,239,199);

   ///blaus
color blaufort = color(35,196,204);
color blau = color(99,216,246);
color blauclaret = color(157,211,239);


//////COMENCEM/////////////

void setup() {
  size(600, 500);
  strokeWeight(3);
 
}



void draw() {
  background(#D3D1D1);
  
  
  liniesY();
  liniesboles();
  
   
  movimentbolaS();
  movimentbolaM(); 
  movimentbolaH();
  
 

  
  //enreresegons();
  //enrereminuts();
  //enrerehores();
  
  
}







/////////////////////////////////////////////////////////
/////////////////FUNCIONS////////////////////////////////


  
////Bola segons////  

void movimentbolaS(){
  bolaSY = map(second(),0,59,0,height);
 
  float midasegons =second()*mida/59;
 
  fill(fresaclaret,220);
  ellipse(mida*3,bolaSY,mida,mida);
  fill(fresa,120);
  ellipse(mida*3,bolaSY,midasegons,midasegons); //dibuixem bola segons
   
  
   
}


////Bola minuts////

void movimentbolaM(){
  bolaMY = map(minute(),0,59,0,height);
   float midaminuts =minute()*mida/59;
 
  
  fill(blauclaret,160);
  ellipse(mida*2,bolaMY,mida,mida);
  
  fill(blau,150);
  ellipse(mida*2,bolaMY,midaminuts,midaminuts); //dibuixem bola minuts
  
  
  
}


////Bola hores//// 

void movimentbolaH(){
  bolaHY = map(hour(),0,24,0,height);
   float midahores = hour()*mida/23;
  
  fill(turquesaclaret,220);
  ellipse(mida,bolaHY,mida,mida);
  fill(turquesa,160);
  ellipse(mida,bolaHY,midahores,midahores); //dibuixem bola hores
}


//////COMPTEE ENRERE///////

void enreresegons(){
  textSize(120);
  //textAlign(CENTER);
  fill(fresa,60);
  text(60-second(),mida*3,height/2+minimida+minimida/2);
}

void enrereminuts(){
  textSize(150);
  textAlign(CENTER);
  fill(blau,60);
  text(60-minute(),mida*2,height/2+minimida*2);
}

void enrerehores(){
  textSize(200);
  textAlign(CENTER);
  fill(turquesa,70);
  text(24-hour(),mida,height/2+minimida*3);
}


////////LÍNIES i QUADRATS//////

void liniesY(){
  strokeWeight(40);
  stroke(grisbarra,400);
  line(mida, 0, mida, mida*4);
  line(mida*2, 0, mida*2, mida*4);
  line(mida*3, 0, mida*3, mida*4);
  line(14, 0, 14, mida*4);
  line(width-minimida, 0, width-minimida, mida*5);
  
}


void liniesboles(){
  fill(#D3D1D1);
  stroke(griscorda);
  strokeWeight(2);
  line(mida+75,bolaHY,mida*2-75,bolaMY); // entre hores i minuts
  line(mida+75,bolaHY,mida*2-75,bolaMY+minimida);
  line(mida+75,bolaHY,mida*2-75,bolaMY-minimida);
  
  line(mida*2+75,bolaMY,mida*3-75,bolaSY); // entre m i s
  
  ellipse(width-minimida,height/2,minimida,minimida);
  line(0+minimida,height/2,mida-75,bolaHY); // desde l'esquerra
  line(0+minimida,height/2,mida-75,bolaHY-minimida);
  line(0+minimida,height/2,mida-75,bolaHY+minimida);
  
  
  ellipse(0+minimida,height/2,minimida,minimida);
  line(mida*3+75,bolaSY,width-minimida,height/2); // desde la dreta
  line(mida*3+75,bolaSY+minimida,width-minimida,height/2);
  line(mida*3+75,bolaSY-minimida,width-minimida,height/2);
  
}

