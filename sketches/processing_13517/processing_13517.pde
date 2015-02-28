
class agente {

  float x;
  float y;
  float z;
  float avanzax;
  float avanzay;

  float avanzaz;
  float angulo;
  float mass;
  float velocidad;
  float coloro;

  agente(float posicion_randomx, float posicion_randomy){
    x = posicion_randomx/2;
    y = posicion_randomy/2;

  }

  void dibuja(){

    angulo = valores_perlin [int(avanzax/ (width/12) )] [ int(avanzay / (height/12))];


    float velo =VELOCITY;
    avanzax = avanzax + velo  * cos(angulo) ;
    avanzay = avanzay + velo  * sin(angulo) ;

     centerX =avanzax;
    centerY = avanzay;


  if (avanzax <=0|| avanzax >= width || avanzay <=0 || avanzay >= height){


      avanzax = (width/2);
      avanzay = (height/2); 
      
    
  }
if (mousePressed){
  avanzax=0;
  avanzay=0;
}

  }
  void amigo (){

    angulo = valores_perlin [int(avanzax / (width/22))] [ int(avanzay / (height/22))];

    float velo =VELOCITY;
    avanzax = avanzax + velo  * cos(angulo)*2 ;
    avanzay = avanzay + velo  * sin(angulo)*2 ;
 //centerX =avanzax;
    //centerY = avanzay;
pushMatrix ();
translate (avanzax, avanzay);

smooth ();
fill (0,50);
//ellipse (0,0,2,2);
popMatrix ();
  }


}





