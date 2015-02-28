
/** Proyecto Final Lenguaje Computacional 0
* Autor: Consuelo Encina
* Basado en Remasterised Shining Star por Pablo Andres Carrasco Toledo
* Taller de Diseño - Primer Año
* 25. 08. 2009
*/

//** Esta composición consta de una composición circular que rota constantemente. Es guiada por el movimiento del mouse, variando tanto su diametro como su extensión.*/
//** La gama cromática se desenvuelve basicamente en colores pasteles, habiendo solo un par de ellos los que contrastan, el fucsia y el burdeo. Todos los colores se entrelazan entre si formando divrsos tejidos y efectos. Al hacer click en cualquier parte del Sketch, la animación desaparece.*/


float sep, nn, n, m, s;  
  
void setup(){  
 sep = 7;  
  nn = 20;  
  n=0; 
  m=millis(); 
  s=5; 
  size(500, 500);  
   
}  
  
void draw(){  
 noiseSeed(150);  
  n+=0.06; 
  s+=0.04; 
  
  background(215, 212, 216); //lila 
  for(float y =sep; y <= width-3*sep; y += nn/10){  
    for(float x = sep+20; x <= height-sep/2; x += 2.0*nn){  
 float N = noise(n); 
 float R = m%70; 
 float S= noise(s); 
    float f;  
      f = dist(mouseX, mouseY, x, y);  
      float diam;  
      diam = map(f, f, width, height, 2);   
      if(mousePressed==false){  
noStroke();  
 
        translate(mouseX*2,mouseY*2);  
        rotate(10);    
        fill(0);  
        triangle(width/3,height/3, 15*S,10,25,16);  
        fill(165, 0, 146); //fucsia 
        triangle(width/2,height/2,6*(6*N),5,10,7);  
 fill(57, 0, 50);  // berenjena
 triangle(width/4,height/4,20,3,7,5);  
     fill(255);  
       
    fill(9, 11, 88); //azul oscuro 
    rect(mouseX,width/2,(15*N),7);  
    fill(158, 208, 245);  // celeste pastel
    rect(mouseY,height/2,4*(f*N),6);  
    
      }  
    }  
  }  
}  
  
  


