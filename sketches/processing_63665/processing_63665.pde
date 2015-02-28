

int sx, sy;
float densidade = 1;//densidade do deseno
int dur = 100;//duração da animaçao
int aumento = 10;//tamanhoo dos quadrados
int[][][] desenho;//variável para o desenho
import processing.opengl.*;//import library


void setup() {

  size(1366,768, P3D);
  background(0);//cor do fundo
  stroke(0);
  
//*********************************************************************************************************


  sx = width/aumento;
  sy = height/aumento;

  desenho = new int[sx][sy][3];  

    float all = (sx * sy * densidade);
  for (int i=0; i < all; i++) {
    int ranx = (int)random(sx);
    int rany = (int)random(sy);
    desenho[ranx][rany][1] = 1;
    desenho[ranx][rany][2] = 1;
    if ((i*100/all)%10 == 0) { print("."); }
 }}



//DRAW********************************************************************************************************



void draw()
  {
    background(0);
    

//PERCURSO FEITO PELA ANIMAÇAO

for (int x=0; x<sx; x++) {
       for (int y=0; y<sy; y++) {    
          
//FADE OUTS ANIMADOS

            if (desenho[x][y][1] == -1) {
            desenho[x][y][0] = 0;  
            desenho[x][y][2] = 0;         
          }
         
//NOVOS DESENHOS ANIMADOS
      
            if ((desenho[x][y][1] == 1) || (desenho[x][y][1] == 0 && desenho[x][y][0] == 1)) 
          {
            desenho[x][y][0] = 1;
            int fadeout = 255 - desenho[x][y][2]*255/dur;
            stroke(0);
            //stroke(agecolor);
            rect(x*aumento,y*aumento,aumento-1,aumento-1); 
            fill(255,255,255, fadeout);
          }
       }
    }
    
    
    
    
    //circle of life   
    for (int x=0; x<sx; x++) {
       for (int y=0; y<sy; y++) {      
         int durquad = quadlado(x,y);
         int fadeout = quadladofadeout(x,y);
         
         
//CRIAR A PARTIR DE 3 QUADRADOS


        if (durquad == 3 && desenho[x][y][0] == 0)  { 
            desenho[x][y][1] = 1;
            int novodur = (fadeout/durquad);
            
            
            
//cOMEÇAR A CRIAR A PARTIR DO CURSOR
          
            if ((x > (mouseX/aumento - 5))&& (x < (mouseX/aumento + 5))&&(y > (mouseY/aumento - 5))&& (y < (mouseY/aumento + 5))) { desenho[x][y][2] = 1 ; }
            else { desenho[x][y][2] =  novodur; }
          }
         
          
//FADE OUT
              
              
              if (desenho[x][y][0] == 1)  {
            

  
  //FADE OUT + RAPIDO

              if ((durquad < 2 ) || (durquad > 3)) { 
                               
               desenho[x][y][2] = desenho[x][y][2] + 5  ;  
              }
             
//FADE OUT LENTO
              
              if ((durquad == 2) || (durquad == 3)) {
               desenho[x][y][2] = desenho[x][y][2] + 1 ; 
              }
             
//FADE OUT AINDA MAIS LENTO

              if (desenho[x][y][2] >= dur) {
               desenho[x][y][1] = -1;
              }
           }                    
       }
    }   
  }
    


int quadlado(int x, int y) {
  return 
//CRIAR NOVOS NA LINHA DE CIMA
         desenho[(x+sx - 1) % sx][(y + 1)%sy][0] +  
         desenho[x][(y + 1) % sy][0] + 
         desenho[(x + 1) % sx][(y + 1)%sy][0] + 
//CRIAR NOVOS NA MESMA LINHA
        desenho[(x+sx -1) % sx][y][0] + 
         desenho[(x + 1) % sx][y][0] +
///CRIAR NOVOS NA LINHA DE BAIXO
         desenho[(x + sx - 1) % sx][(y+sy - 1) % sy][0] + 
         desenho[x][(y+sy - 1) % sy][0] + 
         desenho[(x + 1) % sx][(y + sy - 1) % sy][0]; 
}

int quadladofadeout(int x, int y) {
  return 
//DURAÇAO DOS NOVOS DA LINHA DE CIMA
        desenho[(x+sx - 1) % sx][(y + 1)%sy][2] +  
         desenho[x][(y + 1) % sy][2] + 
         desenho[(x + 1) % sx][(y + 1)%sy][2] + 
//DURAÇAO DOS NOVOS DA MESMA LINHA
         desenho[(x+sx -1) % sx][y][2] + 
         desenho[(x + 1) % sx][y][2] +
//DURAÇAO DOS NOVOS DA LINHA DE BAIXO
         desenho[(x + sx - 1) % sx][(y+sy - 1) % sy][2] + 
         desenho[x][(y+sy - 1) % sy][2] + 
         desenho[(x + 1) % sx][(y + sy - 1) % sy][2]; 
}

