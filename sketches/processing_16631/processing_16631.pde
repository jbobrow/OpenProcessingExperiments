
PImage foto;
int npartes;
float espaco;
PImage parte0, parte1, parte2, parte3;
int larg,alt;
PImage parte[][]= new PImage[50][50];
//println();

void setup(){

  size(1000,800);
  background(0);

  npartes = 10;
  espaco = 1;

  foto = loadImage ("2.jpg");
  
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
 background(0);
  for (int i=0; i<npartes; i++){
    for (int j = 0; j < npartes; j++){
      //espaco = dist(50*i,50*j,mouseX,mouseY)/10;
      float d=dist(50*i,50*j,mouseX,mouseY)/10;
      image (parte[i][j],i*(larg+espaco),j*(alt+espaco),parte[i][j].width+d,parte[i][j].height+d);
    }
  }
}
void mouseClicked(){
  save("tela" + hour()+second()+ ".jpg"); 
}

