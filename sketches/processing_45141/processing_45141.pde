
//
//// ROEMISCHES RECHENBRETT
//// von Ch. Saner, mmp11a @ htw Chur, Okt 2011
//
//
//
/* Der Code könnte wahrscheinlich mit weiterführenden Variabeln und Loops wesentlich vereinfacht bzw. gekürzt werden. 
Trotzdem wurden nur diejenigen Befehle verwendet, die wir bisher im Unterricht hatten. 
Ausnahmen sind die Darstellung von Text, die Veränderung des Cursors und die Verwendung von color-Variabeln. Diese 
Befehle habe ich in der Referenz nachgeschaut und deswegen verwendet, damit das Arbeiten mit dem Rechenbrett 
für den Benutzer vereinfacht wird. Die color-Variablen habe ich verwendet, damit ich die Farbe nicht jedesmal neu 
definieren muss (Aufwand). Ausserdem sind alle drei Befehle sehr einfach anzuwenden. */

// Am Anfang werden verschiedene globale Variabeln definiert.
/* Die Variable yCircle wird für den Einrasterungsvorgang gebraucht (Linie, Zwischenräume). Es handelt sich hier 
eigentlich um ein "gerundetes mouseY". */
int yCircle;
/* Die Variable xCircle wird nur gebraucht, falls mit der Tastatur gearbeitet wird und klärt den Bereich (linke 
oder rechte Spalte) ab, in dem man sich momentan befindet. Es handelt sich hier eigentlich um ein "gerundetes mouseX".*/
int xCircle;
// Die Variable keys wird auf true gesetzt, wenn mit der Tastatur gearbeitet wird. //
boolean keys = false;
// Die Variable addition wird auf false gesetzt, wenn die mittlere Spalte der Subtraktion unterliegt. //
boolean addition = true;
/* Wenn die Variable roem auf true gesetzt ist, wird das Rechenbrett in der römischen Zählweise dargestellt. 
Ansonsten wird die indische Zählweise benutzt. */
boolean roem = true;

// Die Nachfolgenden Variablen werden verwendet, falls eine Zahl mit der Tastatur eingegeben wird. 
// Möchte der Benutzer eine Zahl auf der Tastatur eingeben, wird die Variable insertnr auf true gesetzt. 
boolean insertnr = false;
// Die Variable typednr beinhaltet die aktuell eingegebene Ziffer. 
int typednr = 0;
// Die Variable typedarea enthält die angesprochene Spalte. 
int typedarea = 1;
// Die Variable typedkeys sagt aus, wieviele Ziffern eingegeben wurden. 
int typedkeys = 0;
// Die Variable areasizeProv beinhaltet die ganze bisher eingegebene Zahl. Diese Variable müsste nicht unbedingt global definiert werden. 
int areasizeProv = 0;

// Nun werden die Variabeln für die Grösse einzelnen Beträge bzw. Einheitenbündel (Y-Achsen) definiert. 
// Zuerst für die linke Spalte (Area1). 
int area1sizeI; 
int area1sizeV;
int area1sizeX; 
int area1sizeL; 
int area1sizeC; 
int area1sizeD; 
int area1sizeM; 
// Die Variable area1size beinhaltet die gesamte Grösse der Spalte. 
int area1size = 0;


// Dann für die rechte Spalte (Area3). 
int area3sizeI; 
int area3sizeV;
int area3sizeX; 
int area3sizeL; 
int area3sizeC; 
int area3sizeD; 
int area3sizeM; 
// Die Variable area3size beinhaltet die gesamte Grösse der Spalte. 
int area3size = 0;

// Zum Schluss für die mittlere Spalte (Area2). 
int area2sizeI; 
int area2sizeV;
int area2sizeX; 
int area2sizeL; 
int area2sizeC; 
int area2sizeD; 
int area2sizeM; 
// Die Variable area2size beinhaltet die gesamte Grösse der Spalte. 
int area2size = 0;

/* Weiterhin werden Farbvariabeln deklariert, welche die Farben enthalten, mit denen die Kreise auf den einzelnen 
Achsen dargestellt werden. So musste ich die Farben nachfolgend nicht immer wieder kopieren und einfügen, sondern
konnte schlicht die jeweilige Variable verwenden. Ausserdem könnten so die Farben ganz einfach global verändert werden.*/
color sizeIfill = color(200,150,50);
color sizeVfill = color(210,130,80); 
color sizeXfill = color(220,120,120); 
color sizeLfill = color(190,110,150); 
color sizeCfill = color(140,90,180); 
color sizeDfill = color(120,100,190); 
color sizeMfill = color(90,120,230); 

/* Die Variablen area1, area2 und area3 werden auf true gesetzt, wenn die jeweilige Spalte fokusiert wurde. Die 
Variable noarea wird eingeschalten, wenn keine Spalte fokusiert wurde. */
boolean noarea = true;
boolean area1 = false; 
boolean area2 = false; 
boolean area3 = false; 

////
//
////

// Im Setup-Prozess wird nur die Grösse des Fensters definiert. 
void setup () {
  size (600, 400);
}

////
//
////

