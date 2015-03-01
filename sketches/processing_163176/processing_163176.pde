
ArrayList<Noeud> noeuds = new ArrayList();
int nbre = 2;

void setup() {
  size(400,400);
  smooth();
  noFill();
  stroke(255);
  strokeWeight(0.1);
  textAlign(LEFT,TOP);
  textSize(10);
  creerArbre(nbre);
}

void draw() {
  background(0);
  if(noeuds.size()<300) {
    addNoeud(noeuds.size());
  }
  for(Noeud n : noeuds) {
    n.update();
  }
  dessinerArbre();
}

void creerArbre(int n) {
  noeuds.clear();
  noeuds.add(new Noeud(0,null,null));
  for(int i=1;i<n;i++) {
    addNoeud(i);
  }
}

void addNoeud(int id) {
  noeuds.add(new Noeud(id,null,null));
  int parent = round(random(0,id-1));
  noeuds.get(noeuds.size()-1).setParent(noeuds.get(parent));
  noeuds.get(parent).addEnfant(noeuds.get(noeuds.size()-1));
  ordonnerArbre();
}

void dessinerArbre() {
  for(Noeud n : noeuds) {
    n.dessiner();
  }
}

void ordonnerArbre() {
  float interLigne = float(height)/rechercheProfondeurMax(0);
  float interColonne = float(width)/rechercheLargeurMax(0);
  int[] liste = rechercheLargeur(0);
  int clefChangementNiveau = liste[1];
  int niveau = -1;
  int[] pile = new int[0];
  for(int i=0;i<liste.length;i++) {
    if(liste[i]==clefChangementNiveau) {
      niveau++;
      float x = width/2-(pile.length-1)*interColonne/2;
      float y = interLigne/2+niveau*interLigne;
      for(int j=0;j<pile.length;j++) {
        noeuds.get(pile[j]).setTargetX(x+j*interColonne);
        noeuds.get(pile[j]).setTargetY(y);
      }
      for(int j=i;j<liste.length;j++) {
        boolean trouve = false;
        if(noeuds.get(liste[j]).aDesEnfants()) {
          clefChangementNiveau = noeuds.get(liste[j]).getEnfantId()[0];
          break;
        }
      }
      pile = new int[0];
      pile = append(pile,liste[i]);
    } else {
      pile = append(pile,liste[i]);
    }
  }
  niveau++;
  float x = width/2-(pile.length-1)*interColonne/2;
  float y = interLigne/2+niveau*interLigne;
  for(int j=0;j<pile.length;j++) {
    noeuds.get(pile[j]).setTargetX(x+j*interColonne);
    noeuds.get(pile[j]).setTargetY(y);
  }
}

int[] rechercheLargeur(int s) {
  int[] resultat = new int[0];
  int[] file = new int[0];
  file = append(file,s);
  while(file.length>0) {
    int[] enfants = noeuds.get(file[0]).getEnfantId();
    for(int i=0;i<enfants.length;i++) {
      file = append(file,enfants[i]);
    }
    resultat = append(resultat,file[0]);
    file = subset(file,1);
  }
  return resultat;
}

int rechercheLargeurMax(int s) {
  int largeurMax = 0;
  int nbreEnfantParNiveau = 0;
  int clefChangementNiveau = noeuds.get(s).getEnfantId()[0];
  int[] file = new int[0];
  file = append(file,s);
  while(file.length>0) {
    if(file[0]==clefChangementNiveau) {
      nbreEnfantParNiveau = 0;
      for(int i=0;i<file.length;i++) {
        if(noeuds.get(file[i]).aDesEnfants()) {
          clefChangementNiveau = noeuds.get(file[i]).getEnfantId()[0];
          break;
        }
      }
    }
    int[] enfants = noeuds.get(file[0]).getEnfantId();
    for(int i=0;i<enfants.length;i++) {
      file = append(file,enfants[i]);
    }
    nbreEnfantParNiveau+=enfants.length;
    if(largeurMax<nbreEnfantParNiveau) {
      largeurMax=nbreEnfantParNiveau;
    }
    file = subset(file,1);
  }
  return largeurMax;
}

int rechercheProfondeurMax(int s) {
  int profondeurMax = 0;
  int[] pile = new int[0];
  int[] dejaFait = new int[noeuds.size()];
  for(int i=0;i<dejaFait.length;i++) {
    dejaFait[i] = 0;
  }
  pile = append(pile,s);
  dejaFait[s] = 1;
  profondeurMax++;
  while(pile.length>0) {
    int[] enfants = noeuds.get(pile[pile.length-1]).getEnfantId();
    int trouve = -1;
    for(int i=0;i<enfants.length;i++) {
      if(dejaFait[enfants[i]] == 0) {
        trouve = i;
      }
    }
    if(trouve>-1) {
      pile = append(pile,enfants[trouve]);
      dejaFait[enfants[trouve]] = 1;
      if(pile.length>profondeurMax) {
        profondeurMax=pile.length;
      }
    } else {
      pile = subset(pile,0,pile.length-1);
    }
  }
  return profondeurMax;
}

void keyPressed() {
  if(key==' '){creerArbre(nbre);}
}

