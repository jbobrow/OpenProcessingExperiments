
void setup () {

size (480, 720);
background (247,236,220);
smooth();

strokeWeight(20);
  stroke(201,137,85,50);
fill(255,3.);
  rect(25,25,width-50,height-50);
  
  strokeWeight(10);
  stroke(201,137,85,200);
fill(255,3);
  rect(60,60,width-125,height-125);
}

void draw(){
  
  
  
  
  
  noStroke();
  
  //cafe
  fill (201,137,85);


  //TRIANGULOS CENTRO
   //azul
  fill (86,196,193);


//triagulo azul centro arriba
triangle (width/2-20, height/2+20, width/2, height/2-20, width/2+20, height/2+20);
//triagulo azul centro abajo
triangle (width/2-20, height/2+25, width/2, height/2+65, width/2+20, height/2+25);



//triangulo largo izq
triangle (width/2-50, height/2+65, width/2-30, height/2+22.5, width/2-50, height/2-20);
//triangulo largo izq
triangle (width/2+50, height/2+65, width/2+30, height/2+22.5, width/2+50, height/2-20);



//triangulo cafe izq
fill (201,137,85);
triangle (width/2-45, height/2-20, width/2-25, height/2+20, width/2-5, height/2-20);
//triangulo cafe drch
fill (201,137,85);
triangle (width/2+45, height/2-20, width/2+25, height/2+20, width/2+5, height/2-20);
//duplicado triangulos abajo
//triangulo cafe izq
fill (201,137,85);
triangle (width/2-45, height/2+65, width/2-25, height/2+25, width/2-5, height/2+65);
//triangulo cafe drch
fill (201,137,85);
triangle (width/2+45, height/2+65, width/2+25, height/2+25, width/2+5, height/2+65);



//RECTANGULOS CENTRO
//rect derecha
rect(width/2+55,height/2+65, width/2, height/2-445);
//rect derecha chico
fill (86,196,193);
rect(width/2+55,height/2+45, width/2, height/2-405);

//rect izq
fill (201,137,85);
//rect izq
rect(0,height/2+65, width/2-55, height/2-445);
//rect izq chico
fill (86,196,193);
rect(0,height/2+45, width/2-55, height/2-405);




//RECTANGULOS SUPERIORES LARGUITOS

 fill (201,137,85);

//rectangulos arriba largos
rect(width/2-45, height/2-25, width/2-200 ,-720);

rect(width/2+45, height/2-25, width/2-280 ,-720);

//rectangulos abajo largos

rect(width/2-45, height/2+70, width/2-200 ,750);

rect(width/2+45, height/2+70, width/2-280 ,750);

}


