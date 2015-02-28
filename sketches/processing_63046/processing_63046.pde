
//The {PIMP} GENERATOR has been created using open source technologies and is available for use as desired.
// Enjoy!!

//Each string contains words which begin with the letter declared as the string name.
String[] P = {
  "ORTABLE","ROJECTIVE","OLICE","ASSIVE","ILLS","ROGRESSIVE","IECE","LACE","OTENTIAL","ROMOTER","ULSE","ERPETUATOR","RETENDED","LANNER","ROPAGANDA","RACTIONER","ICTURE","RINCIPLE","OSITION","ERFORMANCE","RINT","ETE","OPULLATION","OLLUTION","EOPLE","PRESENTATION","ROJECTION","ROJECTION","ROJECT","ROCEDURE","LATFORM","RACTICE","ARTICIPATION","ROPOSAL","LAY","HILANTHROPY","ROMOTION","RIMARY","LASTIC","OLLANATION","ROTOTYPE","RETORIAN","RE","RO","OST","OLYMATH","OLY","LOT","HOTOGRAPHY","OLYPHONIC","HONOGRAPHIC"
};
String[] P1 = {
  "ORTABLE","ROJECTIVE","OLICE","ASSIVE","ILLS","ROGRESSIVE","IECE","LACE","OTENTIAL","ROMOTER","ULSE","ERPETUATOR","RETENDED","LANNER","ROPAGANDA","RACTIONER","ICTURE","RINCIPLE","OSITION","ERFORMANCE","RINT","ETE","OPULLATION","OLLUTION","EOPLE","PRESENTATION","ROJECTION","ROJECTION","ROJECT","ROCEDURE","LATFORM","RACTICE","ARTICIPATION","ROPOSAL","LAY","HILANTHROPY","ROMOTION","RIMARY","LASTIC","OLLANATION","ROTOTYPE","RETORIAN","OLYMATH","OLY","LOT","HOTOGRAPHY","OLYPHONIC","HONOGRAPHIC"
};
String[] I = {
  "MAGE","MAGINED","NSTIGATOR","NITIATED","NTERACTION","NVENTION","NTERPRETATION","NVOLVED","NTERDISCIPLINARY","NSTIGATED","NFERED","MBUED","TERATIVE","NTEGRATED","NTERNAL","NFORMED","NTELIGENT","CON","MPERATIVE","MPERIAL","NTEGER","MMATERIAL"
};
String[] M = {
"ANIFESTO","ANIFESTATION","ACHINE","OVEMENT","ICRO","ACRO","ATERIAL","ATRIX","ASTICATION","EMORY","IX","USICAL","IXOLOGIST","EANING","ISSION","OTION","IMICRY","IND","ENTAL","OSAIC","URAL","OUNTED"
};

PFont myFont;
PFont myFont2;
String vertP;
String vertI;
String vertM;
String vertP2;
int numP = 50; // assigns the size of the array for random generator
int numP1 = 47; // assigns the size of the array for random generator
int numI = 22;
int numM = 22;
int posP;
int state = 0;


void setup() {
  size(400, 700);  //Applet size
  String[] fontList = PFont.list();
  println(fontList);

  myFont = createFont("Times New Roman", 80, true); //use createFont when generating multiple point sized fonts
  myFont2 = createFont("Times New Roman Italic", 20, true); //use createFont when generating multiple point sized fonts  
  smooth(); //increase anti-aliasing
}

void draw() {
  background(255); //white background
  fill(0); //text fill black
  textFont(myFont, 80); //header font size 80 point
  textAlign(CENTER);  //text aligned to centre
  text("{PIMP}", width/2, height/2-200);  //Header text {PIMP}
  if (mousePressed) { //condition on mouse pressed
  //Pull a random word from the arrays.
    vertP = P[int(random(0, numP))]; //168
    vertI = I[int(random(0, numI))]; //55
    vertM = M[int(random(0, numM))]; //147
    vertP2 =P1[int(random(0, numP1))]; //168
    state = 1; // prevents any words to appear until after the first mouse press is detected
  }
  if (state == 1) {
    background(255);    
    textFont(myFont, 80);
    textAlign(CENTER);
    text("{PIMP}", width/2, height/2-200);
    textFont(myFont2, 20);
    for (int i = 1; i <= vertP.length(); i++) {                  //draws text vertically on to screen by identifying the word length and then drawing each letter before move to a new line
      text(vertP.substring(i-1, i), width/2-85, 150 + i *30);
    }
    for (int i = 1; i <= vertI.length(); i++) {
      text(vertI.substring(i-1, i), width/2-40, 150 + i *30);
    }
    for (int i = 1; i <= vertM.length(); i++) {
      text(vertM.substring(i-1, i), width/2+10, 150 + i *30);
    }
    for (int i = 1; i <= vertP2.length(); i++) {
      text(vertP2.substring(i-1, i), width/2+60, 150 + i *30);
    }
  }
  delay(50);
}


