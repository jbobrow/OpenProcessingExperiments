
PFont myFont;
PImage img;
import ddf.minim.*;

// Inhalt als Objekt einbinden
Minim minim;
// Variable Player
AudioPlayer player;
AudioPlayer player1;


// Variable zum ein - ausschalten Wecker

boolean ring_ring;
boolean drawimg;  


//Variablen Eingabe Wecker
int ringHour = 18;
int ringMinute = 35;
int plus = 1;

void setup() {
  size(280, 450);


  myFont = createFont("Helvetica", 11);
  textFont(myFont);



  // Bild laden
  img = loadImage("eule.png");
  // Neues Objekt von Minim
  minim = new Minim(this);
  // mp3 laden
  player = minim.loadFile("Cuculus.canorus.mp3");
  player1 = minim.loadFile("Cuculus.canorus.mp3");
}

void draw() {
  //Analoguhr
  int s = second();
  int m = minute();
  int h = hour();

  //Digitaluhr 
  int sec = second();
  int mi = minute();
  int ho = hour();


  if(h > 12) {
    h -= 12;
  }

  smooth();
  background(0);
  translate(140,170);
  rotate(radians(90));
  noFill();


  // Stunden Kreis farbig
  noStroke();
  fill(255);
  ellipse(0, 0, -190, 190);

  // Stunden Kreis farbig
  noStroke();
  fill(0);
  ellipse(0, 0, -180, 180);

  // Stunden Zeiger
  strokeWeight(5);
  stroke(255);
  pushMatrix();
  rotate(radians(30 * h));
  line(0, 0, -90, 0);
  popMatrix();

  // Minuten Kreis aussen weiss
  noStroke();
  fill(255);
  ellipse(0, 0, -160, 160);

  // Minuten Kreis farbig
  noStroke();
  fill(0);
  ellipse(0, 0, -150, 150);

  // Minuten Kreis innen weiss
  noStroke();
  fill(255);
  ellipse(0, 0, -130, 130);

  // Minuten Zeiger
  strokeWeight(5);
  stroke(255);
  pushMatrix();
  rotate(radians(6 * m)); 
  line(0, 0, -75, 0);
  popMatrix();

  // Sekunden Kreis innen farbig
  noStroke();
  fill(0);
  ellipse(0, 0, -120, 120);

  // Sekunden Kreis innen weiss
  noStroke();
  fill(255);
  ellipse(0, 0, -100, 100);

  // Sekunden Zeiger
  strokeWeight(5);
  stroke(255);
  pushMatrix();
  rotate(radians(6 * s)); 
  line(0, 0, -60, 0);
  popMatrix();

  // Sekunden Kreis innen schwarz
  noStroke();
  fill(0);
  ellipse(0, 0, -90, 90);

  // Digitaluhr
  rotate(radians(-90));
  fill(255);
  String t = nf (ho,2) + " : " + nf(mi, 2) + " : " + nf(sec, 2);
  text (t, -27, 5);






  // stuendlich Eule anzeigen und pfeifen
  if(s > 5) {
    drawimg = false;
    player1.pause();
  }
  else {
    if(m == 0) {
      drawimg = true;
      if(player1.isPlaying() == false) {
        player1.loop();
      }
    }
  }



  //Wecker stellen
  if (keyPressed) {
    if (keyCode==UP) {
      if (ringHour==23) {
        ringHour = 0;
      } 
      else {
        ringHour +=plus;
      }
    }
    if (keyCode==DOWN) {
      if (ringHour == 0) {
        ringHour = 23;
      } 
      else {
        ringHour -=plus;
      }
    }
    if (keyCode==RIGHT) {
      if (ringMinute == 59) {
        ringMinute = 0;
      }
      else {
        ringMinute +=plus;
      }
    }
    if (keyCode==LEFT) {
      if (ringMinute == 0) {
        ringMinute = 59;
      }
      else {
        ringMinute -=plus;
      }
    }
  }

  // Wecker Einstellungen
  if(ringHour == ho && ringMinute == mi) {
    if(ring_ring) {
      drawimg = true;
      if(player.isPlaying() == false) {
        player.loop();
      }
    }
  }

  if(drawimg) {
    image(img,-(img.width) / 2,-(img.height / 2));
  }

  // Anzeige Weckzeit & ob Wecker AN oder AUS ist
  if(ring_ring == true) {
    fill(210,0,0);
    String w = "alarm on: " + nf (ringHour,2) + ":" + nf(ringMinute, 2) ;
    text (w, -37, 200);        
    frameRate(7);
  } 
  else {
    fill(255);
    String w = "alarm off: " + nf (ringHour, 2) + ":" + nf(ringMinute, 2) ;
    text (w, -37, 200);        
    frameRate(7);
  }
}

//Wecker AN/AUS Enter
void keyPressed() {
  if (key == ENTER) {
    if(ring_ring == false) {   
      ring_ring = true;
    } 
    else {
      ring_ring = false;
      player.pause();
    }
  }
}

//Wecker AN/AUS Mouse
void mousePressed() {
  if(ring_ring == false) {   
    ring_ring = true;
  } 
  else {
    ring_ring = false;
    player.pause();
  }
}




