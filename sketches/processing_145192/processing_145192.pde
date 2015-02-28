

//declaración de parámetros posicion, velocidad
int posx, posy, velx, vely;
  
void setup(){
  //quitar cursor
  noCursor();
  //presentación del trabajo, se lee siempre
  println("Angry Birds _ PIG");
  println("Amaia Aranzabal 2GEDI 03 _ Elisava");
  //tamaño de la ventana
  size(800,800);
  //definición color del fondo
  background(255,255,255);
  
  //inicialización en la posición inicial (en el centro de la pantalla)
  posx=width/2;
  posy=height/2;
  velx=3;
  vely=3; 
}

void draw(){
  //definicion del color del fondo
  background(255,255,255);
  
  //actualización de posiciones
  posx=posx+ velx;
  posy=posy+ vely;
  
  //PIG
  //oreja izquierda
  strokeWeight(5);
  stroke(19,21,12);
  fill(135,185,34);
  ellipse(posx-width/8,posy-(height/4.5),width/11,height/10);
  //oreja derecha
  ellipse(posx+width/15,posy-(height/4),width/11,height/10);
  //cuerpo
  ellipseMode(CENTER);
  ellipse(posx,posy,width/2,(2*height)/4.5);
  //orejas
  noStroke();
  ellipse(posx-width/8,posy-(height/4.5),width/11,height/10);
  ellipse(posx+width/15,posy-(height/4),width/11,height/10);
  fill(56,149,43);
  ellipse(posx-width/8,posy-(height/4.5),width/22,height/25);
  ellipse(posx+width/15,posy-(height/4),width/25,height/22);
  //boca
  fill(30,59,29);
  ellipse(posx,posy+height/25,(2*width)/10,height/4);
  //cejas
  fill(32,91,39);
  arc(posx-(width*3)/16,posy-height/20,(width*3)/30,(height*3)/30,PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  arc(posx+(width*3)/16,posy-height/20,(width*3)/30,(height*3)/30,PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  fill(135,185,34);
  ellipse(posx-(width*3)/16,posy-height/23,(width*3)/28,(height*3)/28);
  ellipse(posx+(width*3)/16,posy-height/23,(width*3)/28,(height*3)/28);
  //ojos
  strokeWeight(3);
  stroke(65,112,43);
  fill(255,255,255);
  ellipse(posx-(width*3)/16,posy,(width*3)/30,(height*3)/30);
  ellipse(posx+(width*3)/16,posy,(width*3)/30,(height*3)/30);
  noStroke();
  fill(0,0,0);
  ellipse(posx-(width*3)/15,posy,(width*2)/75,(height*2)/75);
  ellipse(posx+(width*3)/16.5,posy,(width*2)/75,(height*2)/75);
  //dientes
  fill(68,114,38);
  ellipse(posx,posy+(height/9),width/20,height/15);
  ellipse(posx-width/20,posy+(height/10),width/20,height/15);
  ellipse(posx+width/20,posy+(height/10.5),width/20,height/15);
  fill(255,255,255);
  ellipse(posx,posy+(height/9),width/25,(height*4)/75);
  ellipse(posx-width/20,posy+(height/10),width/25,(height*4)/75);
  ellipse(posx+width/20,posy+(height/10.5),width/25,(height*4)/75);
  //nariz
  stroke(87,134,39);
  strokeWeight(5);
  fill(179,201,2);
  ellipse(posx,posy,width/4,(2*height)/10);
  noStroke();
  fill(30,59,29);
  ellipse(posx-width/20,posy,width/25,width/15);
  ellipse(posx+width/20,posy,width/25,width/20);


  //LIMITES
  //limites en el eje X
  if ((posx > width-width/4)||(posx < width/4)) {velx=-velx;}
  //limites en el eje Y  
  if(posy > height-((2*height)/9)||(posy < 0+(2*height)/9)) {vely=-vely;}
  
}

void mousePressed(){
  
  // al clicar PIG comienza desde el centro
  posx=width/2;
  posy=height/2;
  
  //al clicar se agrandan los ojos y cambian de color
  strokeWeight(3);
  stroke(65,112,43);
  fill(204,22,224); //cambio de color
  ellipse(posx-(width*3)/16,posy,(width*3)/10,(height*3)/10);//cambio de tamaño
  ellipse(posx+(width*3)/16,posy,(width*3)/10,(height*3)/10);
  noStroke();
  fill(0,0,0);
  ellipse(posx-(width*3)/15,posy,(width*2)/25,(height*2)/25);//cambio de tamaño
  ellipse(posx+(width*3)/16.5,posy,(width*2)/25,(height*2)/25);
}


