
int bgColor; // Bakgrundsfärgen
 
int window; // Fönster
 
int theRectPositionX; // Rektangelns X Position
int theRectPositionY; //  Rektangelns  Y Position
 
boolean stopTheBounce = true; // Sätter boolean värdet på true
 
String textScore = "Totalt poäng: "; // String för text
int totalScore; // En variabel för att hålla koll på resultat
int lastLevelScore; // En variabel för att hålla koll på tidigare resultat
int scorePerCatch = 13; // Antalet poäng per klick
int rectSize = 50; // Rektangelns storlek
 
int theCatchCountDown; // En variabel för att hålla koll på tiden när rektangeln ska förflyttas
int theCatchCountDownMills = 1000; // En starttid på 1000 millisekunder
 
String textLevel = "Level: "; // String för text
int level = 1; // En variabel för att hålla koll på level samt för att starta level auto på 1
int maxLevel = 10; // Sätter en maxlevel på spelet
 
void setup() {
 size(240, 240); // Fönstrets storlek
 bgColor = color(random(256), random(256), random(256)); // Slumpad bakgrundsfärg
}
 
void draw() {
 if(window == 0) { // Kontrollerar att man är på det första fönstret
 background(bgColor); // Sätter bakgrundsfärgen
 
 if (level == maxLevel+1) { // Kontrollerar om man är klar med alla levels
   window = 1; // Om ja sätter fönstret till vinnarfönstret
 }
 
 if (lastLevelScore == totalScore-(scorePerCatch*10)) { // Kontrollerar om förgående levelscore är lika mycket som nuvarande score (vid levelbyte) subtraherat med antalet score man får vid en fångst  multiplicerat med 10 (100%)
     bgColor = color(random(256), random(256), random(256)); // Sätter en ny slumässigbakgrund som feedback på levelbytet
     level = level+1; // Ändrar level variabeln till +1
     lastLevelScore = lastLevelScore+(scorePerCatch*10); // Ändrar de senaste lastLevelScore variabeln till den score man fick vid levelbytet
     theCatchCountDownMills = theCatchCountDownMills-(theCatchCountDownMills/10); // Ändrar variabel hastigheten på rektangelns förflyttande
     rectSize = rectSize-level/2; // Ändrar storleken på rektangeln baserat på den level man befinner sig på dividerat med 2
     
  } else { theCatchCountDown = millis() / theCatchCountDownMills; } // Ändrar hastigheten på förflyttandet
  
 fill(0); // Sätter ny färg
 rect(theRectPositionX,theRectPositionY,rectSize,rectSize); // Ritar ut den förflyttande rektangeln
   
 text(textLevel+level,10,height/1.12); // Skriver ut vilken level man befinner sig på
 text(textScore+totalScore,10,height/1.05); // Skriver ut hur mycket score man har
 
 if((int)theCatchCountDown%2==0) { // Kontrollerar så att de gått ett varv av värdet i theCatchCountDown
   if (stopTheBounce) { // Kontrollerar att boolean variabeln är sann
     theRectPositionX = int(random(width)); // Slumpar rektangelns X Positionen
     theRectPositionY = int(random(height)); // Slumpar rektangelns Y Positionen
     stopTheBounce = false; // Sätter boolean variabeln till falskt så att bollen i nästa "sekund" inte ska studsa runt vilt som bara den
   }
 } else { // Om annat
     stopTheBounce = true; // Sätt boolean på sant
  }
 }
 if(window == 1) { // Kontrollerar om man är på vinnarfönstret
  background(int(random(255)), int(random(255)), int(random(255))); // Slumpar en vinnarbakgrund i massa glada färger
  textSize(20); // Textstorlek
  fill(255); // Färg
  textAlign(CENTER);
  text("Du har klarat spelet!", width/2, height/2); // Skriver ut text
 }
}
 
void mousePressed() { // Om musen är klickad
 if(window == 0) { // Och vi befinner oss på spelfönstret
   if (mouseIsInside(theRectPositionX,theRectPositionY,theRectPositionX+rectSize,theRectPositionY+rectSize)) { // Om musen befinner sig i den förflyttande rektangeln
    theRectPositionX = int(random(width)); // Slumpar rektangelns X Positionen
    theRectPositionY = int(random(height)); // Slumpar rektangelns Y Positionen
    totalScore = totalScore + scorePerCatch; // Ökar poängen
   }
}
}
 
 
boolean mouseIsInside(int x1, int y1, int x2, int y2) {
  if (mouseX>x1 && mouseY>y1 && mouseX < x2 && mouseY < y2) {
  return true;
}  else {
  return false;
  }
}
