
// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 148
// Jeudi 26 février 2009

// * * * * sauvegardeImg * * * *
// Un gestionnaire date/heure et incrémentation numérique permettant la construction d’une chaîne de caractères
// servant d’identifiant unique à un fichier de type image sauvegardé sur la machine.

// * * * * Arguments requis par la fonction de sauvegarde * * * *
// Premier argument
// Le type de sauvegarde et la nature de l'identifiant suivant la fréquence des sauvegardes, soit :
// --------------------------------------
// seconde
// secondeIncrement
// milliseconde
// photogramme
// --------------------------------------

// Second argument
// L'extension du fichier, soit :
// --------------------------------------
// tif
// tga
// jpg
// png
// --------------------------------------

/* Résumé des fonctions :
maintenant() retourne un identifiant unique à chaque seconde.
maintenantMillis() retourne un identifiant unique avec une précision au millième de seconde.
maintenantIncrement() retourne un identifiant unique, en distinguant les images d’une même seconde par un numéro croissant.
*/


String indentifiantActuel = maintenant(); // Par défaut, l'identifiant de temps correspond au temps de l'horloge lors du démarrage de l'applet
String indentifiantPrecedent;

void sauvegardeImg(String message, String ext) {
  // Vérification des arguments
  if (((message.equals("seconde"))||(message.equals("secondeIncrement"))||(message.equals("milliseconde"))||(message.equals("photogramme")))==false) {
    println("Inscrire \"seconde\", \"secondeIncrement\", \"milliseconde\" ou \"photogramme\" comme premier argument de la fonction sauvegardeImg()");
    exit();
  } else if (((ext.equals("tif"))||(ext.equals("tga"))||(ext.equals("jpg"))||(ext.equals("png")))==false) {
    println("Inscrire \"tif\", \"tga\", \"jpg\" ou \"png\" comme second argument de la fonction sauvegardeImg()");
    exit();
  }
  
  // Traitement
  if (message.equals("seconde")) {
    // Mise à jour de l'identifiant de temps
    indentifiantActuel = maintenant();
    // La condition ci-dessous nous évite d'écraser inutilement une image par une autre pendant la même seconde
    // On enregistre uniquement si le temps a progressé d'au moins une seconde
    if (indentifiantActuel.equals(indentifiantPrecedent) == false) {
      save(maintenant()+"."+ext); // sauvegarde de l'image
    }
    // On conserve l'identifiant de temps pour effectuer une comparaison
    indentifiantPrecedent = indentifiantActuel;
  } 
  else if (message.equals("secondeIncrement")) {
    save(maintenantIncrement()+"."+ext); // sauvegarde de l'image
  } 
  else if (message.equals("milliseconde")) {
    save(maintenantMillis()+"."+ext); // sauvegarde de l'image
  } 
  else if (message.equals("photogramme")) {
    // Minimum de deux ##
    // Le nombre de # employé (disons n#) fait précéder la numération de ((n#)-1) chiffre(s) zéro, seulement si la numération est inférieure à (n#)*10
    // Ainsi, ## affichera 01, 02... puis 10, puis 100, puis 1000, puis 10000
    // Tandis que #### affichera 0001, 0002, puis 0010, puis 0100, puis 1000, puis 10000
    // Par défaut, nous choisissons quatre #
    saveFrame(indentifiantActuel+"&"+"####."+ext); // sauvegarde de l'image à chaque frame
  }
}

// Variables utilisées
String aaaa, aa, mm, jj, hr, mn, sc;
String tempsPresent, tempsPrecedent, idTemporel; 
// tempsPresent : À la seconde près
// idTemporel : permet d’ordonnancer les fichiers à l'intérieur d'une même seconde
int i;
// chronoMillis : lecture au millième de seconde
int chronoMillis;


// Fonction pour retourner une chaîne de texte avec la date et l’heure actuelles (en mode local).
// La précision du relevé est à la seconde près.
// Le résultat dépend bien entendu de l’ajustement de l’horloge sur l’ordinateur où s’exécute le programme.
String maintenant() {

  aaaa = str(year());
  // Présumant de dates supérieures à l’an 2000, on ne conservera que les deux derniers chiffres.
  aa = str(aaaa.charAt(2))+str(aaaa.charAt(3));

  if (month()<10) { 
    mm = "0"+str(month()); 
  } 
  else { 
    mm = str(month()); 
  }

  if (day()<10) { 
    jj = "0"+str(day()); 
  } 
  else { 
    jj = str(day()); 
  }

  if (hour()<10) { 
    hr = "0"+str(hour()); 
  } 
  else { 
    hr = str(hour()); 
  }

  if (minute()<10) { 
    mn = "0"+str(minute()); 
  } 
  else { 
    mn = str(minute()); 
  }

  if (second()<10) { 
    sc = "0"+str(second()); 
  } 
  else { 
    sc = str(second()); 
  }

  return aa+mm+jj+"_"+hr+mn+sc;
}


// Fonction pour construire une chaîne de texte unique.
// Le temps présent + un incrément numérique croissant (précision de trois chiffres).
String maintenantIncrement() {
  
  // La présente fonction fait appel à une autre fonction, nommée maintenant().
  tempsPresent = maintenant();

  if (tempsPresent.equals(tempsPrecedent)) { // je suis dans la même seconde
    if (i<10) {
      idTemporel = tempsPresent+"_00"+i;
    } 
    else if ((i>=10)&&(i<=99)) {
      idTemporel = tempsPresent+"_0"+i;
    } 
    else if (i>=100) {
      idTemporel = tempsPresent+"_"+i;
    }
    i++;
  } 
  else { // soit on entre dans une nouvelle seconde, soit on appelle la fonction pour une première fois
    idTemporel = tempsPresent+"_001";
    i = 2;
  }

  tempsPrecedent = tempsPresent;
  return idTemporel;
}


// Fonction pour construire une chaîne de texte unique.
// Le temps présent à la seconde près + une fraction en millisecondes.
String maintenantMillis() {

  // La présente fonction fait appel à une autre fonction, nommée maintenant().
  tempsPresent = maintenant();
  chronoMillis = millis()%1000;

  if (chronoMillis<10) {
    idTemporel = tempsPresent+"_00"+chronoMillis;
  } 
  else if ((chronoMillis>=10)&&(chronoMillis<=99)) {
    idTemporel = tempsPresent+"_0"+chronoMillis;
  } 
  else if (chronoMillis>=100) {
    idTemporel = tempsPresent+"_"+chronoMillis;
  }

  return idTemporel;
}


