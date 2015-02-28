
//////////////////////////////
//El programa crea un cubo a partir de imagenes
//y  lo  descompone en cuadros que se mueven al 
//ritmo de la musica. 
//La  camara  rota automaticamente  y puede ser 
//manipulada al hacer click izquierdo y derecho.
//////////////////////////////

//import processing.opengl.*;
import java.util.Vector;

/////////////////////////////
//Librerías de manejo de sonido
import ddf.minim.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
/////////////////////////////

PImage img;   
imgbeat  myimgbeat;

Minim minim;
AudioPlayer in;
BeatDetect beat;
FFT fft;

Vector vecImgbeat = new Vector();
float r;

void setup() {
  size(720, 480, P3D); 
  float r=0;
  minim = new Minim(this);
  in = minim.loadFile("Acuarium.mp3");
  fft = new FFT(in.bufferSize(), in.sampleRate());
  in.play();
  img = loadImage("Clown.png");
  vecImgbeat.add(new imgbeat(-100,-100,-100,img,"BACK"));
  vecImgbeat.add(new imgbeat(-100,100,-100,img,"BOTTOM"));
  vecImgbeat.add(new imgbeat(-100,-100,100,img,"FRONT"));
  vecImgbeat.add(new imgbeat(-100,-100,-100,img,"LEFT"));
  vecImgbeat.add(new imgbeat(100,-100,-100,img,"RIGHT"));
  vecImgbeat.add(new imgbeat(-100,-100,-100,img,"TOP"));
  smooth();
  lights();
}

void draw() {
  background(0,0,20);  
  fft.forward(in.mix);
  r=r+0.01; 
  camera(sin(r)*200+200,cos(r)*200+200,300,0,0,0,sin(r),0,cos(r)); 
  if(mousePressed && (mouseButton == LEFT)) //si se oprime click izquierdo la camara se acerca y queda dentro del cubo. La rotacion sigue siendo automatica en este modo.
    camera(cos(r)*20,cos(r)*20,20,0,0,0,sin(r),0,1); 
  if(mousePressed && (mouseButton == RIGHT))
      camera(sin(r)*mouseX,sin(r)*mouseY,10,0,0,0,sin(r),0,1); // si se hace click derecho la camara se modifica de acuerdo a la posicion del mouse.
  pointLight(255, 0, 0, 0, 0, 200);
  pointLight(255, 0, 0, 0,0,-200);
  pointLight(0, 00, 255, -200, 0, 0);
  pointLight(0, 0, 255, 200, 0, 0);
  pointLight(0, 255, 0, 0, 200, 0);
  pointLight(0, 255, 0, 0, -200, 0);
  pointLight(255,255,0,0,0,0);
  for(int i=0;i<=5;i++){
    imgbeat imb = (imgbeat)vecImgbeat.get(i);
    imb.dibujar(fft.getBand(1)*0.0015);
  }  
}


