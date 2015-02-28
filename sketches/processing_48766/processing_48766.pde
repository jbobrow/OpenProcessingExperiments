
/* 
* A personal favorite outro made by Razor 1911
* The chiptune is called: My dirty old Kamel
* You can watch the original here: 
* http://www.youtube.com/watch?v=lU-aoqtTIkw
* Font isn't from a sprite, I cheated on that one ;)
* 
* Coded by: @ramayac
*/

import javax.sound.sampled.*;
import rac.ModPlayer;

PImage i1911;
PImage back;
//PImage font;
PImage girl;
PImage razor;

PImage textura;

float teta;
float escala = 2.0;

PVector vgirl;
PFont font;

ModPlayer mod = new ModPlayer();

void setup(){
  size(640, 480, P3D);
  
  i1911 = loadImage("1911.png");
  back = loadImage("back.png");
  //font = loadImage("font.png");
  girl = loadImage("girl.png");
  razor = loadImage("razor.png");
  
  vgirl = new PVector(width/2, height/6);
  
  textura = crearTextura(back, 5);
  
  font = loadFont("Micronian-22.vlw"); 
  textFont(font); 
  
  frameRate(24);
  noStroke();
  
  try {
    byte xm[] = loadBytes("outro.xm"); 
    mod.setModuleData(xm);
    mod.playThread();
  } catch (Exception e) {
    e.printStackTrace();
  }
}

void draw(){
  teta += 0.01;
  escala += 0.008;
  
  pushMatrix();
  translate(width/2, height/2);
  rotateZ(teta*PI/6);
  translate(-textura.width/2, -textura.height/2);
  
  float sc = abs(sin(escala));
  //sc = constrain(sc, 1, 1.5);
  //println(sc);
  scale(1+sc);
  cuadro();
  popMatrix();
  
  stroke(0);
  fill(0, 100);
  rect(10, 90, 300, 300); 
  noStroke();
  
  digitar();
  
  pushMatrix();
  if(random(0, 1) < 0.10){
    float rx = random(-2, 2);
    float ry = random(-2, 2);
    vgirl.add(rx, ry, 0);
  }
  translate(vgirl.x, vgirl.y);
  image(girl, 0, 0);
  popMatrix();
   
  image(razor, 0, 0);
  image(i1911, 0, height - i1911.height);
  
}

PImage crearTextura(PImage fondo, int size){
  int s = size;
  int sizex = fondo.width * s;
  int sizey = fondo.height * s;
  
  PImage buffer = createImage(sizex, sizey, RGB);
    for(int i = 0; i < s; i++){
      for(int j = 0; j < s; j++){
        int ii = i * fondo.width;
        int jj = j * fondo.height;
        
        buffer.copy(fondo, 0, 0, fondo.width, fondo.height, 
        ii, jj, fondo.width, fondo.height);
        //cuadro(i*fondo.width, j*fondo.height);    
      }
  }
  
  return buffer;
}

void cuadro(){
  beginShape();
  texture(textura);
  vertex(0, 0, 0, 0);
  vertex(textura.width, 0, textura.width, 0);
  vertex(textura.width, textura.height, textura.width, textura.height);
  vertex(0, textura.height, 0, textura.height);
  endShape(CLOSE);
}

int currentchar = 0;
String texto = 
  "A small tribute to\n" +
  "one of the coolest\n" +
  "scene groups:\n" +
  "\n" +
  "---------------------------\n" +
  "\n" +
  "        RAZOR 1911\n" +
  "\n" +
  "---------------------------\n" +
  "\n" +
  " coded by: @ramayac \n";

String textbuffer = new String("");

void digitar(){
 if(currentchar < texto.length()){
   currentchar++;
   textbuffer = texto.substring(0, currentchar);
 }
 fill(#CCCECC);
 text(textbuffer, 20, 120, 300, 276);
}

void exit() {
  mod = null;
  super.exit();
}

