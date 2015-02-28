

int colunas=400;
int linhas=400;
float porcentagem;
int pontosX[]=new int [100];
int pontosY[]=new int [100];
int indice=0;
int populacao[][]=new int [linhas+2][colunas+2];
int i,j;
int conta;
int distancia;

void setup(){
  size(linhas+2,colunas+2,P2D);
  background(155,200,0);
  conta=-500;
  distancia=10;
  for (i = 0; i < linhas+2; i++) {
    for (j = 0; j < colunas+2; j++) {
      populacao[i][j] = 0;
    }
  }
  populacao[int(random(linhas)+1)][int(random(colunas)+1)]=11000;
  
}


void draw(){
  int x, y, contador,aleatorizador,maximo,locX, locY;
  conta++;
  if (conta==150){
    //println("passou");
    conta=0;
    maximo=0;
    locX=0;
    locY=0;
    for (i = 1; i < linhas+1; i++) {
    for (j = 1; j < colunas+1; j++) {
      contador=0;
      
      for (x=0;x<5;x++){
        for (y=0;y<5;y++){
            boolean invalido=false;
            if (i-2+x<0) break;
            if (j-2+y<0) break;
            if (i-2+x>401) break;
            if (j-2+y>401) break;
            contador+=populacao[i-2+x][j-2+y];
            if (contador>maximo){
              for (int k=0;k<indice;k++){
                if (dist(i-1+x,j-1+y,pontosX[k],pontosY[k])<distancia){
                  invalido=true;
                }
              } 
                  
              if (invalido==false){
              maximo=contador;
              locX=i;
              locY=j;
              }
            }
        }
      }
    }
    }
    pontosX[indice]=locX;
    pontosY[indice]=locY;
    indice++;
    distancia++;
  }
  
  
  for (i = 1; i < linhas+1; i++) {
    for (j = 1; j < colunas+1; j++) {
      contador=0;
      aleatorizador=0;
      for (x=0;x<3;x++){
        for (y=0;y<3;y++){
          
            contador+=populacao[i-1+x][j-1+y];
            if (populacao[i-1+x][j-1+y]>2000){
              aleatorizador+=1;
            }
        }
      }
      
      if (contador!=0){
        
        porcentagem=0.0855/(5*(pow(contador,0.233)));
        porcentagem+=0.003*noise(i,j);
        
        
         if (aleatorizador==2)
        porcentagem=-4*porcentagem;
         if (aleatorizador==3)
        porcentagem=-10*porcentagem;
         if (aleatorizador==4)
        porcentagem=2*porcentagem;
         if (aleatorizador==5)
        porcentagem=5*porcentagem;
         if (aleatorizador==6)
        porcentagem=6*porcentagem;
         if (aleatorizador==7)
        porcentagem=2*porcentagem;
         if (aleatorizador==8)
        porcentagem=2*porcentagem;
        if (aleatorizador==1)
        porcentagem=5*porcentagem;
        
        porcentagem=porcentagem*(10000-populacao[i][j])/10000;
        
        
        
        populacao[i][j]+=int(porcentagem*contador);
      }
      
      
     
  
     
       
        if (populacao[i][j]>2000){
          stroke(125-(populacao[i][j]-2000)*125/8000);
        
        point(i,j);
        }
     
     
    }
  }
  fill(255,0,0);
  for (i=0;i<indice;i++){
    
      ellipse(pontosX[i], pontosY[i],5,5);
  }  
}


void mousePressed() 
{
  save("line.jpg");
}

