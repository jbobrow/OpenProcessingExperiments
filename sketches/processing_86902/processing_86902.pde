
//Autor Luis Romero Ballesta
//Assignatura Programació
//1ºASIX (TARDA)
//Centre d'Estudis Roca
neu[] neus;
float blocksize;
  
void setup(){
  size(500, 500);
  blocksize=1;
  smooth();  
  neus = new neu[600];
  for (int i=0; i<600; i++){
    neus[i] = new neu();
    neus[i].luisx = random(5,600);
    neus[i].luisy = random(5,600);    
  }  
}  
void draw(){
   background(#000000);
   fill(#FAFF00);
   ellipse(100,60,3,3);
   ellipse(200,90,3,3);
   ellipse(250,120,3,3);
   ellipse(150,150,3,3);
   ellipse(20,180,3,3);
   ellipse(0,100,3,3);
   ellipse(80,160,3,3);
   ellipse(180,50,3,3);
   ellipse(140,60,3,3);
   ellipse(220,120,3,3);
   fill (#ACAFA6);
   ellipse (420,60,200,200); 
   fill(#2DF70F);
   rect(0,250,200,250);
   fill(#2DF70F);
   rect(300,250,200,250);
   fill(#0F81F7);
   rect(190,250,150,250);
   for(float y = 250; y < 500; y+=blocksize) { 
   for(float x = 190; x < 340; x+=blocksize){ 
       fill(random(255),random(255)); 
       rect(x,y,blocksize,blocksize); 
       float velocitat = 0; 
       velocitat=1;
     }
   }
  for (int i=0; i<neus.length; i++)
  {
    neus[i].mou();
    neus[i].dibuixa();
  }  
}
class neu{
  float luisx, luisy;
  
    
  void dibuixa(){
    noStroke();
    fill(255);
    ellipse(luisx, luisy,5,5);
  } 
  void mou(){
    luisy =  luisy + random(5) ;  
    if (luisy>600) luisy = random(5);
  }
}


