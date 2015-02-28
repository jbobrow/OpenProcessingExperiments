
PImage img; 
PImage img2; 
boolean textIsYes;
import guicomponents.*;
color bColor; //variabel för skärmens bakgrundsfärg
GButton greenButton; 
GButton redButton; //variabel för knapp
color greenColor;
GCheckbox checkbox; //checkbox för att bestämma om rektangeln skall ritas

GTextField textField; //variabel för textfältet
GButton okButton; //knapp för att slutföra textinmatning
int ellipseSize; //variabel för ellipsens storlek


void setup(){
ellipseSize = 100; //ellipsens storlek från början 
 smooth();
  img = loadImage("skolebarn.png") ; 
  img2 = loadImage("stop.png") ; 
  size(700, 450); //ställ in skärmens storlek
  bColor = color(0, 0, 0); //från början är bakgrunden svart void draw(){

    //skapa en ny knapp
    greenButton = new GButton(this, "Stå", 20, 20, 100, 50); 
redButton = new GButton(this, "Gå", 20, 90, 100, 50); 
GCheckbox checkbox; //checkbox för att bestämma om rektangeln skall ritas 

//skapa checkbox
checkbox = new GCheckbox(this, "kryss av", 20, 230, 100);
checkbox.setSelected(true); //checkboxen är från början ikryssad

//skapa nytt textfält
textField = new GTextField(this, "", 20, 300, 50, 20);
okButton = new GButton(this, "OK", 80, 300, 30, 20); //skapa ok-knapp

  
  
        textIsYes = true;
         
}
void draw(){
        background(128);



 rectMode(CORNER);
      fill(0);
      rect(130, 80,400,40);
      rectMode(CENTER);
      ellipseMode(CENTER);
     fill(#052302); // fotgjenger boks
ellipse (350,225,125,275);
fill(255,0,0,50); // lys
ellipse(350,140,75,75);
fill(255,240,0,50);           

   ellipse(350, 310, ellipseSize, ellipseSize); //rita en ellipse

        if(textIsYes){
                text("stå", 20,20, 100, 50);
                image(img2, 320,105); 

        }else{
            text("gå", 20,90, 100, 50);
            
             image(img,320,250 );
        }

 }
void handleButtonEvents(GButton button){ //när användaren klickar på en knapp

if(button == greenButton){ //om det var redButton
bColor = color(255, 0, 0); //ändra bakgrundsfärg till grönt 
textIsYes = true;

}else if(button == okButton){
ellipseSize = Integer.parseInt( textField.getText() );

}else if(button == redButton){ //om det var greenButton
bColor = color(0, 255, 0); //ändra bakgrundsfärg till grön
textIsYes = false;

}
}

