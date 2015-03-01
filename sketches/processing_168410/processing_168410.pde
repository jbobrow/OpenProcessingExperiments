


int num_pilotes = 20;

float[] posicionsX = new float[num_pilotes];
float[] posicionsY = new float [num_pilotes];
float[] velocitatsX = new float [num_pilotes];
float[] velocitatsY = new float [num_pilotes];
int[] sz = new int[num_pilotes];
int counter;

void setup(){
  size(750,750);

  for (int i=0; i < num_pilotes; i++)
  {
    posicionsX[i] = width/2;
    posicionsY[i] = height/2;
    
    velocitatsX[i] = random(1,8);
    velocitatsY[i] = random(1,8);
    sz[i] = int(random(50,150));

    
  noStroke();
  background(255);  
  colorMode(HSB);   
  counter = 255;
  
  }
}

void draw(){

    background(200);
  for(int i = 0; i< num_pilotes; i++)
      {fill(random(255),100,255,220);
        modificar_pos(i);
        comprovar_lim(i);
        dibuixar_personatge(i);
      }
}

//moviment
void modificar_pos(int _i)
{
    posicionsX[_i] += velocitatsX[_i] ;
    posicionsY[_i]  += velocitatsY[_i] ;
}


void comprovar_lim(int _i)
{
    //limits X
    if((posicionsX[_i] < sz[_i]/2+sz[_i]/4)||(posicionsX[_i] > width-sz[_i]/2-sz[_i]/4)){
      velocitatsX[_i]  = -velocitatsX[_i] ;
    } 
    //limits Y
    if((posicionsY[_i] < sz[_i]/2+sz[_i]/3)||(posicionsY[_i] >height-sz[_i]/2)){
      velocitatsY[_i]  = -velocitatsY[_i] ;
      


      
    } 
}

void dibuixar_personatge(int _i)
{
  
  //cap
  noStroke();
  ellipse(posicionsX[_i], posicionsY[_i], sz[_i], sz[_i]);
  ellipse(posicionsX[_i]-sz[_i]/2.5,posicionsY[_i]-sz[_i]/2,sz[_i]/1.5,sz[_i]/1.5);
  ellipse(posicionsX[_i]+sz[_i]/2.5,posicionsY[_i]-sz[_i]/2,sz[_i]/1.5,sz[_i]/1.5);
  
  //ulls-blanc
  fill(255);
  ellipse(posicionsX[_i]+sz[_i]*0.1,posicionsY[_i]-sz[_i]*0.1,sz[_i]/5,sz[_i]/2.5);
  ellipse(posicionsX[_i]-sz[_i]*0.1,posicionsY[_i]-sz[_i]*0.1,sz[_i]/5,sz[_i]/2.5);
  
  //ulls-negre i nas
  fill(200);
  ellipse(posicionsX[_i],posicionsY[_i]+sz[_i]*0.1,sz[_i]/3,sz[_i]/6);
  
  ellipse(posicionsX[_i]+sz[_i]*0.14-mouseX*0.015,posicionsY[_i]-sz[_i]*0.1-mouseY*0.015,sz[_i]/10,sz[_i]/5);
  ellipse(posicionsX[_i]-sz[_i]*0.07-mouseX*0.015,posicionsY[_i]-sz[_i]*0.1-mouseY*0.015,sz[_i]/10,sz[_i]/5);
  
 
}
