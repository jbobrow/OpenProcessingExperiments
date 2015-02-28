
void setup (){
 size (600,600);
}


void draw () {
  smooth ();
  background (233,197,43);
  //cuerpo azul
  fill (3,5,255);
  stroke (255,5,5);
  ellipse (300,400,300,300);
  //cabeza
  fill (200,200,200);
  ellipse (300,180,250,150);
  //sonrisa bazier
  fill (0);
  bezier(250,230,280,300,320,255,340,255);
  //nariz
  fill (200,10,10);  
  ellipse (300,200,100,97);
  //bolsillo
  rect (330,400, 80,80);
  //botones
  fill (180,10,100);
  ellipse (300,400,50,40);
  ellipse (300,300,50,40);
  ellipse (300,500,50,40);
  //ojos
  fill (255);
  ellipse (380,170,50,80);
  ellipse (220,170,50,80);
  fill (0);
  ellipse (380,195,30,30);
  ellipse (220,195,30,30);
  //pies
  fill (0,190,0);
  triangle(370,500,330,600,450,600);
  triangle(230,500,150,600,260,600);
  
  
}
