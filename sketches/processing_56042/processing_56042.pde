
PFont SakkalMajallaBold; // Variabel för rubrik-typsnitt
PFont ArialMT; // Variabel för text-typsnitt
PImage skoldp; // Variabel för sköldpaddabild
int skoldpXPos; // Sköldpadda position i x-led
int skoldpYPos; // Sköldpadda position i y-led
PImage hus; // Variabel för husbild




void setup()
{
  size(400, 400); // Ställ in fönsterstorlek
  hus = loadImage("hus.gif"); // Läs in bild-fil
  SakkalMajallaBold = loadFont("SakkalMajallaBold-48.vlw"); // Läs in font-filen
  ArialMT = loadFont("ArialMT-13.vlw"); // Läs in font-filen
  skoldp = loadImage("skoldpadda.gif"); // Läs in bild-filen
  skoldpXPos = width - 40; // Sköldpadda startposition
  skoldpYPos = height - 63; // Skölpadda startposition
  frameRate(25); // Begränsa skärmuppdateringsfrekvensen
   
}

void draw()
{
  background(255, 255, 255); // Vit bakgrund
  fill(183, 206, 188); // Grön fyllnadsfärg
  noStroke();
  rect(0, 180, width, height); // Rita marken
  fill(183, 205, 206); // Blå fyllnadsfärg
  rect(0, 65, width, height/3); // Rita himmel
  fill(0, 0, 0); // Svart fyllnadsfärg
  rect(0, 65, width, 5); // Rita linje
  image(hus, 15, 86); // Rita hus
  fill(240, 44, 119); // Rosa textfärg
  textFont(SakkalMajallaBold); // Ange att SakkalMajallaBold ska användas för text
  text("Led Sköldpaddan hem", 30, 30); // Skriv texten "Led sköldpaddan hem" på koordinaterna x:30, y:120
  fill(0, 0, 0); // Svart textfärg
  textFont(ArialMT); // Ange att ArialMT ska användas för text
  text("Sköldpaddan Ove har gått vilse. Vill du hjälpa honom hem?", 30, 55);
  if (keyPressed) // Om en tangent är nedtryckt..
  {
    if(keyCode == LEFT) // Om det är vänster piltangent..
    {
    skoldpXPos = skoldpXPos -4; // Gå till vänster
  }
  if(keyCode == RIGHT) // Om det är höger piltangent..
  {
    skoldpXPos = skoldpXPos + 4; // Gå till höger
  }
  if(keyCode == UP) // Om det är upp-piltangent
  {
    skoldpYPos = skoldpYPos -4; // Gå uppåt
  }
  if(keyCode == DOWN) // Om det är ned-piltangent
  {
    skoldpYPos = skoldpYPos +4; // Gå uppåt
  }
}
  image(skoldp, skoldpXPos, skoldpYPos); 
}

