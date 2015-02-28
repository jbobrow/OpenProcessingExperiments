

/**
 * part of the example files of the generativedesign library.
 *
 * shows how to use the Tablet class.
 */

import generativedesign.*;
import processing.video.*;
//import processing.pdf.*;

Tablet tablet;
Capture video;
Caneta canetas;
AoVivo camaras;
Serial seriais;
Cronometro cronometros;
Gui interF;

PGraphics pg;

int displayX, displayY, contador;
String[] data;

void setup() {

  displayX = 800;
  displayY = 600;

  size(displayX, displayY, P2D);

  tablet = new Tablet(this);
  video = new Capture(this, displayX/4, displayY/4, 6);

  canetas = new Caneta();
  camaras = new AoVivo();
  cronometros = new Cronometro();
  seriais = new Serial();
  interF = new Gui();

  pg = createGraphics(displayX, displayY, P2D);

  data = loadStrings("data/contador.txt");
  contador = (int(data[0]));
  //contador = 1;

  //stroke(255);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {

  canetas.pincel();
  camaras.desenha();
  canetas.desenhando();
  interF.desenha();
}

////full Screen
//boolean sketchFullScreen() {
//  return true;
//}

void keyPressed() {
  canetas.keyPressed();
  camaras.keyPressed();
  interF.keyPressed();
}

void keyReleased() {
  canetas.keyReleased();
}

class AoVivo {

  PGraphics vd;
  PImage[] img;

  int bgSel, contBg;
  boolean videoOn, bgOn;

  AoVivo() {
    vd = createGraphics(displayX, displayY, P2D);
    img = new PImage[10];
    contBg = 0;
      videoOn = true;
  bgOn = false;

  }

  void desenha() {
    vd.beginDraw();
    vd.pushMatrix();
    vd.scale(-4, 4);
    vd.image(video, -displayX/4, 0);
    vd.popMatrix();
    vd.endDraw();

    if (videoOn == true) {
      image( vd.get(0, 0, displayX, displayY), 0, 0);
      fill(255, 255, 255, 126);
      rect(0, 0, displayX, displayY);
    } 
    else if (videoOn == false && bgOn == false) {
      background(255);
    } 
    else if (videoOn == false && bgOn == true) {
      background(255);
      image(img[bgSel], 0, 0);
      fill(255, 255, 255, 126);
      rect(0, 0, displayX, displayY);
    }
  }

  void keyPressed() {
    if (key == 'v' || key == 'V') {
      videoOn = !videoOn;
    } 
    else if (key == 'i' || key == 'I') {
      vd.save("img/imagem#" + contBg + ".png");
      img[contBg] = loadImage("img/imagem#" + contBg + ".png");
      contBg++;
      if (contBg > 9) {
        contBg = 0;
      }
    } 
    else if (key == '1' && img[0] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 0;
      } 
      else if (bgOn == true && bgSel != 0) {
        bgSel = 0;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    } 
    else if (key == '2' && img[1] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 1;
      } 
      else if (bgOn == true && bgSel != 1) {
        bgSel = 1;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    } 
    else if (key == '3' && img[2] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 2;
      } 
      else if (bgOn == true && bgSel != 2) {
        bgSel = 2;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    } 
    else if (key == '4' && img[3] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 3;
      } 
      else if (bgOn == true && bgSel != 3) {
        bgSel = 3;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    } 
    else if (key == '5' && img[4] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 4;
      } 
      else if (bgOn == true && bgSel != 4) {
        bgSel = 4;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    } 
    else if (key == '6' && img[5] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 5;
      } 
      else if (bgOn == true && bgSel != 5) {
        bgSel = 5;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    } 
    else if (key == '7' && img[6] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 6;
      } 
      else if (bgOn == true && bgSel != 6) {
        bgSel = 6;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    } 
    else if (key == '8' && img[7] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 7;
      } 
      else if (bgOn == true && bgSel != 7) {
        bgSel = 7;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    } 
    else if (key == '9' && img[8] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 8;
      } 
      else if (bgOn == true && bgSel != 8) {
        bgSel = 8;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    } 
    else if (key == '0' && img[9] != null) {
      if (bgOn == false) {
        videoOn = false;
        bgOn = true;
        bgSel = 9;
      } 
      else if (bgOn == true && bgSel != 9) {
        bgSel = 9;
      } 
      else if (bgOn == true) {
        videoOn = true;
        bgOn = false;
      }
    }
  }
}

class Caneta {


  boolean apaga;

  Caneta() {
    apaga = false;
  }

