
int colonnes = 2;
int rangees = 3;
int etat = 1;
int pts = 0;
int pct = 0;
int pctt = 0;
int[] q  = new int[6]; //question
int[] r  = new int[6]; //reponse
int[] m  = new int[6]; //modifie
int[] bq  = new int[6]; //bloc de question
int[] br  = new int[6]; //bloc de reponse

color couleurQ1 = color(255, 255, 255);
color couleurQ2 = color(255, 255, 255);
color couleurQ3 = color(255, 255, 255);
color couleurQ4 = color(255, 255, 255);
color couleurQ5 = color(255, 255, 255);
color couleurR1 = color(255, 255, 255);
color couleurR2 = color(255, 255, 255);
color couleurR3 = color(255, 255, 255);
color couleurR4 = color(255, 255, 255);
color couleurR5 = color(255, 255, 255);
color couleurA1 = color(0);
color couleurA2 = color(0);
color couleurA3 = color(0);
color couleurA4 = color(0);
color couleurA5 = color(0);

String[] question = {
  " Systèmes de détection chimique ", 
  "Les chémorécepteurs ", 
  "La gustation et l’olfaction", 
  "La gustation et l’olfaction diffèrent", 
  "Les gouts de base", 
  "Différenciation des gouts  ", 
  "Organes du gout ", 
  "Cartographie de la langue", 
  "Types de papilles", 
  "Bourgeons gustatifs",
 "Transduction du gout", 
  "Voies centrales du système gustatif", 
  "Influence sur le comportement", 
  "Motivation à se nourrir", 
  "Lésions cérébrales", 
  "Interface utilisant la langue",
"Facteur de survie lié a l’olfaction", 
  "Endroit par ou on ressent les odeurs ", 
  "Les 3 types de cellules de l’éphitélium olfactif ", 
  "L’éphitélium …", 
  "Mucus",   
"Récepteurs Olfactifs", 
  "Dans la couche de mucus ", 
  "Stimulis odorants", 
  "Reconnaître les odeurs", 
  "Influence des odeurs sur le comportement", 
  "Anosmie", 
  "Marketing par odorat (Cinema)", 
  "Marketing par odorat (Jeux)", 
  "Marketing par odorat (Commerce de detail)", 
  "Kinesthésie (ou cinesthésie)", 
  "Sensibilités kinesthésiques", 
  "Introception", 
  "Proprioception ", 
  "Système vestibulaire ", 
  "Structures du labyrinthe vestibulaire", 
  "Influence de la kinesthésie"

}; 

