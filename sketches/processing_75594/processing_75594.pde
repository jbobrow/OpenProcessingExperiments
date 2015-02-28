
//bender version1.0
//creado por Oscar Martinez Ramos
//todos los derechos reservados

//variables
int y = 40;
int y2 = 20;
int y3 = 70;


void setup(){
  size (700,700);
  
}
void draw(){
  stroke(0);
  //fondo
  background (165,155,155);
  //visor grande
  fill(124,117,117);
  ellipse(340,250,500,200);
  //visor pequeño
  fill(0);
  ellipse(340,250,480,180);
  //ojos
  fill(255);
  ellipse(230,250,155,155);
  ellipse(450,250,155,155);
  //pupilas
  fill(0);
  rect(205,230,50,50);
  rect(425,230,50,50);
  //ceño fruncido
  triangle(230,170,450,170,340,270);
  //boca grande
  fill(124,117,117);
  rect(130,400,430,180);
  //boca pequeña
  fill(255);
  rect(140,410,410,160);
  //dientes verticales
  line(190,410,190,570);
  line(270,410,270,570);
  line(350,410,350,570);
  line(420,410,420,570);
  line(500,410,500,570);
  //dientes horizontales
  line(140,460,550,460);
  line(140,520,550,520);
  //puro
  fill(131,56,12);
  quad(400,510,450,510,580,570,560,600);
  quad(400,510,460,520,590,580,570,610);
  fill(247,15,15);
  ellipse(580,590,40,40);
  fill(242,235,10);
  ellipse(580,590,30,30);
  fill(255,0,0);
  ellipse(580,590,20,20);
  //humo
  y = (y+589)%590;
  fill(240,227,227);
  ellipse(570,y,20,25);
  y2 = (y2+589)%590;
  ellipse(590,y2,45,30);
  y3 = (y3+590)%591;
  ellipse(610,y3,40,25);
}

