
void setup (){
  size(850,600); //tamanho do quadro
}

  int x;
  
void draw (){
  
  if (mouseX> width/2){
  background(8,42,54);
  fill(41,27,1); //cor de areia
  rect(0,350,1000,250); //areia
  fill(49,33,3);
  triangle(550,200,450,350,500,350);
  fill(72,49,4);
  triangle(550,200,500,350,650,350);
  fill(49,33,3);
  triangle(300,350,420,150,360,350);
  fill(72,49,4);
  triangle(420,150,360,350,550,350);
  fill(49,33,3);
  triangle(300,200,200,350,250,350);
  fill(72,49,4);
  triangle(300,200,250,350,400,350); //desenhando as piramides de noite
  
  }
  
  else {
  background(72,192,255);
  fill(255,174,75); //cor de areia
  rect(0,350,1000,250); //areia
  fill(173,102,16);
  triangle(550,200,450,350,500,350);
  fill(222,146,54);
  triangle(550,200,500,350,650,350);
  fill(173,102,16);
  triangle(300,350,420,150,360,350);
  fill(222,146,54);
  triangle(420,150,360,350,550,350);
  fill(173,102,16);
  triangle(300,200,200,350,250,350);
  fill(222,146,54);
  triangle(300,200,250,350,400,350); //desenhando as piramides de dia
  }
  
  //usando o if else para definir a mudança das cores no desenho de acordo com a posição do mouse variando de acordo com a coordenada x
 
   if(mouseX<width/2)
   fill (255,234,45);
   else
   fill(255,255,255);
   ellipse(x++,100,80,80); //usando novas condicionais para definir o movimento da elipse e sua cor conforme a posição do mouse
   
   if(x>890) {
   x=-40;
}
}
 


 


