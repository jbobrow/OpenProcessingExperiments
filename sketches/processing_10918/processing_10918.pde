
/**
 * subPlayer (subtitule Player )is made by Patricio Gonzalez Vivo ( www.res-novae.com.ar or www.arteparasanarte.com ) 
 * Based on AdvancedPlayer 
 * 
 * Can read .srt files 
 */

import pogg.*;

TheoraMovie myMovie;

int BUTTONS_HEIGHT = 30;
int MARGIN = 3;

int BUTTON_NONE = -1;
int BUTTON_PLAY = 0;
int BUTTON_STOP = 1;
int BUTTON_SLOW = 2;
int BUTTON_SCROLL = 3;
int BUTTON_FAST = 4;
int BUTTON_CLOCK = 5;

int overButton = BUTTON_NONE;
int[] buttonX;
int[] buttonW;

double speed = 1;

int btop;
int bdown;

//pause -> play = false; stop = false;
boolean play = true;
boolean stop = false;
PFont font;

String[] raw;
String[][] subs;

int subN = 0;

void setup() {

  myMovie = new TheoraMovie(this, "video.ogg");
  myMovie.loop();

  frameRate(myMovie.fps);

  //size(myMovie.width, myMovie.height+BUTTONS_HEIGHT);
  size(320, 240+BUTTONS_HEIGHT); //for the html code to work well

  font = createFont("Monospaced.bold",20);
  
  textFont(font);

  //Loads the subtitles file
  raw = loadStrings("sub.srt");
  
  //here is going to be convert to an inner format
  subs = new String[raw.length][3];

  int contador = 1;
  
  println(raw.length + " lineas a agregar:");

  for(int i=0; i < raw.length;i++) {
    if( int(raw[i]) == contador ) {
      String[] tiempoRAW = split(raw[i+1]," ");

      String[] entradaRAW = split(tiempoRAW[0],":");
      String[] salidaRAW = split(tiempoRAW[2],":");
      
      int[] segEntradaRAW = int(split(entradaRAW[2],","));
      int[] segSalidaRAW = int(split(salidaRAW[2],","));

      int entrada = int(entradaRAW[0])*60*60+int(entradaRAW[1])*60+segEntradaRAW[0];
      int salida = int(salidaRAW[0])*60*60+int(salidaRAW[1])*60+segSalidaRAW[0];

      String texto = "";
      for(int l=0; !(raw[i+2+l].equals("")); l++) {
        texto = texto + raw[i+2+l];
      }

      subs[contador-1][0]= Integer.toString(entrada);
      subs[contador-1][1]= Integer.toString(salida);
      subs[contador-1][2]= texto;
      
      println(contador+" "+ entrada + " -->" + salida + " dice " + texto);
      contador++;
    }
  }

  btop = myMovie.height;
  bdown = myMovie.height+BUTTONS_HEIGHT;

  //initialization of the buttons widths and positions
  buttonW = new int[] {
    23,23,8,0,8,62
  };
  int total = (buttonW.length+1)*MARGIN;
  for(int i=0; i<buttonW.length; i++) {
    total += buttonW[i];
  }
  //the scroll takes all the available space
  if(total<width) {
    buttonW[BUTTON_SCROLL] = width-total;
  }
  int pos = MARGIN;
  buttonX = new int[6];
  for(int i=0; i<buttonX.length; i++) {
    buttonX[i] = pos;
    pos += MARGIN+buttonW[i];
  }
}

void draw() {
  if(play) {
    myMovie.read();
  }

  if(stop) {
    background(0);
  } 
  else {
    image(myMovie, 0, 0);
  }

  checkOverbutton();
  drawButtons();
}

