
//tamanho do array
int s = 20;
//posicoes

float posx[];
float posy[];

//indice 
int pindex=0;
//int posicao=0;

void setup(){
 size(500,500); 
 //inicializo os arrays com tamanho S  
 posx = new float[s];
 posy = new float[s];


  
}


void draw(){
  background(0);
  noStroke();
  for(int posicao = 0; posicao < s ; posicao ++){
    fill(255,0,0);
    rect(posx[posicao],posy[posicao],10,10);
  }
  
}

void mouseMoved(){
  posx[pindex] = mouseX;
  posy[pindex] = mouseY;
  pindex++; //isso é igual a pindex = pindex +1;
  if(pindex >=s){
    pindex = 0; 
  }
  
}

//--------///
