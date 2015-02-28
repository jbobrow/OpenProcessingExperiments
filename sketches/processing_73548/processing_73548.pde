

//Variable générale

int level;
final int LEVELMAX=21;
int frameDebut;
int frameActuel;

boolean[] touches;
boolean[] touchesCodees;
boolean pause;
final int DEEP=1200;

Path p;
User u;
ArrayList pickupList;

//variable pour le level_control
int timeStamp;
int interval;


int scene;
final int JEU=0;
final int VICTOIRE=1;
final int MORT1=2;
final int MORT2=3;
final int RESET=4;
final int MENU=11;
final int MENU2=12;
final int MENU3=13;

final int SLOW=1;
final int SPEED=2;
final int BONUS=3;
final int ENERGIE=4;
float tDegrade;

//variable pour les caméras
// le user gère sa propre caméra, Path et pick sont sur ca
PGraphics camLPG;
PGraphics camRPG;
boolean vision3D;

//variable pour les menus
PFont font;
int menuAnim;
boolean keyHold;



void setup() {
  size(400, 400, P3D);
  smooth();
  hint(DISABLE_DEPTH_TEST) ;
  touches = new boolean[256];
  touchesCodees = new boolean[256]; 
  font = loadFont("SpinCycle-60.vlw");

  reset();
  keyHold=false;
  //départ
  scene=MENU;
}

void draw() { 

  if (scene==MENU) {
    menu();
  }

  if (scene==MENU2) {
    menu2();
  }  
  if (scene==MENU3) {
    menu3();
  }

  if (scene==JEU) {
    if (pause==false) {
      jeu();
    }
  }

  if (scene==MORT1) {
    mort1();
  }
  if (scene==MORT2) {
    mort2();
  }

  if (scene==VICTOIRE) {
    victoire();
  }
  if (scene==RESET) {
    reset();
  }

  println(frameRate);
}

void keyPressed() {
  if ( key == CODED ) {
    touchesCodees[keyCode] = true;
  }
  else {
    touches[key] = true;
  }


  /* DEBUG
   if ( touches['o'] == true ) { //doit rester ici afin d'être activé une seule fois.
   level--;
   println(level);
   }
   if ( touches['p'] == true ) {
   level++;
   println(level);
   }
   if ( touches['y'] == true ) {
   if (pause==true) {
   pause=false;
   } 
   else {
   pause=true;
   }
   println(pause);
   }
   */
}


void keyReleased() {
  keyHold=false;
  if ( key == CODED ) {
    touchesCodees[keyCode] = false;
  }
  else {
    touches[key] = false;
  }
}

void afficheCam3D() {
  //loop camRPG BLEU:
  if (vision3D==true) {
    image(camLPG, 0, 0); //la loop rouge a été enlevé, car elle était inutile et diminuait le frameRate.
    camRPG.loadPixels();
    camLPG.loadPixels();
    for (int i = 0; i < camRPG.height; i++) {
      for (int j = 0; j < camRPG.width; j++) {
        int locRight = i * camRPG.width + j;
        if (camRPG.pixels[locRight] != color(255)) {
          if (camLPG.pixels[locRight] != color(255)) {
            set(j, i, color(0));
          }
          else { 
            set(j, i, color(0, 255, 255));
          }
        }
      }
    }
  } 
  else {
    image(camRPG, 0, 0);
  }
}


