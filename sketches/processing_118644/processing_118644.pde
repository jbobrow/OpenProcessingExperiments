
int inchado = 220 ;
float temblor = 230 ;
float temblor2 = 220;
int contador = 0;
int mov_cir = 0;

//BUBBLES
float a = random(220,300);
float b = random(220,300);
float c = random(220,300);
float d = random(220,300);
float e = random(220,300);
  

void setup(){ 
  size(500,500);
  background(256,256,256);
  smooth();
  frameRate(100);
}

void draw(){
  //EXPLOSION
  if (mousePressed && inchado < 400){
    inchado = inchado + 1 ;
    
  } else if(mousePressed && inchado == 400){
    temblor = random(220,245);
    temblor2 = random(225,245);
    contador = contador + 1;
    
  } else if(contador > 150){
    mov_cir = mov_cir + 1;
  
  }
  
  
  
  
  //PUNTERO
  
println(" X " + mouseX +" Y " + mouseY);

  //FONDO
  //SUELO
  noStroke();
  fill(#B48356);
  rect(0,400,500,500);
  //cielo
  noStroke();
  fill(#CEBAF0);
  rect(0,0,500,400);
  noFill();
  //estrellas
  stroke(#FFF150);
  strokeWeight(3);
  point(62,336);
  point(147,315);
  point(45,266);
  point(65,37);
  point(271,20);
  point(304,101);
  point(316,18);
  point(194,15);
  point(408,35);
  point(494,9);
  point(432,11);
  point(470,139);
  point(337,317);
  point(270,357);
  point(368,375);
  point(474,373);
  point(392,249);  
  point(163,370);
  point(10,263);
  //estrellas grandes
  strokeWeight(5);
  point(128,103);
  point(60,232);
  point(49,376);
  point(392,9);
  point(418,332);
  
  //suelo
  strokeWeight(8);
  stroke(0);
  strokeWeight(6);
  
  line(0,400,194,400);
  line(237,400,500,400);
  strokeWeight(3);
  line(0,429,63,429);
  line(135,429,192,429);
  line(71,429,79,429);
  line(96,429,103,429);
  line(112,429,120,429);
  line(254,429,289,429);
  line(299,429,310,429);
  line(345,429,500,429);
  strokeWeight(2);
  line(20,480,40,480);
  line(43,480,49,480);
  line(55,480,61,480);
  line(67,480,78,480);
  line(126,480,234,480);
  line(269,480,489,480);
  line(489,480,496,480);
  strokeCap(PROJECT);
  
  //CABEZA
  if (contador <= 150){
  strokeWeight(3);
  fill(#1FA259);
  ellipseMode(CENTER);
  ellipse(temblor,temblor2,inchado,inchado);
  strokeWeight(3);}
  
  //COLOR CUERPO
  noStroke();
  fill(#34FF9B);
  rect(207,336,29,131);
  rect(202,336,42,10);
  rect(197,338,10,70);
  rect(235,338,13,50);
  stroke(0);
  strokeWeight(3);
  line(209,335,238,335);
 //BRAZO DERECHO
  fill(#085038);
  arc(206,345,20,20,PI,3*PI/2.0);
  line(196,347,196,399);
  arc(202,401,12,12,0,PI);
  line(208,353,208,399);
  
  //CUERPO-PIERNA_DERECHA
  line(208,353,208,460);
  arc(213,463,12,12,0,PI);
  
  //CUERPO-PIERNA_IZQUIERDA
  line(220,410,220,460);
  arc(227,463,12,12,0,PI);
  
  //BRAZO IZQUIERDO
  line(234,360,234,460);
  arc(238,345,20,20,PI*1.5,2.0*PI);
  line(248,347,248,384);
  arc(242,387,12,12,0,PI);
  
  //COLLAR-ESPACIAL
  int col = mouseY;
  stroke(25,col,col);
  triangle(215,345,220,345,218,340);
  stroke(0);
  if(contador <= 150){
  //OIDO-SUPERSONICO_IZQUIERDO
  quad(320,194,335,206,336,232,324,235); 
  quad(330,212,356,215,356,219,331,226);
  ellipse(369,216,16,16);
  
  //OIDO-SUPERSONICO_IZQUIERDO
  quad(119,214,96,219,96,222,119,228);
  ellipse(90,221,14,14);
  
  //CEJAS
    //sombras
    stroke(#0C7C47);
    strokeWeight(7);
    fill(#37BC72);
  arc(264,170,100,90,1.4*PI,2.0*PI);
  arc(210,170,100,90,3.3,5);
  strokeWeight(3);
  stroke(0);
  //derecha
  noFill();
  arc(264,170,100,90,1.4*PI,2.0*PI);
  //izquierda
  arc(210,170,100,90,3.3,5);

  
 // OJOS
 //sombra
 fill(#085229);
 strokeWeight(0);
 ellipse(280,159,40,40);
 ellipse(205,164,40,40);
 //pupilas
  fill(#A15AFF);
 strokeWeight(0);
 ellipse(280,159,25,25);
 ellipse(205,164,25,25);
 
 //iris
 stroke(#037151);
 strokeWeight(7);
 ellipse(209,162,30,30);
 ellipse(283,157,30,30);
 noStroke();
 
 //color fondo
 stroke(#037151);
 fill(#FFFCFC);
 arc(209,162,30,30,0.5,5);
 arc(283,157,30,30,0.5,5);
 
 //reflejo
 noStroke();
 fill(#62BAD8);
 arc(197,177,25,30,4.7,6);
 arc(271,172,25,30,4.7,6);
 noFill();
 stroke(#037151);
 arc(209,162,30,30,0.5,5);
 arc(283,157,30,30,0.5,5);
 noStroke();

//boca_marciano
 fill(#E0751D);
 ellipse(217,259,42,63);
 noStroke();
 fill(#DED51F);
 ellipse(221,273,32,29);
 
 noFill();
 stroke(#1FA259);
 strokeWeight(15);
 ellipse(217,259,63,63);}

 //GATO
 //burellas 
 stroke(#FFFFFF);
 strokeWeight(5);
 triangle(443,38,458,34,446,23);
 triangle(476,38,463,34,476,23);
 strokeWeight(3);
 fill(#FFFFFF);
 stroke(0);
 triangle(443,38,458,34,446,23);
 triangle(476,38,463,34,476,23);
 noFill();
 //cara
 strokeWeight(2);
 stroke(#FFFFFF);
 fill(0);
 ellipse(460,58,50,30);
 ellipse(460,42,35,20);
 stroke(0);
 ellipse(460,52,35,20);
 //boca gato
 stroke(#FFFFFF);
 strokeWeight(1.8);
 arc(454,55,13,11,0,PI);
 arc(468,55,13,11,0,PI);
 
 int len_rec = 0;
 if(mouseX > 165){
 len_rec = mouseX - 165;
 }
 
 fill(#FF2121);
 rect(454,63,13,len_rec);
 arc(461,len_rec + 62,13,11,0,PI);
 //nariz
 fill(#FFFFFF);
 triangle(457,50,465,50,461,53);
 noFill();
 //bigotes
 point(455,53);
 point(450,53);
 point(466,53);
 point(472,53);
 point(453,50);
 point(469,50);
 //ojos gato
 noFill();
 arc(451,44,13,11,3.3,6);
 arc(470,44,13,11,3.3,6);

 //cola
  //perfilado
 strokeCap(ROUND);
 stroke(#FFFFFF);
 strokeWeight(10);
 arc(430,60,30,30,0.8,2.7);
 arc(400,69,30,30,3.3,6);
 //negro
 strokeCap(ROUND);
 stroke(0);
 strokeWeight(7);
 arc(430,60,30,30,0.8,2.7);
 arc(430,60,30,30,0.6,2.7);
 arc(400,69,30,30,3.3,6);
 

 if(contador > 150){
    noStroke();
    fill(e,100,100);
    ellipse(a - mov_cir,b - mov_cir, 60,40);
    fill(100,d,100);
    ellipse(b + mov_cir,230, 40,40);
    fill(100,100,c);
    ellipse(c + mov_cir,b - mov_cir, 40,40);
    fill(b,23,47);
    ellipse(d - mov_cir,b + mov_cir, 40,40);
    fill(55,a,100);
    ellipse(e + mov_cir,b - mov_cir, 40,40);
    
  }
   /*int ovalo = 40;
 int ovalo2 = 0;
  void mouseReleased(){
  if(ovalo>= 40 && ovalo <= 60 ){
  ovalo = ovalo + 1;
  } else if(ovalo ){
  
  }*/
    
  }



