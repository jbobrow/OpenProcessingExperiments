
//////////// adupan [pseudonym] [http://www.openprocessing.org/user/19961]  /////
//////////// CC3.0 [http://creativecommons.org/licenses/by/3.0/]            /////
//////////// Comics & random V beta 0.5  [tested in Processing 2.0]         /////
/////////////////////////////////////////////////////////////////////////////////
//* Keys:
//*
//* 's'                      -->   to save png frame
//* 'DELETE' & 'BACKSPACE'   -->   to clear the canvas
//*

//import android.view.MotionEvent;
import java.util.Calendar;
PShape[] boc = new PShape[15];
PShape[] vin = new PShape[5];
PShape[] gir = new PShape[1];

///color de fondo
color bg = color(65);
color shade = color(255);

//variables
float glitch = 0;
float var;

void setup() {
  //size(displayWidth, displayHeight);
  size(980, 700);	
  smooth();
  background(bg);
  frameRate(15);
  //grosor de linea
  stroke(0, 0, 0);
  strokeWeight(1);

  shapeMode(CENTER);
  //noCursor();

  //cargar los archivos svg bocadillos
  for (int i = 0; i<boc.length; i++) {
    boc[i] = loadShape(i + ".svg");
  }
  //cargar los archivos svg viñetas
  for (int i = 0; i<vin.length; i++) {
    vin[i] = loadShape("sq" + i + ".svg");
  }
   
   for (int i = 0; i<gir.length; i++) {
    gir[i] = loadShape("m" + i + ".svg");
  }
  
}

void draw() {

  rectMode(CENTER);
  fill(255, 255, 255, 15);
  //rect(width/2, height/2, width, height);

  for (int i = 0; i<boc.length; i++) boc[i].disableStyle();
  for (int i = 0; i<vin.length; i++) vin[i].disableStyle();

  stroke(0, 0, 0);
  strokeWeight(1);
  fill(shade);

  float actual = random(boc.length);
  float sizeMax = random(0.7, 1.2);
  glitch = random(-3, 6);

  var = (width/3);

  if (mousePressed && (mouseButton == LEFT)) {
    //dibujar bocadillos
    rectMode(CENTER);
    pushMatrix();
    translate(mouseX, mouseY);
    scale(sizeMax);

    shape(boc[int(actual)], glitch, glitch);
    boc[int(actual)].rotate(random(-0.25, 0.25)); 
    popMatrix();
  }
}

void mouseReleased() {
  //dibujar viñetas 
  if (mouseButton == RIGHT) {
    rectMode(CENTER);
    fill(255);
    shape(vin[int(random(5))], width/2, height/2);
  }
}

void keyReleased() {
  if (key == 's'    || key == 'S'      ) saveFrame(timestamp()+"_##.png");
  if (key == DELETE || key == BACKSPACE) background(bg);
  }

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