String[] reponse = {
  
  "Organismes univellulaires et multicellulaires", 
  "Types de cellules chimiquement sensibles répartis sur tout le corps", 
  "Roles de détection chimiques dans l’environnement relié a nos besoins fondamentaux", 
  "Par leur structure, leurs mécanismes de chémorecepteurs, organisation globale, connections centrales et leur influence sur le comportement", 
  "sucré, salé, acide, amer, umami(MSG)",
  "Combinaison différente des gouts de base, perception du gout et odeur simultanément et autres modalités sensorielles ", 
  "Le palais, le pharynx, l’épiglotte, cavités nasales(nez+pharynx)", 
  "Certaines parties de la langue sont plus sensibles que d’autres au gout de base(seuil", 
  "crête, bouton, champignon qui contiennent des centaines de bourgeons gustatifs", 
"50 à 150 cellules gustatives, cellules basales, axones gustatifs afférents",
"Processus par lequel un stimulis provoque une réponse dans une cellule sensorielle sous forme de potentiel", 
  "Bourgeons gustatifs – axones gustatifs primaires – tronc cérébral – thalamus – cortex gustatif primaire (aire 36 de Brodmann)", 
  "Déglutition, salivation, vomissement, digestion, respiration", 
  "Information gustative distribuée a l’hypothalamus et certaines structures du système limbique", 
  "Aguesie, perte du sens gustatif (cortex gustatif) et suralimentation, sous-alimentation, alimentation modifiée (hypothalamis)", 
"Machine qui reproduit des pixels sur la langue par un courant électrique qui permet de percevoir une image. Brainport",
  "Differencier les aliments comestibles et non-comestibles, sens chimique pour sentir le danger et facteurs hormonaux de survie", 
  "Fine couche de cellules situées en haut de la cavité nasale : l’éphitélium olfactif", 
  "Cellules olfactives réceptrices, cellules de soutien et cellules basales", 
  "exude une fine couche de mucus qui s’écoule et se reforme toutes les 10 minutes", 
  "composé d’eau contenant des mucopolysaccharides en dissolution et des protéines : anticorps, enzymes, sels, etc", 
  "Ont une fine dendrite unique qui se termine par un petit bouton à la surface de l’épithélium ", 
  "se situe des récepteurs olfactifs qui sont composé de long cils très fins et qui ondulent à partir du bouton", 
  "se dissoudent dans le mucus et se fixent a la surface des cils et activent le processus de transduction", 
  "Par carte olfactive et codage temporel", 
"Par le système limbique en exerçant une influence sur le système endocrinien",
  "Perte de l’olfaction", 
  "Le Grand Bleu, James Bond", 
  "Scent Science", 
  "Restaurants, boulangeries, magasin de chaussures (fausses odeurs)", 
  "Perception de l’équilibre et de la position", 
"Intéroceptive (vicérale) et proprioceptive (posturale)",
"Émotions et homéostasie", 
  "Position relative, déterminé par les propriocepteurs (dans les muscles, tendons, ligaments et jointures)", 
  "Position et déplacement de la tête", 
  "Organes à otolithes (accleration et inclinaison) et canaux semi-circulaires (rotations)", 
  "Sert a nous approprier l’espace et aide avec la perception de soi et la construction de sens"
  
};  

int rand1 = (int)random(question.length);
int rand2 = (int)random(question.length);
int rand3 = (int)random(question.length);
int rand4 = (int)random(question.length);
int rand5 = (int)random(question.length);
int rand1modif = rand1;
int rand2modif = rand2;
int rand3modif = rand3;
int rand4modif = rand4;
int rand5modif = rand5;
int swap = 0;


