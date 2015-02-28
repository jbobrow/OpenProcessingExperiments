
//import processing.video.*;

//MovieMaker mm; 
float [] fibonacci = {0,1,12,3,5,8,13,21,34};
agente_[] agentes_ = new agente_[100]; 
 
 color [] arraycolor = {#ADADAD,#A2A2A2,#898989,#787979,#6B6C6C,#616262,#585858,#FAFAFA,#DBDBDB,#0A0A0A,
 #212121,#3E3D3D,#AFDADB,#9EC3C4,#FFFFFF,#FFFFFF,#FFFFFF,#000000,#000000,#000000,#000000,#000000,#FFFFFF,
#d7e5ec, #d3dfea, #c2d7e7, #a5c6e3, #a6cbe6, #adcbe5, #77839d, #d9d9b9, #a9a978, #727b5b, #6b7c4b, #546d3e, #47472e, 
#727b52, #898a6a, #919272, #AC623b, #cb6a33, #9d5c30, #843f2b, #652c2a, #7e372b, #403229, #47392b, #3d2626, #362c26, 
#57392c, #998a72, #864d36, #544732,#BC0218,#9D0214,#B40418,#5A131B,#8E0717,#81101F,#811221,#393939,#A71629,#580B15,#A50A1F,#AF051C,#761E0C,
#48010A,#7E0414,#D88518,#8B5611,#CE821D,#A5691B,#9B1B02,#151414,#B7751E,#DE8E26,#A7A200,#211D1D,#4D4C4C,#120B0B,
#d9b166, #f5eabe, #fcfadf, #d9d1b0, #fcfadf, #d1d1ca, #a7b1ac, #879a8c, #9186ad, #776a8e,#000000,#000000,#000000,#000000,
#000000,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#000000,#000000,#000000,#000000,#000000,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF};
PFont fontA;

void setup(){
  size (700,450);
background (255); 
fontA = loadFont("Tahoma-48.vlw");
textFont(fontA, 11);
 for(int i=0;i<100;i=i+1){ 

agentes_[i] = new agente_( (width/2),( height/2)); 
}

}

void draw(){
//if (mousePressed){
// saveFrame ();
//}

fill (0);
 rect (width-80,0,width,12);
 fill(255);
  text("R = RESTART", width-70, 10);
  
  for(int i=0;i<100;i++){
agentes_[i].mover_(); 
agentes_[i].dibujar_();

}
//mm.addFrame();
}



