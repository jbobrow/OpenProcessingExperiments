
int b=10; // Breite des Schwarzen Kreises
int c=0;//Screenshot-Nummer
void setup()
{ size(800,600);
  background(0);
  frameRate(60);
  fill(0); // schwarzer Hintergrund
}
void draw(){ 
  if (mousePressed)// Maustasten Abfrage
  if (mouseButton == RIGHT) // bei rechter Taste
  ellipse(mouseX,mouseY,b,b);// Schwarzer Kreis um Mauszeiger
  else set(mouseX,mouseY,color(1)); // wenn linke Maustaste - Pixel an der Spitze des Zeigers setzen mit Farbe 1

  for(int m=0;m<90000;m++)
  { int x = (int)random(width);
    int y = (int)random(height);//zufaellige Koordinaten aus dem Fenster waehlen
    color clr = get(x,y); // Farbe wird gesetzt, die selbe wie an den zufaelligen Koordinaten 
 
    if(blue(clr) != 0)//Falls der blaue Anteil an der RGB Farbe nicht 0 ist
    { x = (x+1) % width;
      y = (y+1) % height;//Koordinaten werden jeweils um 1 erhoeht, Modulo um im Fenster zu bleiben mit den Aktionen
      if(blue(get(x,y)) < 255)//Falls der Blau Anteil(an den Koordinaten x,y) der RGB Farbe unter 255 ist, ...
        set(x,y,color(red(clr)+random(-7,9)
                   ,green(clr)+random(-7,9)
                    ,blue(clr)+random(-7,9))); //...dann wird die Farbe des Pixels an X,Y auf die RGB Farbe gesetzt, welche sich durch eine zufaellige Farbe (durch die random Funktion zwichen -7 und 9) ergibt
    }
  }
  if (keyPressed&&(key == 'c')){ //Loescht den komplette Bildschirm und setzt due Groesse des Schwarzen Kreises zurueck
    background(0);
    b=10;
  }
  if (keyPressed&&(key == 'b')){//verbreitert den Schwarzen Kreis
    b+=2;
  }
  if (keyPressed&&(key == 'v')){//verkleinert den Schwarzen Kreis
    if(b>=2){//solange dieser nicht Kleiner als 2 Pixel ist
    b-=2;}
    else { 
    b=b;}//sonst bleibt dieser gleich und die Taste bewirkt nichts
  }
  if(keyPressed&&(key == 'x')){
    saveFrame("Screenshot"+c+".jpg");//speichert einen Screenshot ab und erhoeht die Zahl des Screenshots
    c++;
  }
  
}
 

