
String[] beroepen       = {"Horeca",  "Landbouw, bosbouw en visserij",  "Specialistische zakelijke diensten",  "Delfstoffenwinning",  "Financiële dienstverlening",   "Handel", "Verhuur en handel van onroerend goed",  "Commerciële Dienstverlening", "Informatie en communicatie",  "Cultuur, sport en recreatie",  "Verhuur en overige zakelijke diensten",  "Energievoorziening",  "Alle economische aciviteiten", "Bouwnijverheid", "Vervoer en opslag", "Nijverheid en energie", "Niet commerciële dienstverlening", "Onderwijs", "Industrie", "Gezondheids- en welzijnszorg", "openbaar bestuur en overheidsdiensten", "waterbedrijven en afvalbeheer"}; 
float[] ziekteverzuim   = { 2.36,      2.72,                              2.76,                                  3.2,                  3.12,                            3.26,    3.34,                                    3.34,                            3.34,                          3.58,                          3.9,                                      3.94,                4.14,                            4.18,              4.4,                4.82,                    5.1,                                5.1,        5.16,          5.22,                          5.46,                                    5.54                          }; 

//dat ding wordt 300 pixels hoog, gedeeld door 100 = 3 pixels

int aantalItems;
int breedteGrafiek = 550;
float breedteBalk;
float grootsteGetal;

int marge = 25; // links rechts en bodem

PImage img;
PFont font;
//PFont knopTekst;

boolean percentage = false;

///////////////////////////////////////////////////////////////

void setup(){
  
  //opzetten
  
  size(600,600); // grootte scherm
  frameRate(10);
  smooth();
  
  //assets van buiten
  img = loadImage("ziekteverzuim.gif");
  font = loadFont("MyriadPro-Cond-20.vlw");
  //knopTekst = loadFont("MyriadPro-Cond-12.vlw");
  textFont(font, 20);
  
  //variabelen declareren
  aantalItems = beroepen.length; //aantal items
  breedteBalk = breedteGrafiek/aantalItems; //breedte balkjes
  
  //kijken wat het grootste getal is
  for(int i=0; i<beroepen.length; i++)
  {
    if(ziekteverzuim[i]> grootsteGetal)
    {
      grootsteGetal = ziekteverzuim[i];
    }
  }
  
}

//////////////////////////////////////////////////////////////////

void draw(){
  
  image(img, 0, 0);
  
  noStroke();
  fill(#849F7A);
  rect(25,200,550,40);
  stroke(#967496);
  
  tekenStaven();
  checkMuis();
  
}

/////////////////////////////////////////////////////////////////

void tekenStaven(){
  
  for (int i = 0; i<aantalItems; i++)
  {
    
   //horizontale positie
    float xPos = marge + (i * breedteBalk);//horizontale positie
   
    fill(#849F7A);
   
    //achtegrondBalk
    rect(xPos, 250, breedteBalk, 300);
      
    
    //kijken waar muis is 
    if(mouseX > xPos && mouseX < xPos + breedteBalk){
      fill(255);
      text(beroepen[i] + " "+ziekteverzuim[i]+"%",30,235);
      fill(#6C9696);
    }
    else
    {
      fill(255); 
    }
    float hoogte;
    
    if(percentage){
      
      hoogte = ziekteverzuim[i] * 3;
    }
    else
    {
      hoogte = ((ziekteverzuim[i]/grootsteGetal))*300;
    }
    float yPos = 550 - hoogte;
    
    
    rect(xPos, yPos, breedteBalk, hoogte);
  }
}

///////////////////////////////////////////////////////////////////////

void checkMuis(){
  
  if(percentage){
    fill(255);
    rect(25, 555, 10, 10);
    fill(#FF6905);
    rect(25, 570, 10, 10);
    
    if(mouseX > 25 && mouseX < 35 && mouseY > 555 && mouseY< 565)
    {
      fill(#F6FF05);
      rect(25, 555, 10, 10);
      cursor(HAND);
    }
    else
    {
      cursor(ARROW);
    }
  }
  else
  {
    fill(#FF6905);
    rect(25, 555, 10, 10);
    fill(255);
    rect(25, 570, 10, 10);
    
    if(mouseX > 25 && mouseX < 35 && mouseY > 570 && mouseY< 580)
    {
      fill(#F6FF05);
      rect(25, 570, 10, 10);
      cursor(HAND);
    }
    else
    {
      cursor(ARROW);
    }
  }
  
  fill(255);
  textFont(font, 12);
  text("verhouding", 40 ,565);
  text("percentage", 40, 580);
  textFont(font, 20);
}

void mouseClicked(){
  if(percentage){
    if(mouseX > 25 && mouseX < 35 && mouseY > 555 && mouseY< 565){
      percentage = !percentage;
    }
  }else{
    if(mouseX > 25 && mouseX < 35 && mouseY > 570 && mouseY< 580){
      percentage = !percentage;
    }
  }
    
}


