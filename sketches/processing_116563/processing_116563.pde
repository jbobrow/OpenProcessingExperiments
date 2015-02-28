
void setup(){
  size (300,300);
  background(#5A3C3C);
}
//ADAN BACHIR 1R ASIX
void draw () {

  //cara
  
  fill (#FA1E0A);
  triangle (205,299,105,299,154,200);
  stroke(#B08C18);
  fill(#B08C18);
  ellipse(150,150,200,220);
  
  //pelo
  stroke(#000000);
  line (202,20,229,75);
  fill (#8A360C);
  triangle(251,87,49,69,213,6);
  stroke(#000000);
  line (202,20,229,75);
  line (204,25,93,64);
  line (212,40,145,65);
  line (216,52,180,67); 
  line (225,66,192,75);
  //ojo derecho
  stroke(#ffffff);
  fill (#ffffff);
  ellipse(190,130,70,50);
  //pupila
  stroke (#000000);
  fill (#000000);
  ellipse(190,130,35,25);
  //iris
  stroke (#56C6FD);
  fill (#56C6FD);
  ellipse(190,130,10,10); 
  
   //ojo izquierdo
   stroke(#ffffff);
  fill (#ffffff);
  ellipse(100,130,70,50);
    //pupila
  stroke (#000000);
  fill (#000000);
  ellipse(100,130,35,25);
  //iris
  stroke (#56C6FD);
  fill (#56C6FD);
  ellipse(100,130,10,10);
  
  //ceja izquierda
  stroke(#000000);
  fill (#000000);
  triangle(141,124,65,100,105,96);
    //ceja derecha
  stroke(#000000);
  fill (#000000);
  triangle(151,124,225,100,181,96);
  
    //boca
  curve (131,257,104,199,185,178,150,228);
  line (154,132,164,161);
  line (138,132,132,159);
  line (164,161,132,159);
  fill (#5B2003);
  ellipse (155,152,10,10);
  ellipse (140,152,10,10);
  
  
  
  println(mouseX+","+mouseY);
}


