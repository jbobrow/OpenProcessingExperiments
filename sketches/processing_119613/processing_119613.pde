
// Les variables les col·loquem aqui a dalt
int rectColor = color(#CC9966);
int rectColor2 = color(#FFFFFF);
boolean pelota = false;
int movimientoPelota = 0;
void setup(){
  size (400,400);
  
}
  
void draw(){
  background(#264299);
  println(mouseX+","+mouseY);
  //cara
  fill (rectColor);
  ellipse(184,154,110,90);
  //Ojo izquierdo
  fill(rectColor2);
  ellipse(160,142,20,10);
  fill(#000000);
  ellipse(160,142,7,5);
    
  //Ojo derecho
  fill(#FFFFFF);
  ellipse(200,142,20,10);
  fill(#000000);
  ellipse(200,142,7,5);
   
  //Oreja izquierda
  noStroke();
  fill(#CC9966);
  ellipse(122,150,25,40);
  //Oreja derecha
  noStroke();
  fill(#CC9966);
  ellipse(245,150,25,40);
  //Boca
  stroke(0);
  fill(#E65665);
  arc(182,165,50,50,0, PI, CLOSE);
    
  //nariz
  stroke (#000000);
  line(178,146,172,150);
  line(172,150,176,157);
  //sombrero
  //el centre del barret és x=192 y=90
  fill (#991321);
  triangle (mouseX-74,mouseY+22,mouseX+4,mouseY-27,mouseX+68,mouseY+22);
  if (pelota==true){
    fill(#000000); 
    ellipse(movimientoPelota,40,25,25);
    movimientoPelota = movimientoPelota +3;
    if (movimientoPelota == 402){
      movimientoPelota = 0;
    }
  }
}
//aquesta funció s'activa mentre estigui pressionat el ratolí
void mousePressed(){
  rectColor = color (#007725);
  rectColor2= color (#550055);
  pelota= true;
}
//aquesta funció s'activa mentre es deixi de clicar el ratolí
void mouseReleased(){
  rectColor = color(#CC9966);
  rectColor2= color(#FFFFFF);
}


