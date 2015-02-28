
PShape welt;
PShape sh;

float counter;

PImage start;
PImage colmap;
PImage eule;
PImage faehnchen;
PImage blase;

PFont font;
PFont fontHead;

color col;

int step = 0;

String[] buttonstring= {

  //suedamerika
  "panama", "equador", "venezuela", "peru", "kolumbien", 
  "chile", "guyana", "bolivien", "suriname", "argentinien", 
  "paraguay", "franzguayana", "uruguay", "brasilien",

   //nordamrika
 "kanada","groenland", "usa", "mexico", "guatemala", "belize",
   "honduras", "elsalvador", "nicaragua", "costarica","cuba",
   "bahamas", "jamaica", "haiti","domrepublic","stkittsandnevis",
   "grenada", "trinidadandtobago", "stvincentandthegrenadines", "stlucia", "antiguaandbarbuda",
   "dominica", "barbados",
   
   //afrika
    "aegypten", "algerien", "angola", "aequatorialguinea", "aethiopien", "benin", "botswana",
    "burkinafaso", "burundi", "dschibul", "elfenbeinkueste", "eritrea", "gabun", "gambia",
    "ghana", "guinea", "guineabissau", "kamerun", "kapverde", "kenia", "komoren", "kongodemorepublik", 
    "kongorepublik","lesoto", "liberia", "lybien", "madagaskar", "malawi", "mali", "marokko", "mauretanien", 
    "mauritius", "mosambik", "namibia", "niger", "nigeria", "ruanda", "sambia", "saotomeundprinicpa", "senegal", 
    "seychellen", "sierraleone", "simbabwe", "somalia", "suedafrika", "sudan", "swasiland", "tansania", 
    "togo", "tschad", "tunesien", "uganda", "westsabara", "zentralfrikanischerep",
   //farbe von algerien liegt auch auf den kapverden
   
   //europa
    "belgien", "bulgarien", "daenemark", "deutschland", "estland", "finnland", "frankreich", 
    "griechenland", "irland", "italien", "lettland", "litauen", "luxemburg", "malta", "niederlande", 
    "oesterreich", "polen", "portugal", "rumaenien", "schweden", "slowakei", "slowenien", "spanien", 
    "tschechien", "ungarn", "gb", "albanien", "bosnienundherzegowina", "island",
    "kroatien", "liechtenstein", "mazedonien", "moldawien", "montenegro", "norwegen", 
    "schweiz", "serbien", "ukraine", "weißrussland",
     
     
     /* "kasachstan",/*"russland",*/ /*"san marino",*//*, "tuerkei",*//*, "georgien",
     "aserbaidschan"/*, "kosovo", "transnistrien", liechtenstein und griechenladn selbe farbe */
    
    //zypern gleich türkei! armenien fehlt, azerbaidjan und georgien selbe farbe
    
    //australien
     "australien", "fidschi", "nauru", "neuseeland", "palau", "papuaneuguinea",
     "salomonen", "tonga", "vanuatu",
     
      // cookinseln, kiribati, marshallinseln mikronesien, "tuvalu" 
     
    //asien
    "afghanistan", "armenien", "aserbaidschan", "bahrain", "bangladesch", 
     "brunei", "buthan", "china", "georgien", "indien",
     "indonesien", "irak", "iran", "israel", "japan",
     "jemen", "jordanien", "kambodscha", "kasachstan", "katar",
     "kirgisistan", "kuwait", "lans", "libanon", "malaysia", "malediven",
     "mongolei", "myanmar", "nepal", "nordkorea", "oman",
     "osttimor", "pakistan", "phillippinen", "russland", "saudiarabien",
     "srilanka", "suedkorea", "syrien", "tadschikistan", "taiwan",
     "thailand", "tuerkei", "turkmenistan", "usbekistan", "vereinigtearabischeemirate",
     "vietnam"
     
     
     
}; //the names of the buttons
    

