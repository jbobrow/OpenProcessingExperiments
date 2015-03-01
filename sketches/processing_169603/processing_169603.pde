
//Judit Parés - GEDI 301


int num_dibuixos = 15;


float [] posicionsX = new float [num_dibuixos];
float [] posicionsY = new float [num_dibuixos];
float [] velocitatsX = new float [num_dibuixos];
float [] velocitatsY = new float [num_dibuixos];
int [] sz = new int [num_dibuixos];
color [] color_llas = new int [num_dibuixos];
color [] color_botons = new int [num_dibuixos];


void setup(){
  size(600,600);
  //inicialitzem posicions i velocitats
  
  noStroke(); //El posem aquí perquè sinó es repeteix massa vegades
  for(int i=0; i<num_dibuixos; i++)
  {
    posicionsX[i] = width/2;
    posicionsY[i] = height/2;
    velocitatsX[i]= random(1,3);
    velocitatsY[i] = random(1,3);
    color_llas [i] = color(int(random(50,100)),int(random(50,100)), int(random(50,100)));
    color_botons [i] = color(227,225, int(random(0,255)));
  
    
  }

 
}

void draw(){

    background(247,245,240);

for(int i=0; i < num_dibuixos; i++)
{
    modificar_pos(i);
    comprovar_lim(i);
    dibuixar_personatge(i);
}
    
}

 
void modificar_pos (int _i)
{
    posicionsX[_i]  += velocitatsX[_i] ;
    posicionsY [_i] += velocitatsY[_i] ;
}


void comprovar_lim(int _i)
{
    //comprobem lÃ­mits X
    if((posicionsX[_i] < sz[_i])||(posicionsX[_i] > width-sz [_i]))
    {
      velocitatsX [_i] = -velocitatsX[_i] ;
    } 
    //comprobem lÃ­mits Y
    if((posicionsY [_i]< sz[_i])||(posicionsY[_i] >height-sz[_i]))
    {
      velocitatsY [_i] = -velocitatsY[_i] ;
    } 
}

void dibuixar_personatge(int _i)
{
 
  //CARA I MANS
    fill (234,222,201);
   ellipse(posicionsX[_i] ,posicionsY[_i] ,50+sz[_i],50+sz[_i]);
   ellipse(posicionsX[_i]-30 ,posicionsY[_i]+90 ,15+sz[_i],15+sz[_i]);
    ellipse(posicionsX[_i]+30 ,posicionsY[_i]+90 ,15+sz[_i],15+sz[_i]);
   
   //BARRET
   fill(0);
   rect(posicionsX[_i]-25 ,posicionsY[_i]-80 ,50+sz[_i],70+sz[_i],8);
   
   //SAMARRETA I BRAÇOS
   fill(191,31,35);
   rect(posicionsX[_i]-25 ,posicionsY[_i]+25,50+sz[_i],70+sz[_i],8);
   rect (posicionsX[_i]-40 ,posicionsY[_i]+29,15+sz[_i],58+sz[_i],4);
   rect (posicionsX[_i]+25 ,posicionsY[_i]+29,15+sz[_i],58+sz[_i],4);
   
   //LLAÇ
   fill(color_llas [_i]);
   ellipse(posicionsX[_i] ,posicionsY[_i]+27 ,10+sz[_i],10+sz[_i]);
   triangle(posicionsX[_i] ,posicionsY[_i]+27, posicionsX[_i]+15 ,posicionsY[_i]+16, posicionsX[_i]+15,posicionsY[_i]+36);
   triangle(posicionsX[_i] ,posicionsY[_i]+27, posicionsX[_i]-15 ,posicionsY[_i]+16, posicionsX[_i]-15 ,posicionsY[_i]+36);
 
   //BOTONS
   fill(color_botons [_i]);
   ellipse(posicionsX[_i] ,posicionsY[_i]+40 ,10+sz[_i],10+sz[_i]);
   ellipse(posicionsX[_i] ,posicionsY[_i]+60 ,10+sz[_i],10+sz[_i]);
   ellipse(posicionsX[_i] ,posicionsY[_i]+80 ,10+sz[_i],10+sz[_i]);
}








