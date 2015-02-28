
ArrayList<Inspecteur> insp;
int pas = 0;
int space = 4;
PFont font;
void setup() {
  //size(400, 350);
  size(600, 400);
  smooth();
  background(255);
  font=loadFont("AGaramondPro-Italic-16.vlw");
  textFont(font);
  insp =new ArrayList<Inspecteur>();
  insp.add(new Inspecteur("Bousadra", 177, 33, 0, 2, 11));
  insp.add(new Inspecteur("Salhi", 303, 42, 1, 4, 44));
  insp.add(new Inspecteur("Berhilli", 198, 39, 2, 20, 80));
  insp.add(new Inspecteur("Dendane", 207, 47, 2, 6, 23));
  insp.add(new Inspecteur("Hamdi", 235, 45, 0, 6, 31));
  insp.add(new Inspecteur("Ziani", 183, 46, 2, 2, 11));  
  //insp.add(new Inspecteur("Baba"    , 294, 54, 0, 12, 32));
  insp.add(new Inspecteur("Sayeh", 296, 14, 0, 10, 49));
  insp.add(new Inspecteur("Jbara", 239, 23, 0, 7, 33));

  pas= width/(insp.size());
  

    //Instruction
    fill(0, 0, 125);
    text("(Glisser la souris )", width/4 + 20, height/2 +50);
    text("Bilan pédagogique des inspecteurs\n    Délégation OUJDA-ANGAD\n   2013/2014", width/3, height/3);

}
int pos=0;
void draw() {

  for(int i=0; i< insp.size();i++){
  if ((1.5*mouseX > i*(pas +space)) && ((1.5*mouseX < (i+1)*(pas +space)))) {
    background(255);
    insp.get(i).display(height, pas+space, 10);
     fill(#FEFF00,100);
     ellipse(width/3 + 35, height/2 - 5, 100,40);
     fill(#4C12FF);
     
     text("M. " +insp.get(i).Nom, width/3, height/2);     
     text((i+1)+ " / "+ (insp.size()), width -40, height-10);
  }
  }
}



class Inspecteur {
  String Nom;
  int profs, insp, cp, ep, ap;
  public Inspecteur(String _nom, int _profs, int _insp, int _cp, int _ep, int _ap) {
    Nom= _nom;
    profs = _profs;
    insp=_insp;
    cp = _cp;
    ep = _ep;
    ap = _ap;
  }

  void display(int h, int sep, int zoom) {
    
    fill(#FAEE7E);
    rect(width -120, 0, width, height);
    fill(0);
    //Titre
    text("Bilan pédagogique des inspecteurs", 40, 20);
    line(40, 22, 250, 22);
    line(40, 24, 250, 24);
    //Instruction
    fill(0, 0, 125);
    text("(Glisser la souris de gauche à droite pour changer d'inspecteur.)\n         Les barres ne sont pas à la même échelle", 75, 50);
    //data
    fill(#2D4761);
    text("Nombre de \nprofesseurs", width -90, 20);    
    rect(width -115, 10, 20, 20);
    rect(10, h - profs, sep, profs);
    text(profs, 20, h-5 - profs);
    fill(#B60100);
    text("Nombre d' \ninspections", width -90, 60);    
    rect(width -115, 50, 20, 20);
    rect(sep+10, h - insp, sep, insp);
    text(insp,sep+25, h - insp-5);    
    fill(125, 0, 125);
    rect(2*sep+10, h - (cp*zoom), sep, cp*zoom);
    text(cp, 2*sep+25, h - (cp*zoom)-5);
    text("Cours \npédagogiques", width -90, 95);    
    rect(width -115, 85, 20, 20);    
    fill(0, 255, 0);
    rect(3*sep+10, h - ep, sep, ep);
    text(ep, 3*sep+25, h - ep-5);
    rect(width -115, 125, 20, 20); 
    fill(0, 200, 0);
    text("Etudes \npédagogiques", width -90, 135); 
    fill(#40218C);
    rect(4*sep+10, h- ap, sep, ap); 
    text("Activités \nprofessionnelles", width -90, 180); 
    rect(width -115, 170, 20, 20);
    text(ap, 4*sep+25, h- ap-5);
  }
}



