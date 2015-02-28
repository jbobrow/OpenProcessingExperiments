
import guicomponents.*;
PImage bColor; //variabel för skärmens bakgrundsbild
GButton pinkButton; //variabel för råsaknapp
GButton turkosButton;//variabel för turkosknapp
GButton yellowButton;//variabel förgulknapp

GWSlider slajder;//variabel för slajder

PImage instruct; //variabel för instruktionsillustartion

PImage glasses; //ladda upp glasögon
PImage okknapp; //okejkanppbakgrund
PImage okknapp2; //okejknappenbakgrund2

PImage knapp0;//vit knapp
PImage knapp1;//råsa knapp
PImage knapp2;//ljusgrön knapp
PImage knapp3;//gul knapp

PImage tant1;//råsa tantk
PImage tant2;//turkos tant
PImage tant3;//gul tant

PImage kind;//kind 

int glassesSize; //variabel för glasögonens storlek
GTextField textField; //variabel för textfältet
GButton okButton; //knapp för att slutföra textinmatning


void setup() {
  smooth();
  imageMode(CENTER);
  glasses=loadImage("glasses.png");//laddar upp blå kanappbakgrund

  okknapp=loadImage("ok.png");//laddar upp ok-knappbakgrund
  okknapp2=loadImage("ok2.png");//laddar upp ok-knappbakgrund2

  kind=loadImage("kind.png");//laddar upp kindbild

  knapp0=loadImage("upp.png");//laddar upp vit kanappbakgrund
  knapp1=loadImage("knapp.png");//laddar upp blå kanappbakgrund
  knapp2=loadImage("green.png");//laddar upp ljusgrön kanappbakgrund
  knapp3=loadImage("dark.png");//laddar upp mörkgrön kanappbakgrund

  tant1=loadImage("dam1.png");//laddar upp råsa tantbakgrund
  tant2=loadImage("dam2.png");//laddar upp turkos tantbakgrund
  tant3=loadImage("dam3.png");//laddar upp gul tantbakgrund

  glasses=loadImage("glasses.png");//laddar upp glasögonbilden
  instruct=loadImage("instruct.png");//laddar upp instruktionsbilden

  size(320, 480);//skärmens storlek

  bColor = (tant1); //frånbörjan är bakgrumden råsa tant

  pinkButton = new GButton(this, " tant", 20, 410, 65, 25);//råsa knapp
  pinkButton.setFont("Courier new", 20, false); //ändra typsnitt
  pinkButton.setTextAlign(GAlign.LEFT); //vänsterställ texten
  pinkButton.setImages(knapp0, knapp1, knapp2);//bakgrunsbild på knappen

  turkosButton = new GButton(this, " tös", 115, 410, 65, 25);//turkos knapp
  turkosButton.setFont("Courier new", 20, false); //ändra typsnitt
  turkosButton.setTextAlign(GAlign.LEFT); //vänsterställ texten
  turkosButton.setImages(knapp0, knapp2, knapp3);//bakgrunsbild på knappen

  yellowButton = new GButton(this, " dam", 210, 410, 65, 25);//gul knapp
  yellowButton.setFont("Courier new", 20, false); //ändra typsnitt
  yellowButton.setTextAlign(GAlign.LEFT); //vänsterställ texten
  yellowButton.setImages(knapp0, knapp3, knapp1);//bakgrunsbild på knappen

  glassesSize = 200; //glasögonens storlek från början

  textField = new GTextField(this, "200", 200, 30, 45, 15);//fält att fylla i värden i
  textField.setFont("Arial", 20); // ställ in typsnitt

  okButton = new GButton(this, " OK", 255, 35, 25, 20); //skapa ok-knapp
  okButton.setImages(okknapp, okknapp2, okknapp);//bakgrunsbild på knappen
}

void draw() {

  background(bColor);//sätt bakgrundsbild
  tint(255, glassesSize, 0, glassesSize/2); 
  image(kind, width/2, height/2);
  tint(255, 255);
  image(glasses, width/2, height/2, glassesSize, glassesSize); 
  image(instruct, 90, 40);
}


void handleButtonEvents(GButton button) { //när användaren klickar på en knapp
  if (button == pinkButton) { //om det var pinkButton
    bColor = (tant1); //ändra bakgrundsbild till råsa tant
  }
  else if (button == turkosButton) { //om det var turkosButton
    bColor = (tant2); //ändra bakgrundsbild till turkosa tanten
  }
  else if (button == yellowButton) { //om det var gulaButton
    bColor = (tant3); //ändra bakgrundsbild till gul tant
  }
  else if (button == okButton) {
    //omvandla textsträngen i textfältet till ett heltal (int) och tilldela till glassesSize
    glassesSize = Integer.parseInt( textField.getText() );
  }
}


