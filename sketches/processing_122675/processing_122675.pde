
float counter = 0;

void setup()
{
  size(700, 700);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  //Tageszeit Hintergrund
   if(hour() > 0 && hour() < 8)
   {
     background (330, 0, 20);
   }
   else
   {
     background(330, 0, 80);
   }
   
   if(hour() >=8 && hour() < 17)
   {
     background(330, 0, 80);
   }
   else
   {
     background(330, 0, 20);
   }
   
   //Sterne bei Nacht
   if (hour() < 8)
   {
     fill(330, 0, 100);
     noStroke();
     ellipse(420, 310, 10, 10);
     ellipse(600, 30, 15, 15);
     ellipse(150, 80, 5, 5);
     ellipse(50, 250, 10, 10);
     ellipse(300, 400, 15, 15);
     ellipse(650, 600, 5, 5);
     ellipse(50, 650, 10, 10);

   }
   else
   {
     fill(330, 0, 80);
     noStroke();
     ellipse(420, 310, 10, 10);
     ellipse(600, 30, 15, 15);
     ellipse(150, 80, 5, 5);
     ellipse(50, 250, 10, 10);
     ellipse(300, 400, 15, 15);
     ellipse(650, 600, 5, 5);
     ellipse(50, 650, 10, 10);
   }
   
   if (hour() >= 17)
   {
     fill(330, 0, 100);
     noStroke();
     ellipse(420, 310, 10, 10);
     ellipse(600, 30, 15, 15);
     ellipse(150, 80, 5, 5);
     ellipse(50, 250, 10, 10);
     ellipse(300, 400, 15, 15);
     ellipse(650, 600, 5, 5);
     ellipse(50, 650, 10, 10);
   }
   else
   {
     fill(330, 0, 80);
     noStroke();
     ellipse(420, 310, 10, 10);
     ellipse(600, 30, 15, 15);
     ellipse(150, 80, 5, 5);
     ellipse(50, 250, 10, 10);
     ellipse(300, 400, 15, 15);
     ellipse(650, 600, 5, 5);
     ellipse(50, 650, 10, 10);
   }

   
    //Glas 
    fill(210, 60, 150);
    stroke(330, 0, 0);
    rect(300, 50, 100, 248);
  {
    int h = hour()*11;
    stroke(330, 0, 0);
    fill(330, 0, 100);
    rect(300, 50, 100, h);
  }
 
  translate(width/2, height/2);
  
  //Schwarzer Kreis, Sekunde
   {
   float sec = map(second(), 0, 60, 0, 360);
   pushMatrix();
   rotate(radians(sec)); // Um i rotieren
   translate(0, -200); // Um Radius zu verschieben
   fill(330, 0, 0);
   stroke(330, 0, 0);
   ellipse(0, 0, 120, 120);
   popMatrix();
   }
   
   //Blauer Kreis, der sich vergrößert
   {
   float sec = map(second(), 0, 60, 0, 360);
   int min = minute()*2;
   pushMatrix();
   rotate(radians(sec));
   translate(0, -200);
   fill(210, 60, 150);
   noStroke();
   ellipse(0, 0, min, min);
   popMatrix();
   }
   
   //pulsierender roter Kreis
   {
   float sec = map(second(), 0, 60, 0, 360);
   float b = map(sin(counter), -1, 1, 20, 80);
   
   pushMatrix();
   rotate(radians(sec));
   translate(0, -170);
   fill(0, 100, b);
   stroke(330, 0, 0);
   ellipse(0, 0, 20, 20);
   counter += 0.1;
   popMatrix();
   }
}