// Im Draw-Prozess wird das Rechenbrett dargestellt. 
void draw () {
    if (kreisgroesseintro<width*1.2) {
      intro();
    }
    if (kreisgroesseintro>=width*1.2) {
      //
      ////
      ////
      //// VISUELLER AUFBAU DES RECHENBRETTES
      ////
      ////
      //
      background(255);
      
      // Arbeitet der Benutzer mit der Tastatur, wird der Cursor für die Übersichtlichkeit automatisch ausgeblendet. 
      if (keys==true) { noCursor(); }
      
      
     //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      
      //
      // TITEL
      //
      // Der Titel soll mittig und in schwarz dargestellt werden. 
      textAlign(CENTER);
      fill(0);
      // Je nach vom Benutzer aktivierten Rechenbrett-Funktionen, hat der Titel einen anderen Inhalt. 
      // Ist Addition angewählt, ...
      if (addition==true)
      // ... wird der Titel entsprechend angezeigt. Das gleiche gilt für die Zählweise (römisch oder indisch). 
        {if (roem==true) {text ("römisches Rechenbrett mit automatischer Addition", 300, 20);} else if (roem==false) {text ("indisches Rechenbrett mit automatischer Addition", 300, 20);}}
      // Ist Subtraktion angewählt, ...  
      else if (addition==false)
      // ... wird dies ebenso gehandhabt. 
        {if (roem==true) {text ("römisches Rechenbrett mit automatischer Subtraktion", 300, 20);} else if (roem==false) {text ("indisches Rechenbrett mit automatischer Subtraktion", 300, 20);}}
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
      //
      ////
      /// GRÖSSEN UND SPALTEN (LINIEN)
      ////
      //
      /* In einem wird das Raster dargestellt. Sie bestehen aus mehreren Linien in verschiedenen Grautönen und sind versetzt
      zueinander . Auf oder zwischen den GRÖSSENLINIEN werden die Einheiten und Einheitenbündel platziert. Die ABGRENZUNGSLINIEN 
      grenzen die Brettspalten ab. Das TAUSENDERKREUZ markiert die Tausenderlinie und wird - wie bei einem römischen Rechenbrett 
      üblich - ebenfalls dargestellt. Es hat allerdings nur eine rein visuelle Funktion.*/
    
      // GRÖSSENLINIEN
    
    for (int i = 1; i < 8; i = i+2) {
      for (int k = 0; k < 3; k = k+1) {
        stroke(k*50);
        line (35, (50*i)+k, 565, (50*i)+k);
      }
    }
    
      //ABGRENZUNGSLINIEN (Hier habe ich einfachheitshalber auf die for-Schleife verzichtet.)
      
      // LINIE 1 (Abgrenzung linke Brettspalte <> mittlere Brettspalte)
      stroke (100);
      line (198, 30, 198, 370);
      stroke (50);
      line (199, 30, 199, 370);
      stroke (0);
      line (200, 30, 200, 370);
      stroke (50);
      line (201, 30, 201, 370);
      stroke (100);
      line (202, 30, 202, 370);
      // LINIE 2 (Abgrenzung mittlere Brettspalte <> rechte Brettspalte)
      stroke (100);
      line (398, 30, 398, 370);
      stroke (0+50);
      line (399, 30, 399, 370);
      stroke (0);
      line (400, 30, 400, 370);
      stroke (0+50);
      line (401, 30, 401, 370);
      stroke (0+100);
      line (402, 30, 402, 370);
    
    
      //TAUSENDERKREUZ
      stroke (100);
      line (288, 38, 310, 62);
      stroke (50);
      line (289, 38, 311, 62);
      stroke (0);
      line (290, 38, 312, 62);
      stroke (50);
      line (291, 38, 313, 62);
      stroke (100);
      line (292, 38, 314, 62);
      stroke (100);
      line (310, 38, 288, 62);
      stroke (0+50);
      line (311, 38, 289, 62);
      stroke (0);
      line (312, 38, 290, 62);
      stroke (0+50);
      line (313, 38, 291, 62);
      stroke (0+100);
      line (314, 38, 292, 62);
      
      // Die Linien sollen auch Beschriftet werden, damit dem Benutzer das Areiten erleichtert wird. 
      
        //BESCHRIFTUNG
      fill(0);
      textAlign(RIGHT);
      text("M", 25, 55);
      text("C", 25, 155);
      text("X", 25, 255);
      text("I", 25, 355);
      
      /// //// ROEMISCH
      /* Wenn die römische Zählweise eingeschaltet sich, werden die Fünfer-, Fünfziger- und Fünfhunderterschritte angezeigt. 
      Wird allerdings mit der inidschen Zählweise gearbeitet, macht es keinen Sinn, die Zwischenräume auch zu beschriften. */
      if (roem==true) {
      textAlign(LEFT);
      text("D", 570, 105);
      text("L", 570, 205);
      text("V", 570, 305);
      }
      
      if (roem==false) {
           if (area1sizeV!=0)
           {area1sizeI=area1sizeI+5;
            area1sizeV=0;}
           if (area1sizeL!=0)
           {area1sizeI=area1sizeX+5;
            area1sizeL=0;}
           if (area1sizeD!=0)
           {area1sizeI=area1sizeC+5;
            area1sizeD=0;}
      }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
      //
      ////
      ////
      //// EINRASTERUNG MIT DER MAUS
      ////
      ////
      //
    
    // Die Variablen mouseY und mouseX müssen nur berechnet werden, wenn mit der Maus gearbeitet wird. 
    if (keys==false) {
    
      // Die Variablen xCricle und yCircle werden zuerst auf 0 gesetzt, damit der Rechenvorgang ohne Einflüsse starten kann. 
      xCircle = 0; yCircle = 0; 
    
      /* Je nach Y-Position der Maus, wird die Variable yCircle entsprechend angepasst. Das Rechenbrett ist der Höhe 
      nach in 7 Bereiche (Grössen) unterteilt. Daher wird die Mausposition "gerundet" und die Variable yCircle 
      mit der entsprechenden Pixelangabe versehen. Der Bereich unter 25 Pixel und derjenige oberhalb von 375 Pixel 
      liegen ausserhalb der Arbeitsfläche. */ 
        if (mouseY<25) { yCircle=0; }
      if (mouseY<75 && mouseY>=25) { yCircle = yCircle + 50; }
      if (mouseY<125 && mouseY>=75) { yCircle = yCircle + 100; }
      if (mouseY<175 && mouseY>=125) { yCircle = yCircle + 150; }
      if (mouseY<225 && mouseY>=175) { yCircle = yCircle + 200; }
      if (mouseY<275 && mouseY>=225) { yCircle = yCircle + 250; }
      if (mouseY<325 && mouseY>=275) { yCircle = yCircle + 300; }
      if (mouseY<375 && mouseY>=325) { yCircle = yCircle + 350; }
      if (mouseY>=375) { yCircle=0; }
     
      /* Je nach X-Position der Maus, wird die Variable xCircle entsprechend angepasst. Das Rechenbrett ist in der 
      Breite in 3 Bereiche unterteilt. Je nachdem, in welchem Bereich sich die Maus befindet, werden die Variabeln 
      noarea (für keinen Bereich), area1 (linke Brettspalte), area2 (mittlere Brettspalte) und area3 (rechte Brettspalte) 
      auf true oder false gesetzt. */
      if (mouseX<35) { noarea = true; area1 = false; area2 = false; area3 = false; cursor(ARROW);}
      if (mouseX<200 && mouseX>=35) { noarea = false; area1 = true; area2 = false; area3 = false; cursor(HAND);}
      if (mouseX<400 && mouseX>=200) { noarea = false; area1 = false; area2 = true; area3 = false; cursor(ARROW);}
      if (mouseX<565 && mouseX>=400) { noarea = false; area1 = false; area2 = false; area3 = true; cursor(HAND);}
      if (mouseX>=565) { noarea = true; area1 = false; area2 = false; area3 = false; cursor(ARROW);}
    // //
      
    }
      
      
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    /////////// DARSTELLEN DER ZAHLEN ///////////
    /////////////////////////////////////////////
    
    /////////// LINKE BRETTSPALTE ///////////
      
       textAlign(CENTER);
       // ZAHL ANZEIGEN
       // Die Zahl steht jeweils unterhalb der Brettspalte.
       // Falls CONTROL gedrückt wurde, wird die von der Tastatur eingegebene Zahl angezeigt.
      if (insertnr == true) {
       /* Liegt die aktuelle Position ausserhalb der Spalte, auf der mittleren Spalte oder der linken Spalte, 
        wird die linke Spalte visuell angewählt.*/
        {if (noarea==true || area2==true || area1==true) 
          {stroke(0); fill(255); rect (98, 370, 37, 20); fill(0); text (typednr, 117.5, 385); }
       // Liegt die rechte Spalte im Fokus, wird dort die Zahl visuell angewählt.//
         else if (area3==true) { fill (0); text (area1size, 117.5, 385);}
        }
      }
        
       /* Wenn die Eingabe mit den Zahlen auf der Tastatur nicht aktiviert ist, zeigt es die aktuelle 
       Zahl an. */
      else if (insertnr == false || area3==true) {fill (0); text (area1size, 117.5, 385);}
    
      
      
      // ABGELEGTE EINHEITEN / EINHEITENBÜNDEL ANZEIGEN
      fill (0); noStroke();
      /* Hier wird die Variable area1sizeProv deklariert, da die diese verändert wird. Das soll mit der 
      Variable area1size nicht geschehen. */ 
      int area1sizeProv = area1size;
      // // TAUSENDER
      // Die Variable area1sizeM benhaltet die ermittelte Anzahl der Tausender in der Urprungszahl. 
      area1sizeM = (area1sizeProv / 1000);
      // Sollte die Variable area1sizeM 4 überschreiten, wird nichts unternommen. Ansonsten ...
         if (area1sizeM>0 && area1sizeM<=4) {
          // Wird für jedes Einheitenbündel in dieser Grösse dargestellt. 
          for (int i = 1; i <= area1sizeM; i = i+1) {
          /* Da nicht alle Kreise an der gleichen Position sein dürfen (da man sie sonst nicht sehen kann), 
          werden Sie auf der Brettspalte optisch ansprechend verteilt. Dazu dient die xPos, die sich für jeden
          Durchgang (pro Einheitenbündel ein Durchgang) ändert. */
          int xPos = ((165 / (area1sizeM + 1))*i)+35;
          // Die entsprechende global deklarierte color-Variable enthält die gewünschte Farbe. 
          fill(sizeMfill);
          // Dann wird das Einheitenbündel mit einem Kreis dargestellt. 
          ellipse(xPos, 50, 30, 30);
         }
        /* Der letzte Schritt besteht darin, der Ursprungszahl die Anzahl der jetzt dargestellten Einheitenbündel 
        abzuziehen, damit die Variable area1sizeProv weiterverwendet werden kann. */
        area1sizeProv = area1sizeProv - (1000*area1sizeM);
      }
      // // FÜNFHUNDERTER
      // Wird nur ausgerechnet und dargestellt, wenn die römische Zählweise eingeschaltet ist. 
     if (roem==true)
     {
        /* Die Variable area1sizeD benhaltet die ermittelte Anzahl der Fünfhunderter in der vorher veränderten 
        Ursprungszahl. */
        area1sizeD = (area1sizeProv / 500);
        // Die nächsten Schritte bleiben für alle Grössen gleich ...
         if (area1sizeD>0) {
          for (int i = 1; i <= area1sizeD; i = i+1) {
          int xPos = ((165 / (area1sizeD + 1))*i)+35;
          fill(sizeDfill);
          ellipse(xPos, 100, 30, 30);
         }
        area1sizeProv = area1sizeProv - (500*area1sizeD);
      }
     }
      // // HUNDERTER
        area1sizeC = (area1sizeProv / 100);
         if (area1sizeC>0 && area1sizeC<=9) {
          for (int i = 1; i <= area1sizeC; i = i+1) {
          int xPos = ((165 / (area1sizeC + 1))*i)+35;
          fill(sizeCfill);
          if (roem==true) { ellipse(xPos, 150, 30, 30); } else if (roem==false) { ellipse(xPos, 150, 15, 15); }
         }
        area1sizeProv = area1sizeProv - (100*area1sizeC);
      }
     if (roem==true) {
      // // FÜNFZIGER
        area1sizeL = (area1sizeProv / 50);
         if (area1sizeL>0) {
          for (int i = 1; i <= area1sizeL; i = i+1) {
          int xPos = ((165 / (area1sizeL + 1))*i)+35;
          fill(sizeLfill);
          ellipse(xPos, 200, 30, 30);
         }
        area1sizeProv = area1sizeProv - (50*area1sizeL);
      }
     }
      // // ZEHNER
        area1sizeX = (area1sizeProv / 10);
         if (area1sizeX>0 && area1sizeC<=9) {
          for (int i = 1; i <= area1sizeX; i = i+1) {
          int xPos = ((165 / (area1sizeX + 1))*i)+35;
          fill(sizeXfill);
          if (roem==true) { ellipse(xPos, 250, 30, 30); } else if (roem==false) { ellipse(xPos, 250, 15, 15); }
         }
        area1sizeProv = area1sizeProv - (10*area1sizeX);
      }
      
     if (roem==true) {
      // // FÜNFER
        area1sizeV = (area1sizeProv / 5);
         if (area1sizeV>0) {
          for (int i = 1; i <= area1sizeV; i = i+1) {
          int xPos = ((165 / (area1sizeV + 1))*i)+35;
          fill(sizeVfill);
          ellipse(xPos, 300, 30, 30);
         }
        area1sizeProv = area1sizeProv - (5*area1sizeV);
      }
     }
      // // EINER
        area1sizeI = (area1sizeProv / 1);
         if (area1sizeI>0 && area1sizeC<=9) {
          for (int i = 1; i <= area1sizeI; i = i+1) {
          int xPos = ((165 / (area1sizeI + 1))*i)+35;
          fill(sizeIfill);
          if (roem==true) { ellipse(xPos, 350, 30, 30); } else if (roem==false) { ellipse(xPos, 350, 15, 15); }
         }
      }
    
    
    /////////////////////////////////////////////
    
    /////////// RECHTE BRETTSPALTE ///////////
    
    // Hier passiert genau das gleiche wie in der linken Spalte, nur mit den entsprechenden Variabeln und Pixelangaben. 
      if (insertnr == true) {
        {if (area3==true) 
          {stroke(0); fill(255); rect (463, 370, 37, 20); fill(0); text (typednr, 482.5, 385); }
         else if (area1==true || area2==true || noarea==true) { fill (0); text (area3size, 482.5, 385);}
        }
      }
        
      else if (insertnr == false) { fill (0); text (area3size, 482.5, 385);}
      fill (0); noStroke();
      int area3sizeProv = area3size;
      // ANZEIGEN
      // // TAUSENDER
      area3sizeM = (area3sizeProv / 1000);
         if (area3sizeM>0 && area3sizeM<=4) {
          for (int i = 1; i <= area3sizeM; i = i+1) {
          int xPos = ((165 / (area3sizeM + 1))*i)+400;
          fill(sizeMfill);
          ellipse(xPos, 50, 30, 30);
         }
        area3sizeProv = area3sizeProv - (1000*area3sizeM);
      }
      // // FÜNFHUNDERTER
     if (roem==true)
     {
        area3sizeD = (area3sizeProv / 500);
         if (area3sizeD>0) {
          for (int i = 1; i <= area3sizeD; i = i+1) {
          int xPos = ((165 / (area3sizeD + 1))*i)+400;
          fill(sizeDfill);
          ellipse(xPos, 100, 30, 30);
         }
        area3sizeProv = area3sizeProv - (500*area3sizeD);
      }
     }
      // // HUNDERTER
        area3sizeC = (area3sizeProv / 100);
         if (area3sizeC>0 && area3sizeC<=9) {
          for (int i = 1; i <= area3sizeC; i = i+1) {
          int xPos = ((165 / (area3sizeC + 1))*i)+400;
          fill(sizeCfill);
          if (roem==true) { ellipse(xPos, 150, 30, 30); } else if (roem==false) { ellipse(xPos, 150, 15, 15); }
         }
        area3sizeProv = area3sizeProv - (100*area3sizeC);
      }
     if (roem==true) {
      // // FÜNFZIGER
        area3sizeL = (area3sizeProv / 50);
         if (area3sizeL>0) {
          for (int i = 1; i <= area3sizeL; i = i+1) {
          int xPos = ((165 / (area3sizeL + 1))*i)+400;
          fill(sizeLfill);
          ellipse(xPos, 200, 30, 30);
         }
        area3sizeProv = area3sizeProv - (50*area3sizeL);
      }
     }
      // // ZEHNER
        area3sizeX = (area3sizeProv / 10);
         if (area3sizeX>0 && area3sizeC<=9) {
          for (int i = 1; i <= area3sizeX; i = i+1) {
          int xPos = ((165 / (area3sizeX + 1))*i)+400;
          fill(sizeXfill);
          if (roem==true) { ellipse(xPos, 250, 30, 30); } else if (roem==false) { ellipse(xPos, 250, 15, 15); }
         }
        area3sizeProv = area3sizeProv - (10*area3sizeX);
      }
      
     if (roem==true) {
      // // FÜNFER
        area3sizeV = (area3sizeProv / 5);
         if (area3sizeV>0) {
          for (int i = 1; i <= area3sizeV; i = i+1) {
          int xPos = ((165 / (area3sizeV + 1))*i)+400;
          fill(sizeVfill);
          ellipse(xPos, 300, 30, 30);
         }
        area3sizeProv = area3sizeProv - (5*area3sizeV);
      }
     }
      // // EINER
        area3sizeI = (area3sizeProv / 1);
         if (area3sizeI>0 && area3sizeC<=9) {
          for (int i = 1; i <= area3sizeI; i = i+1) {
          int xPos = ((165 / (area3sizeI + 1))*i)+400;
          fill(sizeIfill);
          if (roem==true) { ellipse(xPos, 350, 30, 30); } else if (roem==false) { ellipse(xPos, 350, 15, 15); }
         }
      }
      // //
      
      
    /////////////////////////////////////////////
    
    /////////// LINKE BRETTSPALTE ///////////
    
    // Zuerst werden die Angaben zu den einzelnen Grössen anhand der Variabeln area1size(Grösse) und area3size(Grösse) ausgerechnet. 
    // Bei Addition zähle zusammen...
    if (addition==true) {area2size = area1size + area3size; 
          area2sizeI = area1sizeI + area3sizeI; 
          area2sizeV = area1sizeV + area3sizeV;
          area2sizeX = area1sizeX + area3sizeX; 
          area2sizeL = area1sizeL + area3sizeL; 
          area2sizeC = area1sizeC + area3sizeC; 
          area2sizeD = area1sizeD + area3sizeD; 
          area2sizeM = area1sizeM + area3sizeM;
    }
    // ... Bei Substraktion ziehe die kleinere Zahl von der grösseren ab. 
    else if (addition==false) {
      if (area1size>area3size){area2size = area1size - area3size;
          area2sizeI = area1sizeI - area3sizeI; 
          area2sizeV = area1sizeV - area3sizeV;
          area2sizeX = area1sizeX - area3sizeX; 
          area2sizeL = area1sizeL - area3sizeL; 
          area2sizeC = area1sizeC - area3sizeC; 
          area2sizeD = area1sizeD - area3sizeD; 
          area2sizeM = area1sizeM - area3sizeM; 
      } 
      else if (area1size<area3size) {area2size = area3size - area1size;
          area2sizeI = area3sizeI - area1sizeI; 
          area2sizeV = area3sizeV - area1sizeV;
          area2sizeX = area3sizeX - area1sizeX; 
          area2sizeL = area3sizeL - area1sizeL; 
          area2sizeC = area3sizeC - area1sizeC; 
          area2sizeD = area3sizeD - area1sizeD; 
          area2sizeM = area3sizeM - area1sizeM; 
      }
      // Sollten die Variabeln area1size und area3size gleich gross sein, ergibt das 0. Diesen Schritt müsste man nicht zwingend machen. "
      else if (area1size==area3size) {area2size = 0;
          area2sizeI = 0; 
          area2sizeV = 0;
          area2sizeX = 0; 
          area2sizeL = 0; 
          area2sizeC = 0; 
          area2sizeD = 0; 
          area2sizeM = 0;}
    }
    
    
      
    // Ab hier passiert genau das gleiche wie in der linken und der rechten Spalte, nur mit den entsprechenden Variabeln und Pixelangaben. 
      //
      fill (0);
       textAlign(CENTER);
      text (area2size, 300, 385);
      // ANZEIGEN
      // // TAUSENDER
      area2sizeM = (area2size / 1000);
      if (area2sizeM<1) {area2sizeM = 0;}
      else if (area2sizeM>0) {
         for (int i = 1; i <= area2sizeM; i = i+1) {
          int xPos = ((200 / (area2sizeM + 1))*i)+200;
          fill(0);
          ellipse(xPos, 50, 20, 20);
         }
        area2size = area2size - (1000*area2sizeM);
      }
      // // FÜNFHUNDERTER
      if (roem==true) {
        area2sizeD = (area2size / 500);
      if (area2sizeD<1) {area2sizeD = 0;}
      else if (area2sizeD>0) {
         for (int i = 1; i <= area2sizeD; i = i+1) {
          int xPos = ((200 / (area2sizeD + 1))*i)+200;
          fill(0);
          ellipse(xPos, 100, 20, 20);
         }
        area2size = area2size - (500*area2sizeD);
      }
      }
      // // HUNDERTER
        area2sizeC = (area2size / 100);
      if (area2sizeC<1) {area2sizeC = 0;}
      else if (area2sizeC>0) {
         for (int i = 1; i <= area2sizeC; i = i+1) {
          int xPos = ((200 / (area2sizeC + 1))*i)+200;
          fill(0);
          ellipse(xPos, 150, 20, 20);
         }
        area2size = area2size - (100*area2sizeC);
      }
      // // FÜNFZIGER
        if (roem==true) {
        area2sizeL = (area2size / 50);
      if (area2sizeL<1) {area2sizeL = 0;}
      else if (area2sizeL>0) {
         for (int i = 1; i <= area2sizeL; i = i+1) {
          int xPos = ((200 / (area2sizeL + 1))*i)+200;
          fill(0);
          ellipse(xPos, 200, 20, 20);
         }
        area2size = area2size - (50*area2sizeL);
      }
        }
      // // ZEHNER
        area2sizeX = (area2size / 10);
      if (area2sizeX<1) {area2sizeX = 0;}
      else if (area2sizeX>0) {
         for (int i = 1; i <= area2sizeX; i = i+1) {
          int xPos = ((200 / (area2sizeX + 1))*i)+200;
          fill(0);
          ellipse(xPos, 250, 20, 20);
         }
        area2size = area2size - (10*area2sizeX);
      }
      // // FÜNFER
        if (roem==true) {
        area2sizeV = (area2size / 5);
      if (area2sizeV<1) {area2sizeV = 0;}
      else if (area2sizeV>0) {
         for (int i = 1; i <= area2sizeV; i = i+1) {
          int xPos = ((200 / (area2sizeV + 1))*i)+200;
          fill(0);
          ellipse(xPos, 300, 20, 20);
         }
        area2size = area2size - (5*area2sizeV);
      }
        }
      // // EINER
        area2sizeI = (area2size / 1);
      if (area2sizeI<1) {area2sizeI = 0;}
      else if (area2sizeI>0) {
         for (int i = 1; i <= area2sizeI; i = i+1) {
          int xPos = ((200 / (area2sizeI + 1))*i)+200;
          fill(0);
          ellipse(xPos, 350, 20, 20);
         }
      }
      
}
/////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //
  ////
  ////
  //// STANDORT BESTIMMEN UND DARSTELLEN
  ////
  ////
  //

// Ist die Steuerung mit der Tastatur nicht aktiviert, wird die Variable xCircle mit dem x-Standort der Maus versehen. 
  if (keys==false) {
    xCircle = mouseX; 
  }
 
  // Sollte sich der Fokus auserhalb der Arbeitsfläche befinden, wird nichts unternommen. 
  if (noarea==true) {}
  // Ansonsten kann eine Einheit oder ein Einheitenbündel dargestellt werden,...
   if (yCircle!=0) {
     // ..das aber nur in der linken und rechten Spalte des Rechenbrettes angezeigt wird. 
     if (area1==true || area3==true) {
            // Linien der Vorschaukreise wird definiert
            noStroke ();
               
            // Vorschau wird platziert. Sie wird je nach Steuerungsgerät (Tastatur oder Maus) verändert. 
            if (yCircle==50){
               if (keys==false) {
                 fill(sizeMfill, 200);
                 ellipse(xCircle, yCircle, 30, 30);
               }
                if (keys==true) {
                 fill(sizeMfill, 50); 
                 ellipse(xCircle, yCircle, 140, 75);
               }
            }
            
            /* Ist die indische Zählweise eingeschaltet, werden in den Zwischenräumen keine Vorschau platziert (jeweils
            bei yCircle = 100,200, oder 300). */
            if (roem==true)  {
              if (yCircle==100){
               if (keys==false) {
                 fill(sizeDfill, 200);
                 ellipse(xCircle, yCircle, 30, 30);
               }
                if (keys==true) {
                 fill(sizeDfill, 50); 
                 ellipse(xCircle, yCircle, 75, 75);
               }
            }
            }
            
                if (yCircle==150){
               if (keys==false) {
                 fill(sizeCfill, 200);
                 ellipse(xCircle, yCircle, 30, 30);
               }
                if (keys==true) {
                 fill(sizeCfill, 50); 
                 ellipse(xCircle, yCircle, 140, 75);
               }
            }
            
            if (roem==true)  {
                   if (yCircle==200){
                 if (keys==false) {
                   fill(sizeLfill, 200);
                   ellipse(xCircle, yCircle, 30, 30);
                 }
                  if (keys==true) {
                   fill(sizeLfill, 50); 
                   ellipse(xCircle, yCircle, 75, 75);
                 }
              }
            }
            
                 if (yCircle==250){
               if (keys==false) {
                 fill(sizeXfill, 200);
                 ellipse(xCircle, yCircle, 30, 30);
               }
                if (keys==true) {
                 fill(sizeXfill, 50); 
                 ellipse(xCircle, yCircle, 140, 75);
               }
            }
            
            if (roem==true)  {
                   if (yCircle==300){
                 if (keys==false) {
                   fill(sizeVfill, 200);
                   ellipse(xCircle, yCircle, 30, 30);
                 }
                  if (keys==true) {
                   fill(sizeVfill, 50); 
                   ellipse(xCircle, yCircle, 75, 75);
                 }
              }
            }
                   if (yCircle==350){
               if (keys==false) {
                 fill(sizeIfill, 200);
                 ellipse(xCircle, yCircle, 30, 30);
               }
                if (keys==true) {
                 fill(sizeIfill, 50); 
                 ellipse(xCircle, yCircle, 133, 85);
               }
            }
            }
   }

}

