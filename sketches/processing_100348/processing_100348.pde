
PFont f;
int para = 15;
int xligne = 30;
boolean premiere;

String ligne1 = "    Il était une fois dans un petit village bordé par les montagnes, une fille appelé Miam qui détestait son nom. Comme pour les autres habitants, c'était le Vieux sage du  ";
String ligne2 = "village qui l'avait nommée ainsi. La coutume était que ce soit la personne la plus veille et donc la plus sage qu'on appelait 'Vieux sage'  qui choisisse le nom des nouveau-nés. Le ";
String ligne3 = "Vieux sage enveloppait le corps du nourrisson dans une étoffe très rare qu'il était le seul à posséder dans le village, il tournait sa langue trois fois dans sa bouche, puis donnait un  ";
String ligne4 = "nom à l'enfant.";

String ligne5 = "Miam détestait cette coutume, mais elle détestait encore plus le Vieux sage qui avait choisi son nom, et c'est ce nom qu'elle détestait plus que tout. Elle le trouvait horrible et ridicule.";

String ligne6 = "Plus les années passaient, plus son nom l'obsédait. Avoir un surnom ou se faire appeler autrement ne suffisait pas à apaiser sa peine, car son véritable nom la hantait toujours. ";
String ligne7 = "Avant même d'avoir atteint l’âge adulte son mal être devint si grand qu'elle cessa tout contact avec les gens du village. ";

String ligne8 = "Un jour, devant tant de tristesse, le Vieux sage du village qui se sentait coupable de ce malheur, vint parler à Miam et lui avoua qu'il était possible de changer de nom mais que ";
String ligne9 = "cela était normalement interdit. Devant ces mots Miam fit abstraction totale de toute la haine qu'elle éprouvait à son égard et elle but chacune de ses paroles.";

String ligne10= " Le Vieux sage lui parla de la vallée des noms, une vallée magique qui se trouvait à 4 jours de marche environ. Pour s'y rendre il fallait emprunter un passage  sous-marin dans ";
String ligne11 = " un lac près du village, un petit tunnel qui remontait immédiatement après quelques mètres, il n'était pas très profond mais suffisamment pour qu'il reste méconnu des ";
String ligne12= "villageois. Dans cette vallée existait des noms qui n'appartenaient à personne et qui erraient  à la recherche de propriétaire.";

String ligne13= " Le Vieux sage lui fit don de 3 bonnets qui avaient visiblement été tricotés dans le même tissu que l'étoffe avec laquelle on recouvrait les nouveau-nés à leur naissance. 'Ce sont ";
String ligne14= "des bonnets magiques' lui dit-il. Il lui expliqua que chacun de ces bonnets était un réceptacle pour un nom. Ce bonnet pouvait intercepter un nom mais un seul, une fois le  ";
String ligne15= "nom attrapé on ne pouvait plus le changer. De plus à chaque fois qu'elle enfilerait un de ces bonnets elle prendrait un nouveau nom et perdrait l'ancien. ";

String ligne16= "Miam n'était pas particulièrement courageuse mais elle était prête à tout pour avoir un autre nom que celui qu'elle portait .Le lendemain elle traversa le tunnel et marcha  ";
String ligne17= "pendant quatre jours. Pendant son voyage elle se demanda longuement quel était le nom qu'elle préfèrerait, mais elle ne trouva pas de réponse.  Le cinquième jour elle reconnut la  ";
String ligne18= "description de la vallée que lui avait faite le Vieux sage. Elle décida alors de mettre un des 3 bonnets magiques sur sa tête. A l'instant même où elle le posa elle découvrit un ";
String ligne19= "petit nuage de lettres avec différentes écritures qui tournoyaient en l'air. Elle essaya en vain de lire les mots que ces lettres pouvaient former. Tout à coup un amas de lettres lui  ";
String ligne20= "fonça dessus à toute vitesse.  Sans même avoir le temps de faire un pas de côté pour esquiver, elle sentit les lettres pénétrer dans le bonnet magique. Elle le retira aussitôt et  ";
String ligne21 = "vit les lettres 'P','R','U','N', puis 'E' se broder successivement dans le tissu avec un joli fil couleur bordeaux. Ca y est, elle ne s'appelait plus Miam, à présent c'était Prune.  ";
String ligne22 = "Elle était enfin libérée de son calvaire et pouvait commencer à vivre. Elle était ravie.  ";

