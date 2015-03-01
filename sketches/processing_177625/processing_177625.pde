
//VARIABLENDEKLARATION
PImage bild5;
PImage bild;
PImage bild1;
PImage bild2;
PImage bild3;
PImage bild4;
PImage bild6;
PImage bild7;
PImage bild8;




//SETUPEINSTELLUNGEN

void setup()
{
  size(500, 500);

  bild=loadImage ("Himmel.jpg");
  bild1=loadImage ("K.png");
  bild2=loadImage ("A.png");
  bild3=loadImage ("T.png");
  bild4=loadImage ("R.png");
  bild5 =loadImage ("Gesicht.png");
  bild6=loadImage ("E.png");
  bild7=loadImage ("D.png");
  bild8=loadImage ("I.png");
}






// HAUPTFUNKTION

void draw ()
{




  // HINTERGRUND



  image (bild, 250, 250, 500, 500);
  if (mousePressed)
  {
  } else
  {

    filter (GRAY);
  }




  // GROSSE BUCHSTABEN

  if (mousePressed)
  {

    // BUCHSTABEN STELLEN SICH AUF

    pushMatrix();               //I
    imageMode (CENTER);
    translate (80, 300);
    image (bild8, 0, 0, 150, 150);
    popMatrix();

    pushMatrix();              // E1

    translate (250, 110);
    image (bild6, 0, 0, 100, 100);
    popMatrix();

    pushMatrix();              // E2
    imageMode (CENTER);
    translate (360, 130);
    image (bild6, 0, 0, 100, 100);
    popMatrix();

    pushMatrix();               //D
    imageMode (CENTER);
    translate (150, 180);
    image (bild7, 0, 0, 100, 100);
    popMatrix();
  }






  //BUCHSTABEN SCHWEBEN HERUM

  else
  {
    pushMatrix();                   //großes K
    imageMode (CENTER);
    translate (375, 125);
    rotate (millis()/1000.0);
    scale ((sin(millis()/1000.0))*2);//vergrößern 
    image (bild1, 50, 0, 80, 80);
    popMatrix();

    pushMatrix();                   // großes T
    imageMode (CENTER);
    translate (125, 375);
    rotate (millis()/1000.0);
    scale ((sin(millis()/1000.0))*2);
    image (bild3, -50, 0, 100, 100);
    popMatrix();

    pushMatrix();                   // großes R
    imageMode (CENTER);
    translate (125, 125);
    rotate (millis()/1000.0);
    scale ((cos(millis()/1000.0))*2);
    image (bild4, 50, 0, 100, 100);
    popMatrix();

    pushMatrix();                    //großes A
    imageMode (CENTER);
    translate (500, 375);
    rotate (millis()/1000.0);
    scale ((cos(millis()/1000.0))*2);
    image (bild2, -50, 0, 100, 100);
    popMatrix();

    pushMatrix();                   //E
    imageMode (CENTER);
    translate (50, 50);
    rotate (millis()/1000.0);
    image (bild6, -50, 0, 100, 100);
    popMatrix();

    pushMatrix();                   //D
    imageMode (CENTER);
    translate (50, sin(millis()/500.0)*100);
    image (bild7, 300, 0, 100, 100);
    popMatrix();

    pushMatrix();                      //I
    imageMode (CENTER);
    translate (0, 0); 
    rotate (millis()/1000.0);
    image (bild8, 10, 250, 100, 100);
    popMatrix();
  }






  // KLEINE BUCHSTABEN
  if (mousePressed)
  {
  } else 
  {
    pushMatrix();                        //buchstabe in der mitte
    translate (sin (millis()/500.0)*100, cos (millis()/500.0)*50);
    image (bild4, 250, 250, 50, 50);
    popMatrix();

    pushMatrix();                       //buchstabe links oben
    translate (0, sin(millis()/500.0)*100);
    image (bild2, 50, 50, 50, 50);
    popMatrix();

    pushMatrix();                       // buchstabe oben rechts
    translate (sin(millis()/500.0)*100, 0);
    image (bild3, 430, 70, 100, 100);
    popMatrix();

    pushMatrix();                        // buchstabe unten links
    translate (sin (millis()/500.0)*100, 0);
    image (bild1, 50, 450, 60, 60);
    popMatrix();

    pushMatrix();                        //buchstabe unten rechts
    translate (0, sin (millis()/500.0)*200);
    image (bild4, 450, 450, 100, 100);
    popMatrix();
  }
  image (bild5, 300, 350, 450, 300);
}



