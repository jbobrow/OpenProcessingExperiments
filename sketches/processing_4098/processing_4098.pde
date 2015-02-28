
/** 
 *Proyecto LC0: Tejido Coronario 
 *Por federico garcia
 *Descrippcion general
  Modifiacion del primer trabajo de lc0: "Estela explosiva"
  La primera vision reproduce una corona realizada con las funciones: 
    Rotate que  hace girar las curvas dibujadas,las que muestran un efecto de lava por
    la funcion loadPixels y el arreglo que ella conlleva.
    ""basado en el sketch: Funny Fluidby de Manuel Guerra""
    Luego se juega con las relaciones que produce el mouse y las teclas; 
    cambiando las curvas, los colores con stroke y el centro de la corona con transalate.
*/


int n =800;

void setup() { 
  size(800, 800,P3D); 
background(0); 
colorMode(HSB,255);
} 
 
void draw() { 
   
  if(mousePressed) { 
    translate(255,255);
    fill(0); 
    stroke(random(255),random(255),random(255)); 
    fill(255);
    
   
    
} else { 
   translate(500,500);
  point(mouseX,mouseY);
loadPixels();
for(int i=n*n-n-1;i>n;i--) 
pixels[i]=int((pixels[i-n]+pixels[i+1]+pixels[i-1])/10);
updatePixels(); 
  } 
    fill(0); 
  for(int i = 25; i < 500; i += 20){  
      for(int x = 20; x <200 ; x += 40){ 
 rotate(250); 
        curve(i, i, pmouseX, pmouseY,pmouseY,pmouseX,x,i); 
   curve(i,x,x,i,mouseX,mouseY,pmouseY,pmouseX);
  curve(x, x,mouseX, mouseY,pmouseY,pmouseX,i,x);  
 
   } 
   
   if(keyPressed){
     
     fill(#0DFAE4,290);
           curve(i,i,i,i,i,i,i,i);
     box(i*10/n);
  } }
} 