String ligne23 = "Mais le lendemain matin, après avoir passé la nuit à réfléchir à son nouveau nom, elle décida finalement de repousser son retour au village et de partir à la quête d'un autre  ";
String ligne24= "nom. En effet elle trouvait celui-ci beaucoup mieux que l'autre, mais quand même il n'était pas parfait, et maintenant qu'elle était ici, elle se devait de revenir avec le meilleur  ";
String ligne25= "nom qui puisse exister. Pour ce faire, elle se mit à la recherche du plus bel endroit de la vallée. Après quelques heures de recherches, guidée par son odorat, elle atterrit dans un ";
String ligne26 = "magnifique parterre de fleurs. Il ne pouvait pas y avoir meilleur endroit pour abriter de beaux prénoms, sans doute des prénoms de fleurs selon Prune. Elle enfila alors le second  ";
String ligne27 = "bonnet que le Vieux sage lui avait offert et tourna son regard vers le ciel. Comme la première fois elle eut juste le temps d'apercevoir quelques noms en l'air avant que l'un  ";
String ligne28= "d'entre eux rentre dans le bonnet. Elle enleva le bonnet et vit s'inscrire petit à petit la lettre 'M', elle connaissait aucun nom de fleurs commencent par un 'M', puis elle pensa  ";
String ligne29 = "à son ancien nom 'Miam' et remit immédiatement le bonnet sur sa tête en espérant qu'il était encore temps pour qu'un autre nom pénètre le bonnet. Et c'est ce qui arriva. Elle  ";
String ligne30 = "attendit que les lettres s'écrivent sur le bonnet pour pouvoir lire 'Marie', ouf il n'y avait pas écrit 'Miam', mais alors même qu'elle commençait déjà à regretter de ne pas avoir  ";
String ligne31 ="gardé le nom de Prune, les lettres continuèrent de se broder sur bonnet pour finalement former un nom composé : ' Marie-Yolande'. Elle avait bel et bien réussi à attraper deux  ";
String ligne32 ="noms différents mais ceux-ci s'étaient liés l'un à l'autre d'une façon qu'elle n'aimait pas du tout. Après tous ces efforts il était impensable qu'elle s'appelle Marie-Yolande. Elle se  ";
String ligne33="remit donc à la recherche d'un autre nom. ";

String ligne34="Marie-Yolande n'avait plus le droit à l'erreur, il ne lui restait plus que le troisième et dernier bonnet que le Vieux Sage lui avait donné. C'était sa dernière chance de trouver un  ";
String ligne35 ="nom qui lui plairait. Cette fois-ci elle fit très attention lorsqu'elle enfila le bonnet, elle ne le garda que quelques secondes puis le retira, juste le temps pour apercevoir les quelques  ";
String ligne36 ="noms qui se trouvaient autour d'elle. Elle recommença cette opération pendant trois jours jusqu'à ce qu'elle tombe sur le nom 'Jade' sur un rocher le long d'un ruisseau. Marie- ";
String ligne37 ="Yolande s'assura qu'il n'y avait pas d’autres noms dans les parages et enfila son dernier bonnet sans hésitation. Comme à chaque fois le nom vint se coudre sur le bonnet.  ";

String ligne38 ="'J','A','D','E','O','N': Jadeon,  elle n'avait pas vu qu’une partie du nom était caché par une pierre. Hélas ce coup-ci encore était un échec. Elle n'avait même pas imaginé  ";
String ligne39 ="possible qu'elle puisse porter un nom d'homme. Mais il y avait plus grave encore. ";

String ligne40 ="Jadeon était l'ancien Vieux Sage du village qui avait mal tourné, une personne très mauvaise qui avait été l'auteur de nombreux crimes pour lesquelles il fut chassé du village. ";
String ligne41="La jeune fille comprit alors que tous ces noms abandonnés n’étaient autre que les noms des personnes qui étaient mortes dans les montagnes qui entouraient le village.  ";
String ligne42 ="En portant le même nom qu'un ancien criminel elle réalisa combien sa quête du prénom parfait était superficielle. ";

String ligne43 ="Elle retourna alors au village et alla voir le Vieux sage pour lui raconter son périple et lui rendre ses 3 bonnets. Finalement elle décida de se faire appeler Miam et fut heureuse  ";
String ligne44 ="jusqu'à la fin de ses jours. ";

