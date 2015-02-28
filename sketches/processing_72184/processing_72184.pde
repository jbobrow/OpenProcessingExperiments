
PImage alex;
XMLElement xml;
ArrayList<XMLElement> elemtsHealth = new ArrayList<XMLElement>();
ArrayList<XMLElement> elemtsGroceries = new ArrayList<XMLElement>();
ArrayList<XMLElement> elemtsBuildings = new ArrayList<XMLElement>();
ArrayList<XMLElement> elemtsShopping = new ArrayList<XMLElement>();
ArrayList<XMLElement> elemtsEntertainment = new ArrayList<XMLElement>();

//neu
int [] circleX = new int[5]; // X Position jedes Kreises
int [] circleY = new int[5]; // Y Position jedes Kreises
int [] circleW = new int[5]; // Breite jedes Kreises

// Um auf den Wert eines Kreises zurückzugreifen, einfach nachher z.B. in circleX[n] "n" durch die Zahl des Kreises ersetzen (0 bis 3)
//neu

String[] xPos = new String[11];
String[] yPos = new String[11];


float xLinksOben = 52.525900;
float xRechtsUnten = 52.516685;

float yLinksOben = 13.40000;
float yRechtsUnten = 13.423901;

void setup() {
  size(1152, 712);
  smooth();
  alex=loadImage("alex_screen2.png");
  
  
  
  //neu  
  
  // Hier wird die Breite jedes Kreises festgelegt
circleW[0] = 50;

// Die Kreise werden jetzt zufällig platziert
circleX[0] = int( random( 0 + circleW[0]/2 , width - circleW[0]/2 ) );
circleY[0] = int( random( 0 + circleW[0]/2 , height - circleW[0]/2 ) );
// Die Hälfte der Breite des Kreises (circle1W/2) wird
// abgezogen damit er nicht über den Bildrand hinaus geht


// Kreis 2
circleW[1] = 50;
circleX[1] = int( random( 0 + circleW[1]/2 , width - circleW[1]/2 ) );
circleY[1] = int( random( 0 + circleW[1]/2 , height - circleW[1]/2 ) );

// Kreis 3
circleW[2] = 50;
circleX[2] = int( random( 0 + circleW[2]/2 , width - circleW[2]/2 ) );
circleY[2] = int( random( 0 + circleW[2]/2 , height - circleW[2]/2 ) );

// Kreis 4
circleW[3] = 50;
circleX[3] = int( random( 0 + circleW[3]/2 , width - circleW[3]/2 ) );
circleY[3] = int( random( 0 + circleW[3]/2 , height - circleW[3]/2 ) );

// Kreis 5
circleW[4] = 50;
circleX[4] = int( random( 0 + circleW[4]/2 , width - circleW[4]/2 ) );
circleY[4] = int( random( 0 + circleW[4]/2 , height - circleW[4]/2 ) );


//neu 

  //Gesundheit
  xml = new XMLElement(this, "alex_allgemeinmediziner.txt");
  elemtsHealth.add(xml);
  xml = new XMLElement(this, "alex_apotheke.txt");
  elemtsHealth.add(xml);
  xml = new XMLElement(this, "alex_friseur.txt");
  elemtsHealth.add(xml);
  xml = new XMLElement(this, "alex_krankenhaus.txt");
  elemtsHealth.add(xml);
  xml = new XMLElement(this, "alex_physiotherapeut.txt");
  elemtsHealth.add(xml);
  xml = new XMLElement(this, "alex_wellness.txt");
  elemtsHealth.add(xml);
  xml = new XMLElement(this, "alex_zahnarzt.txt");
  elemtsHealth.add(xml);

  //Lebensmittel
  xml = new XMLElement(this, "alex_baecker.txt");
  elemtsGroceries.add(xml);
  xml = new XMLElement(this, "alex_fleischer.txt");
  elemtsGroceries.add(xml);
  xml = new XMLElement(this, "alex_obst.txt");
  elemtsGroceries.add(xml);
  xml = new XMLElement(this, "alex_spaetkauf.txt");
  elemtsGroceries.add(xml);
  xml = new XMLElement(this, "alex_spirituosen.txt");
  elemtsGroceries.add(xml);
  xml = new XMLElement(this, "alex_supermarkt.txt");
  elemtsGroceries.add(xml);

  //öffentliche gebäude
  xml = new XMLElement(this, "alex_kindergarten.txt");
  elemtsBuildings.add(xml);
  xml = new XMLElement(this, "alex_galerie.txt");
  elemtsBuildings.add(xml);
  xml = new XMLElement(this, "alex_gericht.txt");
  elemtsBuildings.add(xml);
  xml = new XMLElement(this, "alex_hochschule.txt");
  elemtsBuildings.add(xml);
  xml = new XMLElement(this, "alex_hotel.txt");
  elemtsBuildings.add(xml);
  xml = new XMLElement(this, "alex_kirche.txt");
  elemtsBuildings.add(xml);
  xml = new XMLElement(this, "alex_museum.txt");
  elemtsBuildings.add(xml);
  xml = new XMLElement(this, "alex_park.txt");
  elemtsBuildings.add(xml);
  xml = new XMLElement(this, "alex_schule.txt");
  elemtsBuildings.add(xml);
  xml = new XMLElement(this, "alex_sehenswuerdigkeit.txt");
  elemtsBuildings.add(xml);

  //shopping
  xml = new XMLElement(this, "alex_drogerie.txt");
  elemtsShopping.add(xml);
  xml = new XMLElement(this, "alex_einkaufszentrum.txt");
  elemtsShopping.add(xml);
  xml = new XMLElement(this, "alex_optiker.txt");
  elemtsShopping.add(xml);
  xml = new XMLElement(this, "alex_schmuck.txt");
  elemtsShopping.add(xml);
  xml = new XMLElement(this, "alex_schuhe.txt");
  elemtsShopping.add(xml);


  //unterhaltung
  xml = new XMLElement(this, "alex_bar.txt");
  elemtsEntertainment.add(xml);
  xml = new XMLElement(this, "alex_cafe.txt");
  elemtsEntertainment.add(xml);
  xml = new XMLElement(this, "alex_casino.txt");
  elemtsEntertainment.add(xml);
  xml = new XMLElement(this, "alex_club.txt");
  elemtsEntertainment.add(xml);
  xml = new XMLElement(this, "alex_fitnessstudio.txt");
  elemtsEntertainment.add(xml);
  xml = new XMLElement(this, "alex_kino.txt");
  elemtsEntertainment.add(xml);
  xml = new XMLElement(this, "alex_restaurant.txt");
  elemtsEntertainment.add(xml);
  xml = new XMLElement(this, "alex_theater.txt");
  elemtsEntertainment.add(xml);

}

