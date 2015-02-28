
float xspeed = random (1.75, 2.25);
float yspeed = random (1.65, 2.45);
  // Ausgangsgeschwindigkeit für x und y gesetzt

float y = 325;
float x = 435;
  // Ausgangswert für x und y
  
boolean sketchFullScreen() {
return true;
} 

void setup() {
  size(1024, 768);
  noStroke();
  noCursor();
  background(30, 80, 120); 
  println(xspeed + " Start xspeed");
  println(yspeed + " Start yspeed"); 
  noLoop();
}

void draw() { 
  
 
     fill(x * 20 % 55, x * 20 % 255, x * 131,98 % 255);
  // Die Füllung und die Deckkraft der Ellipse ist an den x-Wert geküpft
     ellipse(x, y, width*0.195, -450 + 20 % +x +y);
  // Kreis 1.
     
   x = x + xspeed;
  // Die Gewschindigkeit wird an den x-Wert geknüpft
 if ((x > width - 5) || (x < 25)) {
    xspeed = xspeed * -1.065; 
    println(xspeed + " xspeed1");
 
  // Multiplikator für die Geschwindigkeit wird an width in Bezug auf x geknüpft
  // Ausgabe für xspeed und x  
    } 
 
       y = y + yspeed; 
 if ((y > height - 5) || (x < 20)) {
    yspeed = yspeed * -1.071;
 
   println(yspeed + " yspeed1"); 
  // Multiplikator für die Geschwindigkeit wird an width in Bezug auf y geknüpft

  // Ausgabe für yspeed und y   
    } 
    
  if ((xspeed >= 1700. || xspeed <= -1000.))  {
     xspeed = -1.09;
   // Zurücksetzten von xspeed
   }
   
  if ((x >= 12690. || x <= -12690.))  {  
      println(x + " x Schlusswert");
      println(y + " y Schlusswert");
     x = random (0, 1024);
     println(x + " x Displaystart");
     y = random (0, 768);
     println(y + " y Displaystart");
     xspeed = random (1.75, 2.25);
      println(xspeed + " x Ausgangsspeed");
     yspeed = random (1.65, 2.45);
      println(yspeed + " y Ausgangsspeed");
    // Zurücksetzten von xspeed, yspeed, x und y; xspeed und yspeed wird über random neu gesetzt,
    // die Werte entscheiden über die Richtung von x und y und über die Geschwindigkeit von x und von y
     }
    
  
  if ((yspeed >= 380. || yspeed <= -368.))  {
     yspeed = -2;
   // Zurücksetzten von yspeed
   }
   
  if ((y >= 768. || y <= -768.))  {
   // Zurücksetzten von y
    
     y = random (730, 768);
     println(y + " y Start nach Durchlauf Kreisveraenderung"); 
  } 
  
   if ((x >= 200. || x <= 600.))  {
     fill(x * 70 % 175, x * 60 % 225, y * 70 % 35);
   // Die Füllung und die Deckkraft der Ellipse ist an den x- und y-Wert geküpft
     ellipse(x, y, width*0.195, 70);
   //Kreis 2, liegt in Kreis 1 und wird gedreht
   } 
   
   if (xspeed >= 300.)  {
      fill(y * 75 % 75, y * 40 % 15, x * 70 % 35);
    // Die Füllung und die Deckkraft der Ellipse ist an den x- und y-Wert geküpft
      ellipse(x, y, width*0.195, 90);

    //Kreis 3, liegt in Kreis 1 und 2, wird gedreht und über den x- und y-Wert vergrößert
  } 
  
    if ((x >= 400. || x <= 700.))  {
      fill(y * 75 % 85, y * 40 % 45, x * 70 % 35);
    // Die Füllung und die Deckkraft der Ellipse ist an den x-Wert geküpft
      ellipse(x, y, width*0.195, 350 + 20% +x -y);

    //Kreis 3, liegt in Kreis 1 und 2, wird gedreht und über den x- und y-Wert vergrößert
  }
  
     if (xspeed >= 270.)  {
      fill(y * 75 % 25, y * 40 % 120, x * 70 % 35);
    // Die Füllung und die Deckkraft der Ellipse ist an den x- und y-Wert geküpft
      ellipse(x, y, width*0.195, 350 + 20% +x -y);

    //Kreis 3, liegt in Kreis 1 und 2, wird gedreht und über den x- und y-Wert vergrößert
  } 
}

void mousePressed() {
  loop();
 } 

void keyPressed(){
 noLoop();
} 



