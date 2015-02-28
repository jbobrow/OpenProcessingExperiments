
PFont myFont;

void setup(){
 size(700, 400);
 //Fonten kan skabes på 2 maader. Enter 'laver' du en font via 'tools' -> create font og goer foelgende:
 //Metode 1
 //myFont = loadFont("Her skriver du navnet paa font filen du har gemt i din data mappe");
 
 //Ellers kan du skabe din font i koden. Denne maede virker kun hvis programmet ikke skal sendes til andre og   //koeres på deres computer:
 //Metode 2
 myFont = createFont("Georgia", 16);
}

void draw(){
  //Farven teksten bliver skrevet med
  fill(155, 0, 200);
  //Metoden 'text()' tager den streng der skal vises paa skaermen og x & y koordinaterne for teksten.
  //Koordinaterne er på tekstens nederste venstre hjoerne, hvilket betyder at y-vaerdien skal vaere 
  //stoerre end 0
  text("teksten der bliver vist", 20, 20);
}
