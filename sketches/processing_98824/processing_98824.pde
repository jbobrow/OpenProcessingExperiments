
//es tracta de clicar just quan els dos avions coincideixin 

float x=0, y=0, vx=7, vy=7;
int a=70, b=55, value=0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
var audioElement1 = document.createElement("audio");
var audioElement2 = document.createElement("audio");//definicio de variables


void setup(){
  size(700,400);//tamany
  audioElement2.setAttribute("src","avio.mp3");//identificacio de larxiu
  audioElement2.play();//reproduccio del so de lavio
  img1=loadImage("nau.jpg");
  img2=loadImage("explosio.jpg");
  img3=loadImage("fondo.jpg");
  img4=loadImage("kamikaze.jpg");//carrega de les imatges
  background(0);
  noCursor();//no es veu el cursor
}


void draw(){
  image(img3,0,0,width,height);//imatge de fons
  pushMatrix();
  translate(mouseX,mouseY);//faig que es mogui amb el mouse
  scale(0.1);//escala a la que he posat l'avio
  image(img4,0,0);//avio que portes amb el cursor
  popMatrix();
  if((x<0)||(x>width-a)){
    vx=-vx;
  }//per que l'avio reboti per la pantalla
  if((y<0)||(y>height-b)){
    vy=-vy;
  }
  image(img1,x,y,a,b);//la imatge de l'altre avio
  x=x+vx;
  y=y+vy;//velocitats
}


void mousePressed(){
  if((mouseX>x-a)&&(mouseY>y-b)&&(mouseX<x+a)&&(mouseY<y+b)){
    img1=img2;//defineixo que si les imatges dels dos avions coincideixen al apretar el mouse, s'intercanviin les imatges per la d'una explosio
    img4=img2;
    vx=0;
    vy=0;//faig que es pari l'avio
    audioElement1.setAttribute("src","explosio.mp3");
    audioElement1.play();//sona una explosio
  }
}



