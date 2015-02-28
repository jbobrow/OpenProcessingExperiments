
//Position
float xpos, ypos;
//Geschwindigkeit
float xspeed = 10;
float yspeed = 8;
//Richtung
float xdirection = 1;
float ydirection = 1;
//Schläger
int xracrechts;
int yracrechts;
int xraclinks;
float yraclinks;
//Punktzahl
int scorerechts = 0;
int scorelinks = 0;
//Fonts
PFont font;
PFont veranda100;
//Counter
boolean counting;
float startTime;
float countDuration;
//Startknopf
int buttonheight = 80;
int buttonlength = 200;
int value = 0;
//Gegner-Maus
float enemyx = xpos;
float enemyy = ypos;
int oben = 10;
int unten = height-70;
// Gegnerbewegung
float x;
float y;
float easing = 0.2;



void setup() 
{
  size(800, 600);
  smooth();
  noStroke();

  int buttony = height/2-buttonheight/2-10 ;
  int buttonx = width/2-buttonlength/2+10;

  xpos = width/2-5;
  ypos = height/2;


  counting = false;
  
  frameRate(60);
  
  
}



void draw() {
  smooth();
  println(value);

  int buttony = height/2-buttonheight/2-10 ;
  int buttonx = width/2-buttonlength/2+10;

  // Startknopf
  // wenn Klick, dann setze Value = 100

  {
    if ((mousePressed == true) && ( mouseX > buttonx && mouseX < buttonx+buttonlength) && (mouseY >buttony && mouseY < buttony+buttonheight)) {
      smooth();

      value = 100;
      counting = true;
      startTime = millis();
      countDuration = 1499;
    }

    // counter
    // wenn value = 100 dann Starte Counter
    if ((counting == true)&&(value < 101)) {  

      // Spielfeld          
      background(0, 0, 0);
      fill(255);
      veranda100 = loadFont("Verdana-100.vlw");
      textFont(veranda100, 32);
      text("SCORE   " + scorerechts, 10, height-20);
      text("SCORE   " + scorelinks, width-180, height-20);
      rect(0, 10, width, 10);
      rect(0, height-60, width, 10);
      stroke(255);
      line(width/2+10, height-60, width/2+10, 10);

      // Countdown
      // value = 200
      float tTime = millis() - startTime;
      if (tTime > countDuration) {
        counting = false;
        tTime = countDuration;
        value = 200;
      }
      int seconds = (int)(tTime/1000);
      int millis = (int)(tTime);
      fill(255, 255, 255);
      veranda100 = loadFont("Verdana-100.vlw");
      textFont(veranda100, 100);
      text(3-millis*2/1000, 380, 310);
    }


    //  Spielfeld mit Startknopf zeichnen
    // vor Start des Spiels
    else {
      {
        // Spielfeld
        background(0, 0, 0);
        fill(255, 255, 255);
        veranda100 = loadFont("Verdana-100.vlw");
        textFont(veranda100, 32);
        text("SCORE   " + scorerechts, 10, height-20);
        text("SCORE   " + scorelinks, width-180, height-20);
        rect(0, 10, width, 10);
        rect(0, height-60, width, 10);
        stroke(255);
        line(width/2+10, height-60, width/2+10, 10);
        fill(255, 255, 255);
        rect(buttonx, buttony, buttonlength, buttonheight);
        fill(0, 0, 0);
        textFont(veranda100, 50);
        text("START", width/2-buttonlength/2+28, height/2 - buttonheight/2+50);
      }
    }
  }


  // wenn value = 200 dann starte das Spiel
  if ((value> 101)&&(value < 201)) {  
    xpos = xpos + (xspeed * xdirection);
    ypos = ypos + (yspeed * ydirection);

    // Spielfeld
    background(0);
    fill(255);
    textFont(veranda100, 32);
    text("SCORE   " + scorerechts, 10, height-20);
    text("SCORE   " + scorelinks, width-180, height-20);
    rect(0, 10, width, 10);
    rect(0, height-60, width, 10);
    stroke(255);
    line(width/2+10, height-60, width/2+10, 10);


    {
      // Schlägerbewegung rechts
      fill(255, 255, 255);
      xracrechts = width-30;
      yracrechts = mouseY-30;



      // Ball
      rect(xpos, ypos, 10, 10);


      //Abgrenzung, damit der Schläger nicht aus dem Spielfeld rutscht 
      // rechts
      if (mouseY-30 < 20 ) {
        yracrechts = 20;
      }
      if (mouseY+30 > height-60) {
        yracrechts = height -120;
      }

      // links
      if (ypos + 30 > height - 60)
      {        
        y = height -120;
      }
      if ( ypos - 30 < 0) {
        y = 20;
      }



      // Schlägerbewegung links
      float targetX = 20;
      float dx = targetX - x;
      if (abs(dx) > 1) {
        x += dx * easing;
      }

      float targetY = ypos-20;
      float dy = targetY - y;
      if (abs(dy) > 1) {
        y += dy * easing;
      }
      // Schläger zeichnen links
      noStroke();
      fill(255);
      rect(x, y, 11, 60);
    }
    //Schläger zeichnen rechts
    noStroke();
    fill(255);
    rect(xracrechts, yracrechts, 10, 60);


    //abprallen am rechten Schläger
    if ( xpos > xracrechts-10 && ( ypos < mouseY + 30 && ypos > mouseY -30)) {
      xdirection = xdirection * -1;
    }

    // abprallen am linken Schläger
    if ( xpos < xraclinks+30 && (ypos < y +60 && ypos > y))
    {
      xdirection = xdirection * -1;
    }

    // abprallen oben und unten

    if (ypos > height-70 || ypos < 20) {
      ydirection = ydirection * -1;
      // Ball geht am rechten Schläger vorbei
    }
    if (xpos > width -20) {

      counting = true;
      startTime = millis();
      countDuration = 1499; 

      scorerechts = scorerechts +1;
      xpos = width/2-5;
      ypos = height/2;
      ydirection = random(0.5, 2);
      xdirection = xdirection * -1;
      xspeed = random(8, 12);
      yspeed = random(7, 10);
      value = 100;
      // Ball geht am linken Schläger vorbei
    }
    if (xpos <20) {
      counting = true;
      startTime = millis();
      countDuration = 1499; 

      scorelinks = scorelinks +1;
      xpos = width/2-5;
      ypos = height/2;
      ydirection = random(0.5, 2);
      xdirection = xdirection * -1;
      xspeed = random(8, 12);
      yspeed = random(7, 10);
      value = 100;
    }
  }
}



