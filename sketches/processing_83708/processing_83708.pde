
//Crysta Leong
//Creative Computing
//Final: Visual Data

PImage Pinkdot;
PImage Teacup;
PImage UK;
PImage Russia;
PImage Japan;
PImage China;
PImage NZ;
PImage Australia;
PImage USA;
PImage Greece;
PImage Italy;
PImage Mexico;

String selectedCountry = "Teacup";

void setup() {
  size(800, 600);
  Pinkdot =loadImage ("polkadottpatternCC.jpg");
  Teacup = loadImage ("TEACUP_BACKGROUND.png");
  UK = loadImage ("UK.png");
  Russia = loadImage ("RUSSIA.png");
  Japan = loadImage ("JAPAN.png");
  China = loadImage ("CHINA.png");
  NZ = loadImage ("NEWZEALAND.png");
  Australia = loadImage ("AUSTRALIA.png");
  USA = loadImage ("USA.png");
  Greece = loadImage ("GREECE.png");
  Italy = loadImage ("ITALY.png");
  Mexico = loadImage ("MEXICO.png");
  
}
void draw() {

image(Pinkdot, 0, 0);

  if (selectedCountry == "Teacup") {
    image(Teacup, 0, 0, 800, 600);
  } 
  else if (selectedCountry == "Teacup") {
    image(Teacup, 0, 0, 800, 600);
  } 
  else if (selectedCountry == "UK") {
    image(UK, 0, 0, 800, 600);
  } 
  else if (selectedCountry == "Russia") {
    image(Russia, 0, 0, 800, 600);
  } 
  else if (selectedCountry == "Japan") {
    image(Japan, 0, 0, 800, 600);
  } 
  else if (selectedCountry == "China") {
    image(China, 0, 0, 800, 600);
  } 
  else if (selectedCountry == "NZ") {
    image(NZ, 0, 0, 800, 600);
  } 
  else if (selectedCountry == "Australia") {
    image(Australia, 0, 0, 800, 600);  
  } 
  else if (selectedCountry == "USA") {
    image(USA, 0, 0, 800, 600);  
  } 
  else if (selectedCountry == "Greece") {
    image(Greece, 0, 0, 800, 600);  
  } 
  else if (selectedCountry == "Italy") {
    image(Italy, 0, 0, 800, 600);  
   } 
  else if (selectedCountry == "Mexico") {
    image(Mexico, 0, 0, 800, 600);  
  }

  //BUTTONS
  //empty button
  rect(510, 190, 15, 15);
  //Uk button
  rect(510, 220, 15, 15);
  //russia button
  rect(510, 250, 15, 15);
  //japan button
  rect(510, 280, 15, 15);
  //china button
  rect(510, 310, 15, 15);
  //NZ button
  rect(510, 340, 15, 15);
  //australia button
  rect(510, 370, 15, 15);
  //US button
  rect(510, 400, 15, 15);
  //greece button
  rect(510, 430, 15, 15);
  //italy button
  rect(510, 460, 15, 15);
  //mexico button
  rect(510, 490, 15, 15);
  
}

void mouseClicked() {
  if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 190) && (mouseY< 205) ) {
    selectedCountry = "Teacup";
  }
  if ( (mouseX > 510 ) && (mouseX < 525) && (mouseY > 220 ) && (mouseY< 235) ) {
    selectedCountry = "UK";
  }
  if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 250) && (mouseY< 265) ) {
    selectedCountry = "Russia";
  }
  if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 280) && (mouseY< 295) ) {
    selectedCountry = "Japan";
  }  
  if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 310) && (mouseY< 325) ) {
    selectedCountry = "China";
  }
  if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 340) && (mouseY< 355) ) {
    selectedCountry = "NZ";
  }
  if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 370) && (mouseY< 385) ) {
    selectedCountry = "Australia";
  }
  if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 400) && (mouseY< 415) ) {
    selectedCountry = "USA";
  }
  if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 430) && (mouseY< 445) ) {
    selectedCountry = "Greece";
  }
   if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 460) && (mouseY< 475) ) {
    selectedCountry = "Italy";
  }
   if ( (mouseX > 510) && (mouseX < 525) && (mouseY > 490) && (mouseY< 505) ) {
    selectedCountry = "Mexico";
  }
  }
 


