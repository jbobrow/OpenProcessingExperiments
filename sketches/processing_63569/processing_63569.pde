
//float xcenter;   // Mittelpunkt auf der x-Achse
//float ycenter;   // Mittelpunkt auf der y-Achse
float rad = 0;   // Radius der Kreisbahn
float angle = 0; // aktueller Rotationswinkel

float x;
float y;
float r;
color haarfarbe = color(0, 0, 0, 95);
int modus = 0;


void setup() {
  size(500, 800);
  background(255);
  smooth();

  //Nase
  noStroke();
  fill(255, 211, 185);
  triangle(230, 500, 270, 500, 250, 450);

  //Mund
  fill(255, 52, 89);
  beginShape();
  vertex(240, 520);
  vertex(260, 520);
  vertex(290, 530);
  vertex(250, 540);
  vertex(210, 530);
  endShape();

  //Augen
  fill(29, 104, 160);
  ellipse(220, 450, 20, 20);
  ellipse(280, 450, 20, 20);
}


void draw() {

 
    if (modus==0) {                 //Locken
      if (mousePressed) {               //Locken
        fill(haarfarbe);
        //Locken
        x = mouseX+random(-20, 20);      //Locken
        y = mouseY +random(-20, 20);     //Locken
        r = random(0, 40);               //Locken
        ellipse(x, y, r, r);             //Locken
        //Locken
      }                               //Locken
    }                             //Locken


    if (modus == 1) {
      if (mousePressed) {

        // Verschieben des Rotationswinkels
        angle += 0.1;
        // VergrÃ¶ÃŸern des Radius pro Bild
        rad += 0.1;

        //if(rad > 80);{
        //xcenter = width / 1.5;
        //ycenter = height / 1.5;
        //rad += 0.1;
        //}


        // Berechnung der aktuellen Position
        float x = mouseX + cos (angle) * rad;
        float y = mouseY + sin (angle) * rad;

        // Zeichnen des Dreiecks
        fill (haarfarbe);
        triangle (x, y, mouseX+2, mouseY-2, mouseX, mouseY);
      }
    }


 
    

        //Nase
        noStroke();
        fill(255, 211, 185);
        triangle(230, 500, 270, 500, 250, 450);

        //Mund
        fill(255, 52, 89);
        beginShape();
        vertex(240, 520);
        vertex(260, 520);
        vertex(290, 530);
        vertex(250, 540);
        vertex(210, 530);
        endShape();

        //Augen
        fill(29, 104, 160);
        ellipse(220, 450, 20, 20);
        ellipse(280, 450, 20, 20);
   


   if (keyPressed) {

      if (key == 's') {
        modus = 1;
      }

      if (key == 'a') {
        modus = 0;
      }


  if (key == ' ') {
background(255);
}
      //Haarfarben

      if (key == '1') { 
        haarfarbe = color(255, 149, 18, 90);
      }

      if (key == '2') { 
        haarfarbe = color(255, 230, 88, 90);
      }

      if (key == '3') { 
        haarfarbe = color(82, 48, 5, 90);

        //  if(key == '4'){ 
        //color haarfarbe = color(0,0,0,90);
      }
    }
 println(modus); 
}