// //


  //
  ////
  ////
  //// STEUERUNG MIT DER MAUS
  ////
  ////
  //

void mouseClicked() {
  if (mouseButton == LEFT) {
    // Wurde der linke Mausbutton gedrückt, wird eine Einheit oder ein Einheitenbündel auf der entsprechenden Grösse abgelegt. 
    
    // Ist die römische Zählweise eingeschaltet, werden alle Grössen berücksichtigt. 
    if (roem==true) {
    // Zuerst die linke Brettspalte ...
    if (area1==true) {
    if (yCircle==0) {return;}
    /* Mit der "oder"-Abfrage wird verhindert, dass nicht mehr Einheiten oder Einheitenbündel aufgenommen werden, als beabsichtigt. 
    Es muss Platz frei sein, um eine Einheiten oder ein Einheitenbündel abzulegen. */
    if (yCircle==50) {if (area1sizeM<4) {area1size=area1size+1000;}}
    if (yCircle==100) {if (area1sizeM<4 || area1sizeD<1) {area1size=area1size+500;}}
    if (yCircle==150) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4) {area1size=area1size+100;}}
    if (yCircle==200) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4 || area1sizeL<1) {area1size=area1size+50;}}
    if (yCircle==250) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4 || area1sizeL<1 || area1sizeX<4) {area1size=area1size+10;}}
    if (yCircle==300) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4 || area1sizeL<1 || area1sizeX<4 || area1sizeV<1) {area1size=area1size+5;}}
    if (yCircle==350) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4 || area1sizeL<1 || area1sizeX<4 || area1sizeV<1 || area1sizeI<4) {area1size=area1size+1;}}
    }
    // ... dann die rechte. 
    if (area3==true) {
    if (yCircle==0) {return;}
    if (yCircle==50) {if (area3sizeM<4) {area3size=area3size+1000;}}
    if (yCircle==100) {if (area3sizeM<4 || area3sizeD<1) {area3size=area3size+500;}}
    if (yCircle==150) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4) {area3size=area3size+100;}}
    if (yCircle==200) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4 || area3sizeL<1) {area3size=area3size+50;}}
    if (yCircle==250) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4 || area3sizeL<1 ||area3sizeX<4) {area3size=area3size+10;}}
    if (yCircle==300) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4 || area3sizeL<1 ||area3sizeX<4 || area3sizeV<1) {area3size=area3size+5;}}
    if (yCircle==350) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4 || area3sizeL<1 ||area3sizeX<4 || area3sizeV<1 || area3sizeI<4) {area3size=area3size+1;}}
      }
  }
  
    // Ist allerdings die indische Zählweise eingeschaltet, werden nur die Grössen 1, 10, 100 und 1000 berücksichtigt. 
    if (roem==false) {
    // Es folgt eine ähnliche Prozedur wie bei der römischen Zählweise. 
    // linke Brettspalte
    if (area1==true) {
    if (yCircle==0) {return;}
    if (yCircle==50) {if (area1sizeM<4) {area1size=area1size+1000;}}
    if (yCircle==150) {if (area1sizeM<4 || area1sizeC<9) {area1size=area1size+100;}}
    if (yCircle==250) {if (area1sizeM<4 || area1sizeC<9 || area1sizeX<9) {area1size=area1size+10;}}
    if (yCircle==350) {if (area1sizeM<4 || area1sizeC<9 || area1sizeX<9 || area1sizeI<9) {area1size=area1size+1;}}
    }
    //
    // rechte Brettspalte
    if (area3==true) {
    if (yCircle==0) {return;}
    if (yCircle==50) {if (area3sizeM<4) {area3size=area3size+1000;}}
    if (yCircle==150) {if (area3sizeM<4 || area3sizeC<9) {area3size=area3size+100;}}
    if (yCircle==250) {if (area3sizeM<4 || area3sizeC<9 || area3sizeX<9) {area3size=area3size+10;}}
    if (yCircle==350) {if (area3sizeM<4 || area3sizeC<9 || area3sizeX<9 || area3sizeI<9) {area3size=area3size+1;}}
      }
  }
  }


    // Wurde der rechte Mausbutton gedrückt, wird eine Einheit oder ein Einheitenbündel auf der entsprechenden Grösse abgezogen. 
  if (mouseButton == RIGHT) {
    // nichts ändert sich, wenn die Maus nicht in einem bestimmten Bereich ist
  if (yCircle==0) {return;}
          // AREA 1
    if (area1==true) {
      // im Bereich wird ein Item gelöscht und abgefragt, das Minuszählen wird per Abfrage unterbunden
    if (yCircle==50) {if (area1size>=1000) {area1size=area1size-1000;}}
    if (roem==true) {if (yCircle==100) {if (area1size>=500) {area1size=area1size-500;}}}
    if (yCircle==150) {if (area1size>=100) {area1size=area1size-100;}}
    if (roem==true) {if (yCircle==200) {if (area1size>=50) {area1size=area1size-50;}}}
    if (yCircle==250) {if (area1size>=10) {area1size=area1size-10;}}
    if (roem==true) {if (yCircle==300) {if (area1size>=5) {area1size=area1size-5;}}}
    if (yCircle==350) {if (area1size>=1) {area1size=area1size-1;}}
    }
          // AREA 3
    if (area3==true) {
      // im Bereich wird ein Item gelöscht und abgefragt, das Minuszählen wird per Abfrage unterbunden
    if (yCircle==50) {if (area3size>=1000) {area3size=area3size-1000;}}
    if (roem==true) {if (yCircle==100) {if (area3size>=500) {area3size=area3size-500;}}}
    if (yCircle==150) {if (area3size>=100) {area3size=area3size-100;}}
    if (roem==true) {if (yCircle==200) {if (area3size>=50) {area3size=area3size-50;}}}
    if (yCircle==250) {if (area3size>=10) {area3size=area3size-10;}}
    if (roem==true) {if (yCircle==300) {if (area3size>=5) {area3size=area3size-5;}}}
    if (yCircle==350) {if (area3size>=1) {area3size=area3size-1;}}
    }
  
  //
   
}}