  void pincel() {
    if (apaga == true && mousePressed) {
      //color transp = color(0, 0);
      //pg.set(mouseX, mouseY, 112);
      pg.stroke(255);
    }
    else if (apaga == false) {
      pg.stroke(0);
    }
    if (mousePressed) {
      pg.beginDraw();
      pg.strokeCap(ROUND);
      pg.strokeWeight(30 * tablet.getPressure());
      pg.line(pmouseX, pmouseY, mouseX, mouseY);
      pg.endDraw();
      image( pg.get(0, 0, displayX, displayY), 0, 0);
    }
    //print("TiltX: " + nfs(tablet.getTiltX(), 1, 3) + "   " + "TiltY: " + nfs(tablet.getTiltY(), 1, 3) + "   ");
    //float[] res = new float[2];
    //println("Azimuth: " + nfs(tablet.getAzimuth(), 1, 3) + "   " + "Altitude: " + nfs(tablet.getAltitude(), 1, 3) 
    //  + "Pressure: " + nfs(tablet.getPressure(), 1, 3) + "  videoOn: " + videoOn + "  bgOn: " + bgOn);
  }

  void desenhando() {
    image( pg.get(0, 0, displayX, displayY), 0, 0);
  }

  void keyPressed() {
    if (key == 's' || key == 'S') {
      seriais.desenha();
      pg.save("Artes/DesenhoAoVivo#" + contador + ".png");
      contador++;
    }
    else if (key == 'k' || key == 'K') {
      apaga = true;
      println(" apagando: " + apaga);
    }
    else if (key == 'b' || key == 'B') {
      pg.beginDraw();
      pg.background(0,0);
      pg.endDraw();
    }
  }

  void keyReleased() {
    if (key == 'k' || key == 'K') {
      apaga = false;
      println(" apagando: " + apaga);
    }
  }
}

class Cronometro { // Nome da Classe

  int salvaTempo, totalTempo, correTempo;

  Cronometro() { // Construtor
    salvaTempo = 0;
    correTempo = 0;
    totalTempo = 8000;
  }

  void ativo() { // Funcionamento

      salvaTempo = millis();
    if (salvaTempo > 0) {
      correTempo = millis() - salvaTempo;
    }

    if (correTempo > totalTempo) {
      //println ("Final da espera");
      seriais.desenha();
      //ligado = false;
      //pintando = false;
      //estado = 0;
      //testTitulo = true;
      //println ("Desligado");
      //background (bg);
      //desenhaTexto();
      salvaTempo = 0;
    }
  }
}

class Gui {

  PGraphics gui;
  PFont guiFont;
  boolean guiOn;

  Gui() {
    gui = createGraphics(displayX, displayY, P2D);
    guiFont = loadFont("data/Geneva-16.vlw");
    guiOn = false;
  }

  void desenha() {
    if (guiOn == true) {
      gui.beginDraw();
      gui.fill(0, 90);
      gui.noStroke();
      gui.rectMode(CENTER);
      gui.rect(width/2, height-35, width-20, 50);
      gui.fill(255);
      gui.textFont(guiFont, 16);
      gui.textAlign(LEFT);
      gui.text ("Foto ( i )      |      Selecionar Foto ( 1-0 )" +
        "      |      Vídeo ( v )      |      Apagar ( k )" +
        "      |      Salvar ( s )", 30, height-30);
      gui.endDraw();
      image( gui.get(0, 0, displayX, displayY), 0, 0);
    }
  }

  void keyPressed() {
    if (key == TAB) {
      guiOn = !guiOn;
    }
  }
}

class Serial { // Nome da Classe
  PFont fontSerie;
  int textH;

  Serial() { // Construtor
    fontSerie = loadFont("data/OCRAStd-28.vlw");
  }

  void desenha() { // Funcionamento
    textFont(fontSerie, height/10);
    fill(255);

    textH = height-13;

    pg.beginDraw();
    pg.textAlign(LEFT);
    pg.text ("Serial#" + contador, 40, textH);
    pg.textAlign(CENTER);
    pg.text ("DesenhoAoVivo", width/2, textH);

    int d = day();    // Values from 1 - 31
    int m = month();  // Values from 1 - 12
    int y = year();   // 2003, 2004, 2005, etc.

    pg.textAlign(RIGHT);
    pg.text (d + "/" + m + "/" + y, width - 40, textH);
    pg.endDraw();

    contador++;
    data[0] = str(contador);
    saveStrings ("data/contador.txt", data);

    myDelay(3000);

    save("artes/MusicaVisual_" + contador + ".tif");
    //println("saving to pdf – finishing");
    //endRecord();
    //println("saving to pdf – done");
  }

  void myDelay(int ms)
  {
    try
    {    
      Thread.sleep(ms);
    }
    catch(Exception e) {
    }
  }
}



