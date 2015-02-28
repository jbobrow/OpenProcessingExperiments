
/**
 * <b> farbrasterrr functions </b><br><br>
 * <b> key 1</b> linecolor randomized between 0-30 or 320-360 degree <i>(hsb)</i><br>
 * <b> key 2</b> linecolor randomized between 30-70 degree <i>(hsb)</i><br>
 * <b> key 3</b> linecolor randomized between 70-160 degree <i>(hsb)</i><br>
 * <b> key 4</b> linecolor randomized between 160-200 degree <i>(hsb)</i><br>
 * <b> key 5</b> linecolor randomized between 200-250 degree <i>(hsb)</i><br>
 * <b> key 6</b> linecolor randomized between 250-320 degree <i>(hsb)</i><br><br>
 * <b> key e</b> lines end round<br>
 * <b> key r</b> lines end flat<br><br>
 * <b> key h</b> lines are horicontal drawn<br>
 * <b> key v</b> lines are vertical drawn<br>
 * <b> key d</b> lines are diagonal downwards drawn<br>
 * <b> key f</b> lines are diagonal upwards drawn<br><br>
 * <b> key t</b> transparency between 10%-100% chooseable<br>
 * <b> key z</b> transparecy directly back to 100%<br><br>
 * <b> key b</b> changes background from black to white<br>
 * <b> key n</b> fills whole window with backgroundcolor<br><br>
 * <b> key x</b> changes x-value of raster from 2-20<i> (2 steps)</i><br>
 * <b> key y</b> changes y-value of raster from 2-20<i> (2 steps)</i><br><br>
 * <b> mouseY position</b> changes line weight <i>(top: thin - down: fat)</i><br>
 * <b> mouseX position</b> changes line weightvariation <i>(left: all same - right: very different)</i><br><br>
 * <b> <u>superfunctions</u></b> - <i><u>online local via processing with the source - not online !!</i></u><br>
 * <b> key s</b> saves the actual image<br>
 * <b> key backspace</b> redo <i>(only <u>five</u> times possible)</i><br>
 * <b> informations</b> about chosen color, line-direction, transparency, etc. via println in processing!<br><br>
 * tim reichelt 20081120
 */

String startTime;  
float hinterGrund = 0;
float anzahlX = 2;
float anzahlY = 2;
float trans = 100;
int sJoin = 1;
float posX, posY; 
float entoder; 
float farbWert = 0; 
int wahl = 0;
float variation;
float yBreite;
float strichBreite;
PImage zuruckBild;
int zuruck = 0;
int zuruckZaehler = 0;

void setup() {
  size(700, 700);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  cursor(HAND);
  background(0, 0, hinterGrund);
  saveFrame("temp0.png");
  saveFrame("temp1.png");
  saveFrame("temp2.png");
  saveFrame("temp3.png");
  saveFrame("temp4.png");
}

void draw() {
}

void geradenZeichnen(){
  for (int gridY=0; gridY<anzahlY; gridY++) {
    for (int gridX=0; gridX<anzahlX; gridX++) {

      posX = width/anzahlX * gridX;
      posY = height/anzahlY * gridY;

      variation = map(mouseX, 0, 700, 0, 100);
      yBreite = map(mouseY, 0, 700, 0, 100);
      strichBreite = yBreite+random(variation);

      if(wahl == 0){
        stroke(farbWert, 100, 100, trans);
        strokeWeight(strichBreite);
        if(sJoin == 1){ 
          strokeCap(SQUARE);
          line(posX, posY, posX+width/anzahlX, posY); 
        }
        if(sJoin == 0){
          strokeCap(ROUND);
          line(posX, posY, posX+width/anzahlX, posY); 
        }
      }

      if(wahl == 2){
        stroke(farbWert, 100, 100, trans);
        strokeWeight(strichBreite);
        if(sJoin == 1){ 
          strokeCap(SQUARE);
          line(posX, posY, posX+width/anzahlX, posY+height/anzahlY); 
        }
        if(sJoin == 0){
          strokeCap(ROUND);
          line(posX, posY, posX+width/anzahlX, posY+height/anzahlY); 
        }
      }

      if(wahl == 3){
        stroke(farbWert, 100, 100, trans);
        strokeWeight(strichBreite);
        if(sJoin == 1){ 
          strokeCap(SQUARE);
          line(posX, posY+height/anzahlY, posX+width/anzahlX, posY); 
        }
        if(sJoin == 0){
          strokeCap(ROUND);
          line(posX, posY+height/anzahlY, posX+width/anzahlX, posY); 
        }
      }

      if(wahl == 1){
        stroke(farbWert, 100, 100, trans);
        strokeWeight(strichBreite);
        if(sJoin == 0){
          strokeCap(ROUND);
          line(posX, posY, posX, posY+height/anzahlY); 
        }
        if(sJoin == 1){ 
          strokeCap(SQUARE);
          line(posX, posY, posX, posY+height/anzahlY); 
        }

      }


    }
  }
  if(zuruck == 0) saveFrame("temp0.png");
  if(zuruck == 1) saveFrame("temp1.png");
  if(zuruck == 2) saveFrame("temp2.png");
  if(zuruck == 3) saveFrame("temp3.png");
  if(zuruck == 4) saveFrame("temp4.png");
  zuruck = zuruck + 1;
  if(zuruck == 5) zuruck = 0;
}

