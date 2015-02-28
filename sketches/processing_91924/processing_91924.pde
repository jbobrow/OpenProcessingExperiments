
void setup() {
  smooth();
  background(#c9d6e6);
  size (400,400);

}

void draw() {
  strokeWeight(7);
  
//cuadrado rojo
  stroke (25, 0, 0);
  fill(#FA0D0D);
  rect(45,44,206,208);
//cuadrado negro
fill(0);
rect(45,255,106,104);
rect(150,341,101,32);
//amarillo
fill(#FFE72E);
rect(251,44,128,102);
//cuadrado gr.claro
  fill(#e4f1ea);
  strokeWeight(7);
  // gr claro 2
    fill(#e4f1ea);
    // gr
    rect(251,244,128,50);
rect(251,147,128,105);
//cuadro derecha dividido
  rect(315,147,64,105);
  //azul oscuro
   fill(#1e1736);
  rect(251,296,126,77);
   //without strokes
  noStroke();
  fill(#FFE72E);
  rect(252,-5,131,47);
   fill(#FFE72E);
  rect(-5,294,53,110);
 fill(#FA0D0D);
  rect(377,296,30,110);
   fill(#e4f1ea);
    rect(-6,41,55,113);
    //gr arriba
   fill(#e4f1ea);
  rect(98,-5,154,47);
  // lineas
  stroke(7);
  strokeCap(PROJECT);
  //horiz
  line(9,44,45,44);
  line(9,150,45,150);
  //vert1
  line(95,8,95,43);
  //vert2
    line(251,5,251,43);
    //vert 3
      line(379,10,379,43);

  line(45,380,45,50);
  line(10,296,405,296);
  line(150,270,150,392);
  line(379,299,379,379); 
}


