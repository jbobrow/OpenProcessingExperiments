
color blanco,negro,azul,rojo,verde,fucsia,amarillo;
boolean cuenta;


void setup(){
 noCursor();
 size (screen.width,screen.height);
 blanco = color (255);
 negro = color ( 0);
 azul = color (0,0,255);
 rojo = color (255,0,0);
 verde = color (0,255,0);
 amarillo = color (255,255,0);
 fucsia= color (255,0,150);

}
void draw(){
 frameRate (12);

 background (negro);
   
  
 if ((cuenta ==true)&&(mouseX<150)){
   fill (blanco);
 rect (0,0,width,height);  
 cuenta = false;
 } else if ((cuenta== false)&&(mouseX<150)){
cuenta = true;
 }
 
  if ((cuenta ==true)&&(mouseX>150)&&(mouseX<250)){
    fill (azul);
 rect (0,0,width,height);  
 cuenta = false;
 } else if ((cuenta== false)&&(mouseX>150)&&(mouseX<250)){
cuenta = true;
 }
 
     if ((cuenta ==true)&&(mouseX>250)&&(mouseX<350)){
    fill (fucsia);
 rect (0,0,width,height);  
 cuenta = false;
 } else if ((cuenta== false)&&(mouseX>250)&&(mouseX<350)){
cuenta = true;
 }

   if ((cuenta ==true)&&(mouseX>350)&&(mouseX<450)){
    fill (rojo);
 rect (0,0,width,height);  
 cuenta = false;
 } else if ((cuenta== false)&&(mouseX>350)&&(mouseX<450)){
cuenta = true;
 }
 
    if ((cuenta ==true)&&(mouseX>450)&&(mouseX<550)){
    fill (verde);
 rect (0,0,width,height);  
 cuenta = false;
 } else if ((cuenta== false)&&(mouseX>450)&&(mouseX<550)){
cuenta = true;
 }
 
    if ((cuenta ==true)&&(mouseX>550)&&(mouseX<650)){
    fill (amarillo);
 rect (0,0,width,height);  
 cuenta = false;
 } else if ((cuenta== false)&&(mouseX>550)&&(mouseX<650)){
cuenta = true;
 }
 


 delay(mouseY);

}