void mouseReleased(){
  geradenZeichnen();
}

void keyReleased(){  // bei loslassen der taste ausfuehren
  if (key == 's') {
    //das aktuelle datum und die zeit wird in der variablen startTime abgelegt
    startTime = year()+nf(month(),2)+nf(day(),2)+"_"+nf(hour(),2)+nf(minute(),2)+nf(second(),2);  
    saveFrame(startTime+".png");
  }
  if (key == '1'){
    entoder = random(0, 2);
    if(entoder > 0){
      farbWert = random(0, 30);
      println(farbWert);
    }
    if(entoder < 1){
      farbWert = random(320, 360);
      println(farbWert);
    }
  }
  if (key == '2'){
    farbWert = random(30, 70);
    println(farbWert);
  }
  if (key == '3'){
    farbWert = random(70, 160);
    println(farbWert);
  }
  if (key == '4'){
    farbWert = random(160, 200);
    println(farbWert);
  }
  if (key == '5'){
    farbWert = random(200, 250);
    println(farbWert);
  }
  if (key == '6'){
    farbWert = random(250, 320);
    println(farbWert);
  }
  if (key == 'e'){
    String angabe = "eckige Enden";
    sJoin = 1;
    println(angabe);
  }
  if (key == 'r'){
    String angabe = "runde Enden";
    sJoin = 0;
    println(angabe);
  }
  if (key == 'n'){
    background(0, 0, hinterGrund);
    saveFrame("temp0.png");
    saveFrame("temp1.png");
    saveFrame("temp2.png");
    saveFrame("temp3.png");
    saveFrame("temp4.png");
  }
  if (key == 't'){
    trans = trans+10;
    if(trans == 110) trans = 10;
    String angabe = "Transparenz:"+trans;
    println(angabe);
  }
  if (key == 'z') trans = 100;
  if (key == 'b'){
    hinterGrund = hinterGrund + 10;
    if(hinterGrund == 110) hinterGrund = 0;
    background(0, 0, hinterGrund);
  }
  if(key == 'x'){
    anzahlX = anzahlX + 2;
    if(anzahlX == 22)anzahlX = 2;
    String angabe = "rastergroesse x-wert:"+anzahlX;
    println(angabe);
  }
  if(key == 'y'){
    anzahlY = anzahlY + 2;
    if(anzahlY == 22)anzahlY = 2;
    String angabe = "rastergroesse y-wert:"+anzahlY;
    println(angabe);
  }
  if(key == 'h'){
    String angabe = "horizontal";
    wahl = 0;
    println(angabe);
  }
  if(key == 'v'){
    String angabe = "vertikal";
    wahl = 1;
    println(angabe);
  }
  if(key == 'd'){
    String angabe = "diagonal absteigend";
    wahl = 2;
    println(angabe);
  }
  if(key == 'f'){
    String angabe = "diagonal aufsteigend";
    wahl = 3;
    println(angabe);
  } 
  
  /*
  if(key == BACKSPACE){
    if(zuruckZaehler == 4){
      zuruckBild = loadImage("temp0.png");
      image(zuruckBild, 0, 0);
    }
    if(zuruckZaehler == 3){
      zuruckBild = loadImage("temp1.png");
      image(zuruckBild, 0, 0);
    }
    if(zuruckZaehler == 2){
      zuruckBild = loadImage("temp2.png");
      image(zuruckBild, 0, 0);
    }  
    if(zuruckZaehler == 1){
      zuruckBild = loadImage("temp3.png");
      image(zuruckBild, 0, 0);
    }
    if(zuruckZaehler == 0){
      zuruckBild = loadImage("temp4.png");
      image(zuruckBild, 0, 0);
    }
    zuruckZaehler = zuruckZaehler + 1;
    if(zuruckZaehler == 5) zuruckZaehler = 0;
  }
  */
}


