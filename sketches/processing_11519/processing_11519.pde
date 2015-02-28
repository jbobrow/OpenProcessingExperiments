
//nnnn
//import processing.video.*;

agente_[] agentes_ = new agente_[250]; 
//MovieMaker mm; 

 color [] rojo2 = {#7C0404,#710B0B,#7C1313,#A00A0A,#A20D0D,#2E0000,#811717,#400D0D,#B71414,#860F0F,#9B0808,#AA1515,#E32020,#830C0C,
 #BC0218,#9D0214,#B40418,#5A131B,#8E0717,#81101F,#811221,#A71629,#580B15,#A50A1F,#AF051C,#48010A,#7E0414,#D88518,#8B5611,#CE821D,#A5691B,
 #B7751E,#DE8E26,#ffffff,#818181,#0F0F0F,#1F1F1F,#270104,#2C2829,#585354,#313131,#484747,#626262,#7C7C7C,#D8D6D6,#0A0A0A,#D6D6D6,
 #B4B2B2,#121212,#585757,#343333,#1F1F1F,#F0F0F0,#CECCCC,#989898,#3E3D3D,#5F5E5E,#7C7C7C,#C6C6C6,#FAFAFA,#CBC9C9,#F5F5F5,#E8E8E8};

void setup(){
  size (900,700);
background (255); 
 for(int i=0;i<150;i=i+1){ 
agentes_[i] = new agente_( (width/2),( height/2)); 

}
//mm = new MovieMaker(this, width, height, "segun.mov", 30, 
  //      MovieMaker.ANIMATION, MovieMaker.HIGH);
}

void draw(){
if (mousePressed){
 
saveFrame ();
 
 }
  for(int i=0;i<150;i++){
agentes_[i].mover_(); 
agentes_[i].dibujar_();

}
//mm.addFrame();
}



