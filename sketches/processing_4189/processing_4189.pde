
void pincel(float x, float y, color c, float amp){ //Función pincel
  int puntos = round(random(1,100)); //Los puntos serán al random redondeado
  for(int i = 1; i <= puntos; i++){ //Ciclo "for" determina que cuando i=1, hará PUNTOS
    float h =  hue (c) +random(0,55); //Croma y un poquito de random (intensifica los colores)
    float s = saturation (c)+ random (100) ; //Saturacion y random (hace que parezca un "filtro de color"a la cámara)
    float b = brightness (c); //Brillo
    pushMatrix(); 
    translate(x,y); 
    fill(h,s,b); //Llenar con esas caracteristicas del color
 
    float tam = random(4, amp/4);  //Tamaño será definido por 
    ellipse(random(-amp, amp),random(-amp, amp), tam*4, tam*4); //elipses de tamaño
    
    popMatrix(); 
    
  } 
} 

