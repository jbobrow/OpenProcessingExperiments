
import guicomponents.*;

GCheckbox checkboxRed; // checkbox för röd färg
GCheckbox checkboxBlue; //checkbox för blå färg


GButton plusButton; //variabel för plus knapp
GButton minusButton; //variabel för minus knapp

int ellipseSize; //variabel för ellipsens storlek


void setup(){
 size(350,400); 
 checkboxRed = new GCheckbox(this, "Addera röd färg", 20, 260, 100);
 checkboxBlue = new GCheckbox(this, "Addera blå färg", 20, 280, 100);

ellipseSize = 120; //Cirklens storlek från början

//skapar knappar
  plusButton = new GButton(this, "  +", 180, 310, 45, 30);
  minusButton = new GButton (this, "  -", 125, 310, 45, 30);
  
  plusButton.setFont("Arial bold", 22, false); //ändrar typsnitt plusknapp
  plusButton.setTextAlign(GAlign.LEFT); //vänsterställd text
    minusButton.setFont("Arial bold", 22, false); //ändrar typsnitt minusknapp
    minusButton.setTextAlign(GAlign.LEFT); //vänsterställd text
}

void draw(){
  background (165, 251, 255); //Anger bakgrundsfärgen
   noStroke(); //Inga kantlinjer på cirklen
   ellipse(width/2, 150, ellipseSize, ellipseSize); //ritar en cirkel
   if(checkboxBlue.isSelected()&& checkboxRed.isSelected()){ //om båda checkboxarba är ifyllda
     fill(185, 75, 255); //lila fyllnads färg
   }else if(checkboxRed.isSelected()){ //om checkboxen för röd färg är ifylld
  fill(255, 10, 10); //röd fyllnadsfärg på cirklen
   }else if(checkboxBlue.isSelected()){ //om checkboxen för blå färg är ifylld
     fill(10, 36, 255); //blå fyllnads färg
                }else {
     fill(255);
   }
   text("Minska eller öka storleken på cirklen", 90, 360); //Text under cirklen
   }

void handleButtonEvents(GButton button){ // när användaren klickar på en knapp
  if(button == plusButton) { //om det var plusButton
    ellipseSize = ellipseSize +10; // gör cirklen större
  }else if(button == minusButton){ //om det var minusButton
   ellipseSize = ellipseSize -10; // gör cirklen mindre
  }}

