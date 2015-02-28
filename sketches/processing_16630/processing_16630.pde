

PImage foto;
PImage fundo;
int npartes;
float espaco;
PImage parte0, parte1, parte2, parte3;
int larg,alt;
PImage parte[][]= new PImage[50][50];
//println();

void setup(){

  size(800,600);
  

  npartes = 50;
  espaco = 0.5;

  foto = loadImage ("onda.gif");
  fundo = loadImage ("onda.gif");
  
  larg = foto.width/npartes;
  //define a largura da parte.

  alt = foto.height/npartes;
  //define a altura da altura.

  for (int i = 0; i < npartes; i++){
    for (int j = 0; j < npartes; j++){
      parte[i][j] = foto.get(i*larg,j*alt,larg,alt);
    }
  }
}
void draw(){
 image (fundo,0,0);
  for (int i=0; i<npartes; i++){
    for (int j = 0; j < npartes; j++){
      espaco = dist(1*i,1*j,mouseX,mouseY)/10;
     
      image (parte[i][j],i*(larg+espaco),j*(alt+espaco));
    }
  }
}
void mouseClicked(){
  save("tela" + hour()+second()+ ".jpg"); 
}

