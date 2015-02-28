

/*Granaat in Processing 1, gemaakt door Vincent Verheyen.
  Hierbij verklaar ik deze code vrij te gebruiken.
  Contacteer mij steeds via vincent.verheyen@hotmail.com 
  May 2010, happy coding!*/
  
//begin van programma-----(happy coding!)-----------------------------------------------------//

  //containers-----(declaratie van getallen)--------------------------------------------------//

  /*Met deze arrays zal ik later de locatie en
    de rotatie van de buikstukken en de kopstukken 
    van de granaat berekenen. De [9] staat voor de 
    9 stukken van de granaat. Eerst 5 rijen van de 
    buik van de granaat (vanboven te beginnen tellen) 
    en dan 4 kopstukken van de granaat (bij de buik 
    te beginnen tellen). De [3] maakt later voor elk 
    stuk van de granaat nog 3 extra hokjes. Deze 3 
    hokjes zal ik bij locatie nodig hebben voor de 
    x-, y- en z-waarden. Bij rotatie zal ik deze 3
    hokjes nodig hebben voor de x-, y- en z-rotatie.*/

int [][] locatie = new int [9] [3],
         rotatie = new int [9] [3];

  /*Met deze array zal ik [54] maal een willekeurig 
    natuurlijk getal laten bepalen van 0 en t.e.m 2. 
    Deze getallen zullen staan voor een van de [3] 
    getallen uit boenstaande arrays. Op deze manier 
    zal de granaat telkens anders exploderen.*/
    
int [] willekeurig_0_tot_en_met_2 = new int [54];

  /*Met willekeurig_hokje_locatie en willekeurig-
   _hokje_rotatie zal ik in de void-draw-sectie 
   aanduiden welk hokje van willekeurig_0_tot_en-
   _met_2 zal moeten ingevuld worden. Min_of_plus
   _2 zal voor de eigenlijke explosie zorgen.*/

int willekeurig_hokje_locatie,
    willekeurig_hokje_rotatie,
    min_of_plus_2;
         
  /*muis_klik wordt berekend in de mousePressed- en 
    de mouseReleased-secties. muis_klik zal 1 worden 
    bij het klikken, wat een voorwaarde zal zijn 
    bij het exploderen van de granaat.*/
    
int muis_klik = 0;
         
  /*Met deze array zal ik de kleur van de granaat 
    berekenen. Kleur begint op onderstaande waarden 
    maar zal later veranderen in de void-draw-sectie.*/
    
int [] kleur = {115, 360, 360};

  /*Dit getal zal een signaal geven dat de 
    granaat zal doen exploderen of imploderen.*/

int exploderen_imploderen = 0;

  /*Dit getal zal duidelijk maken of de granaat
    terug in zijn oorspronkelijke staat is.*/

int geexplodeerd_geimplodeerd = 0;
    
  /*Met muis_versleping zal ik de versleping 
    van de muis berekenen wanneer er muis_klik wordt.
    Deze berekening gebeurt in de void-mouseDragged-
    sectie. De getallen zullen worden omgezet naar 
    radialen in de void-draw-sectie en kunnen daar 
    ook het standpunt van de 'camera' veranderen.*/
        
int [] muis_versleping = {0, 0};

  //void setup-----(bevat omgevings-gerichte uitspraken)--------------------------------------//

void setup(){

  /*Ik creeer een scherm van 400 op 400 pixels. 
    Ik gebruik P3D als renderer voor het tekenen 
    van 3D-objecten.*/
    
size (400,400,P3D);

  /*Ik kies voor de de kleurmodus HSB met een 
    bereik van 0 tot 360.*/

colorMode (HSB, 360);

  /*Dit betekent een witte achtergrond creeeren. 
    Mijn witte achtergrond wordt ververst in de
    void-draw-sectie maar voor minder kans op 
    flitsen schrijf ik deze hier ook reeds.*/
    
background (360);

  /*Met deze getallen geef ik de begin-locaties
    van de stukken van de granaat door aan de 
    void-draw-sectie.*/

locatie [0] [0] = -8;      locatie [1] [0] = -8;      locatie [2] [0] = -8;
locatie [0] [1] = -40;     locatie [1] [1] = -3;      locatie [2] [1] = 35;
locatie [0] [2] = 45;      locatie [1] [2] = 50;      locatie [2] [2] = 50;

locatie [3] [0] = -8;      locatie [4] [0] = -8;      locatie [5] [0] = 5;
locatie [3] [1] = 73;      locatie [4] [1] = 110;     locatie [5] [1] = -75;
locatie [3] [2] = 50;      locatie [4] [2] = 45;      locatie [5] [2] = -7;

locatie [6] [0] = 5;       locatie [7] [0] = -10;     locatie [8] [0] = -85; 
locatie [6] [1] = -100;    locatie [7] [1] = -120;    locatie [8] [1] = -55;
locatie [6] [2] = -7;      locatie [7] [2] = -7;      locatie [8] [2] = -7;

  /*Met deze getallen geef ik de begin-rotaties 
    van de stukken van de granaat door aan de 
    void-draw-sectie.*/

rotatie [8] [2] = -75; 

}

  //void draw-----(continu-uitgevoerde uitspraken)--------------------------------------------//

