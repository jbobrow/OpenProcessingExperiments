
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
//Global Variables
//color tDo = #96DC04;
Minim minim;
AudioSample nDo;
AudioSample nRe;
AudioSample nMi;
AudioSample nFa;
AudioSample nSol;
AudioSample nLa;
AudioSample nSi;
AudioSample nDob;
AudioSample tyayo;
PImage todosYayo;
PImage pandastar;
PImage none;


//GONY XILOFONO MAÑANITAS
void setup(){
  size(1024, 768);
  background(#FFFFFF);
  minim = new Minim(this);
  nDo = minim.loadSample("01_do.mp3");
  nRe = minim.loadSample("02_re.mp3");
  nMi = minim.loadSample("03_mi.mp3");
  nFa = minim.loadSample("04_fa.mp3");
  nSol = minim.loadSample("05_sol.mp3");
  nLa = minim.loadSample("06_la.mp3");
  nSi = minim.loadSample("07_si.mp3");
  nDob = minim.loadSample("08_do2.mp3");
  tyayo = minim.loadSample("YAYO.mp3");
  pandastar = loadImage("PandaStarHBD.jpg");
  todosYayo = loadImage("todossomosyayo.jpg");
  none = loadImage("none.jpg");
  
}

void draw(){
  PFont edwar = loadFont("edwar.vlw");
  textFont(edwar);
  //Color
  fill(#D84F29);
  //Puntaje
  textSize(72);
  textAlign(CENTER);
  text("Happy birthday Gonz", width/2, 100);
  fill(#000000);
  PFont frut = loadFont("frut.vlw");
  textFont(frut);
  textSize(20);
  text("x x b b v b n v   b n m b n m ,   , , m n b v n b   v b n m , n b", width/2, 170);  
  
  strokeWeight(5);
  stroke(#DEA868);
  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      fill(#96DC04);
      rect(24, 200, 115, 405 );
    }
  } else {
    fill(#B4DC61);
    rect(24, 200, 115, 405 );
  }
  
  if (keyPressed) {
    if (key == 'x' || key == 'X') {
      fill(#02BEBF);
      rect(149, 207, 115, 390 );
    }
  } else {
    fill(#6DBFBF);
    rect(149, 207, 115, 390 );
  }
  
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      fill(#0460D9);
      rect(274, 215, 115, 375 );
    }
  } else {
    fill(#6A9AD9);
    rect(274, 215, 115, 375 );
  }
  
  if (keyPressed) {
    if (key == 'v' || key == 'V') {
      fill(#6E278F);
      rect(399, 222, 115, 360 );
    }
  } else {
    fill(#7B528F);
    rect(399, 222, 115, 360 );
  }
  
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      fill(#FE67AF);
      rect(524, 230, 115, 345 );
    }
  } else {
    fill(#FEADD3);
    rect(524, 230, 115, 345 );
  }

  if (keyPressed) {
    if (key == 'n' || key == 'N') {
      fill(#F20505);
      rect(649, 237, 115, 330 );
    }
  } else {
    fill(#F27979);
    rect(649, 237, 115, 330 );
  }
  
  if (keyPressed) {
    if (key == 'm' || key == 'M') {
      fill(#F37008);
      rect(774, 245, 115, 315 );
    }
  } else {
    fill(#F3A668);
    rect(774, 245, 115, 315 );
  }
  
  if (keyPressed) {
    if (key == ',') {
      fill(#F2B602);
      rect(899, 252, 115, 300 );
    }
  } else {
    fill(#F2D16D);
    rect(899, 252, 115, 300 );
  }
  noStroke();
  fill(#000000);
  rect(100, 670, 185, 50);
  rect(700, 670, 185, 50);
  textSize(20);
  textAlign(LEFT);
  fill(#FFFFFF);
  text("#todossomosyayo", 110, 700); 
  text("HBD Pandastar", 720, 700); 
 
 if (mouseX > 100 && mouseX < 285){
   if(mouseY > 670 && mouseY < 720){
     if (mousePressed == true) {
       image(todosYayo, 0, 0);
     }
   }
 } 

 if (mouseX > 700 && mouseX < 885){
   if(mouseY > 670 && mouseY < 720){
     if (mousePressed == true) {
       image(pandastar, 0, 0); 
     }
   }
 }
 
}

 void mouseReleased(){
    image(none, 0, 0);
    if (mouseX > 100 && mouseX < 285){
     if(mouseY > 670 && mouseY < 720){
       tyayo.trigger();
     }
    }
  }

void keyPressed(){ 
  switch(key){
    case 'z' :
      nDo.trigger();
      break;
    case 'x' :
      nRe.trigger();
      break;
    case 'c' :
      nMi.trigger();
      break;
    case 'v' :
      nFa.trigger();
      break;
    case 'b' :
      nSol.trigger();
      break;
    case 'n' :
      nLa.trigger();
      break;
    case 'm' :
      nSi.trigger();
      break;
    case ',' :
      nDob.trigger();
      break; 
  }
}




