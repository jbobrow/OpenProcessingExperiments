
//dénomination des éléments nécessaires au programme en totalité (appelés plusieurs fois)
PImage hugo;
PImage fond;
PImage mms;
float xpos;
float ypos;
float drag = 3.0;
int vie = 110;
PFont fontA;

void setup() 
{
  noTint();

  size(800,600);//taile écran minimale pour y voir quelquechose
  fond = loadImage("paysage.bmp");//chargement du fond
  hugo = loadImage("hugo.png");//chargement de Hugo
  mms=loadImage("mms.png");// chargement de sa nourriture 
  xpos = width;
  ypos = height;
  frameRate(30);
  println(frameCount);
  fontA = loadFont("Jokerman-Regular-48.vlw");

}

void draw() 
{ 
  //compteur de vie qui diminue à chaque passage dans la boucle...
  delay(10);
  vie=vie-5;

  println(vie);
  //  delay (3000);
  //début puis à chaque passage dans la boucle,rétablissement après nourrissage...
  noTint();


  //contrôle du personnage à la souris
  float difx = mouseX - xpos-hugo.width/2;
  if(abs(difx) > 1.0) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-hugo.width);
  }  

  float dify = mouseY - ypos-hugo.height/2;
  if(abs(dify) > 1.0) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 200, height-hugo.height);

  } 
  if (vie <=0){

    delay (3000);
    nourrirCrea (500);
    delay(100);
    println(vie);
  } 
  if (vie <10){
    couleurCritik(255,255,255);



    image(mms,120,120);
  }

  // Place la créature sous ma souris...
  image(fond,0,0,800,600);
  image(hugo, xpos, ypos,width/4,height/2);
  if(vie<=20){
  image(mms,520,180);
  }
} 
//action qui lui rend un peu de vie...et petit saut bref de satisfaction!
void mousePressed(){
  vie=vie+10;
  println(vie);
  delay(500);
  ypos=ypos-100;

}
//l'écran change de couleur:il est sur le point de mourir...
void couleurCritik(int x,int y,int z){
  image (hugo,x,y);
  tint(255,0,0);
  textFont(fontA,16);
  text("à bientôt et merci d'avoir joué"+"...");
  delay(50);
}

//elle est nourrie, la vie remonte

int nourrirCrea (int mms){
  vie=vie+mms;
  return (vie);
}





//jeu sur la souris...
//affichage d'un texte au glissé-déplacé
void mouseDragged(){
  textFont(fontA, 32);
  text("votre personnage a besoin de repos..."+" ",20,20);
  delay(200);



  textFont(fontA, 32);
  text("Appuyez sur stop pour arrêter de jouer",mouseX,mouseY);
  fill(125, 10, 125,20);

}