color[] buttoncolor= {

  //suedamerika
  1933157273, 1932764057, 1933026201, 1932698521, 1933091737, 
  1932370841, 1932960665, 1932567449, 1932895129, 1932436377, 
  1932501913, 1932829593, 1932305305, 1932632985,

  //nordamerika
   1929510892,1930559468, 1929576428, 1929641964,1929707500, 1929773036,
   1929838572, 1929904108, 1929969644, 1930035180, 1930166252,
   1443561452, 1930231788, 1929445356, 1930297324, 1444282348,
   1443889132, 1443823596, 487653356, 487784428, 1444216812,
   379650303, 974258156,
   
   //afrika
   1946141236, 1946141254, 1946141247, 989839934, 1946141225, 1946141264, 1946141228,
   1946141265, 1946141230, 1946141226, 1946141258, 1946141242, 1946141252, 1342161487, 
   1946141267, 1946141261, 1946141255, 1946141250, 989839942, 1946141241, 1946141221, 1946141229,
   1946141249, 1946141227, 1946141260, 1946141245, 1946141220, 1946141237, 1946141268, 1946141257, 1946141259,
   738181666, 1946141240, 1946141244, 1946141251, 1946141253, 1946141231, 1946141234, 503300647, 1946141256 ,
   1946141219, 1946141263, 1946141233, 1946141224, 1946141232, 1946141238, 1946141222, 1946141239, 
   1946141266, 1946141248, 1946141217, 1946141235, 1946141262, 1946141243,
   
   //europa
   1939933951, 1939940351, 1939933439, 1939932415, 1939934975, 1939935999, 1939931647,
   1939936767, 1939933183, 1939932671, 1939935231, 1939935487, 1453393151, 1453398527, 1939933695,
   1939931903, 1939934719, 1939937023, 1939940607, 1939936511, 1939939071, 1939938047, 1939937279,
   1939934463, 1939939327, 1939932927, 1939938815, 1939938559, 1939931391,
   1939938303, 1939936767, 1939940095, 1939940863, 1570840831, 1939941375, 
   1939932159, 1939939839, 1939935743, 1939941119,
   
   //Ozeanien
   1929406463, 1694524415, 1442865663, 1929406719, 1560304639, 1929406207,
   1929405695, 1442866175, 1929405951,
   
   //Asien
   1946091544, 1946091537, 1946091538, 1107231241, 1946091551,
   1526661157, 1946091550, 1946091566, 1946091536, 1946091548,
   1946091559, 1946091530, 1946091539, 1946091531, 1946091563,
   1946093065, 1946091533, 1946091555, 1946091569, 1946092297,
   1946091542, 1946091785, 1946091554, 1946091532, 1946091558,1459552282,
   1946091567, 1946091552, 1946091549, 1946091565, 1946092809,
   1946091560, 1946091545, 1946091561, 1946091570, 1946091529,
   1946091547, 1946091564, 1946091534, 1946091543, 1946091562,
   1946091553, 1946091535, 1946091540, 1946091541, 1946092553,
   1946091556
   
   //kirgistan, kuwait
   
   
}; //the colors of the buttons

String[] myText;

void setup() {
  size(1300, 750);  

 

  welt = loadShape("world-map_back_03.svg");
  colmap = loadImage("world-map_back_03.png");
  start = loadImage("start.png");
  eule = loadImage("Uhu_2gross.png");
  faehnchen = loadImage("fähnchen.png");
  blase = loadImage("blase.png");

  smooth();  // Improves the drawing quality of the SVG


  myText = loadStrings ("text.txt");
  font = loadFont("MyriadPro-Regular-48.vlw");
  fontHead = loadFont("NeedleworkGood-48.vlw");
  
  //counter = 0.0;
  noCursor();
}


/*void mouseReleased(){
 if (welt.contains(mouseX,mouseY)) {
 welt.setEnlarged(true);
 }
 }*/



void draw() {
  if (step == 0) {
    //println("intro");
    image(start, 0, 0);
    
    textFont(fontHead);
    textSize(20);
    fill(255,0,174);
    text("Klick mich!",mouseX, mouseY);
    
    
    textFont(font);
    textSize(12);
    fill(0);
    text("Winnie Mahrin  Marlene Sattler  Kai-Marie Schimanski | Processing  Steffen Klaue  HTW Berlin  SS 2012", 730,730);
    

   /* counter++;
    translate(width/8,height/8);
    rotate(counter*TWO_PI/180);
    translate(-eule.width/2,-eule.height/2);*/
    
    
    image(eule, 790, 450, 161, 190);
    
    
  }

  if (step == 1) {
    background(255);

    textFont(fontHead);
    textSize(25);
    fill(50);
    text("Die Welt der Besserwisser", 450, 65);


    // Get color for interaction
    col = colmap.get(mouseX, mouseY);
    image(colmap, 0, 0);


    for (int i=0;i<buttonstring.length;++i) {
      if (col == buttoncolor[i]) {
        sh = welt.getChild(buttonstring[i]);
        // Disable the colors found in the SVG file

        // Set our own coloring
       // fill(165);
        noStroke();
        // Draw a single state
        shape(sh, 0, 0); // Go Blue!

        

        textFont(font);
        textSize(13);
        textLeading(16);
        fill(0);

        image(blase, 30, 420, 255, 300);
        image(eule, 283, 610, 65, 75);
        fill(0);
        text(myText[i], 55, 440, 160, 300);
        
      }
    }

        image(faehnchen,mouseX-3, mouseY-47,30,50);
    /*  pushMatrix();
     if(welt.isEnlarged()) {
     scale(10);
     }
     welt.draw();
     popMatrix();
     */
  }

  //fill();
  
 

}




void mousePressed() {
  step = 1; 
  println(col);
}


