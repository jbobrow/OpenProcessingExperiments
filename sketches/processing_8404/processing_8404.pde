
//On déclare les variables.
int a;
int b;
int c;
int d;
int e;
int f;
int g;
int h;
float i;
float j;
int k;

//On donne le lien entre le sketch et les imags à charger.
PImage StormTrooper;
PImage Yoda;

void setup(){
 //Epaisseur des traits 
  strokeWeight(1.2);
//Couleur de fond 
  background(255);
//Taille du sketch 
  size (800,800);
//on déclare les variables
    //Position du StormTroopers
  a=50;
  b=50;
  c=50;
  d=50;
  k=0;
   //Position de Yoda.
  i=random(0, 800);
  j=random(0, 800);
//On donne le lien entre le sketch et les imags à charger.
  StormTrooper = requestImage("ST.jpg");
  Yoda = requestImage("yoda.jpg");

}

void draw()
{
  background(255);
//Couleur de la typo.
  fill(0);
//On choisit de la typo.
  PFont maTypo = loadFont("Futura-Medium-48.vlw"); 
//On Ddéfinit la taille de la typo.
  textFont(maTypo, 32);
//On dit quoi écrire et ou écrire, ici le score en bas.  
  text(k,400,780);
 
//On charge les images dans le sketch 
  if (StormTrooper.width == 0) {
     } else if (StormTrooper.width == -1) {
    } else {
      image(StormTrooper, a, b);}
      
  if (Yoda.width == 0) {
  } else if (Yoda.width == -1) {
  } else {
    image(Yoda, i, j);}

//On définit les coordonées du rayon laser du pistolaser.
       e=a+75;
       f=b+33;
       g=a+120;
       h=b+33; 
//Si je presse d je monte, s je descend, d je vais à gauche, q à droite.       
    if (keyPressed){ 
          if (key == 'd') {
          a = a + 10;
          }}
    if (keyPressed){ 
          if (key == 'q') {
          a = a - 10;
          }}      
    if (keyPressed){ 
          if (key == 'z') {
          b = b - 10;     
          }}      
     if (keyPressed){ 
          if (key == 's') {
          b = b + 10;
          }} 
      
     if (keyPressed){ 
//Si je presse la barre espace je tire. 
       if (key == ' ') {
//Un rayon rouge.
         stroke(255, 0, 0);  
         line(e, f, g, h); 
//Si le bout du rayon rouge se trouve sur Yoda.
         // && sert à implanter plusieur condition.
         //Si le rayon est là ET là ET là ET ici, alors.
          if (g > i && g < i+100 && h > j && h < j+100){
//Alors Yoda se replace aléatoirement dans le sketch.
            i=random(0, 750);
            j=random(0, 750);
//Et on gagne un point.
            k=k+1;}; 
            }}   
//Si j'ai 5 points.         
      if (k == 5) {
//Les images disparaissent.        
        tint(0,0,0,0);
//Et je gagne!        
        text("YOU WIN !",340,400);  
        }
}