String titre = "La vallée des noms";





void setup() {
  premiere = true;
  size(1450, 850);
  f = loadFont("TimesNewRomanPSMT-22.vlw");
  textAlign(CENTER);
}

void draw() { 

  
         
  



if(premiere==true){
  fill(255, 255, 255, 100);
  rect(0, 0, width, height);
  
  textFont(f);    

  int xtitre = 430;
  int ytitre = 260;
  for (int i = 0; i < titre.length(); i++) {
    
    fill(240);
    textSize(80);
    float bouge = 0;
   
    text(titre.charAt(i), xtitre+bouge, ytitre+bouge);
    // textWidth() spaces the characters out properly.
    xtitre += textWidth(titre.charAt(i));
    
  }
  
  fill(150);
  textSize(18);
  text("1/2", 1300, 725);

  
frameRate(15);


  int xligne1 = xligne;
  int yligne1 =370;
  for (int i = 0; i < ligne1.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne1+30) && mouseY>(yligne1-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne1+100) && mouseY>(yligne1-100)) {
        bouge = map(mouseY, yligne1+abs(100), yligne1, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne1.charAt(i), xligne1+bouge, yligne1+bouge);
    // textWidth() spaces the characters out properly.
    xligne1 += textWidth(ligne1.charAt(i));
  }



  int xligne2 = xligne;
  int yligne2 =yligne1+15;
  for (int i = 0; i < ligne2.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne2+30) && mouseY>(yligne2-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne2+100) && mouseY>(yligne2-100)) {
        bouge = map(mouseY, yligne2+abs(100), yligne2, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne2.charAt(i), xligne2+bouge, yligne2+bouge);

    xligne2 += textWidth(ligne2.charAt(i));
  }

  int xligne3 = xligne;
  int yligne3 =yligne2+15;
  for (int i = 0; i < ligne3.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne3+30) && mouseY>(yligne3-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne3+100) && mouseY>(yligne3-100)) {
        bouge = map(mouseY, yligne3+abs(100), yligne3, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne3.charAt(i), xligne3+bouge, yligne3+bouge);

    xligne3 += textWidth(ligne3.charAt(i));
  }



  int xligne4 = xligne;
  int yligne4 = yligne3+15;
  for (int i = 0; i < ligne4.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne4+30) && mouseY>(yligne4-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne4+100) && mouseY>(yligne4-100)) {
        bouge = map(mouseY, yligne4+abs(100), yligne4, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne4.charAt(i), xligne4+bouge, yligne4+bouge);
    // textWidth() spaces the characters out properly.
    xligne4 += textWidth(ligne4.charAt(i));
  }


  int xligne5= xligne;
  int yligne5 =yligne4+15+para;
  for (int i = 0; i < ligne5.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne5+30) && mouseY>(yligne5-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne5+100) && mouseY>(yligne5-100)) {
        bouge = map(mouseY, yligne5+abs(100), yligne5, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne5.charAt(i), xligne5+bouge, yligne5+bouge);
    // textWidth() spaces the characters out properly.
    xligne5 += textWidth(ligne5.charAt(i));
  }





  int xligne6= xligne;
  int yligne6 =yligne5+15+para;
  for (int i = 0; i < ligne6.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne6+30) && mouseY>(yligne6-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne6+100) && mouseY>(yligne6-100)) {
        bouge = map(mouseY, yligne6+abs(100), yligne6, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne6.charAt(i), xligne6+bouge, yligne6+bouge);
    // textWidth() spaces the characters out properly.
    xligne6 += textWidth(ligne6.charAt(i));
  }



  int xligne7 = xligne;
  int yligne7 =yligne6+15;
  for (int i = 0; i < ligne7.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne7+30) && mouseY>(yligne7-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne7+100) && mouseY>(yligne7-100)) {
        bouge = map(mouseY, yligne7+abs(100), yligne7, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne7.charAt(i), xligne7+bouge, yligne7+bouge);

    xligne7 += textWidth(ligne7.charAt(i));
  }




  int xligne8 = xligne;
  int yligne8 =yligne7+15+para;
  for (int i = 0; i < ligne8.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne8+30) && mouseY>(yligne8-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne8+100) && mouseY>(yligne8-100)) {
        bouge = map(mouseY, yligne8+abs(100), yligne8, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne8.charAt(i), xligne8+bouge, yligne8+bouge);
    // textWidth() spaces the characters out properly.
    xligne8 += textWidth(ligne8.charAt(i));
  }





  int xligne9 = xligne;
  int yligne9 =yligne8+15;
  for (int i = 0; i < ligne9.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne9+30) && mouseY>(yligne9-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne9+100) && mouseY>(yligne9-100)) {
        bouge = map(mouseY, yligne9+abs(100), yligne9, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne9.charAt(i), xligne9+bouge, yligne9+bouge);
    // textWidth() spaces the characters out properly.
    xligne9 += textWidth(ligne9.charAt(i));
  }




  int xligne10 = xligne;
  int yligne10 =yligne9+15+para;
  for (int i = 0; i < ligne10.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne10+30) && mouseY>(yligne10-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne10+100) && mouseY>(yligne10-100)) {
        bouge = map(mouseY, yligne10+abs(100), yligne10, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne10.charAt(i), xligne10+bouge, yligne10+bouge);

    xligne10+= textWidth(ligne10.charAt(i));
  }




  int xligne11 = xligne;
  int yligne11 =yligne10+15;
  for (int i = 0; i < ligne11.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne11+30) && mouseY>(yligne11-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne11+100) && mouseY>(yligne11-100)) {
        bouge = map(mouseY, yligne11+abs(100), yligne11, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne11.charAt(i), xligne11+bouge, yligne11+bouge);
    // textWidth() spaces the characters out properly.
    xligne11 += textWidth(ligne11.charAt(i));
  }




  int xligne12= xligne;
  int yligne12 =yligne11+15;
  for (int i = 0; i < ligne12.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne12+30) && mouseY>(yligne12-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne12+100) && mouseY>(yligne12-100)) {
        bouge = map(mouseY, yligne12+abs(100), yligne12, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne12.charAt(i), xligne12+bouge, yligne12+bouge);
    // textWidth() spaces the characters out properly.
    xligne12 += textWidth(ligne12.charAt(i));
  }


  int xligne13 = xligne;
  int yligne13 =yligne12+15+para;
  for (int i = 0; i < ligne13.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne13+30) && mouseY>(yligne13-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne13+100) && mouseY>(yligne13-100)) {
        bouge = map(mouseY, yligne13+abs(100), yligne13, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne13.charAt(i), xligne13+bouge, yligne13+bouge);
    // textWidth() spaces the characters out properly.
    xligne13 += textWidth(ligne13.charAt(i));
  }


  int xligne14 = xligne;
  int yligne14 =yligne13+15;
  for (int i = 0; i < ligne14.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne14+30) && mouseY>(yligne14-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne14+100) && mouseY>(yligne14-100)) {
        bouge = map(mouseY, yligne14+abs(100), yligne14, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne14.charAt(i), xligne14+bouge, yligne14+bouge);
    // textWidth() spaces the characters out properly.
    xligne14 += textWidth(ligne14.charAt(i));
  }


  int xligne15 = xligne;
  int yligne15 =yligne14+15;
  for (int i = 0; i < ligne15.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne15+30) && mouseY>(yligne15-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne15+100) && mouseY>(yligne15-100)) {
        bouge = map(mouseY, yligne15+abs(100), yligne15, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne15.charAt(i), xligne15+bouge, yligne15+bouge);
    // textWidth() spaces the characters out properly.
    xligne15 += textWidth(ligne15.charAt(i));
  }
}
if(premiere==false){
  fill(255, 255, 255, 100);
  rect(0, 0, width, height);
  fill(0);
  textFont(f); 
  textSize(18);
  
  fill(150);
  textSize(18);
  text("2/2", 1300, 725);

  int xligne16 = xligne;
  int yligne16 =200;
  for (int i = 0; i < ligne16.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne16+30) && mouseY>(yligne16-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne16+100) && mouseY>(yligne16-100)) {
        bouge = map(mouseY, yligne16+abs(100), yligne16, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne16.charAt(i), xligne16+bouge, yligne16+bouge);
    // textWidth() spaces the characters out properly.
    xligne16 += textWidth(ligne16.charAt(i));
  }


  int xligne17 = xligne;
  int yligne17 =yligne16+15;
  for (int i = 0; i < ligne17.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne17+30) && mouseY>(yligne17-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne17+100) && mouseY>(yligne17-100)) {
        bouge = map(mouseY, yligne17+abs(100), yligne17, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne17.charAt(i), xligne17+bouge, yligne17+bouge);
    // textWidth() spaces the characters out properly.
    xligne17 += textWidth(ligne17.charAt(i));
  }


  int xligne18 = xligne;
  int yligne18 =yligne17+15;
  for (int i = 0; i < ligne18.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne18+30) && mouseY>(yligne18-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne18+100) && mouseY>(yligne18-100)) {
        bouge = map(mouseY, yligne18+abs(100), yligne18, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne18.charAt(i), xligne18+bouge, yligne18+bouge);
    // textWidth() spaces the characters out properly.
    xligne18 += textWidth(ligne18.charAt(i));
  }


  int xligne19 = xligne;
  int yligne19 =yligne18+15;
  for (int i = 0; i < ligne19.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne19+30) && mouseY>(yligne19-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne19+100) && mouseY>(yligne19-100)) {
        bouge = map(mouseY, yligne19+abs(100), yligne19, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne19.charAt(i), xligne19+bouge, yligne19+bouge);
    // textWidth() spaces the characters out properly.
    xligne19 += textWidth(ligne19.charAt(i));
  }


  int xligne20 = xligne;
  int yligne20 =yligne19+15;
  for (int i = 0; i < ligne20.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne20+30) && mouseY>(yligne20-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne20+100) && mouseY>(yligne20-100)) {
        bouge = map(mouseY, yligne20+abs(100), yligne20, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne20.charAt(i), xligne20+bouge, yligne20+bouge);
    // textWidth() spaces the characters out properly.
    xligne20 += textWidth(ligne20.charAt(i));
  }

  int xligne21 = xligne;
  int yligne21 =yligne20+15;
  for (int i = 0; i < ligne21.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne21+30) && mouseY>(yligne21-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne21+100) && mouseY>(yligne21-100)) {
        bouge = map(mouseY, yligne21+abs(100), yligne21, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne21.charAt(i), xligne21+bouge, yligne21+bouge);

    xligne21 += textWidth(ligne21.charAt(i));
  }

  int xligne22 = xligne;
  int yligne22 =yligne21+15;
  for (int i = 0; i < ligne22.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne22+30) && mouseY>(yligne22-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne22+100) && mouseY>(yligne22-100)) {
        bouge = map(mouseY, yligne22+abs(100), yligne22, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne22.charAt(i), xligne22+bouge, yligne22+bouge);

    xligne22 += textWidth(ligne22.charAt(i));
  }

  int xligne23= xligne;
  int yligne23 =yligne22+15+para;
  for (int i = 0; i < ligne23.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne23+30) && mouseY>(yligne23-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne23+100) && mouseY>(yligne23-100)) {
        bouge = map(mouseY, yligne23+abs(100), yligne23, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne23.charAt(i), xligne23+bouge, yligne23+bouge);

    xligne23 += textWidth(ligne23.charAt(i));
  }

  int xligne24 = xligne;
  int yligne24 =yligne23+15;
  for (int i = 0; i < ligne24.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne24+30) && mouseY>(yligne24-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne24+100) && mouseY>(yligne24-100)) {
        bouge = map(mouseY, yligne24+abs(100), yligne24, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne24.charAt(i), xligne24+bouge, yligne24+bouge);

    xligne24 += textWidth(ligne24.charAt(i));
  }

  int xligne25 = xligne;
  int yligne25 =yligne24+15;
  for (int i = 0; i < ligne25.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne25+30) && mouseY>(yligne25-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne25+100) && mouseY>(yligne25-100)) {
        bouge = map(mouseY, yligne25+abs(100), yligne25, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne25.charAt(i), xligne25+bouge, yligne25+bouge);

    xligne25 += textWidth(ligne25.charAt(i));
  }

  int xligne26 = xligne;
  int yligne26 =yligne25+15;
  for (int i = 0; i < ligne26.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne26+30) && mouseY>(yligne26-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne26+100) && mouseY>(yligne26-100)) {
        bouge = map(mouseY, yligne26+abs(100), yligne26, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne26.charAt(i), xligne26+bouge, yligne26+bouge);

    xligne26 += textWidth(ligne26.charAt(i));
  }
  int xligne27 = xligne;
  int yligne27 =yligne26+15;
  for (int i = 0; i < ligne27.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne27+30) && mouseY>(yligne27-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne27+100) && mouseY>(yligne27-100)) {
        bouge = map(mouseY, yligne27+abs(100), yligne27, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne27.charAt(i), xligne27+bouge, yligne27+bouge);

    xligne27 += textWidth(ligne27.charAt(i));
  }


  int xligne28 = xligne;
  int yligne28 =yligne27+15;
  for (int i = 0; i < ligne28.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne28+30) && mouseY>(yligne28-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne28+100) && mouseY>(yligne28-100)) {
        bouge = map(mouseY, yligne28+abs(100), yligne28, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne28.charAt(i), xligne28+bouge, yligne28+bouge);

    xligne28 += textWidth(ligne28.charAt(i));
  }


  int xligne29 = xligne;
  int yligne29 =yligne28+15;
  for (int i = 0; i < ligne29.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne29+30) && mouseY>(yligne29-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne29+100) && mouseY>(yligne29-100)) {
        bouge = map(mouseY, yligne29+abs(100), yligne29, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne29.charAt(i), xligne29+bouge, yligne29+bouge);

    xligne29 += textWidth(ligne29.charAt(i));
  }


  int xligne30 = xligne;
  int yligne30 =yligne29+15;
  for (int i = 0; i < ligne30.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne30+30) && mouseY>(yligne30-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne30+100) && mouseY>(yligne30-100)) {
        bouge = map(mouseY, yligne30+abs(100), yligne30, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne30.charAt(i), xligne30+bouge, yligne30+bouge);

    xligne30 += textWidth(ligne30.charAt(i));
  }

  int xligne31= xligne;
  int yligne31 =yligne30+15;
  for (int i = 0; i < ligne31.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne31+30) && mouseY>(yligne31-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne31+100) && mouseY>(yligne31-100)) {
        bouge = map(mouseY, yligne31+abs(100), yligne31, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne31.charAt(i), xligne31+bouge, yligne31+bouge);

    xligne31 += textWidth(ligne31.charAt(i));
  }


  int xligne32 = xligne;
  int yligne32 =yligne31+15;
  for (int i = 0; i < ligne32.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne32+30) && mouseY>(yligne32-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne32+100) && mouseY>(yligne32-100)) {
        bouge = map(mouseY, yligne32+abs(100), yligne32, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne32.charAt(i), xligne32+bouge, yligne32+bouge);

    xligne32 += textWidth(ligne32.charAt(i));
  }


  int xligne33 = xligne;
  int yligne33 =yligne32+15;
  for (int i = 0; i < ligne33.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne33+30) && mouseY>(yligne33-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne33+100) && mouseY>(yligne33-100)) {
        bouge = map(mouseY, yligne33+abs(100), yligne33, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne33.charAt(i), xligne33+bouge, yligne33+bouge);

    xligne33 += textWidth(ligne33.charAt(i));
  }



  int xligne34 = xligne;
  int yligne34 =yligne33+15+para;
  for (int i = 0; i < ligne34.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne34+30) && mouseY>(yligne34-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne34+100) && mouseY>(yligne34-100)) {
        bouge = map(mouseY, yligne34+abs(100), yligne34, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne34.charAt(i), xligne34+bouge, yligne34+bouge);

    xligne34+= textWidth(ligne34.charAt(i));
  }



  int xligne35 = xligne;
  int yligne35 =yligne34+15;
  for (int i = 0; i < ligne35.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne35+30) && mouseY>(yligne35-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne35+100) && mouseY>(yligne35-100)) {
        bouge = map(mouseY, yligne35+abs(100), yligne35, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne35.charAt(i), xligne35+bouge, yligne35+bouge);

    xligne35 += textWidth(ligne35.charAt(i));
  }



  int xligne36 = xligne;
  int yligne36 =yligne35+15;
  for (int i = 0; i < ligne36.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne36+30) && mouseY>(yligne36-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne36+100) && mouseY>(yligne36-100)) {
        bouge = map(mouseY, yligne36+abs(100), yligne36, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne36.charAt(i), xligne36+bouge, yligne36+bouge);

    xligne36 += textWidth(ligne36.charAt(i));
  }



  int xligne37 = xligne;
  int yligne37 =yligne36+15;
  for (int i = 0; i < ligne37.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne37+30) && mouseY>(yligne37-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne37+100) && mouseY>(yligne37-100)) {
        bouge = map(mouseY, yligne37+abs(100), yligne37, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne37.charAt(i), xligne37+bouge, yligne37+bouge);

    xligne37 += textWidth(ligne37.charAt(i));
  }



  int xligne38 = xligne;
  int yligne38 =yligne37+15+para;
  for (int i = 0; i < ligne38.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne38+30) && mouseY>(yligne38-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne38+100) && mouseY>(yligne38-100)) {
        bouge = map(mouseY, yligne38+abs(100), yligne38, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne38.charAt(i), xligne38+bouge, yligne38+bouge);

    xligne38 += textWidth(ligne38.charAt(i));
  }



  int xligne39 = xligne;
  int yligne39 =yligne38+15;
  for (int i = 0; i < ligne39.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne39+30) && mouseY>(yligne39-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne39+100) && mouseY>(yligne39-100)) {
        bouge = map(mouseY, yligne39+abs(100), yligne39, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne39.charAt(i), xligne39+bouge, yligne39+bouge);

    xligne39 += textWidth(ligne39.charAt(i));
  }


  int xligne40 = xligne;
  int yligne40 = yligne39+15+para;
  for (int i = 0; i < ligne40.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne40+30) && mouseY>(yligne40-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne40+100) && mouseY>(yligne40-100)) {
        bouge = map(mouseY, yligne40+abs(100), yligne40, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne40.charAt(i), xligne40+bouge, yligne40+bouge);
    // textWidth() spaces the characters out properly.
    xligne40 += textWidth(ligne40.charAt(i));
  }



  int xligne41 = xligne;
  int yligne41 = yligne40+15;
  for (int i = 0; i < ligne41.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne41+30) && mouseY>(yligne41-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne41+100) && mouseY>(yligne41-100)) {
        bouge = map(mouseY, yligne41+abs(100), yligne41, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne41.charAt(i), xligne41+bouge, yligne41+bouge);
    // textWidth() spaces the characters out properly.
    xligne41 += textWidth(ligne41.charAt(i));
  }



  int xligne42 = xligne;
  int yligne42 = yligne41+15;
  for (int i = 0; i < ligne42.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne42+30) && mouseY>(yligne42-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne42+100) && mouseY>(yligne42-100)) {
        bouge = map(mouseY, yligne42+abs(100), yligne42, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne42.charAt(i), xligne42+bouge, yligne42+bouge);
    // textWidth() spaces the characters out properly.
    xligne42 += textWidth(ligne42.charAt(i));
  }



  int xligne43 = xligne;
  int yligne43 = yligne42+15+para;
  for (int i = 0; i < ligne43.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne43+30) && mouseY>(yligne43-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne43+100) && mouseY>(yligne43-100)) {
        bouge = map(mouseY, yligne43+abs(100), yligne43, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne43.charAt(i), xligne43+bouge, yligne43+bouge);
    // textWidth() spaces the characters out properly.
    xligne43 += textWidth(ligne43.charAt(i));
  }



  int xligne44 = xligne;
  int yligne44 = yligne43+15;
  for (int i = 0; i < ligne44.length(); i++) {
    float bouge;
    fill(0);
    if (mouseY<(yligne44+30) && mouseY>(yligne44-30)) {
      bouge = 0;
    }
    else { 
      if (mouseY<(yligne44+100) && mouseY>(yligne44-100)) {
        bouge = map(mouseY, yligne44+abs(100), yligne44, random(-15, 15), random(-2, 2));
      }
      else {

        bouge = random(-30, 30);
      }
    }
    text(ligne44.charAt(i), xligne44+bouge, yligne44+bouge);
    // textWidth() spaces the characters out properly.
    xligne44 += textWidth(ligne44.charAt(i));
  }
}
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      background(255);
      premiere= false ;
    } 
    else if (keyCode == LEFT) {
      background(255);
      premiere=true;
    }
  }
}
