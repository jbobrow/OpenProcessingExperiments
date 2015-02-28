
//Tarea Programacion Manfred BUcher

int nBolas=50;
int rango;//Tomado de melania
int [][] bolas = new int[nBolas][50];
 
void setup() {
  size(600, 600);
  rango=(int)random(100);
  for (int i=0;i<nBolas;i++) {
    bolas[i][0]=(int)random(width);
    bolas[i][1]=(int)random(height);
    bolas[i][2]=(int)random(width);
    bolas[i][3]=(int)random(height);
    bolas[i][4]=(int)random(90);
    bolas[i][5]=(int)random(50,100);
    bolas[i][6]=(int)random(0);
    bolas[i][7]=(int)random(255);

  }
}
 
void draw() {
  background(255);   
  for (int i=0;i<nBolas;i++) {
     
    fill(bolas[i][6],bolas[i][7]);
    ellipse(bolas[i][0], bolas[i][1], bolas[i][4], bolas[i][4]);
     
    int v= bolas[i][5];//Tomado de Melania
    bolas[i][0]+=(bolas[i][2]-bolas[i][0])/v;
    bolas[i][1]+=(bolas[i][3]-bolas[i][1])/v;
     
    int cx= bolas[i][0]-bolas[i][2];
    int cy= bolas[i][1]-bolas[i][3];
    if(((cx<v)&&(cx>-v))&&(cy<v)&&(cy>-v))
        {
        bolas[i][2]=(int)random(width);
        bolas[i][3]=(int)random(height);
        }
         
     for (int p=0;p<nBolas;p++) {
       if(i!=p){
          
            int distancia = (int)sqrt(sq(bolas[i][0]-bolas[p][0])+sq(bolas[i][1]-bolas[p][1]));
          
         if(distancia<rango){
           
           line(bolas[i][0],bolas[i][1],bolas[p][0],bolas[p][1]);
         }
         } 
         }
         }
    
    print("x="+bolas[0][0]+" y="+bolas[0][1]+" a="+bolas[0][2]+" b="+bolas[0][3]+"\n");//Tomado de Melania
}
