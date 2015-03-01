
int num_personaje= 3;


float[] posicionsX = new float[num_personaje];
float[] posicionsY = new float[num_personaje];
float[] velocitatsX = new float[num_personaje];
float[] velocitatsY = new float[num_personaje];
int [] sz= new int[num_personaje];


void setup(){
  size(700,700);
  
  for (int i=0; i< num_personaje; i++) {
 
  
    posicionsX[i] = width/2;
    posicionsY[i] = height/2;
    velocitatsX[i] = random(6,12);
    velocitatsY[i] = random(6,12);
    sz[i] = int(random (20,30));
   
  }


}

void draw(){

    background(0);
    for (int i=0; i<num_personaje; i++) {
    modificar_pos(i);
    comprovar_lim(i);
    dibuixar_personatge(i);
    
}

}
void modificar_pos(int _i)
{
    posicionsX[_i]  += velocitatsX[_i] ;
    posicionsY[_i]  += velocitatsY[_i] ;
}


void comprovar_lim(int _i)
{
    
    if((posicionsX[_i] < sz[_i]/2+155)||(posicionsX[_i] > width-sz[_i]/2-155)){
      velocitatsX[_i]  = -velocitatsX[_i] ;
    } 
    
    if((posicionsY[_i] < sz[_i]/2+155)||(posicionsY[_i] >height-sz[_i]/2-155)){
      velocitatsY[_i]  = -velocitatsY[_i] ;
    } 
}

void dibuixar_personatge(int _i)
{
    strokeWeight(2);
fill(250,0,0);
ellipse(posicionsX[_i]-100,posicionsY[_i]+130,150,70);
ellipse(posicionsX[_i]+100,posicionsY[_i]+130,150,70);
 
//brazos
fill(250,203,202);
ellipse(posicionsX[_i]-150,posicionsY[_i]+20,60,54);
ellipse(posicionsX[_i]+150,posicionsY[_i]+20,60,54);
 
 
//forma basica
strokeWeight(2);
fill(250,203,202);
ellipse(posicionsX[_i],posicionsY[_i],300,300);
 
//boca
fill(0);
ellipse(posicionsX[_i],posicionsY[_i]+40,25,25);
 
//ojos
 
fill(0,0,0);
ellipse(posicionsX[_i]-30,posicionsY[_i]-30,25,80);
ellipse(posicionsX[_i]+30,posicionsY[_i]-30,25,80);
 
fill(#1210C6);
ellipse(posicionsX[_i]+30,posicionsY[_i]-30,23,70);
ellipse(posicionsX[_i]-30,posicionsY[_i]-30,23,70);
 
fill(0,0,0);
ellipse(posicionsX[_i]-30,posicionsY[_i]-37,24,60);
ellipse(posicionsX[_i]+30,posicionsY[_i]-37,24,60);
 
fill(250,250,250);
ellipse(posicionsX[_i]-30,posicionsY[_i]-45,15,39);
ellipse(posicionsX[_i]+30,posicionsY[_i]-45,15,39);
  
}

