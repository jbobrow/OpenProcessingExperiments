
int num_personatges = 15;
int[] sz = new int [num_personatges];

float[] posicionsX = new float [num_personatges];
float[] posicionsY = new float [num_personatges];
float[] velocitatsX = new float [num_personatges];
float[] velocitatsY = new float [num_personatges];




void setup(){
  size(900,600);
  //inicialitzem posicions i velocitats:
   
  for( int i=0; i< num_personatges; i++)
  {
    posicionsX [i] = width/2;
    posicionsY [i] = height/2;
    velocitatsX [i] = random(1,8);
    velocitatsY [i] = random(1,8); 
    sz [i]  = 30;
  }
 
}

void draw(){

    background(#C3D8E3);
    
    for( int i=0; i< num_personatges; i++)
    {
    modificar_pos(i);
    comprovar_lim(i);
    personatge(i);
    
    }
}


void modificar_pos(int _i)
{
    posicionsX [_i]  += velocitatsX [_i] ;
    posicionsY [_i] += velocitatsY [_i] ;
}


void comprovar_lim(int _i)
{
    
    if((posicionsX[_i] < sz[_i]/2+30)||(posicionsX[_i] > width-sz[_i]/2-30)){
      velocitatsX [_i]  = -velocitatsX [_i] ;
    } 
    
    if((posicionsY[_i] < sz[_i]/2+50)||(posicionsY[_i] >height-sz[_i]/2-65)){
      velocitatsY [_i]  = -velocitatsY [_i] ;
    } 
}


void personatge(int _i)
{ 
  noStroke();
  fill(#31878B);
  rect(posicionsX[_i]-83/2,posicionsY[_i]+5/2,30/2,100/2,100/2,100/2,100/2,100/2);
  rect(posicionsX[_i]+53/2,posicionsY[_i]+5/2,30/2,100/2,100/2,100/2,100/2,100/2);
  fill(#F0DD9B);
  ellipse(posicionsX[_i]-73/2, posicionsY[_i]+100/2,30/2,30/2);
  ellipse(posicionsX[_i]+73/2,posicionsY[_i]+100/2,30/2,30/2);
   fill(#A04025);
  ellipse(posicionsX[_i]-40/2,posicionsY[_i]+140/2,80/2,-50/2);
  ellipse(posicionsX[_i]+40/2,posicionsY[_i]+140/2,80/2,-50/2);
  fill(#FFFFFF);
  rect(posicionsX[_i]-70/2,posicionsY[_i],140/2,150/2,20/2,20/2,60/2,60/2);
  fill(#F0DD9B);//lhe hagut de posar aqui perque sinÃ�Â³ el rectangle es sobreposava a les altres formes
  ellipse(posicionsX[_i], posicionsY[_i]+30/2, 60/2,60/2);
  ellipse(posicionsX[_i],posicionsY[_i]-30/2,150/2,150/2); 
  fill(0);
  ellipse(posicionsX[_i]-20/2,posicionsY[_i]-30/2,20/2,20/2);
  ellipse(posicionsX[_i]+20/2,posicionsY[_i]-30/2,25/2,25/2);
  fill(#624E44);
  curve(posicionsX[_i]-90/2,posicionsY[_i]+650/2,posicionsX[_i]-100/2,posicionsY[_i]-40/2,posicionsX[_i]+100/2,posicionsY[_i]-40/2, posicionsX[_i]+90/2,posicionsY[_i]+650/2);
}



