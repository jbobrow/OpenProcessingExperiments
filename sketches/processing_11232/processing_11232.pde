
class agente {

  float x;
  float y;
  float z;
  float avanzax;
  float avanzay;
  float angulo;
  float mass;
  float velocidad = 1;
 
 
 color col = col ();
  agente(float posicion_randomx, float posicion_randomy){
    x = posicion_randomx/2;
    y = posicion_randomy/2;
 

}

  void dibuja(){


    angulo = valores_perlin [int(avanzax/ (width/22) )] [ int(avanzay / (height/22))];    
        float velo = random(1);
     avanzax = avanzax + velo  * cos(angulo) ;
    avanzay = avanzay + velo  * sin(angulo) ;
         if (avanzax <=0|| avanzax >= width ||avanzay <=12  || avanzay>=height ){       
           avanzax = (width/2);
      avanzay = (height/2); 

         }
         
   if (keyPressed ){
   if (key == 'r' || key == 'R'){
  avanzax = 0;
  avanzay = 0;
  fill (255);
    rect (0,0,width, height);
}}  
  }
  void amigo (){


            
    angulo = valores_perlin [int(avanzax / (width/22))] [ int(avanzay / (height/22))];
    float velo = random(1);

    avanzax = avanzax + velo  * cos(angulo)*2;
    avanzay = avanzay + velo  * sin(angulo)*2 ;
  
        pushMatrix();

    translate(avanzax, avanzay);
   smooth ();
    rotate(angulo/3);
noStroke ();
fill  (col);
ellipse (0,0,4,4);
   popMatrix(); 
 
  }

}


color col (){ 

  return rojo2 [int (random (rojo2.length))]; 
} 





void NOISE(float elruido) {
ruido = (elruido);

  controlP5.controller("NOISE").setValue(elruido);
}