void draw(){

  /*Dit ververst de witte achtergrond continu
    waardoor tekeningen continu verdwijnen en 
    geen 'sleep'-vormen ontstaan.*/
    
background (360);

  /*Ik bereken de invulkleur met waardes uit 
    de container-sectie.*/
    
fill(kleur[0], kleur[1], kleur[2]);

  /*Als er wordt muis_klik verandert kleur[0].*/

if(muis_klik == 1) {
  
  kleur[0] = kleur[0] - 2;
  
  /*Als er wordt muis_klik en kleur[0] kleiner
    dan 0 is, verandert exploderen_imploderen 
    in 1. Dit zal de granaat doen exploderen.*/

  if(kleur[0] < 0) {
    
    exploderen_imploderen = 1;
 
  }
  
}

  /*Als er niet wordt muis_klik en kleur[0]
    kleiner dan 115 is, verandert kleur[0].
    Dit maakt de granaat terug groen,
    wanneer ze niet groen is.*/

if(muis_klik == 0) {
 
  if (kleur[0] < 115) {
  
    kleur[0] = kleur[0] + 2;
  
  }
  
  /*Als er niet wordt muis_klik en kleur[0] 
    kleiner dan 0 is zal er een signaal
    gegeven worden dat de granaat doet 
    imploderen.*/
  
  if(kleur[0] < 0) {
  
    exploderen_imploderen = -1;
  
  }
  
}

  /*Als kleur[0] groter dan 3 is, zal ik 
    [54] maal een nieuw willekeurig natuurlijk
    getal laten bepalen van 0 en t.e.m 2. Dit 
    getal komt telkens in een van de 54 hokjes 
    van willekeurig_0_tot_en_met_2.*/
  
if (kleur[0] > 3) {
  
    for(int x = 0; x < 54; x ++) {
    
      willekeurig_0_tot_en_met_2 [x] = int(random(0,3));
    
  }
  
}

 /*Als exploderen_imploderen 1 is, zal de
  granaat exploderen. Geexplodeerd_geimplo-
  deerd zal gebruikt worden om duidelijk te 
  maken wanneer de granaat terug in zijn 
  oorspronkelijke staat is. Min_of_plus_2
  zal afwisselend min of plus 2 worden.
  Dit zal mee zorgen voor een ontploffing
  naar alle kanten. Er wordt constant 
  gelooped door de stukken van de granaat. 
  Tegelijkertijd worden er hokjes van
  willekeurig_0_tot_en_met_2 gelooped. 
  3 per rotatie en 3 per locatie van elk 
  stuk van de granaat. Deze keuze van 
  hokjes zorgen voor een variatie in 
  explosie.*/

if (exploderen_imploderen == 1) {
  
  geexplodeerd_geimplodeerd += 1;
  
  willekeurig_hokje_locatie = 0;
  willekeurig_hokje_rotatie = 27;
  min_of_plus_2 = 2;
  
  for (int x = 0; x < locatie.length; x++) {
    
    for (int y = 0; y < 3; y++) {
      
	locatie[x] [ willekeurig_0_tot_en_met_2[willekeurig_hokje_locatie++] ] += min_of_plus_2;

        rotatie[x] [ willekeurig_0_tot_en_met_2[willekeurig_hokje_rotatie++] ] += min_of_plus_2;
        
	min_of_plus_2 = -min_of_plus_2;

    }
    
  }
  
}

 /*Als exploderen_imploderen -1 is, en de
   granaat niet in zijn oorspronkelijke
   staat is, zal de granaat imploderen.
   Geexplodeerd_geimplodeerd zal gebruikt 
   worden om duidelijk te maken wanneer 
   de granaat terug in zijn oorspronkelijke 
   staat is. Voor meer uitleg over implosie,
   zie hierboven bij explosie.*/
  
if ((exploderen_imploderen == -1) & (geexplodeerd_geimplodeerd >= 1)) {
  
  geexplodeerd_geimplodeerd -= 1;

  willekeurig_hokje_locatie = 0;
  willekeurig_hokje_rotatie = 27;
  min_of_plus_2 = 2;
  
  for (int x = 0; x < locatie.length; x++) {
    
    for (int y = 0; y < 3; y++) {
      
	locatie[x] [ willekeurig_0_tot_en_met_2[willekeurig_hokje_locatie++] ] -= min_of_plus_2;

        rotatie[x] [ willekeurig_0_tot_en_met_2[willekeurig_hokje_rotatie++] ] -= min_of_plus_2;
        
	min_of_plus_2 = -min_of_plus_2;
    }
  }
}
  
  /*Ik laat een wit licht schijnen met x-waarde 150, 
    y-waarde 200 en z-waarde 300.*/

pointLight(360, 0, 360, 150, 200, 300);

  /*Deze translate zorgt ervoor dat mijn x-waardes 
    200 pixels naar rechts en mijn y-waardes 200 
    pixels naar onder verschuiven.*/

translate(200, 200, 0);

  /*Hier zet ik de versleping, die berekent wordt 
    in de void-mouseDragged-sectie, om in radialen. 
    Het lijkt of de 'camera' beweegt met die radialen.
    In feite draait gewoon de hele granaat rond het
    midden van het scherm.*/
    
rotateY(radians(muis_versleping[0]));
rotateX(radians(muis_versleping[1]));

  /*Ik zet de positie van bovenstaande translate en 
    rotate [9] keer in pushMatrix zodat ik er 
    makkelijk naar kan teruggrijpen met popMatrix. 
    De eerste popMatrix van elke stuk van de granaat 
    grijpt terug naar deze pushMatrix.*/

for (int granaatstukken = 0; granaatstukken < 9  ; granaatstukken ++){
  
  pushMatrix();
  
}

   /*Ik verklaar de locatie en de rotatie van de
     eerste rij van de buik van de granaat (van
     boven te beginnen tellen).*/
    
popMatrix();
translate(locatie [0] [0],locatie [0] [1],locatie [0] [2]);
rotateX(radians(rotatie [0] [0]));
rotateY(radians(rotatie [0] [1]));
rotateZ(radians(rotatie [0] [2]));

   /*Hier teken ik alle blokjes van die rij.
     RotateX bepaalt de x-rotatie van de blokjes 
     ten opzichte van het midden van hunzelf.
     Translate zorgt voor spatie tussen de 
     blokjes en rotateY zorgt voor de y-rotatie
     tussen de blokjes. */
  
for (int blokjes = 0; blokjes < 10  ; blokjes ++){

  pushMatrix();
  rotateX(radians(20));
  box(25, 25, 25);
  popMatrix();
  translate(35, 0, 0);
  rotateY(radians(36));
  
}
  
   /*Ik verklaar de locatie en de rotatie van de
     tweede rij van de buik van de granaat (van
     boven te beginnen tellen).*/
     
popMatrix();
translate(locatie [1] [0],locatie [1] [1],locatie [1] [2]);
rotateX(radians(rotatie [1] [0]));
rotateY(radians(rotatie [1] [1]));
rotateZ(radians(rotatie [1] [2]));

   /*Hier teken ik alle blokjes van die rij.
     RotateX bepaalt de x-rotatie van de blokjes 
     ten opzichte van het midden van hunzelf.
     Translate zorgt voor spatie tussen de 
     blokjes en rotateY zorgt voor de y-rotatie
     tussen de blokjes. */
  
for (int blokjes = 0; blokjes < 10  ; blokjes ++){

  pushMatrix();
  rotateX(radians(10));
  box(25, 27.5, 25);
  popMatrix();
  translate(40, 0, 0);
  rotateY(radians(36));
}

   /*Ik verklaar de locatie en de rotatie van de
     derde rij van de buik van de granaat (van
     boven te beginnen tellen).*/
     
popMatrix();
translate(locatie [2] [0],locatie [2] [1],locatie [2] [2]);
rotateX(radians(rotatie [2] [0]));
rotateY(radians(rotatie [2] [1]));
rotateZ(radians(rotatie [2] [2]));

   /*Hier teken ik alle blokjes van die rij.
     RotateX bepaalt de x-rotatie van de blokjes 
     ten opzichte van het midden van hunzelf.
     Translate zorgt voor spatie tussen de 
     blokjes en rotateY zorgt voor de y-rotatie
     tussen de blokjes. */
  
for (int blokjes = 0; blokjes < 10  ; blokjes ++){

  pushMatrix();
  box(25, 30, 25);
  popMatrix();
  translate(40, 0, 0);
  rotateY(radians(36));
  
}

   /*Ik verklaar de locatie en de rotatie van de
     vierde rij van de buik van de granaat (van
     boven te beginnen tellen).*/
     
popMatrix();
translate(locatie [3] [0],locatie [3] [1],locatie [3] [2]);
rotateX(radians(rotatie [3] [0]));
rotateY(radians(rotatie [3] [1]));
rotateZ(radians(rotatie [3] [2]));
  
for (int blokjes = 0; blokjes < 10  ; blokjes ++){
  
   /*Hier teken ik alle blokjes van die rij.
     RotateX bepaalt de x-rotatie van de blokjes 
     ten opzichte van het midden van hunzelf.
     Translate zorgt voor spatie tussen de 
     blokjes en rotateY zorgt voor de y-rotatie
     tussen de blokjes. */

  pushMatrix();
  rotateX(radians(-10));
  box(25, 27.5, 25);
  popMatrix();
  translate(40, 0, 0);
  rotateY(radians(36));
  
}

   /*Ik verklaar de locatie en de rotatie van de
     vijfde rij van de buik van de granaat (van
     boven te beginnen tellen).*/
     
popMatrix();
translate(locatie [4] [0],locatie [4] [1],locatie [4] [2]);
rotateX(radians(rotatie [4] [0]));
rotateY(radians(rotatie [4] [1]));
rotateZ(radians(rotatie [4] [2]));
  
for (int blokjes = 0; blokjes < 10  ; blokjes ++){
  
   /*Hier teken ik alle blokjes van die rij.
     RotateX bepaalt de x-rotatie van de blokjes 
     ten opzichte van het midden van hunzelf.
     Translate zorgt voor spatie tussen de 
     blokjes en rotateY zorgt voor de y-rotatie
     tussen de blokjes. */
  
  pushMatrix();
  rotateX(radians(-20));
  box(25, 25, 25);
  popMatrix();
  translate(35, 0, 0);
  rotateY(radians(36));
  
}

   /*Ik verklaar de locatie en de rotatie van 
     het eerste kopstuk van de granaat 
     (van de buik beginnen te tellen).*/

popMatrix();
translate(locatie [5] [0],locatie [5] [1],locatie [5] [2]);
rotateX(radians(rotatie [5] [0]));
rotateY(radians(rotatie [5] [1]));
rotateZ(radians(rotatie [5] [2]));
box(100, 30, 100);

   /*Ik verklaar de locatie en de rotatie van 
     het tweede kopstuk van de granaat 
     (van de buik beginnen te tellen).*/

popMatrix();
translate(locatie [6] [0],locatie [6] [1],locatie [6] [2]);
rotateX(radians(rotatie [6] [0]));
rotateY(radians(rotatie [6] [1]));
rotateZ(radians(rotatie [6] [2]));
box(30, 50, 30);

    /*Ik verklaar de locatie en de rotatie van 
     het derde kopstuk van de granaat 
     (van de buik beginnen te tellen).*/

popMatrix();
translate(locatie [7] [0],locatie [7] [1],locatie [7] [2]);
rotateX(radians(rotatie [7] [0]));
rotateY(radians(rotatie [7] [1]));
rotateZ(radians(rotatie [7] [2]));
box(150, 20, 50);

   /*Ik verklaar de locatie en de rotatie van 
     het vierde kopstuk van de granaat 
     (van de buik beginnen te tellen).*/

popMatrix();
translate(locatie [8] [0],locatie [8] [1],locatie [8] [2]);
rotateX(radians(rotatie [8] [0]));
rotateY(radians(rotatie [8] [1]));
rotateZ(radians(rotatie [8] [2]));
box(150, 20, 50);

}

  //void mousePressed-----(muis geklikt)------------------------------------------------------//

