
int nLinhas = 20;
int posY = 0;
boolean segura = false;

float[][] linhasParadas = new float[nLinhas][8];
float[][] linhasMovendo = new float[nLinhas][8];


void setup(){
  size(400, 400);
  noFill();
  stroke(100);
  background(0);

  //armazendo as coordenadas das linhas em um array multidimensional
  for(int i = 0; i < nLinhas; i++){
    linhasParadas[i][0] = 0;    
    linhasParadas[i][2] = 0;
    linhasParadas[i][4] = width;
    linhasParadas[i][6] = width;

    linhasMovendo[i][0] = 0;    
    linhasMovendo[i][2] = 0;
    linhasMovendo[i][4] = width;
    linhasMovendo[i][6] = width;

    for(int j = 1; j < 8; j+=2){
      posY = i * (height / nLinhas);
      linhasParadas[i][j] = posY;
      linhasMovendo[i][j] = posY;
    }
  }
  
  //desenhando as linhas
  for(int i = 0; i < nLinhas; i++){
    bezier(linhasParadas[i][0],
           linhasParadas[i][1],
           linhasParadas[i][2],
           linhasParadas[i][3],
           linhasParadas[i][4],
           linhasParadas[i][5],
           linhasParadas[i][6],
           linhasParadas[i][7]);
  }  
}

void draw(){
  if(segura){
    arrasta();
  }else{
    volta();
  }
}


void mousePressed(){
  segura = true;
}

void mouseReleased(){
  segura = false;
}  

void volta(){
  background(0);
  for(int i = 0; i < nLinhas; i++){ 

    if(linhasMovendo[i][3] != linhasParadas[i][3]){
      linhasMovendo[i][3] = (linhasMovendo[i][3] + linhasParadas[i][3])/2;
      linhasMovendo[i][5] = (linhasMovendo[i][5] + linhasParadas[i][5])/2;
    }
    
    linhas(i);
  }
}


//Função que "arrasta" as linhas
void arrasta(){
  background(0);  
  for(int i = 0; i < nLinhas; i++){
/*    for(int j = 3; j < 6; j+=2){
      linhasMovendo[i][j] = mouseY;
    }
*/

    if(linhasMovendo[i][3] != mouseY){
      linhasMovendo[i][3] = (linhasMovendo[i][3] + mouseY)/2;
      linhasMovendo[i][5] = (linhasMovendo[i][5] + mouseY)/2;
    }


    linhas(i);
  }
}

//Função que desenha as linhas
void linhas(int i){
      bezier(linhasMovendo[i][0],
             linhasMovendo[i][1],
             linhasMovendo[i][2],
             linhasMovendo[i][3],
             linhasMovendo[i][4],
             linhasMovendo[i][5],
             linhasMovendo[i][6],
             linhasMovendo[i][7]);
}

