
//Autor: Sergio S.
//Paint
/*colores asignados:
Q= amarillo claro | W = azul oscuro | E = gris | R = gris oscuro
T = naranja claro | Y = verde claro | U = rojo claro | I = azul claro
O = rosa blanquecino | P = azul blanquecino | A = carne | S = lila
D = verde oscuro | F = marrón | G = marrón oscuro | H = rosa intenso
J = rosa | K = rojo sangre | L = azul verdoso | Ñ = morado
Z = rojo | X = amarillo | C = azul | V = verde
B = violeta | N = naranja | M = celeste | Ç = negro (Borrador)
¡ = blanco
*/

//fondo
void setup(){
  size(400,400);
  background(0);
  smooth();
}

void draw (){
//negro
if(mousePressed){
  noStroke();
  ellipse (mouseX, mouseY,10,10);
  
//Paleta de colores  
if(keyPressed){
  if (key=='z'){
    fill(#F50000);
  }
  else if (key =='x'){
    fill (#FFE200);
  }
  else if (key == 'c'){
    fill (#0041FF);
  }
  else if (key == 'v'){
    fill (#10FF00);
  }
  else if (key =='b'){
    fill (#D315BE);
  }
  else if (key == 'n'){
    fill (#FFAF00);
  }
  else if (key =='m'){
    fill(#00FFEC);
  }
  else if (key =='a'){
    fill(#FFCB6A);
  }
  else if (key =='s'){
    fill(#D97CFF);
  }
  else if (key =='d'){
    fill(#33B22B);
  }
  else if (key =='f'){
    fill(#CB8904);
  }
  else if (key =='g'){
    fill(#8E6106);
  }
  else if (key =='h'){
    fill(#F200BA);
  }
  else if (key =='j'){
    fill(#FA88E0);
  }
  else if (key =='k'){
    fill(#B90F06);
  }
  else if (key =='l'){
    fill(#1DDB93);
  }
  else if (key =='ñ'){
    fill(#5D02C6);
  }
  else if (key =='q'){
    fill(#F9FF5D);
  }
  else if (key =='w'){
    fill(#1C1AC4);
  }
  else if (key =='e'){
    fill(#BFBFBF);
  }
  else if (key =='r'){
    fill(#898989);
  }
  else if (key =='t'){
    fill(#FFAE43);
  }
  else if (key =='y'){
    fill(#83FF88);
  }
  else if (key =='u'){
    fill(#FA5647);
  }
  else if (key =='i'){
    fill(#5270FF);
  }
  else if (key =='o'){
    fill(#FEC9FF);
  }
   else if (key =='p'){
    fill(#C9FFFE);
  }
  else if (key =='¡'){
    fill(#FFFFFF);
  }
  else if (key =='ç'){
    fill(#000000);
  }
}
}
}


