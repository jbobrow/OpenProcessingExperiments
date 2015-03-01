
//Variables
float s, m, h, x, y;
int sz,a,b,c,d,e,i;
PImage foto,foto2,foto3,foto4;


void setup() {
  size(400,400);
  foto = loadImage ("bola.jpg");
  foto2 = loadImage ("cap serp.jpg");
  foto3 = loadImage ("cosserp.jpg");
  foto4 = loadImage ("cartell.jpg");
 }
 
void draw() {
   sz = 40;
  a= 50;
  b=80;
  int vsol = second();
  
//activar funcions
  celestrellat();
  sorra();
  boladesert();
  cactus();
  sol();
  cactusrep();
  serp();
  nuvolsqueesmouen();    
}

///////////////////////////////////////////////
////////////////// FUNCIONS ///////////////////

  void  celestrellat(){  // celestrellat amb l'hora
  int vsol = hour();
  background(188-vsol*5, 213-vsol*5, 253-vsol*5); //cel
  
  for(int i = 1; i<100; i=i+20){  // estrelles
  fill(random(190,195));
  ellipse(random(width), random(height), 2,2);
   }
 }
 
 void  nuvolsqueesmouen(){  
   x = x + 0.05;
   y = y + 0.021;
   int vsol = hour();
   fill(238-vsol*3);
    ellipse (y,22,220,20);
    ellipse (x+72,45,150,20);
    ellipse (y+252,22,120,20);
 }

 void sorra(){  //sorra desert
  fill (251,228,179);
  rect (0,220,width,height);
   arc(2, 220, 250, 35, PI, TWO_PI);
   arc(200, 220, 200, 50, PI, TWO_PI);
   arc(340, 220, 150, 40, PI, TWO_PI);
  image(foto4,235,295); //cartell
 }

  void serp(){ // el cap de la serp marca els minuts
  float m = map( minute(), 0, 59, 0, width );
  fill(116,179,108);
  rect(312,335-m/10,9,40+m/10);
  image(foto3,303,365); //cos
  image(foto2,298,335-m/10);//cap
}  

void cactus(){ // l'ombra del cactus també marca els minuts
  float m = map( minute(), 0, 59, 0, width );
  fill(130,118,94); 
  int d= -25;
  arc(82+d, 300, 165+m/3.5, 15, -PI/2, PI/2); //ombra
  fill(18,135,51); //cactus 
  arc(91+d, 258+50, 20, 220, PI, TWO_PI); //cactus
  ellipse(92+d,248,44,18);
  ellipse(75+d,238,14,30);
  ellipse(110+d,238,14,30);
}  


void sol(){ // el sol marca les hores
  noStroke();
  smooth();
  float h = map( hour(), 0, 23, 0, width ); // sol
  int vsol = hour();
  fill(251+vsol*5, 255+vsol*5, 105+vsol*5);
  ellipse( h, sz, sz*1.65, sz*1.65);
 }

 void cactusrep(){ //repetició dels cactus
 int e = 75;
 float m = map( minute(), 0, 59, 0, width );// ombra
  fill(120,118,94);  
  arc(102, 260+50+e, 165+m/3.5, 15, -PI/2, PI/2); 
  fill(18,135,51); //cactus 
  arc(111, 268+50+e, 20, 220, PI, TWO_PI);
  ellipse(112,258+e,44,18);
  ellipse(95,248+e,14,30);
  ellipse(130,248+e,14,30);


int a = 170;
int b = -70;
  fill(130,118,94); 
  arc(112+a, 260+50+b, 165+m/3.5, 15, -PI/2, PI/2); 
  fill(18,135,51); //cactus 
  arc(121+a, 268+50+b, 20, 200, PI, TWO_PI);
  ellipse(122+a,258+b,44,18);
  ellipse(105+a,248+b,14,30);
  ellipse(140+a,248+b,14,30);
}
    
void boladesert(){ // la bola del desert marca els segons
  noStroke();
  float s = map(second(), 0, 59, 0, width );
  image(foto,s,255);
}


