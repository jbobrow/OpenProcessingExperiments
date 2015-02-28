
import guicomponents.*;
 
// identifierng av bakgrund och checkboxen
color bgColor;
GCheckbox checkbox;
 
//Färgvalsknapparna
GButton whiteButton;
GButton greenButton;
GButton violetButton;
 
//Modifieringsbox och godkänn knapp
GTextField textField;
GButton klarButton;
int rundStorlek;
 
void setup(){
size( 320, 320);
fill(0, 0, 0);
//bakgrundsvärg
bgColor = color(255, 222, 173);
 
checkbox = new GCheckbox(this, "Rita Cirkel", 40, 135, 100);
//färgvalsknapparna igen
whiteButton = new GButton(this, "White", 230, 250, 80, 40);
greenButton = new GButton(this, "Green", 130, 250, 80, 40);
violetButton = new GButton(this, "violet",30, 250, 80, 40);
//modifieringsknappar och fält igen
textField = new GTextField(this, "", 40, 20, 70, 30); 
klarButton = new GButton(this,"Godkänn", 130, 20, 70, 30);
//storlek på cirkeln
rundStorlek = 100;
}
 
void draw(){
background(bgColor);
fill(0, 0, 0);
//text
  text("Ändra färger på bakgrund!", 105, 240);
 text("Ändra storlek på Cirkeln vet ja!!", 60, 70);
 //vad som händer när checkboxen är intryckt
 if (checkbox.isSelected() ){
  fill(255, 255, 255);
 ellipse(160, 140, rundStorlek, rundStorlek);
 text("Titt ut!", 60, 190);
 }
 //påskägg när man går över size 110
 if (rundStorlek > 110) {
   fill(255, 255, 0);
 ellipse(160, 140, rundStorlek, rundStorlek);
 fill(0, 0 ,0);
 ellipse(140, 125, 20, 20);
 ellipse(178, 125, 20, 20);
 ellipse(158, 160, 10, 50);
 text("Bu!!!!!", 150, 210);
 }
 }
 
//knapp hanteringen
void handleButtonEvents(GButton button) {
if(button == whiteButton){
  bgColor = color(255, 255 ,255);
 
}else if(button == greenButton) {
  bgColor = color(0,255, 0);
 
}else if(button == violetButton){
  bgColor = color(238, 130, 238);
  
}else if(button == klarButton){
  rundStorlek = Integer.parseInt( textField.getText() );
}
}

