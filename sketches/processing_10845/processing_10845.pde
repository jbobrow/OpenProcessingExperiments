
// initation des listes, objet et variable
ArrayList balles;
PFont police;
color couleur;
float accx,accy;


// initialisation du sketch
void setup(){
  // creation de l'objet text
  police = loadFont("Monospaced-12.vlw"); 
  textFont(police, 12);
  // passage en hsb
  colorMode(HSB,360,1,1,1);
  // couleur de la premiere balle
  couleur= color(0,1,1,1);
  //initiation de la liste et creation de la premiere balle
  balles= new ArrayList();
  balles.add(new Balle(100.0,100.0,20,0.3,0,0,couleur));
  size(640,480);
  frameRate(30);
  smooth();

}
// le sketch ^_^
void draw(){
  // affichage du nombre de balle et du framerate
  fill(0,0,1,0.5);
  rect(-1,-1,width+1,height+1);
  fill(0,0,0);
  text("nombre de balles : "+str(balles.size()),10,18);
  text("frameRate : "+str(frameRate),10,30);
  // boucle for pour l'affichage des balles
  for (int i=0;i<balles.size();i++){
    Balle maBalle=(Balle) balles.get(i);
    maBalle.display();
    maBalle.mouvement();
    // boucle for pour tester les collisions
    for(int j=0;j<balles.size();j++){
      if(i!=j){
        Balle secondeBalle=(Balle) balles.get(j);

        maBalle.contact(secondeBalle,i,j);
      }
    }
  }
}
// creation de nouvelle balle , qui prend en compte le mouvement de la souris pour lui donner sa vitesse initiale
void mouseReleased(){
  accx=mouseX-pmouseX;
  accy=mouseY-pmouseY;
  couleur=color(frameCount%360,1,1);
  balles.add(new Balle(mouseX,mouseY,random(10,30),0.3,accx,accy,couleur));
}




// classe balle, qui contient tout les comportement d'une balle ( affichage, mouvement, contact )

class Balle
{
  // variable utile pour les balles
  float px,py;
  float taille;
  float vitesseVerticale;
  float vitesseHorizontale;
  float gravite;
  float accelerationHorizontale;
  color couleur;


  // objet constructeur de balle

  Balle(float ix,float iy, float itaille,float iaccelerationHorizontale,float iVitesseHorizontale,float iVitesseVerticale,color icouleur){
    px=ix;
    py=iy;
    taille=itaille;
    couleur=icouleur;
    gravite=taille/100;
    accelerationHorizontale=iaccelerationHorizontale;
    vitesseHorizontale=iVitesseHorizontale;
    vitesseVerticale=iVitesseVerticale;

  }
  // affichage de la balle
  void display(){
    noStroke();
    fill(couleur);
    ellipse(px,py,taille,taille);
  }
  // deplacement de la balle, et reaction si collision avec un coté ou le bas de la fenètre, ainsi que gestion de la vitesse
  void mouvement(){
    py+=vitesseVerticale;
    vitesseVerticale+=gravite;
    px+=vitesseHorizontale;
    if(py>height){
      vitesseVerticale=vitesseVerticale*-0.9;
      py=height-taille/2;
    }
    if(px>width||px<0){
      if (abs(vitesseHorizontale)>3){
        vitesseHorizontale*=-0.9;
        accelerationHorizontale*=-1;
      } 
      else {
        vitesseHorizontale*=-1;
        accelerationHorizontale*=-1;
      }
    }
    if (abs(vitesseHorizontale)<3){
      vitesseHorizontale+=accelerationHorizontale;
    }
    if(px<0){
      px=10;
    }
    else if(px>width){
      px=width-10;

    } 
  }

  // detection de collision avec une autre balle, allant dans le sens inverse, si dans va dans le même sens pas de collision
  void contact(Balle secondeBalle,int i, int j){
    if(vitesseHorizontale*secondeBalle.vitesseHorizontale<0&&((width-px>10 || px>10) || (width-secondeBalle.px<10 || secondeBalle.px<10))){
      float disX = px - secondeBalle.px;
      float disY = py - secondeBalle.py;
      if(sqrt(sq(disX) + sq(disY)) < (taille/2+secondeBalle.taille/2 )) {
        
        vitesseHorizontale*=-1;
        secondeBalle.vitesseHorizontale*=-1;
        px+=vitesseHorizontale;
        secondeBalle.px+=secondeBalle.vitesseHorizontale;
        py+=vitesseVerticale;
        secondeBalle.py+=secondeBalle.vitesseVerticale;

      } 
    }
  }
}




