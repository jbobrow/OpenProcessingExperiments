
// variables disponibles dans tout le sketch
int compteur;//variable du compteur
PFont police;// variable de la police

void setup() {
  size(400, 400);//taille
  frameRate(30);//image par seconde
  police = loadFont("PlaneCrash-48.vlw");// importation de la police
  textFont(police,150);// taille de la police
  compteur = 0;//initialisation du compteur
}

void draw() {
    background(random(170,190));//gommage systématique pour créer l'animation
   
    // croix
    smooth();
    strokeWeight(1);// largeur de trait
    stroke(random(20,80));// couleur aléatoire 
    line(0,200,400,200);//croix
    line(200,0,200,400);//
    
    //trait supérieur de la croix plus large
    strokeWeight(2);// largeur de trait
    line(200,0,200,200);// surlignage de la position de départ
    
    //cibles
    strokeWeight(2);// largeur de trait
    stroke(random(190,220));// couleur du trait aléatoire en niveau de gris
    noFill();// pas de remplissage
    ellipse(200,200,300,300);// cible 1
    ellipse(200,200,270,270);// cible 2
    
    //effet usé
    noStroke();// pas de bordure
    fill(random(50,100));// remplissage aléatoire en valeurs de gris
    ellipse(random (0,400), random (0,400), random (20), random (20));// taches position aléatoire et diamètre de 20 maximum
    for (float i = 0; i < 400; i = i+random(0,400)){////boucle variable "i" min=0 ;max=400;incrementation aléatoire maximum 400
      strokeWeight(1);//largeur de trait
      stroke(random(50,255));// couleur de trait aléatoire en nuances de gris
      line(i,0,i,height);// tracer lignes: absisse des deux points de la ligne s'incrémente simultanément on a donc des lignes verticales
  }
   
  
   // gestion de la typographie en fonction du compteur
   if( compteur <= 30){ // condition: tant que le compteur ne dépasse pas 30 (1seconde)
    fill(0);// remplissage en noir
    text("4",150,255);// print "4" 
  }
  if( compteur >= 31){// tant que le compteur est plus grand ou egal a 31
    if (compteur <= 60){// et qu'il est plus petit ou egal a 60
      fill(0);// remplissage en noir
      text("3",155,255);// print "3"
    }
  }
  if (compteur >= 61){// tant que le compteur est plus grand ou egal a 61
    if (compteur <= 90){// et qu'il est plus petit ou egal a 90
      fill(0);//remplissage en noir
      text("2",155,250);// print "2"
    }
  }
  if (compteur >= 91){// tant que le compteur est plus grand ou egal a 91
    if (compteur <= 120){// et qu'il est plus petit ou egal a 120
      fill(0);// remplissage en noir
      text("1",150,255);// print "1"
    }
  }
  
  //rotation de la ligne
  translate(200, 200);//le point d'origine (coin supérieur gauche) est au centre
  rotate(compteur*((PI*2)/30));//rotation en fonction du compteur de 360°par seconde
  stroke(0);//ligne noire
  strokeWeight(2);// épaisseur de la ligne
  smooth();//lissage
  line(0, 0, 0, -290);//ligne verticale position de départ
  
  
  // flash
  if (compteur == 30) {//condition : si le compteur dépasse 30 (1seconde) 
    background(230);//et le le fond blanc qui fait le flash........3......
  }
  if (compteur==60){
    background(230);//........2.......
  }
  if (compteur == 90){
    background(230);//....1.....
  }
  if(compteur == 120){
    background(230);//ouverture volet 
    compteur = 0;
  }
  compteur = compteur+1;//incrémentation du compteur
}



