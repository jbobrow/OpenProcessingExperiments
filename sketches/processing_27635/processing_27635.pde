
import fisica.*;

FWorld world;
PImage shoe;
PImage balle;
FPoly pied;
FCircle aki;
float a;
color c;
PImage bg;
int cpt, cptmem,record;
PFont font,font2;
int temps,compa;
boolean ok=true;

//FContact contact;
void setup() {
  size(400, 400); 
  bg=loadImage("parc.png");
  font= loadFont("Arial-Black-48.vlw");
  font2= loadFont("Arial-Black-80.vlw");
  textFont(font);
  balle=loadImage("balle.png");
  shoe=loadImage("shoe.png");
  temps=millis()/1000;

  Fisica.init(this);

  world=new FWorld();
  world.setGravity(0, 900); 
  world.setEdges();

  aki = new FCircle(10);
  aki.setPosition(200, 200);
  a=aki.getY(); // <-- QU'EST-CE QUE TU VEUX FAIRE AVEC ÇA?/ je croyais qu'on pouvait mettre les Y du aki ds 1 variable
  aki.attachImage(balle);
  aki.setBullet(true); // L'OPTION BULLET PERMET DE MIEUX CALCULER LES COLLISIONS
  world.add(aki);

  // C'EST UN PEU PARESSEUX DE TRAITER LE PIED COMME UNE BOITE.
  // JE L'AI CHANGÉ POUR UN POLYGONE. merci
  // c'était plus facile, à jouer, mais finalement c'est vrai que c'es mieux

  pied = new FPoly();
  pied.vertex(-30,10);
  pied.vertex(-30,-15);
  pied.vertex(-10,-15);
  pied.vertex(20,3);
  pied.vertex(28,1);
  pied.vertex(32,10);
  pied.setPosition(220, 300);
  pied.setBullet(true); // L'OPTION BULLET PERMET DE MIEUX CALCULER LES COLLISIONS
  pied.setAngularDamping(0);


  pied.setRotatable(false);
  pied.attachImage(shoe);
  world.add(pied);

  world.setGravity(0, 900);
}

void draw() {
  fill(0);

  c=color(0);
  if (ok==true)background(bg);


  text(cpt,300,50);
  fill(180,0,0);
  text("top:"+cptmem,200,100);
  world.step();
  world.draw(this);
}

void keyPressed() {

  if (keyCode==ENTER) {
    aki.setPosition(200,200);
    pied.setPosition(220, 300);
  }
}


void contactStarted(FContact contact) {


  // DETECTER UNE COLISION ENTRE LE AKI, LE SOL ET LE PIED
  // EST-CE QU'UN DES DEUX CORPS EST AKI:
  if ( contact.getBody1() == aki || contact.getBody2() == aki ) {
    // EST-CE QU'UN DES DEUX CORPS EST LE SOL:
    if ( contact.getBody1() == world.bottom || contact.getBody2() == world.bottom  ) {
      println("AKI TOUCHE LE SOL");

      //textFont(font2);
      // text("Appuie sur enter pour recommencer", 50,200);
      //textFont(font);

      if (cpt>cptmem)cptmem=cpt;
      if(cpt>record)record=cptmem;
      cpt=0;
      // EST-CE QU'UN DES DEUX CORPS EST LE PIEDS:
    } 
    else if  ( contact.getBody1() == pied || contact.getBody2() == pied ) {
      println("AKI TOUCHE LE PIED");


      cpt++;
    }
  }
}


