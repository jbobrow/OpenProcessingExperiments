
void setup()
{ colorMode(HSB,360,100,100);
  size(500,500);
}
void draw()
{
  background(0);
  
  fill(255);
  noStroke();

float zeitfarbe = map(second(),0,60,0,360);//Ändert die Farbe in einen Winkel von 0-360 sekündlich

//Stundenbalken

  fill(0,0,100); // Füllen des Grundbalkens in Weiß
  rect(365,110,25,240);// Koordinaten und Größe des Grundbalken
  
  float hoursize = map(hour(),0,24,0,240); //Variable setzen für die Balkengröße der sich auf die Stundenzahl bezieht
  
  fill(zeitfarbe,100,100); //Füllen des Balkens mit Blau
  rect(365,110,25,hoursize); //Rechteck mit variabler Größe die oben definiert wurde

//Minutenbalken
  
  fill(0,0,100); // Füllen des Grundbalkens in Weiß
  rect(240,110,25,240);// Koordinaten und Größe des Grundbalken
  
  float minutesize = map(minute(),0,60,0,240); //Variable setzen für die Balkengröße der sich auf die Stundenzahl bezieht
  
  fill(zeitfarbe,100,100); //Füllen des Balkens mit Blau
  rect(240,110,25,minutesize); //Rechteck mit variabler Größe die oben definiert wurde


//Sekundenbalken

  fill(0,0,100); // Füllen des Grundbalkens in Weiß
  rect(115,110,25,240);// Koordinaten und Größe des Grundbalken
  
  float secondsize = map(second(),0,60,0,240); //Variable setzen für die Balkengröße der sich auf die Stundenzahl bezieht
  
  fill(zeitfarbe,100,100); //Füllen des Balkens mit Blau
  rect(115,110,25,secondsize); //Rechteck mit variabler Größe die oben definiert wurde
}

