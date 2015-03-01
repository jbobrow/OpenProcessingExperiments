
int num_pilotes=20;

            //declaració de posicions i velocitats:
float [] posicionsX = new float [num_pilotes];
float [] posicionsY = new float [num_pilotes];
float [] velocitatsX = new float [num_pilotes];
float [] velocitatsY = new float [num_pilotes];
int [] sz = new int [num_pilotes];
color [] color_pilota = new int [num_pilotes];

void setup(){
  size(300,200);
  
  //inicialitzem posicions i velocitats:
  for (int i = 0; i < num_pilotes; i++)
    {
    posicionsX [i] = width/2;
    posicionsY [i] = height/2;
    velocitatsX [i] = random(1,5);
    velocitatsY [i] = random(1,5);
     //el random retorna un real, pero he declarat "sz" com un enter, aixi que afegeixo int per convertirlo en un enter.
    sz [i] = int (random (20, 20));
    color_pilota [i] = color (int (random(255)), int (random (255)), int (random (255)));
}
}
void draw(){
  
  background(0);

 for (int i=0; i< num_pilotes; i++) {
   
   modificar_pos (i);
   comprovar_lin (i);
   dibuixar_personatge (i);
   
   
   }
}

void modificar_pos (int _i)

{
    posicionsX [ _i] += velocitatsX [ _i];
    posicionsY [_i] += velocitatsY [_i] ;
    }
void comprovar_lin (int _i)
{
  
    //comprobem limits X
    if((posicionsX [_i] < sz [_i]/2)||(posicionsX [_i]> width-sz [_i]/2)){
      velocitatsX [_i]  = -velocitatsX [_i] ;
    } 
    //comprobem lÃ­mits Y
    if((posicionsY [_i]< sz [_i])||(posicionsY [_i] >height-sz [_i] /2)){
      velocitatsY [_i] = -velocitatsY [_i];
    } 
}

void dibuixar_personatge (int _i)
{
   //i dibuixem
   fill (color_pilota [_i]);
    ellipse(posicionsX [ _i] , posicionsY [_i] ,sz [_i], sz [_i]);

}