void mousePressed() {
  
  if(mouseButton == LEFT) {
  
  /*Ik bereken de beweging voor het vierde
    kopstuk wanneer er geklikt wordt met
    de linkermuisknop.*/
  
  rotatie [8] [2] -= 10;
  
  /*Ik geef een signaal aan de void-draw-
    sectie om te zeggen dat er geklikt
    is met de linkermuisknop.*/
  
  muis_klik = 1;
  
  }

}

  //void mouseDragged-----(muis geklikt en versleept)-----------------------------------------//

void mouseDragged() {
  
   /*Ik bereken de versleping van de muis
     wanneer er geklikt en gesleept wordt.*/

  muis_versleping[0] -= (pmouseX - mouseX);
  muis_versleping[1] += (pmouseY - mouseY);

}

  //void mouseReleased-----(muis losgelaten)--------------------------------------------------//

void mouseReleased() {
  
  if(mouseButton == LEFT) {
  
  /*Ik bereken de beweging voor het vierde
    kopstuk wanneer er losgelaten wordt met
    de linkermuisknop.*/
  
  rotatie [8] [2] += 10;
    
  /*Ik geef een signaal aan de void-draw-
    sectie om te zeggen dat er losgelaten
    is met de linkermuisknop.*/
  
  muis_klik = 0;
  
  }

}

//einde van programma-----(happy coding!)-----------------------------------------------------//


