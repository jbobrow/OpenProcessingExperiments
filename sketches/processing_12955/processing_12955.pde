
class Circulo{
  float posX_, posY_, tam_,d,avance;
  color rojo;
   Circulo (float posX, float posY, float tam){ 
  
     posX_ = posX;
     posY_ = posY;
     tam_ =tam;
     rojo= color(255,255,0,150);
     avance= 1;
   }
   
   void dibujar (){
    noStroke();
    fill(rojo);  
   ellipse(posX_, posY_, tam_,tam_);
 
   d = dist (posX_ ,posY_, mouseX, mouseY);
   if (d< tam_/2){ 
    rojo = color (0,200,50,75);
  
   } 
    posY_ = posY_ + avance;
    
    if (posY_ > height){
      avance = avance *-1;
    }else if (posY_ <0){
      avance = avance *-1;
}
   }

 void pintar(){
   rojo = color (255,255,0,150);
 }
}

