
PFont typo;
boolean ouinon;
int laquelle, decompte, aleatoire, width, height, cumul, coups, compteur, aaa, a_tester, table_de, table_a;
float cActif, cPassif, cNeutre;
int[] resultats = new int[9];
String[] temps = new String[10];

void setup()
{
  width = 600;
  height = 450;
  size(600, 450);
  colorMode(HSB, 1);
  background(0);
  smooth();
  typo = createFont("Courier", 32);
  textAlign(CENTER);
  textFont(typo);
  laquelle = 21;
  for (int i = 0; i < 10; i = i+1) {
    temps[i] = " à faire";
  }
  cumul = 0;
  coups = 0;
  cPassif = random(1);
  cActif = random(1);
  cNeutre = random(1);
  table_de = 20;
  table_a = 20;
}

void draw()
{
  background(0);
  if (laquelle == 21) {
    lesquelles();
  } 
  else if (laquelle == 11) {
    menu();
  }
  else {
    if (ouinon == true) {
      propose();
    }
    else {
      exo();
    }
  }
}

void lesquelles()
{
  textFont(typo, height/15);
  fill(cNeutre, .33, .75);
  if (table_de == 20) {
    text( "Faire les tables de", width/2, height/3.3);
    textFont(typo, height/9);
    for (int i = 0; i < 10; i = i+1) {
      if (mouseX > 25+i*(width-50)/11 && mouseX < 25+(i+1)*(width-50)/11) {
        a_tester = i;
        fill(cActif, 1, 1);
      }
      else {
        fill(cPassif, .33, .66);
      }
      text( i, 50+i*(width-50)/11, height/2.22);
    }
  } else {
    text( "Faire les tables de "+ table_de + " à ", width/2, height/3.3);
    textFont(typo, height/9);
    for (int i = table_de; i < 10; i = i+1) {
      if (mouseX > 25+(i-table_de/2)*(width-50)/11 && mouseX < 25+((i-table_de/2)+1)*(width-50)/11) {
        a_tester = i+20;
        fill(cActif, 1, 1);
      }
      else {
        fill(cPassif, .33, .66);
      }
      text( i, 50+(i-table_de/2)*(width-50)/11, height/2.22);
    }
  }
}

void menu()
{
  for (int i = table_de; i < table_a; i = i+1) {
    textFont(typo, height/15);
    if (mouseY > i*height/12 && mouseY < (i+1)*height/12) {
      a_tester = i;
      fill(cActif, 1, 1);
    }
    else {
      fill(cPassif, .33, .66);
    }
    text("table de "+ i + temps[i], width/2, (height/12)*(i+0.8));
  }
  fill(cNeutre, .33, .75);
  if (coups == 0)
  {
    textFont(typo, height/15);
    text("Au boulot, mon coco!", width/2, (height/12)*11.7);
  }
  else {
    textFont(typo, height/20);
    text(floor(cumul/60) + " mn. et " + (cumul-floor(cumul/60)*60) + " sec. (" + nf(cumul/(coups*12),1,2) + "sec. par réponse)", width/2, (height/12)*(11.8));
  }
}

void exo()
{
  fill(cNeutre, .33, .75);
  textFont(typo, height/20);
  aaa = second()+minute()*60+hour()*3600-compteur;
  text( floor(aaa/60) + " mn. et " + (aaa-floor(aaa/60)*60) + " sec.", width/2, height/15);
  for (int i = decompte; i > 0; i = i - 1) {
    ellipse((width/decompte)*i-width/(decompte*2), height/8, height/48, height/48);
  }
  textFont(typo, height/5);
  text(aleatoire + "x" + laquelle, width/2, height/3);
  textFont(typo, height/8);
  for (int i = 0; i < 3; i = i + 1) {
    for (int j = 0; j < 3; j = j + 1) {
      if (mouseX > width/5*(i+1) && mouseX < width/5*(i+2) && mouseY > height/5*(j+2) && mouseY < height/5*(j+3)) {
        fill(cActif, 1, 1);
        a_tester=i+3*j;
      }
      else {
        fill(cPassif, .33, .66);
      }
      text(resultats[i+3*j], width/5*(i+1.5), height/5*(j+2.5));
    }
  }
}

void propose()
{
  aleatoire = int(random(11));
  for (int i = 0; i < 9; i = i + 1) {
    resultats[i] = int(random(101));
  }
  resultats[int(random(9))] = min(aleatoire*laquelle+10, 100);
  resultats[int(random(9))] = max(aleatoire*laquelle-10, 0);
  resultats[int(random(9))] = min(aleatoire*laquelle+5, 100);
  resultats[int(random(9))] = max(aleatoire*laquelle-5, 0);
  resultats[int(random(9))] = min(aleatoire*laquelle+1, 100);
  resultats[int(random(9))] = max(aleatoire*laquelle-1, 0);
  resultats[int(random(9))] = min(aleatoire*laquelle+2, 100);
  resultats[int(random(9))] = max(aleatoire*laquelle-2, 0);
  resultats[int(random(9))] = min((aleatoire+1)*laquelle, 100);
  resultats[int(random(9))] = max((aleatoire-1)*laquelle, 0);
  for (int i = 0; i < 9; i = i + 1) {
    for (int j = 0; j < 9; j = j + 1) {
      if (resultats[i] == resultats[j]) {
        resultats[i] = int(random(101));
      }
    }
  }
  resultats[int(random(9))] = aleatoire*laquelle;
  ouinon = false;
  decompte = decompte - 1;
  a_tester = 20;
}

void mousePressed() {
  if (laquelle != 11 && a_tester != 20) {
    if (resultats[a_tester] == aleatoire*laquelle) {
      if (decompte == 1) {
        temps[laquelle] = " en " + floor(aaa/60) + " mn. et " + (aaa-floor(aaa/60)*60) + " sec.";
        coups =  coups + 1;
        cumul = cumul + aaa;
        laquelle = 11;
        a_tester = 20;
      }
      else {
        ouinon = true;
      }
    }
    else {
      decompte = min(15, decompte + 1);
    }
  }
  if (laquelle == 11 && a_tester != 20) {
    decompte = 13;
    ouinon = true;
    laquelle = a_tester;
    compteur = second()+minute()*60+hour()*3600;
  }
  if (laquelle == 21 && a_tester != 20) {

    if (a_tester > 20) {
      table_a = a_tester-19;
    } 
    else {
      table_de = a_tester;
    }
    if (table_de != 20 && table_a != 20) {
      laquelle = 11;
    }
    ouinon = true;
  }
}