void mouseClicked() {
  if(overButton == BUTTON_PLAY) {
    play = !play;
    stop = false;
  } 
  else if(overButton == BUTTON_STOP) {
    myMovie.stop();
    play = false;
    stop = true;
  } 
  else if(overButton == BUTTON_SLOW) {
    speed = speed / 1.5;
    frameRate((float)(speed*myMovie.fps));
  } 
  else if(overButton == BUTTON_FAST) {
    speed = speed * 1.5;
    frameRate((float)(speed*myMovie.fps));
  }
}

void checkOverbutton() {
  overButton = BUTTON_NONE;
  if(mouseY>=btop+MARGIN && mouseY<=height-MARGIN) {
    for(int i=0; i<buttonX.length; i++) {
      if(mouseX>=buttonX[i] && mouseX<=buttonX[i]+buttonW[i]) {
        overButton = i;
        break;
      }
    }
  }
}

void drawButtons() {
  smooth();

  noStroke();

  fill(74, 84, 94); //color 1

  rect(0, btop, width, BUTTONS_HEIGHT);


  ellipseMode(CORNER);

  //play button
  int x = buttonX[BUTTON_PLAY];
  int y = btop+MARGIN;
  int w = buttonW[BUTTON_PLAY];
  int h = w;
  if(overButton == BUTTON_PLAY) {
    fill(255,255,255); //color 3
  } 
  else {
    fill(156,166,176); //color 2
  }
  ellipse(x, y, w, h);
  fill(74, 84, 94); //color 1
  if(!play) {
    triangle(x+9, y+7, x+9, y+16, x+17, y+11);
  } 
  else {
    rect(x+8, y+8, 3, 8);
    rect(x+13, y+8, 3, 8);
  }

  //stop button
  x = buttonX[BUTTON_STOP];
  w = buttonW[BUTTON_STOP];
  if(overButton == BUTTON_STOP) {
    fill(255,255,255); //color 3
  } 
  else {
    fill(156,166,176); //color 2
  }
  ellipse(x, y, w, h);
  fill(74, 84, 94);
  rect(x+8, y+8, 8, 8);

  //slow button
  x = buttonX[BUTTON_SLOW];
  w = buttonW[BUTTON_SLOW];
  if(overButton == BUTTON_SLOW) {
    fill(255,255,255); //color 3
  } 
  else {
    fill(156,166,176); //color 2
  }
  triangle(x+4, y+6, x+4, y+16, x, y+11);
  triangle(x+8, y+6, x+8, y+16, x+4, y+11);

  //fast button
  x = buttonX[BUTTON_FAST];
  w = buttonW[BUTTON_FAST];
  if(overButton == BUTTON_FAST) {
    fill(255,255,255); //color 3
  } 
  else {
    fill(156,166,176); //color 2
  }
  triangle(x+4, y+11, x, y+6, x, y+16);
  triangle(x+8, y+11, x+4, y+6, x+4, y+16);


  //clock
  x = buttonX[BUTTON_CLOCK];
  y = height-9;
  if(overButton == BUTTON_CLOCK) {
    fill(255,255,255); //color 3
  } 
  else {
    fill(156,166,176); //color 2
  }
  float sec = myMovie.time();
  String time = formatTime(sec);

  text(time,x,y);

  //Subtitles
  if ( int(sec) == 0) subN = 0;
  
  if ( int(sec) >= int(subs[subN][0])) {
    textAlign(CENTER);
    fill(203,16,195);
    text(subs[subN][2],width/2, y - 40);
    
    if(int(sec) >= int(subs[subN][1])) subN++;
  } 
  
  textAlign(LEFT);

  noSmooth();
}


String formatTime(float sec) {
  int seconds = (int)sec;
  float fraction = sec-seconds;
  int mill = (int)(fraction *1000);
  int minutes = seconds/60;
  seconds = seconds%60;
  int hours = minutes/60;
  minutes = minutes%60;

  String time = "";
  if(minutes<10) {
    time = time+"0";
  }
  time = time+minutes+":";
  if(seconds<10) {
    time = time+"0";
  }
  time = time+seconds;
  return time;
}


