

  /*Compositie in Processing 1, gemaakt door Vincent Verheyen.
    Hierbij verklaar ik deze code vrij te gebruiken. 
    Contacteer mij steeds via vincent.verheyen@hotmail.com 
    May 2010, happy coding!*/

//begin van programma-----(happy coding!)-----------------------------------------------------//

  //containers-----(declaratie van getallen)--------------------------------------------------//

  /*Ik declareer een decimaal getal 'draai' met als startwaarde 0.
    In de void-draw-sectie zal ik 'draai' gebruiken om een 
    draaibeweging en een verandering van kleur tot stand te brengen.*/
  
float draai = 0;

  //void setup-----(bevat omgevings-gerichte uitspraken)--------------------------------------//
  
void setup(){

  /*Ik creeer een scherm van 400 op 400 pixels met P3D als renderer
    voor het renderen van 3D-objecten.*/
  
size (400, 400, P3D);
 
  /*Met kleurmodus HSB, waarin uitersten 0 en 360 zijn.
    Ik kies deze uitersten omdat ik dan de waarden van de draai-
    beweging kan gebruiken voor de variatie in kleur. H staat
    voor tint, S voor saturatie en L voor helderheid.*/
  
colorMode(HSB, 360);
  
  /*Dit betekent een witte achtergrond creeeren. Mijn witte
    achtergrond wordt ververst in void-draw-sectie, maar voor minder 
    kans op flitsen, schrijf ik deze ookin de void-setup-sectie.*/
  
background(360);

}

  //void draw-----(continu-uitgevoerde uitspraken)--------------------------------------------//

void draw() {

  /*Dit ververst de witte achtergrond continu, waardoor tekeningen
    continu verdwijnen en geen 'sleep'-vormen ontstaan.*/
  
background (360);

  /*Wanneer draai kleiner is dan 360, wordt draai + 0.2 gedaan.
    Wanneer draai 360 wordt, wordt draai terug 0. Dit gebruik
    ik later om een rotatie en een tint te berekenen.*/
  
if(draai < 360) {
  draai = draai + 0.2;
}
    else {draai = 0;
  }

  /*Er wordt continu een nieuwe invulkleur berekend met een
    tint gelijk aan draai, met een transparantie van 250.*/
  
fill(draai, 360, 360, 250);

  /*Translate maakt dat een kubus in plaats van linksbovenaan
    in het midden van het scherm zal getekend.*/
  
translate(width/2, height/2);

  /*Er wordt een rotatie berekent volgens de 3 assen, elk gelijk
  aan de radialen van de huidige draai.*/
  
rotateX(radians(draai));
rotateY(radians(draai));
rotateZ(radians(draai));

  /*We maken een loop die 4 keer uitgevoerd zal worden.*/
  
for(int kolom = 0; kolom < 4 ; kolom++) {
  
  /*Dit creert de eerste linkse kubus bij de eerste uitvoering, 
    en tekent de volgnede eerste linkse kubussen van elke rij bij de 
    volgende uitvoeringen. Bij elke uitvoering wordt er ook een 
    extra z-rotatie bij de huidige z-rotatie opgeteld.*/
  
  rotateZ(radians(draai));
  box(25);

  /*Dit creert 4 extra kolommen per rij. Bij elke nieuwe kolom wordt
    er een extra y-rotatie bij de huidige y-rotatie opgeteld. 
    Translate zorgt ervoor dat er een spatie van 50 pixels tussen 
    de kolommen zit.*/
  
  for(int rij = 0; rij < 4; rij++){
    translate(50, 0, 0);
    rotateY(radians(draai));
    box(25);
  }

  /*Dit creeert 3 extra rijen per kolom. Bij elke nieuwe rij wordt 
    er een extra x-rotatie bij de huidige x-rotatie wordt opgeteld. 
    Translate zorgt ervoor dat een nieuwe rij netjes onder de vorige komt 
    in breedte en zorgt ervoor dat er een hoogteverschil van 50 pixels 
    tussen elke rij zit.*/
  
  rotateX(radians(draai));
  translate(-200, 50, 0);
}

}
  
//einde van programma-----(happy coding!)-----------------------------------------------------//


