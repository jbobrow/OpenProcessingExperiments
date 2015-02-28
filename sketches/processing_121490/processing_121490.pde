
PImage foto;
int ancho = 5;
int alto = 3;


void setup(){
  size(600,600);
  foto = loadImage("foto1.png");
  background(0);

}

void draw(){
  println(mouseX+ "," +mouseY);
  image(foto,300,170);
  //fondo
  fill(50,0,185);
  ellipse(random(600),random(600),5,8);
  
  //Rayo
  noStroke();
  fill(random(255,0),random(255,159), random(255), 50);
  triangle(450, 40, 435, 130, 410, 130);
  triangle(435, 110, 465, 110, 430, 190);
  //PIPI
  int relleno = int (random(255));
  fill(relleno,relleno*2,relleno/5); 
  int i=190;
  int j =490; 
  while(i<=300 && j>=380){
    ellipse(i,j,ancho,alto);
    i=i+7;
    j=j-7;
  }
    //salpicadura1
  int h=490; 
  while(h>=450){
    ellipse(190,h,ancho,alto);
    h=h-10;
  }
  //salpicadura2
  int x=190;
  int y=490; 
  while(x>=145 && y>=470){
    ellipse(x,y,ancho,alto);
    x=x-10;
    y=y-5;
  }
  //salpicadura
  int an=190;
  int al=490; 
  while(an>=170 && al>=450){
    ellipse(an,al,ancho,alto);
    an=an-10;
    al=al-10;
  }
   

}


