
//Practica 4 - FUNCIONS

int num_fantasmes=15;
 
            //declaració de posicions i velocitats:
float [] posicionsX = new float [num_fantasmes];
float [] posicionsY = new float [num_fantasmes];
float [] velocitatsX = new float [num_fantasmes];
float [] velocitatsY = new float [num_fantasmes];
int [] sz = new int [num_fantasmes];
color [] color_pilota = new int [num_fantasmes];
 
void setup(){
  size(600,400);
   
  //inicialitzem posicions i velocitats:
  for (int i = 0; i < num_fantasmes; i++)
    {
    posicionsX [i] = width/2;
    posicionsY [i] = height/2;
    velocitatsX [i] = random(1, 4);
    velocitatsY [i] = random(1, 4);
     //el random retorna un real, pero he declarat "sz" com un enter, aixi que afegeixo int per convertirlo en un enter.
    sz [i] = int (random (40, 40));
    color_pilota [i] = color (int (random(255)), int (random (255)), int (random (255)));
}
}
void draw(){
   
  background(0);
  rectMode (CENTER);
  
          //Marc
  noFill();
  stroke (#0A7EF7);
  rect (width/2 , height/2, width*0.95, height*0.95);
  
        //"Comecocos"
  noStroke();
  fill(#F7F70A);
  arc (mouseX, mouseY, 45, 45, radians (30), radians (330));
  fill(0);
  ellipse (mouseX+7, mouseY-10, 4, 4);
      
 
 
 for (int i=0; i< num_fantasmes; i++) {
    
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
    //comprobem limits Y
    if((posicionsY [_i]< sz [_i])||(posicionsY [_i] >height-sz [_i]+ 14)){
      velocitatsY [_i] = -velocitatsY [_i];
    }
}
 
void dibuixar_personatge (int _i)
{
   //i dibuixem
   fill (color_pilota [_i]);
   rectMode (CENTER);
   
   //Cos
    ellipse(posicionsX [ _i] , posicionsY [_i] ,sz [_i], sz [_i]);
    rect (posicionsX [_i], posicionsY [_i] + sz[_i]/3, sz [_i], sz [_i]/2);
    
   //Potes
   ellipse (posicionsX [_i], posicionsY [_i]+20, 14, 14);
   ellipse (posicionsX [_i]+13, posicionsY [_i]+20, 14, 14);
   ellipse (posicionsX [_i]-13, posicionsY [_i]+20, 14, 14);
   
   //Ulls
   fill (255);
   ellipse (posicionsX [_i]-2, posicionsY [_i]-2, 8, 8);
   ellipse (posicionsX [_i]+10, posicionsY [_i]-2, 8, 8);
   fill (0);
   ellipse (posicionsX [_i], posicionsY [_i]-2, 4, 4);
   ellipse (posicionsX [_i]+12, posicionsY [_i]-2, 4, 4);
   
 
}