void draw() {
  image(alex, 0, 0);

  
  
//neu  

// kontrollieren ob der Mauszeiger über einem oder mehreren Kreisen liegt
if (mousePressed == true)
{

if ( (mouseX >= circleX[0] - circleW[0]/2) && (mouseX <= circleX[0] + circleW[0]/2) && (mouseY >= circleY[0] - circleW[0]/2) && (mouseY <= circleY[0] + circleW[0]/2) )
{
circleX[0] = mouseX;
circleY[0] = mouseY;
}

if ( (mouseX >= circleX[1] - circleW[1]/2) && (mouseX <= circleX[1] + circleW[1]/2) && (mouseY >= circleY[1] - circleW[1]/2) && (mouseY <= circleY[1] + circleW[1]/2) )
{
circleX[1] = mouseX;
circleY[1] = mouseY;
}

if ( (mouseX >= circleX[2] - circleW[2]/2) && (mouseX <= circleX[2] + circleW[2]/2) && (mouseY >= circleY[2] - circleW[2]/2) && (mouseY <= circleY[2] + circleW[2]/2) )
{
circleX[2] = mouseX;
circleY[2] = mouseY;
}

if ( (mouseX >= circleX[3] - circleW[3]/2) && (mouseX <= circleX[3] + circleW[3]/2) && (mouseY >= circleY[3] - circleW[3]/2) && (mouseY <= circleY[3] + circleW[3]/2) )
{
circleX[3] = mouseX;
circleY[3] = mouseY;
}

if ( (mouseX >= circleX[4] - circleW[4]/2) && (mouseX <= circleX[4] + circleW[4]/2) && (mouseY >= circleY[4] - circleW[4]/2) && (mouseY <= circleY[4] + circleW[4]/2) )
{
circleX[4] = mouseX;
circleY[4] = mouseY;
}

}

// Kreise zeichnen
noStroke();

fill(0,160,176);
ellipse(circleX[0], circleY[0], circleW[0], circleW[0]);
fill(106,74,60);
ellipse(circleX[1], circleY[1], circleW[1], circleW[1]);
fill(204,51,63);
ellipse(circleX[2], circleY[2], circleW[2], circleW[2]);
fill(200,250,200);
ellipse(circleX[3], circleY[3], circleW[3], circleW[3]);
fill(237,201,0);
ellipse(circleX[4], circleY[4], circleW[4], circleW[4]);
//neu
  
  
  List<Float> x_coords = new ArrayList<Float>();
  List<Float> y_coords = new ArrayList<Float>();
  for (XMLElement healthElement : elemtsHealth) {
    XMLElement[] rss = healthElement.getChildren("wpt");

    for (int i = 0; i < rss.length; i++) {
      XMLElement kid = rss[i];

      float x1 = map(float(kid.getString("lat")), xLinksOben, xRechtsUnten, 0, width);
      float y1 = map(float(kid.getString("lon")), yLinksOben, yRechtsUnten, 0, height);
      
      x_coords.add(new Float(x1));
      y_coords.add(new Float(y1));
      
      fill(0,160,176);
      strokeWeight(0);
      ellipse(x1, y1, 5, 5); 
        
    }
  }
  
  stroke(0,160,176);
      strokeWeight(0);
 for (int k = 1; k < x_coords.size(); k++)
{
line(x_coords.get(k), y_coords.get(k), circleX[0], circleY[0]);
}
  
  
  x_coords = new ArrayList<Float>();
  y_coords = new ArrayList<Float>();
  for (XMLElement healthElement : elemtsGroceries) {
    XMLElement[] rss = healthElement.getChildren("wpt");

    for (int i = 0; i < rss.length; i++) {
      XMLElement kid = rss[i];

      float x1 = map(float(kid.getString("lat")), xLinksOben, xRechtsUnten, 0, width);
      float y1 = map(float(kid.getString("lon")), yLinksOben, yRechtsUnten, 0, height);

      x_coords.add(new Float(x1));
      y_coords.add(new Float(y1));
      
      fill(106,74,60);
      strokeWeight(0);
      ellipse(x1, y1, 5, 5); 
    }
  }
  
  stroke(106,74,60);
      strokeWeight(0);
   for (int k = 1; k < x_coords.size(); k++)
{
line(x_coords.get(k), y_coords.get(k), circleX[1], circleY[1]);
}
  
  x_coords = new ArrayList<Float>();
  y_coords = new ArrayList<Float>();
  for (XMLElement healthElement : elemtsBuildings) {
    XMLElement[] rss = healthElement.getChildren("wpt");

    for (int i = 0; i < rss.length; i++) {
      XMLElement kid = rss[i];

      float x1 = map(float(kid.getString("lat")), xLinksOben, xRechtsUnten, 0, width);
      float y1 = map(float(kid.getString("lon")), yLinksOben, yRechtsUnten, 0, height);

      x_coords.add(new Float(x1));
      y_coords.add(new Float(y1));
      
      fill(204,51,63);
      strokeWeight(0);
      ellipse(x1, y1, 5, 5); 
    }
  }
  
  stroke(204,51,63);
      strokeWeight(0);
  for (int k = 1; k < x_coords.size(); k++)
{
line(x_coords.get(k), y_coords.get(k), circleX[2], circleY[2]);
}
  
  
  x_coords = new ArrayList<Float>();
  y_coords = new ArrayList<Float>();
  for (XMLElement healthElement : elemtsShopping) {
    XMLElement[] rss = healthElement.getChildren("wpt");

    for (int i = 0; i < rss.length; i++) {
      XMLElement kid = rss[i];

      float x1 = map(float(kid.getString("lat")), xLinksOben, xRechtsUnten, 0, width);
      float y1 = map(float(kid.getString("lon")), yLinksOben, yRechtsUnten, 0, height);

      x_coords.add(new Float(x1));
      y_coords.add(new Float(y1));
      
      fill(200,250,200);
      strokeWeight(0);
      ellipse(x1, y1, 5, 5); 
    }
  }
  
  stroke(200,250,200);
      strokeWeight(0);
 for (int k = 1; k < x_coords.size(); k++)
{
line(x_coords.get(k), y_coords.get(k), circleX[3], circleY[3]);
}
  
  x_coords = new ArrayList<Float>();
  y_coords = new ArrayList<Float>();
  for (XMLElement healthElement : elemtsEntertainment) {
    XMLElement[] rss = healthElement.getChildren("wpt");

    for (int i = 0; i < rss.length; i++) {
      XMLElement kid = rss[i];

      float x1 = map(float(kid.getString("lat")), xLinksOben, xRechtsUnten, 0, width);
      float y1 = map(float(kid.getString("lon")), yLinksOben, yRechtsUnten, 0, height);

      x_coords.add(new Float(x1));
      y_coords.add(new Float(y1));
      
      fill(237,201,81);
      strokeWeight(0);
      ellipse(x1, y1, 5, 5);
    }
  }
  
  stroke(237,201,81);
      strokeWeight(0);
   for (int k = 1; k < x_coords.size(); k++)
{
line(x_coords.get(k), y_coords.get(k), circleX[4], circleY[4]);
}
  
}


