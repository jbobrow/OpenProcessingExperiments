
// game of life testing 
// strongly inspired by https://www.processing.org/examples/gameoflife.html
// and https://de.wikipedia.org/wiki/Conways_Spiel_des_Lebens

//userdefined variables
int zellSize = 8; // cell size
int zelleLebtInit = 15;// init cell lives percentage
int tick = 24; //alle soundsoviele frames soll eine iteration berechnet werden
boolean wrap = true; // wrap on border?

//Neighbor rules: the classical Conway-world is  23/3, e.g. copyworld is 1357/1357.
int[] regelLife = {
  //2, 4, 5
  2, 3
    //1,3,5,7
};
int [] regelBirth = {
  3
    //1,3,5,7
};

//do not change!
int [][] zellen;
int [][] zellenTmp;
color lebt = color(random(255), 100, 0);
color tot  = color (0);
int count  = 0;
boolean pause = false;


void setup() {
  size (600, 600);
  background (0);
  stroke(48);
  noSmooth();

  //init, muss vorher bekann sein wie viele elemente im array sein sollen!
  zellen    = new int[width/zellSize][height/zellSize];
  zellenTmp = new int[width/zellSize][height/zellSize];
  noSmooth();
  initZellen();
}

void draw() {
  if (frameCount % tick == 0 ) {
    println("Generation: "+count);
    count++;
    //nur hier soll dann neu berechnet werden
    iteration();
  }
  //schauen, was wir im zellen array haben und danach dann zeichnen
  for (int x = 0; x<width/zellSize; x++) {
    for (int y = 0; y<height/zellSize; y++) {
      if (zellen[x][y]==1) 
        fill(lebt);
      else 
        fill(tot);

      //was füllen wir...
      rect(x*zellSize, y*zellSize, zellSize, zellSize);
    }//end y loop
  }//end x loop
}

void initZellen() {
  // random mit der zelleLebtInit-Lebewahrscheinlichkeit Zellen initialisieren
  for (int x = 0; x<width/zellSize; x++) {
    for (int y = 0; y<height/zellSize; y++) {
      float zustand = random (100);

      if (zustand > zelleLebtInit) zustand = 0;
      else                         zustand = 1;

      zellen[x][y]=int(zustand);
    }//end y loop
  }//end x loop
  background(0);
  count = 0;
}

void clearZellen() {
  // alle zellen auf 0 setzen
  for (int x = 0; x<width/zellSize; x++) {
    for (int y = 0; y<height/zellSize; y++) {
      zellen[x][y]= 0;
    }//end y loop
  }//end x loop
  count = 0;
}



void iteration() {
  //hier soll berechnet werden, ob eine zelle am leben bleibt oder nicht
  //zuerst sichern in 2tes array
  for (int x = 0; x<width/zellSize; x++) {
    for (int y = 0; y<height/zellSize; y++) {
      zellenTmp[x][y]= zellen[x][y];
    }//end y loop
  }//end x loop

  //alle nachbarn abklappern
  for (int x = 0; x<width/zellSize; x++) {
    for (int y = 0; y<height/zellSize; y++) {
      //für die aktuelle Zelle schauen wir in jeden nachbarn an, ob er da ist
      int nachbar = 0;
      //nachbarn sind die 8 angrenzenden felder
      //vorsicht am rand!
      //vorgehensweise: x-1 und y-1 ist schräg links, dann gehen wir eins weiter runter (y), und noch eins, dann springen wir eins weiter nach rechts (x)
      for (int xi = x-1; xi <= x+1; xi++) {//die horizontale line: x
        for (int yi = y-1; yi <= y+1; yi++) {//die vertikale linie: y
          if (!wrap) {
            if (((xi>=0)&&(xi<width/zellSize))&&((yi>=0)&&(yi<height/zellSize))) {//rand...
              if (!((xi==x) && (yi==y))) {// nicht gegen aktive Zelle!
                if (zellenTmp[xi][yi] == 1) {//ist wer da?
                  nachbar ++; //jup, nachbar rauf!
                }
              }
            }
          } else {
            nachbar = nachbarCheck(xi, yi, x, y, nachbar);//besserer check, der auch um die "kanten geht"
          }//end if wrap
        }//end yi
      }//end xi

      regularBirthDeath( x, y, nachbar);
    }//end y loop
  }//end x loop
}


void regularBirthDeath(int x, int y, int nachbar) {
  //und jetzt killen oder neue birth
  if (zellenTmp[x][y] == 1) {//aktuelle Zelle lebt
    //killen oder nicht?
    boolean letLive = false;
    for (int i =0; i<regelLife.length; i++) {
      if (nachbar == regelLife[i]) {//haben wir genug nachbarn?
        letLive = true;
      }
    }
    if (letLive == false) zellen[x][y] = 0;
  } else {//aktuelle Zelle tot
    //wiederbeleben
    boolean letBirth = false;
    for (int i =0; i<regelBirth.length; i++) {
      if (nachbar == regelBirth[i]) {//haben wir genug nachbarn?
        letBirth = true;
      }
    }
    if (letBirth == true) zellen[x][y] = 1;
  }
}



int nachbarCheck(int xi, int yi, int x, int y, int nachbar) {
  //overflow checking for neighbors
  int xmax = width/zellSize;
  int ymax = height/zellSize;

  try {
    if (!((xi==x) && (yi==y))) {// nicht gegen aktive Zelle!
      if (xi < 0)     xi = xmax-1; //überlauf 0 nach maximum x
      if (yi < 0)     yi = ymax-1; //überlauf 0 nach maximum y
      if (xi >= xmax)  xi = 0; //an den x start
      if (yi >= ymax)  yi = 0; //an den y start
      if (zellenTmp[xi][yi] == 1) {//ist wer da?
        nachbar ++; //jup, nachbar rauf!
      }
    }
  } 
  catch (Exception e) {
    //e.printStackTrace();
    println("xi: " + xi +" x: " + x+"  xmax: "+ xmax +  " yi: " + yi +  " y: " + y+"  ymax: "+ymax+ " width: " + width + " height: " + height);
    noLoop();
  }
  return nachbar;
}

void keyPressed()
{
  if (key == 'i' || key == 'I') invertZellen(); //bringt nicht besonders viel...
  if (key == 'r' || key == 'R') initZellen();
  if (key == 'c' || key == 'C') clearZellen();
  if (key == ' ') {
    pause = !pause;
    if (pause)
      noLoop();
    else
      loop();
  }
}

void invertZellen() {
  // alle leeren zellen nochmal mit der oben angegebene wahrscheinlichkeit auf 1 setzen
  for (int x = 0; x<width/zellSize; x++) {
    for (int y = 0; y<height/zellSize; y++) {
      if (zellen[x][y]== 0) { 
        float zustand = random (100);
        if (zustand > zelleLebtInit) zustand = 0;
        else                         zustand = 1;
        zellen[x][y] =int( zustand);
      }
      //else zellen[x][y] = 0;
    }//end y loop
  }//end x loop
  count = 0;
}