// KEY PRESSING


void keyPressed() {

  // Wenn die Control-Taste gedrückt wurde, wird die Variable angesprochen, die das Eingeben von Zahlen ermöglicht. 
  if (keyCode == CONTROL) {if (insertnr==false) {insertnr = true;} else if (insertnr==true) {insertnr = false; typedkeys=0; typednr=0;} }
  //
  // Es sollen nur 4 Zahlen eingegeben werden können. Das wird per Abfrage der Variable typedkeys unterbunden. Ausserdem darf die Zahl nicht grösser als 4999 sein. 
  if (key=='0' && insertnr == true) {if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}
  if (key=='1' && insertnr == true) {if (typedkeys==0) {typedkeys=typedkeys+1; typednr=1; areasizeProv=typednr;} else if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typednr=typednr+1; areasizeProv=typednr; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; typednr=typednr+1; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}
  if (key=='2' && insertnr == true) {if (typedkeys==0) {typedkeys=typedkeys+1; typednr=2; areasizeProv=typednr;} else if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typednr=typednr+2; areasizeProv=typednr; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; typednr=typednr+2; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}
  if (key=='3' && insertnr == true) {if (typedkeys==0) {typedkeys=typedkeys+1; typednr=3; areasizeProv=typednr;} else if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typednr=typednr+3; areasizeProv=typednr; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; typednr=typednr+3; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}
  if (key=='4' && insertnr == true) {if (typedkeys==0) {typedkeys=typedkeys+1; typednr=4; areasizeProv=typednr;} else if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typednr=typednr+4; areasizeProv=typednr; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; typednr=typednr+4; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}
  if (key=='5' && insertnr == true) {if (typedkeys==0) {typedkeys=typedkeys+1; typednr=5; areasizeProv=typednr;} else if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typednr=typednr+5; areasizeProv=typednr; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; typednr=typednr+5; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}
  if (key=='6' && insertnr == true) {if (typedkeys==0) {typedkeys=typedkeys+1; typednr=6; areasizeProv=typednr;} else if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typednr=typednr+6; areasizeProv=typednr; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; typednr=typednr+6; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}
  if (key=='7' && insertnr == true) {if (typedkeys==0) {typedkeys=typedkeys+1; typednr=7; areasizeProv=typednr;} else if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typednr=typednr+7; areasizeProv=typednr; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; typednr=typednr+7; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}
  if (key=='8' && insertnr == true) {if (typedkeys==0) {typedkeys=typedkeys+1; typednr=8; areasizeProv=typednr;} else if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typednr=typednr+8; areasizeProv=typednr; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; typednr=typednr+8; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}
  if (key=='9' && insertnr == true) {if (typedkeys==0) {typedkeys=typedkeys+1; typednr=9; areasizeProv=typednr;} else if (typedkeys>0 && typedkeys<3) {typednr=typednr*10; typednr=typednr+9; areasizeProv=typednr; typedkeys=typedkeys+1;} else if (typedkeys==3) {typednr=typednr*10; typednr=typednr+9; areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000 && areasizeProv>=0) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000 && areasizeProv>=0) {area3size=areasizeProv;}} }}


  
       
  // // ROEMISCH // //
  if (key == 'r') {roem = true;}
  if (key == 'i') {roem = false;}
  
  // Beim geichzeiten Drücken der Ctrl/Strg - Taste und einer Zahl, werden werden die entsprechenden Zahlen eingegeben.
  // Beim Drücken der Taste "a" wird Addieren gewählt.
  if (key == 'a')
  {addition=true;}
  // Beim Drücken der Taste "s" wird Subtrahieren gewählt.
  if (key == 's')
  {addition=false;}
  
  
  if (keyCode == DOWN) {
   // Falls eine ENTSPRECHENDE Taste gedrückt wird, soll die Variable "keys" eingeschaltet werden, um ein Setzen mit der Tastatur zu ermöglichen. 
   // Dieser Modus wird erst eingeschaltet, wenn eine der Pfeiltasten (DOWN, UP, LEFT, RIGHT) gedrückt wird. 
    keys = true;
      if (area1==false && area3==false) {area1=true;}
      if (area2==true) {xCircle = 118;}
      if (area1==true || area2==true) {xCircle = 118;}
      else if (area3==true) {xCircle = 483;}
      if (yCircle<350 && yCircle!=0) { if (roem==true) {yCircle = yCircle+50;} else if (roem==false) {yCircle = yCircle+100;}
      if (yCircle==0) {yCircle = 50; xCircle = 118;}
      }
  }
    
  if (keyCode == UP) {
    keys = true;
      if (area1==false && area3==false) {area1=true;}
      if (area1==true || area2==true) {xCircle = 118;}
      else if (area3==true) {xCircle = 483;}
      if (yCircle>50) { if (roem==true) {yCircle = yCircle-50;} else if (roem==false) {yCircle = yCircle-100;} }
      if (yCircle==0) {yCircle = 350; xCircle = 118;}
      }
     
     
  if (keyCode == LEFT) {
    keys = true;
    xCircle = 118;
    if (yCircle==0) {yCircle = 350;}
    area1= true;
    area2= false;
    area3= false;
  } 
  if (keyCode == RIGHT) {
    keys = true;
    xCircle = 483;
    if (yCircle==0) {yCircle = 350;}
    area1= false;
    area2= false;
    area3= true;
  } 


  if (keyCode == ENTER) {
    //////////  //ROEMISCH//
   if (insertnr == true) {
   areasizeProv=typednr; typednr=0; typedkeys=0; insertnr=false; if (area1==true || area2==true || noarea==true) {if (areasizeProv<5000) {area1size=areasizeProv;}} else if (area3==true) {if (areasizeProv<5000) {area3size=areasizeProv;}} } 
   else if (insertnr == false) {
    if (roem==true) {
          // AREA 1
    if (area1==true) {
    if (yCircle==0) {return;}
    if (yCircle==50) {if (area1sizeM<4) {area1size=area1size+1000;}}
    if (yCircle==100) {if (area1sizeM<4 || area1sizeD<1) {area1size=area1size+500;}}
    if (yCircle==150) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4) {area1size=area1size+100;}}
    if (yCircle==200) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4 || area1sizeL<1) {area1size=area1size+50;}}
    if (yCircle==250) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4 || area1sizeL<1 ||area1sizeX<4) {area1size=area1size+10;}}
    if (yCircle==300) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4 || area1sizeL<1 ||area1sizeX<4 || area1sizeV<1) {area1size=area1size+5;}}
    if (yCircle==350) {if (area1sizeM<4 || area1sizeD<1 || area1sizeC<4 || area1sizeL<1 ||area1sizeX<4 || area1sizeV<1 || area1sizeI<4) {area1size=area1size+1;}}
    }
    //
        // AREA 3
    if (area3==true) {
    if (yCircle==0) {return;}
    if (yCircle==50) {if (area3sizeM<4) {area3size=area3size+1000;}}
    if (yCircle==100) {if (area3sizeM<4 || area3sizeD<1) {area3size=area3size+500;}}
    if (yCircle==150) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4) {area3size=area3size+100;}}
    if (yCircle==200) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4 || area3sizeL<1) {area3size=area3size+50;}}
    if (yCircle==250) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4 || area3sizeL<1 ||area3sizeX<4) {area3size=area3size+10;}}
    if (yCircle==300) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4 || area3sizeL<1 ||area3sizeX<4 || area3sizeV<1) {area3size=area3size+5;}}
    if (yCircle==350) {if (area3sizeM<4 || area3sizeD<1 || area3sizeC<4 || area3sizeL<1 ||area3sizeX<4 || area3sizeV<1 || area3sizeI<4) {area3size=area3size+1;}}
      }
    
  }
  
      //////////  //INDISCH//
    if (roem==false) {
          // AREA 1
    if (area1==true) {
    if (yCircle==0) {return;}
    if (yCircle==50) {if (area1sizeM<4) {area1size=area1size+1000;}}
    if (yCircle==150) {if (area1sizeM<4 || area1sizeC<9) {area1size=area1size+100;}}
    if (yCircle==250) {if (area1sizeM<4 || area1sizeC<9 || area1sizeX<9) {area1size=area1size+10;}}
    if (yCircle==350) {if (area1sizeM<4 || area1sizeC<4 || area1sizeX<9 || area1sizeI<9) {area1size=area1size+1;}}
    }
    //
        // AREA 3
    if (area3==true) {
    if (yCircle==0) {return;}
    if (yCircle==50) {if (area3sizeM<4) {area3size=area3size+1000;}}
    if (yCircle==150) {if (area3sizeM<4 || area3sizeC<9) {area3size=area3size+100;}}
    if (yCircle==250) {if (area3sizeM<4 || area3sizeC<9 || area3sizeX<9) {area3size=area3size+10;}}
    if (yCircle==350) {if (area3sizeM<4 || area3sizeC<4 || area3sizeX<9 || area3sizeI<9) {area3size=area3size+1;}}
      }
    }
   }
  }
   
      if (keyCode == BACKSPACE || keyCode == DELETE) {


    // nichts ändert sich, wenn die Vorschau nicht in einem bestimmten Bereich ist
  if (yCircle==0) {return;}
// AREA 1
    if (area1==true) {
      // im Bereich wird ein Item gelöscht und abgefragt, das Minuszählen wird per Abfrage unterbunden
    if (yCircle==50) {if (area1size>=1000) {area1size=area1size-1000;}}
    if (roem==true) {if (yCircle==100) {if (area1size>=500) {area1size=area1size-500;}}}
    if (yCircle==150) {if (area1size>=100) {area1size=area1size-100;}}
    if (roem==true) {if (yCircle==200) {if (area1size>=50) {area1size=area1size-50;}}}
    if (yCircle==250) {if (area1size>=10) {area1size=area1size-10;}}
    if (roem==true) {if (yCircle==300) {if (area1size>=5) {area1size=area1size-5;}}}
    if (yCircle==350) {if (area1size>=1) {area1size=area1size-1;}}
    }
          // AREA 3
    if (area3==true) {
      // im Bereich wird ein Item gelöscht und abgefragt, das Minuszählen wird per Abfrage unterbunden
    if (yCircle==50) {if (area3size>=1000) {area3size=area3size-1000;}}
    if (roem==true) {if (yCircle==100) {if (area3size>=500) {area3size=area3size-500;}}}
    if (yCircle==150) {if (area3size>=100) {area3size=area3size-100;}}
    if (roem==true) {if (yCircle==200) {if (area3size>=50) {area3size=area3size-50;}}}
    if (yCircle==250) {if (area3size>=10) {area3size=area3size-10;}}
    if (roem==true) {if (yCircle==300) {if (area3size>=5) {area3size=area3size-5;}}}
    if (yCircle==350) {if (area3size>=1) {area3size=area3size-1;}}
    }
      }
}
    //
   
   // Falls die Maus bewegt wird, soll die Variable "keys" ausgeschaltet werden, um ein Setzen mit der Maus zu ermöglichen. 
   void mouseMoved() {
  keys=false;
  typednr=0;
  typedkeys=0;
  insertnr=false;
  }
  
  
  int kreisgroesseintro = 20;
  void intro () {
    background(0);
        noStroke(); 
    fill(255);
    ellipse(width/2, height/2, kreisgroesseintro, kreisgroesseintro);
// =================================
  // GRÖSSENLINIEN

for (int i = 1; i < 8; i = i+2) {
  for (int k = 0; k < 3; k = k+1) {
    stroke(0);
    line (35, (50*i)+k, 565, (50*i)+k);
  }
}

  //ABGRENZUNGSLINIEN (Hier habe ich einfachheitshalber auf die for-Schleife verzichtet.)
  
  // LINIE 1 (Abgrenzung linke Brettspalte <> mittlere Brettspalte)
  stroke (0);
  line (198, 30, 198, 370);
  stroke (0);
  line (199, 30, 199, 370);
  stroke (0);
  line (200, 30, 200, 370);
  stroke (0);
  line (201, 30, 201, 370);
  stroke (0);
  line (202, 30, 202, 370);
  // LINIE 2 (Abgrenzung mittlere Brettspalte <> rechte Brettspalte)
  stroke (0);
  line (398, 30, 398, 370);
  stroke (0);
  line (399, 30, 399, 370);
  stroke (0);
  line (400, 30, 400, 370);
  stroke (0);
  line (401, 30, 401, 370);
  stroke (0);
  line (402, 30, 402, 370);


  //TAUSENDERKREUZ
  stroke (0);
  line (288, 38, 310, 62);
  stroke (0);
  line (289, 38, 311, 62);
  stroke (0);
  line (290, 38, 312, 62);
  stroke (0);
  line (291, 38, 313, 62);
  stroke (0);
  line (292, 38, 314, 62);
  stroke (0);
  line (310, 38, 288, 62);
  stroke (0);
  line (311, 38, 289, 62);
  stroke (0);
  line (312, 38, 290, 62);
  stroke (0);
  line (313, 38, 291, 62);
  stroke (0);
  line (314, 38, 292, 62);
  
  // Die Linien sollen auch Beschriftet werden, damit dem Benutzer das Areiten erleichtert wird. 
  
    //BESCHRIFTUNG
  fill(0);
  textAlign(RIGHT);
  text("M", 25, 55);
  text("C", 25, 155);
  text("X", 25, 255);
  text("I", 25, 355);
  
  textAlign(LEFT);
  text("D", 570, 105);
  text("L", 570, 205);
  text("V", 570, 305);
  
        textAlign(CENTER);
      fill(0);
      text ("römisches Rechenbrett mit automatischer Addition", 300, 20);
// =================================
    fill(0, 1);
    rect(0,0,width,height);
    kreisgroesseintro = kreisgroesseintro + 3;
    
        textAlign(CENTER);
    fill (0); text (area1size, 117.5, 385);
    text (area2size, 300, 385);
    text (area3size, 482.5, 385);
  }

