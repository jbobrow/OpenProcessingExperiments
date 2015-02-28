
//JORGE SALGADO MENDOZA 9-NOV-12
//TECNOLOGIA MULTIMEDIA

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim musica;
AudioPlayer reproductor;
AudioSample [] pistas = new AudioSample[2];
PImage bola;
float x=-300,y=0,x2=0,centrox=0,centroy=-420,xx=0,yy=0;
int ox=0,oox=300;
boolean derecha=true, teclado = false, oderecha=true,oizquierda=false,ooderecha=false,ooizquierda=true,colores = false,perdio=false,iniciado=false;

void setup(){
  size(600,420);
  smooth();
  frameRate(10);
  musica = new Minim(this);
  reproductor = musica.loadFile("start.mp3");
  reproductor.loop();   
  pistas[0] = musica.loadSample("bolos.mp3");
  pistas[1] = musica.loadSample("perdio.mp3"); 
}
void draw(){
  if(!iniciado)
    bienvenida();
  else{
  background(0);
  bolos(240,40);
  bolos(260,45);
  bolos(280,50);
  bolos(300,60);
  bolos(320,50);
  bolos(340,45);
  bolos(360,40);  
  escenario();
  obstaculo();
  noFill();
  stroke(255);
  bola();
  }
}
void bola()
{
  stroke(255); 
  fill(255);
  bola = loadImage("bola.png");
  if(!teclado)
  {
    y = sqrt((1-((x*x)/122500))*22500);
    if(x== 300)
      derecha=false;
    if(x== -300)
      derecha = true;
    if(derecha)
      x+=25;
    else
      x-=25;
    image(bola,x+300,y+220);
  }
  else
  {
    yy-=random(1,25);
    xx=(((yy-centroy)/(y-centroy))*(x-centrox))+centrox;
    
    if((yy+340 <= 310 && yy+340 >= 290))
    {
      if(xx+300<oox+200 && xx+300>oox+100)
      {
        perdiste();
        println( "1/ " +(xx+300) + " " + (oox+200) + " " + (oox+100) + "Test jorge sm");
      }
      if(xx+300<oox+100 && xx+300+50>oox+100)
      {
        perdiste();
        println( "2/ " +(xx+300) + " " + (oox+200) + " " + (oox+100) + "Test jorge sm");
      }    
      if(xx+300>oox+200 && xx+300-10<oox+200)
      {
        perdiste();
        println( "3/ " +(xx+300) + " " + (oox+200) + " " + (oox+100) +"Test jorge sm");
      }     
    }
    if((yy+340 <= 210 && yy+340 >= 190))
    {
      if(xx+300<ox+200 && xx+300>ox+100)
      {
        perdiste();
        println( "1/ " +(xx+300) + " " + (ox+200) + " " + (ox+100) + "Test");
      }
      if(xx+300<ox+100 && xx+300+50>ox+100)
      {
        perdiste();
        println( "2/ " +(xx+300) + " " + (ox+200) + " " + (ox+100) + "Test");
      }    
      if(xx+300>ox+200 && xx+300-10<ox+200)
      {
        perdiste();
        println( "3/ " +(xx+300) + " " + (ox+200) + " " + (ox+100) +"Test");
      }     
    }    
    if(yy+340<100)
      ganaste();
    image(bola,xx+300,yy+340);   
  }
}
void bolos(int x,int y)
{
  stroke(255); 
  fill(255);  
  ellipse(x,y-10,19,59);
  ellipse(x,y+30,40,59);
  stroke(255,0,0); 
  strokeWeight(5);
  line(x-10,y,x+10,y);
}
void escenario()
{
  if(colores)
    stroke(255,247,3); 
  else
    stroke(255,247,150);
  strokeWeight(20);  
  line(0,420,220,0);
  line(380,0,600,420);  
  colores = !colores;
}
void keyPressed(KeyEvent e){
  if(e.getKeyCode()==38)
  {
    teclado = true;
  } 
  if(e.getKeyCode()==10 && !iniciado)
  {
    iniciado=true;
    draw();
  } 
}
void obstaculo(){
  stroke(15,255,41);
  strokeWeight(5);
 //Linea Grande 
  line(100+ox,200,200+ox,200);
  if(oderecha)
    ox++;
  if(oizquierda)
    ox--;
  if(ox == 300)
  {
    oderecha = false;
    oizquierda = true;
  }
  if(ox == 0)
  {
    oderecha = true;
    oizquierda = false;
  }
  //Linea Pequenea
  line(100+oox,300,200+oox,300);   
  if(ooderecha)
    oox+=(int)random(5,15);
  if(ooizquierda)
    oox-=(int)random(3,10);
  if(oox >= 300)
  {
    ooderecha = false;
    ooizquierda = true;
  }
  if(oox <= 0)
  {
    ooderecha = true;
    ooizquierda = false;
  }  
}
void perdiste(){
  reproductor.pause();
  pistas[1].trigger();   
  background(0);
  textFont(createFont("SansSerif",20));
  textAlign(CENTER);    
  text("Perdio suerte para la proxima",width/2,50); 
  noLoop();
}
void bienvenida(){
  background(0);
  textFont(createFont("SansSerif",16));
  textAlign(CENTER);    
  text("BOLOS ACATLAN\nTrate de tirar los bolos\nOprima la tecla UP o flecha de arriba\nCuando este seguro de poder hacerlo\nCuidado con los gusanos Verdes\nTe pican\nOprima ENTER\nLa velocidad de la pelota es aleatoria",width/2,50);
}
void ganaste(){
  reproductor.pause();
  pistas[0].trigger();  
  background(0);
  textFont(createFont("SansSerif",20));
  textAlign(CENTER);    
  text("Felicidades ganaste!!!",width/2,350); 
  noLoop();
}

