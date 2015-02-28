
//importerar bibliotek
import guicomponents.*;

//variabel för vykortets bakgrundsfärg
color cardColor;

//variabler för färgvalsknappar
GButton blueButton;
GButton greenButton;
GButton yellowButton;
GButton whiteButton;
GButton pinkButton;

//variabel för typsnitt
PFont instructions;
PFont message;

//variabler för bilder
PImage palm;
PImage frog;
PImage dolphin;
PImage dolphin2;
PImage parrot;
PImage horse;
PImage cat;
PImage dog;
PImage heart;

//variabler för om bilderna skall visas eller ej
GCheckbox checkbox1;
GCheckbox checkbox2;
GCheckbox checkbox3;
GCheckbox checkbox4;
GCheckbox checkbox5;
GCheckbox checkbox6;
GCheckbox checkbox7;
GCheckbox checkbox8;
GCheckbox checkbox9;

//variabler som hör till userInputText
String userInputText; //userInputText
GTextField textField;//textfält 
GButton okButton; //OK-knapp

void setup()
{
  //fönsterstorlek
  size(400, 500);
  
  //från början är vykortet vitt
  cardColor = color(255);
  
  //skapa färgvalsknappar
  blueButton = new GButton(this, "  Blue", 20, 65, 60, 25);
  blueButton.setFont("Kalinga", 14, false);
  blueButton.setTextAlign(GAlign.LEFT);
  
  greenButton = new GButton(this, " Green", 90, 65, 60, 25);
  greenButton.setFont("Kalinga", 14, false);
  greenButton.setTextAlign(GAlign.LEFT);
  
  yellowButton = new GButton(this, " Yellow", 160, 65, 60, 25);
  yellowButton.setFont("Kalinga", 14, false);
  yellowButton.setTextAlign(GAlign.LEFT);
  
  whiteButton = new GButton(this, "  White", 230, 65, 60, 25);
  whiteButton.setFont("Kalinga", 14, false);
  whiteButton.setTextAlign(GAlign.LEFT);
  
  pinkButton = new GButton(this, "  Pink", 300, 65, 60, 25);
  pinkButton.setFont("Kalinga", 14, false);
  pinkButton.setTextAlign(GAlign.LEFT);
  
  //ändra färg på färgvalsknappar
  ////nameButton.setColours (color (normal), color (mouseOver), color (pressedColor));
  blueButton.setColours(color(203, 250, 255), color(53, 222, 240), color(4, 185, 203));
  greenButton.setColours(color(203, 255, 211), color(52, 245, 79), color(4, 203, 25));
  yellowButton.setColours(color(255, 255, 201), color(244, 245, 94), color(213, 214, 35));
  whiteButton.setColours(color(255), color(232, 232, 232), color(219, 219, 219));
  pinkButton.setColours(color(255, 237, 254), color(252, 209, 250), color(227, 174, 224));
  
  //skapa font
  instructions = createFont("Kalinga bold", 12, true);
  message = createFont("Gabriola", 20, true);
  
  //läser in bilder
  palm = loadImage("palm.png");
  frog = loadImage("frog.png");
  dolphin = loadImage("dolphin.png");
  dolphin2 = loadImage("dolphin2.png");
  parrot = loadImage("parrot.png");
  horse = loadImage("horse.png");
  cat = loadImage("cat.png");
  dog = loadImage("dog.png");
  heart = loadImage("heart.png");
  
  //skapa checkbox
  checkbox1 = new GCheckbox(this, "Palm", 20, 135, 15);
  checkbox2 = new GCheckbox(this, "Frog", 65, 135, 15);
  checkbox3 = new GCheckbox(this, "Big dolphin", 112, 135, 15);
  checkbox4 = new GCheckbox(this, "Small dolphin", 188, 135, 15);
  checkbox5 = new GCheckbox(this, "Parrot", 20, 155, 15);
  checkbox6 = new GCheckbox(this, "Horse", 72, 155, 15);
  checkbox7 = new GCheckbox(this, "Cat", 122, 155, 15);
  checkbox8 = new GCheckbox(this, "Dog", 160, 155, 15);
  checkbox9 = new GCheckbox(this, "Heart", 202, 155, 15);
  
  //skapar knapp och textfält för userInputText
  textField = new GTextField (this, "", 20, 210, 310, 30, true);
  okButton = new GButton (this, " OK", 340, 210, 40, 30);
  okButton.setFont("Kalinga", 14, false);
  okButton.setTextAlign(GAlign.LEFT);
  okButton.setColours(color(203, 250, 255), color(53, 222, 240), color(4, 185, 203));
  
  userInputText = "Your message here";
}


void draw()
{
  background(250);//bakgrundsfärg
  fill(cardColor);//fyllnadsfärg
  stroke(41, 38, 13);//mörk linjefärg
  rect(20, 280, 360, 200);//ritar "vykortet"
  
  textFont(instructions);
  fill(41, 38, 13);
  text("Create your own card!", 20, 25);
  text("Start by choosing card color", 20, 60);
  text("Time to write your message", 20, 205);
  text("Good job! now you're done.", 20, 275);
  text("Now, choose an image", 20, 125);
  
  //om checkboxen är ikryssad
  if(checkbox9.isSelected())
  {
  image(heart, 30, 310);//visa järta
  }
  if(checkbox1.isSelected())
  {
  image(palm, 50, 310);//visa palm
  }
  if(checkbox6.isSelected())
  {
  image(horse, 50, 300);//visa häst
  }
  if(checkbox2.isSelected())
  {
  image(frog, 70, 413);//visa groda
  }
  if(checkbox3.isSelected())
  {
  image(dolphin, 200, 420);//visa delfin
  }
  if(checkbox4.isSelected())
  {
  image(dolphin2, 180, 437);//visa delfin
  }
  if(checkbox5.isSelected())
  {
  image(parrot, 290, 290);//visa papegoja
  }
  if(checkbox7.isSelected())
  {
  image(cat, 45, 380);//visa katt
  }
  if(checkbox8.isSelected())
  {
  image(dog, 110, 380);//visa hund
  }
  
  //skriver ut användarens textinmatning på vykortet
  textFont(message);
  text(userInputText, 230, 360);
}


void handleButtonEvents(GButton button)//när användaren klickar på en widget (knapp)..
{
  if(button == blueButton)//..om det var blueButton..
  { 
     cardColor = color(203, 250, 255);//..ändra bakgrundsfärg till blå
  }
  else if(button == greenButton)//om det var greenButton..
  {
     cardColor =color(203, 255, 211);//..ändra bakgrundsfärg till grön
  }
  else if(button == yellowButton)//om det var yellowButton..
  {
     cardColor = color(255, 255, 201);//..ändra bakgrundsfärg till gul
  }
   else if(button == whiteButton)//om det var whiteButton..
  {
     cardColor = color(255);//..ändra bakgrundsfärg till vit
  }
   else if(button == pinkButton)//om det var whiteButton..
  {
     cardColor = color(255, 237, 254);//..ändra bakgrundsfärg till rosa
  }
  else if(button == okButton);//om det var okButton..
  {
    userInputText = textField.getText();//skriver ut meddelandet
  }
}