void setup() {
  size(800, 700);
  smooth();
  noStroke();
  int swap = (int)random(5);

  for (int i = 1; i < q.length; i++ ) {
    q[i] = 0;
    r[i] = 0;
    bq[i] = 0;
    br[i] = 0;
  }

  for (int i = 1; i < m.length; i++ ) {
    m[i] = i;
  }

  while (rand1 == rand2) {
    rand2 = (int)random(question.length);
  }

  while (rand3 == rand2 || rand3 == rand1) {
    rand3 = (int)random(question.length);
  }

  while (rand4 == rand2 || rand3 == rand4 || rand4 == rand1) {
    rand4 = (int)random(question.length);
  }

  while (rand5 == rand2 || rand3 == rand5 || rand4 == rand5 || rand5 == rand1) {
    rand5 = (int)random(question.length);
  }

  //println(question[1]);
  // println(reponse[1]);
}
void draw() { 

  fill(220);
  rect(0, 0, width, height);

  /*rand1modif = rand2;
   rand2modif = rand3;  
   rand3modif = rand4;
   rand4modif = rand1;
   rand5modif = rand5;
   
   m[1] = 2;
   m[2] = 3;
   m[3] = 4;
   m[4] = 1;
   m[5] = 5;*/

  println(swap);
  if (swap==0) {
    println("zéro");
    rand1modif = rand5;
    rand2modif = rand1;  
    rand3modif = rand4;
    rand4modif = rand3;
    rand5modif = rand2;

    m[1] = 5;
    m[2] = 1;
    m[3] = 4;
    m[4] = 3;
    m[5] = 2;
  }

  if (swap==1) {
    println("un");
    rand1modif = rand2;
    rand2modif = rand3;  
    rand3modif = rand4;
    rand4modif = rand1;
    rand5modif = rand5;

    m[1] = 2;
    m[2] = 3;
    m[3] = 4;
    m[4] = 1;
    m[5] = 5;
  }
  if (swap==2) {
    println("deux");
    rand1modif = rand1;
    rand2modif = rand5; 
    rand3modif = rand2;
    rand4modif = rand3;
    rand5modif = rand4;

    m[1] = 1;
    m[2] = 5;
    m[3] = 2;
    m[4] = 3;
    m[5] = 4;
  }
  if (swap==3) {
    println("trois");
    rand1modif = rand4;
    rand2modif = rand5; 
    rand3modif = rand3;
    rand4modif = rand2;
    rand5modif = rand1;

    m[1] = 4;
    m[2] = 5;
    m[3] = 3;
    m[4] = 2;
    m[5] = 1;
  }
  if (swap==4) {
    println("quatre");
    rand1modif = rand2;
    rand2modif = rand1;
    rand3modif = rand4;
    rand4modif = rand5;
    rand5modif = rand3;

    m[1] = 2;
    m[2] = 1;
    m[3] = 4;
    m[4] = 5;
    m[5] = 3;
  }


  if (etat <=2) {

    // Dessin des blocs

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA1);
      strokeWeight(20);
    }
    fill(couleurQ1);
    rect(10, 10, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA2);
      strokeWeight(20);
    }
    fill(couleurQ2);
    rect(10, 120, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA3);
      strokeWeight(20);
    }
    fill(couleurQ3);
    rect(10, 230, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA4);
      strokeWeight(20);
    }
    fill(couleurQ4);
    rect(10, 340, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA5);
      strokeWeight(20);
    }
    fill(couleurQ5);
    rect(10, 450, 370, 100);

    //------------------------

    stroke(0);
    fill(255);
    rect(10, 560, 200, 75);
    
    textAlign(CENTER);
    textSize(16);
    fill(0);
    text("VÉRIFIER", 20, 570, 200, 80);

    //---------------------

    stroke(0);
    fill(couleurR1);
    rect(420, 10, 370, 100);

    stroke(0);
    fill(couleurR2);
    rect(420, 120, 370, 100);

    stroke(0);
    fill(couleurR3);
    rect(420, 230, 370, 100);

    stroke(0);
    fill(couleurR4);
    rect(420, 340, 370, 100);

    stroke(0);
    fill(couleurR5);
    rect(420, 450, 370, 100);



    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand1], 20, 20, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand2], 20, 130, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand3], 20, 240, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand4], 20, 350, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand5], 20, 460, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand1modif], 420, 20, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand2modif], 420, 130, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand3modif], 420, 240, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand4modif], 420, 350, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand5modif], 420, 460, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(pts, 515, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text("/5", 530, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(pct, 620, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text("/", 630, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(pctt, 640, 600);
  }
}
void mouseReleased() {
  if (etat ==1) {
    if (mouseX >10 && mouseX < 380 && mouseY >10 && mouseY < 110) {
      if (bq[1] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 1;
          bq[1] =5;
          couleurQ1 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 1;
          bq[1] =4;
          couleurQ1 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 1;
          bq[1] =3;
          couleurQ1 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 1;
          bq[1] =2;
          couleurQ1 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 1;
          bq[1] =1;
          couleurQ1 = color(0, 255, 255);
        }
      }
      else {
        if (bq[1] ==1) {
          q[1] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==2) {
          q[2] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==3) {
          q[3] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==4) {
          q[4] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==5) {
          q[5] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >120 && mouseY < 220) {
      if (bq[2] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 2;
          bq[2] =5;
          couleurQ2 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 2;
          bq[2] =4;
          couleurQ2 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 2;
          bq[2] =3;
          couleurQ2 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 2;
          bq[2] =2;
          couleurQ2 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 2;
          bq[2] =1;
          couleurQ2 = color(0, 255, 255);
        }
      }
      else {
        if (bq[2] ==1) {
          q[1] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==2) {
          q[2] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==3) {
          q[3] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==4) {
          q[4] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==5) {
          q[5] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >230 && mouseY < 330) {
      if (bq[3] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 3;
          bq[3] =5;
          couleurQ3 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 3;
          bq[3] =4;
          couleurQ3 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 3;
          bq[3] =3;
          couleurQ3 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 3;
          bq[3] =2;
          couleurQ3 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 3;
          bq[3] =1;
          couleurQ3 = color(0, 255, 255);
        }
      }
      else {
        if (bq[3] ==1) {
          q[1] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==2) {
          q[2] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==3) {
          q[3] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==4) {
          q[4] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==5) {
          q[5] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >340 && mouseY < 440) {
      if (bq[4] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 4;
          bq[4] =5;
          couleurQ4 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 4;
          bq[4] =4;
          couleurQ4 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 4;
          bq[4] =3;
          couleurQ4 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 4;
          bq[4] =2;
          couleurQ4 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 4;
          bq[4] =1;
          couleurQ4 = color(0, 255, 255);
        }
      }
      else {
        if (bq[4] ==1) {
          q[1] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==2) {
          q[2] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==3) {
          q[3] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==4) {
          q[4] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==5) {
          q[5] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >450 && mouseY < 550) {
      if (bq[5] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 5;
          bq[5] =5;
          couleurQ5 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 5;
          bq[5] =4;
          couleurQ5 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 5;
          bq[5] =3;
          couleurQ5 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 5;
          bq[5] =2;
          couleurQ5 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 5;
          bq[5] =1;
          couleurQ5 = color(0, 255, 255);
        }
      }
      else {
        if (bq[5] ==1) {
          q[1] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==2) {
          q[2] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==3) {
          q[3] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==4) {
          q[4] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==5) {
          q[5] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
      }
    }

    //---------------------Réponses

    if (mouseX >420 && mouseX < 790 && mouseY >10 && mouseY < 110) {
      if (br[1] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 1;
          br[1] =5;
          couleurR1 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 1;
          br[1] =4;
          couleurR1 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 1;
          br[1] =3;
          couleurR1 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 1;
          br[1] =2;
          couleurR1 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 1;
          br[1] =1;
          couleurR1 = color(0, 255, 255);
        }
      }
      else {
        if (br[1] ==1) {
          r[1] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==2) {
          r[2] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==3) {
          r[3] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==4) {
          r[4] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==5) {
          r[5] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >120 && mouseY < 220) {
      if (br[2] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 2;
          br[2] =5;
          couleurR2 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 2;
          br[2] =4;
          couleurR2 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 2;
          br[2] =3;
          couleurR2 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 2;
          br[2] =2;
          couleurR2 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 2;
          br[2] =1;
          couleurR2 = color(0, 255, 255);
        }
      }
      else {
        if (br[2] ==1) {
          r[1] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==2) {
          r[2] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==3) {
          r[3] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==4) {
          r[4] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==5) {
          r[5] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >230 && mouseY < 330) {
      if (br[3] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 3;
          br[3] =5;
          couleurR3 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 3;
          br[3] =4;
          couleurR3 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 3;
          br[3] =3;
          couleurR3 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 3;
          br[3] =2;
          couleurR3 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 3;
          br[3] =1;
          couleurR3 = color(0, 255, 255);
        }
      }
      else {
        if (br[3] ==1) {
          r[1] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==2) {
          r[2] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==3) {
          r[3] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==4) {
          r[4] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==5) {
          r[5] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >340 && mouseY < 440) {
      if (br[4] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 4;
          br[4] =5;
          couleurR4 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 4;
          br[4] =4;
          couleurR4 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 4;
          br[4] =3;
          couleurR4 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 4;
          br[4] =2;
          couleurR4 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 4;
          br[4] =1;
          couleurR4 = color(0, 255, 255);
        }
      }
      else {
        if (br[4] ==1) {
          r[1] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==2) {
          r[2] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==3) {
          r[3] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==4) {
          r[4] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==5) {
          r[5] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >450 && mouseY < 550) {
      if (br[5] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 5;
          br[5] =5;
          couleurR5 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 5;
          br[5] =4;
          couleurR5 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 5;
          br[5] =3;
          couleurR5 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 5;
          br[5] =2;
          couleurR5 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 5;
          br[5] =1;
          couleurR5 = color(0, 255, 255);
        }
      }
      else {
        if (br[5] ==1) {
          r[1] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==2) {
          r[2] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==3) {
          r[3] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==4) {
          r[4] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==5) {
          r[5] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
      }
    }
  }

  //---vérifie

  if (mouseX >10 && mouseX < 210 && mouseY >560 && mouseY < 635) {
    if (etat ==2) { 
      etat =3;
    }
    if (etat ==1) { 
      couleurA1 = color(255, 0, 0);
      couleurA2 = color(255, 0, 0);
      couleurA3 = color(255, 0, 0);
      couleurA4 = color(255, 0, 0);
      couleurA5 = color(255, 0, 0);
      etat =2;
      if (q[1]==m[r[1]]) {
        pts += 1;
        println("q1");

        if (bq[1] == 1) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 1) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 1) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 1) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 1) {
          couleurA5 = color(0, 255, 0);
        }
      }
      if (q[2]==m[r[2]]) {
        pts += 1;
        println("q2");
        if (bq[1] == 2) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 2) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 2) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 2) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 2) {
          couleurA5 = color(0, 255, 0);
        }
      }

      if (q[3]==m[r[3]]) {
        pts += 1;
        println("q3");
        if (bq[1] == 3) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 3) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 3) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 3) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 3) {
          couleurA5 = color(0, 255, 0);
        }
      }

      if (q[4]==m[r[4]]) {
        pts += 1;
        println("q4");
        if (bq[1] == 4) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 4) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 4) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 4) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[4] == 4) {
          couleurA5 = color(0, 255, 0);
        }
      }

      if (q[5]==m[r[5]]) {
        pts += 1;
        println("q5");
        if (bq[1] == 5) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 5) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 5) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 5) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 5) {
          couleurA5 = color(0, 255, 0);
        }
      }
      pct += pts;
      pctt += 5;
    } 
    if (etat ==3) { 
      pts = 0;
      etat =1;
      swap = (int)random(5);

      for (int i = 1; i < q.length; i++ ) {
        q[i] = 0;
        r[i] = 0;
        bq[i] = 0;
        br[i] = 0;
      }

      for (int i = 1; i < m.length; i++ ) {
        m[i] = i;
      }

      while (rand1 == rand2) {
        rand2 = (int)random(question.length);
      }

      while (rand3 == rand2 || rand3 == rand1) {
        rand3 = (int)random(question.length);
      }

      while (rand4 == rand2 || rand3 == rand4 || rand4 == rand1) {
        rand4 = (int)random(question.length);
      }

      while (rand5 == rand2 || rand3 == rand5 || rand4 == rand5 || rand5 == rand1) {
        rand5 = (int)random(question.length);
      }


      rand1 = (int)random(question.length);
      rand2 = (int)random(question.length);
      rand3 = (int)random(question.length);
      rand4 = (int)random(question.length);
      rand5 = (int)random(question.length);
      rand1modif = rand1;
      rand2modif = rand2;
      rand3modif = rand3;
      rand4modif = rand4;
      rand5modif = rand5;
      couleurQ1 = color(255, 255, 255);
      couleurQ2 = color(255, 255, 255);
      couleurQ3 = color(255, 255, 255);
      couleurQ4 = color(255, 255, 255);
      couleurQ5 = color(255, 255, 255);
      couleurR1 = color(255, 255, 255);
      couleurR2 = color(255, 255, 255);
      couleurR3 = color(255, 255, 255);
      couleurR4 = color(255, 255, 255);
      couleurR5 = color(255, 255, 255);

      for (int i = 1; i < q.length; i++ ) {
        q[i] = 0;
        r[i] = 0;
        bq[i] = 0;
        br[i] = 0;
      }

      for (int i = 1; i < m.length; i++ ) {
        m[i] = i;
      }

      while (rand1 == rand2) {
        rand2 = (int)random(question.length);
      }

      while (rand3 == rand2 || rand3 == rand1) {
        rand3 = (int)random(question.length);
      }

      while (rand4 == rand2 || rand3 == rand4 || rand4 == rand1) {
        rand4 = (int)random(question.length);
      }

      while (rand5 == rand2 || rand3 == rand5 || rand4 == rand5 || rand5 == rand1) {
        rand5 = (int)random(question.length);
      }
    }
  }
}
