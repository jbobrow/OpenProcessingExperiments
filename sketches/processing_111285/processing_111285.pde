
FLOWER f; //objet en globale de type flower
boolean inited=false; //permet de savoir si on a fait un premier clip une première fois

void setup(){
  size(600,600);
  frameRate(100);
  smooth(3);
  colorMode(HSB, 100);
 //noLoop(); //pazs de bpoucle au début du doc
}

void draw(){
  if(inited){
  //background(100,0,100); //si on retire le background en boucle, les fleurs se supperposent
  f.animation();
}
}
void mousePressed(){
   f = new FLOWER(mouseX,mouseY); //on veut une nouvelle fleur. cette forme n'existe pa sen natif, on cree donc une classe personnalisée. les deux arg sont les positions x et y de la fleur
  inited=true; //inited devient true car on a cliqué
}
//on déclare une classe FLOWER
class FLOWER{
  float origineX; //5 Coordonnée entre parenthèse : on veut y accéder facilement, on crée donc deux super variables
  float origineY;
  int nb_petals=int(random(15,30));
  float angle=360.0/nb_petals; //rotation des petales, selon le nombre de petal
  PETAL[] dico_petal= new PETAL [nb_petals];  //PETAL (les objets seront de type PETAL) [] (on déclare le tableau)[nb_petals] = taille du tableau

FLOWER(float ox, float oy){ //4 c'ets le constructeur, il porte le meme nom que la classe, et renvoie l'instance de l'objet. Coordonnée entre parenthèse : on veut y accéder facilement, on crée donc deux super variables
//7 on crée un tableau

origineX = ox;
origineY = oy;
 //6 déclaration de l'origine
create_petals();
create_bourgeon();
 
}

void create_petals(){
  

  
    for(int u=0;u<nb_petals;u++){ //on déclare un for à quelle valeur il démare, quelle est sa limite, comment s'incrémente il
    dico_petal[u]= new PETAL();
 
  }
      
}

void animation(){ //permet de redessiner tout le temps tous les objets
    translate (origineX,origineY); //on se place une fois ici, ne pas mettre translate dans la boucle
  for(int u=0;u<dico_petal.length;u++){
    PETAL monpetal = dico_petal[u]; //on va le chercher dans le tableau puis on lui applique la methode "dessine"'
    
    monpetal.dessine();
    rotate(radians(angle));
  }
}
void create_bourgeon(){

}

}
class PETAL{
  float rayon = 0;
  float max_rayon = 200+random(-10,10); //rayon max entre 190 et 210
  //variable de vitesse pour que chaque fleur pousse de manière différente
  float vitesse = random(1,3);
  boolean ended = false;
  float ouverture = 10;//random(-10,10);
  color col = color(int(random(0,100)),100,100);
  float coef = 1.2;
//on met ensuit en place le constructeur
PETAL(){

  
  
}
void dessine(){
  
  //on définit le nom des points
  PVector bez1 = new PVector(); //P vector = vecteur. chacun a un x et un y.
  PVector bez2 = new PVector();
  PVector end = new PVector();
  //on définit la forme
  bez1.x = cos(radians(ouverture/2*-1))*rayon/coef;
  bez1.y = sin(radians(ouverture/2*-1))*rayon/coef;
  bez2.x = cos(radians(ouverture/2))*rayon/coef;
  bez2.y = sin(radians(ouverture/2))*rayon/coef;
  end.x = rayon; //on part de l'origin donc pas besoin de calculer ce point
  end.y = 0;//on part de l'origin donc pas besoin de calculer ce point
  
fill(col);
stroke(100,0,100);//on trace la forme
beginShape();
curveVertex(0,0); //the first control point
curveVertex(0,0); //is also the start point of curve
curveVertex(bez1.x,bez1.y);
curveVertex(end.x,end.y);
curveVertex(bez2.x,bez2.y);
curveVertex(0,0); //the last point of curve
curveVertex(0,0); //is also the last control point
endShape();

test_finished(); //est ce que c'est terminé au niveau de l'objet
}
void test_finished(){ //on teste si le rayon a dépassé le maximum autorisé
  if(rayon<max_rayon){
    rayon+=vitesse;
}
}
}




