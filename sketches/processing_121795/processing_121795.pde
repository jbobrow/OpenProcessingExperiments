

void setup () {
  
  String [] villes = loadStrings ("newUSA.txt");

  int Xgrand = 0;
  int Xpetit = 0;
  int Ygrand = 0;
  int Ypetit = 0;

  for (int i=0; i<=((villes.length)-1); i++) {

    // X:

    if (float(villes[Xgrand].split(",")[0]) < float(villes[i].split(",")[0]) ) {
      Xgrand = i;
    }
    if (float(villes[Xpetit].split(",")[0]) > float(villes[i].split(",")[0]) ) {
      Xpetit = i;
    }

    // Y:

    if (float(villes[Ygrand].split(",")[1]) > float(villes[i].split(",")[1]) ) {
      Ygrand = i;
    }
    if (float(villes[Ypetit].split(",")[1]) < float(villes[i].split(",")[1]) ) {
      Ypetit = i;
    }
  }

  // Calcules:

  float largeur = float((villes[Xgrand].split(",")[0])) - float((villes[Xpetit].split(",")[0]));
  float hauteur = float((villes[Ypetit].split(",")[1])) - float((villes[Ygrand].split(",")[1]));
  float proportion = hauteur/largeur;
  size(800, int(800*proportion));
  background(0);

  // Dessin : 
  
  for (int i=0; i<=((villes.length)-1); i++) {

    fill(255-map(i,0,13509,0,255),
    map(i,0,13509,0,255),
    map(float(villes[i].split(",")[0]), float(villes[Xpetit].split(",")[0]), float(villes[Xgrand].split(",")[0]), 0, 255),
    255);
//    fill(random(0,255), random(0,255), random(0,255),50);
    noStroke();
    ellipse(map(float(villes[i].split(",")[0]), float(villes[Xpetit].split(",")[0]), float(villes[Xgrand].split(",")[0]), 0, width), 
    map(float(villes[i].split(",")[1]), float(villes[Ypetit].split(",")[1]), float(villes[Ygrand].split(",")[1]), 0, height), 
    1, 1);
  }
//  println(villes[0].split(",")[0]);
  println(villes.length);
}



