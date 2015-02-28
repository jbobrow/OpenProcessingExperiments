
// Javi paste los codigos jajajaj
void setup(){
size (500,500);
background (0,180,0);

}
void draw (){
  
  
  if (mousePressed){
    bichete(#EDFF00);

}
  println ("eje x"+ mouseX + "ejeY" + mouseY);//xa q nos monotorice las cordenadas del puntero del raton
  println (frameRate);//velocidad de muestreo en frames
  }

void bichete(color cuerpo){
fill (cuerpo);
strokeWeight(1);
rect(230,130,40, 200);//cuerpo
fill (255);
ellipse( width/2, 100,95,95);//cara
fill (255,0,0);
ellipse (width/2, 130,15,25);//boca
fill ( 87,17,167);

ellipse (230, 100, 30,40);//ojo izq
fill (8, 6, 10);
ellipse (230, 110, 15, 15);//pupila izq
fill ( 87,17,167);
ellipse (270,100, 30, 40);//ojo derecho
fill (8,6,10);
ellipse (265, 110, 15, 15);//pupila derecha
strokeWeight(10);
line (230, 330,125,450 );//pierna izq
line (270,330,420, 450);//pierna derecha
line (230,160,110,230);
}


