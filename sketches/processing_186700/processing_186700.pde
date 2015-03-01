
/*size(600,600);

for (int i =0; i<100; i=i+5) {
  println(i);
  fill(i*2.55);
  ellipse(i*6,150,i,i);
}*/

size(600, 600);
for (int i =0; i<100; i=i+5) {
  println(i);
  fill(i*2.55);
  //con este calculo se llega maximo a 255 que es el valor maximo de
  //el color
  ellipse(i*6, 150, i, i);
  fill(255-(i*2.55));
  //(i*2.55) es decir que es 255 entonces hace que se haga negativo 
  //o inverso de acorde al primer fill
  ellipse(i*6, 50, i, i);
}

