
int num_ossos = 30;

float[] posicionsX = new float[num_ossos];
float[] posicionsY = new float[num_ossos];
float[]velocitatsX = new float[num_ossos];
float[] velocitatsY = new float[num_ossos];
int[] sz = new int [num_ossos];
color [] color_ossos = new int [num_ossos];

void setup(){
  size(600,600);
  //inicialitzem posicions i velocitats:
  for(int i= 0; i<num_ossos; i++)
  {
    posicionsX [i] = width/2;
    posicionsY [i] = height/2;
    velocitatsX [i] = random(1,8);
    velocitatsY [i]= random(1,8);
    sz[i]= int(random(20,30));
 color_ossos[i] = color (int(random(255)),int(random(255)),int(random(255)));
}
}
void draw(){
  background(0);
for(int i= 0; i<num_ossos; i++)
  {
    

    modificar_pos(i);
    comprovar_lim(i);
    dibuixar_personatge(i);
    
}
}

void modificar_pos(int _i)
{
    posicionsX[_i]  += velocitatsX [_i];
    posicionsY[_i]  += velocitatsY [_i];
}


void comprovar_lim(int _i)
{
    //comprobem lÃ­mits X
    if((posicionsX[_i] < sz[_i]+25)||(posicionsX[_i] > width-sz[_i]-25)){
      velocitatsX [_i] = -velocitatsX[_i] ;
    } 
    //comprobem lÃ­mits Y
    if((posicionsY[_i] < sz[_i]+20)||(posicionsY[_i] >height-sz[_i]-22.5)){
      velocitatsY[_i]  = -velocitatsY[_i] ;
    } 
}

void dibuixar_personatge(int _i)
{
 
//orelles grans
fill(#B45D00);
ellipse(posicionsX[_i]+25,posicionsY[_i]-20,sz[_i]+20,sz[_i]+20);
ellipse(posicionsX[_i]-25,posicionsY[_i]-20,sz[_i]+20,sz[_i]+20);
//orelles petites
fill(#FCC88F);
ellipse(posicionsX[_i]+25,posicionsY[_i]-15,sz[_i]+7,sz[_i]+10);
ellipse(posicionsX[_i]-25,posicionsY[_i]-15,sz[_i]+7,sz[_i]+10);
//cap
fill(#B45D00);
ellipse(posicionsX[_i],posicionsY[_i], sz[_i]+55,sz[_i]+45);  
//morro
fill(255,255,255);
ellipse(posicionsX[_i],posicionsY[_i]+10,35,30);
//nas
fill(0,0,0);
ellipse(posicionsX[_i], posicionsY[_i]+7,15,10);
//ulls
ellipse(posicionsX[_i]+10,posicionsY[_i]-10,8,11);
ellipse(posicionsX[_i]-10,posicionsY[_i]-10,8,11);
//llaç
noStroke();
fill(color_ossos[_i]);
quad(posicionsX[_i]-15,posicionsY[_i]-35,posicionsX[_i]+15,posicionsY[_i]-20,posicionsX[_i]+15,posicionsY[_i]-35,posicionsX[_i]-15,posicionsY[_i]-20);
//boca
noFill();
stroke(0);
strokeWeight(1);
arc(posicionsX[_i]-5,posicionsY[_i]+10,10,15, 0, radians(180));
arc(posicionsX[_i]+5,posicionsY[_i]+10,10,15, 0, radians(180));
}

