
void setup(){
size(600,600); 
background(0);
}

void draw(){
  println("eje x "+mouseX+" eje y "+mouseY);
 background(255);
 line(mouseX-20,mouseY+40,mouseX-40,mouseY+70);//brazo izquierdo
 line(mouseX+20,mouseY+40,mouseX+40,mouseY+70);//brazo derecho
 line(mouseX+10,mouseY+85,mouseX+10,mouseY+105);//pierna derecha
 line(mouseX-10,mouseY+85,mouseX-10,mouseY+105);//pierna izquierda
 ellipse(mouseX,mouseY+60,50,70);//cuerpo
 ellipse(mouseX,mouseY,100,70);//cabeza
 ellipse(mouseX-15,mouseY,10,mouseY/20);//ojo izquierdo
 ellipse(mouseX+15,mouseY,10,mouseY/20);//ojo derecho
 ellipse(mouseX,mouseY+15,7,mouseY/60);//boca

}
