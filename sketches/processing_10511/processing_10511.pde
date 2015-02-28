
int cont=0;  //crea dos estats del programa

float x1=400;
float y1=400;
float x2=400;
float y2=400;
float x3=400;
float y3=400;
float x4=400;
float y4=400;
float x5=400;
float y5=400;
float sx1=1;
float sy1=-2;
float sx2=1;
float sy2=-2;
float sx3=1;
float sy3=-2;
float sx4=1;
float sy4=-2;
float sx5=1;
float sy5=-2;    //parametres inicials de les 5 el·lipses (tots els floats)


void setup()
{
  size(600, 600); 
  smooth();
  background(0,0,0);  //parametres fondo

 }
 
 void draw()
 {
     background(0,0,0);
     x1=x1+sx1;
     x2=x2+sx2;
     x3=x3+sx3;
     x4=x4+sx4;
     x5=x5+sx5;
   
     y1=y1+sy1;
     y2=y2+sy2;
     y3=y3+sy3;
     y4=y4+sy4;
     y5=y5+sy5;          //moviments desitjats de les el·lipses (punt centre més vector director) els parametres x i y son el centre els parametres sx i sy són el vector director
     
      if (((sqrt((sq(x1-x2))+sq(y1-y2))<3)&&(sqrt((sq(x2-x3))+sq(y2-y3))<3)&&(cont==0))&&(sy1!=sy2)){ //comanda que ens permet que les el·lipses es reajuntin quan els centres de les el·lipses 1,2 i 3                                                                                                      
      x2=x1;                                                                                         // estan a menys de 3 pixels de distancia l'estat de control es 0 i els vectors directors son diferents
      x3=x1;                                                                                          // aquesta ultima condicio evita que s'activi el resultat ja que al sortir de void mouseClicked l'estat
      x4=x1;                                                                                          // de control sempre és 0                                                                                        
      x5=x1;
      y1=y1;
      y2=y1;
      y3=y1;
      y4=y1;
      y5=y1;
      sx1=(sx1+sx2+sx3+sx4+sx5)/5;                                                                   //vectorrs directors de les el·lipses que fan que el moviment quan es mouen alhora sigui la suma
      sy1=(sy1+sy2+sy3+sy4+sy5)/5;                                                                   //dels moviments quan aquestes es van a trovar
      sx2=(sx1+sx2+sx3+sx4+sx5)/5;
      sy2=(sy1+sy2+sy3+sy4+sy5)/5;
      sx3=(sx1+sx2+sx3+sx4+sx5)/5;
      sy3=(sy1+sy2+sy3+sy4+sy5)/5;
      sx4=(sx1+sx2+sx3+sx4+sx5)/5;
      sy4=(sy1+sy2+sy3+sy4+sy5)/5;
      sx5=(sx1+sx2+sx3+sx4+sx5)/5;
      sy5=(sy1+sy2+sy3+sy4+sy5)/5;
 }
  
   stroke(0,0,0); 
  strokeWeight(4); 
  noFill();
  stroke (255,0,0);                                            //el·lipses i les seves caracteristiques
  ellipse(x1,y1,150,150);
  stroke (0,255,0);
  ellipse(x2,y2,150,150);
  stroke (0,0,255);
  ellipse(x3,y3,150,150);
  stroke (255,255,0);
  ellipse(x4,y4,150,150);
  stroke (255,255,255);
  ellipse(x5,y5,150,150);
  
  if (x1>width | x1<0)                                  //equacions que fan que les el·lipses rebotin al xocar am els limits de la pantalla
   {
     sx1=-1*sx1;
     
   }
    if (x2>width | x2<0)
   {
     sx2=-1*sx2;
     
   }
    if (x3>width | x3<0)
   {
     sx3=-1*sx3;
     
   }
    if (x4>width | x4<0)
   {
     sx4=-1*sx4;
     
   }
    if (x5>width | x5<0)
   {
     sx5=-1*sx5;
     
   }
  if (y1>width | y1<0)
   {
     sy1=-1*sy1;
     
   }
    if (y2>width | y2<0)
   {
     sy2=-1*sy2;
     
   }
    if (y3>width | y3<0)
   {
     sy3=-1*sy3;
     
   }
    if (y4>width | y4<0)
   {
     sy4=-1*sy4;
     
   }
    if (y5>width | y5<0)
   {
     sy5=-1*sy5;
     
   }
 }
 void mouseClicked ()                             //apartat en el que es crea el moviment en clicar el mouse
 {  
  if(cont==1) {concentra(); cont=0;}              //comanda que canvi l'estat de control i activa les equacions d'unio o dispersio de les boles segons l'estat de control
     else {dispersa(); cont=1;}                   
  
 }
 
 
void dispersa()                                    // si al pulsar el mouse les boles es mouen com una sola aquesta equacio fa que es dispersin seguint les lines que unirien els vertex d'un
{                                                  // pentagon amb el seu centre (el vector director es unitari i multiplicat per la velocitat desitjada)
  
   sx1=0*2;
   sx2=0.951*2;
   sx3=0.5877*2;
   sx4=-0.5877*2;
   sx5=-0.951*2;
   
   sy1=-1*2;
   sy2=-0.3043*2;
   sy3=+0.811*2;
   sy4=+0.811*2;
   sy5=-0.3043*2;
}

void concentra()                              //si al pulsar el mouse les boles es mouen cada una a la seva manera aquesta equacio fa que convergeixin totes en un punt a una velocitat en que arrivin 
{                                             //alhora de manera que quan torni a començar s'activi la comanda de la linea 48 convertintles altre vegada en una sola.
  sx1=(mouseX-x1)/50;
  sy1=(mouseY-y1)/50;
  sx2=(mouseX-x2)/50;
  sy2=(mouseY-y2)/50;
  sx3=(mouseX-x3)/50;
  sy3=(mouseY-y3)/50;
  sx4=(mouseX-x4)/50;
  sy4=(mouseY-y4)/50;
  sx5=(mouseX-x5)/50;
  sy5=(mouseY-y5)/50;

}


