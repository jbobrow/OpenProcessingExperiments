
PFont font;
boolean ouinon;
int laquelle, decompte, aleatoire, sizeX, sizeY, cumul, coups, compteur, aaa, a_tester;
int[] resultats = new int[9];
String[] temps = new String[11];

void setup() 
{
  sizeX = 800;//screen.width;
  sizeY = 600;//screen.height;
  size(sizeX, sizeY);
  background(0);
  smooth();
  font = loadFont("Courier-Bold-120.vlw");
  textAlign(CENTER);
  textFont(font, 32);
  laquelle = 11;
  for (int i = 0; i < 11; i = i+1) {
    temps[i] = " à faire";
  }
  cumul = 0;
  coups = 0;
} 

void draw()
{ 
  background(0);

  if(laquelle == 11) {
    menu();
  } 
  else {
    if(ouinon == true) {
      propose();
    } 
    else {
      exo();
    }
  }
}

void menu()
{
  for (int i = 0; i < 11; i = i+1) {
    textFont(font, sizeY/15);
    if(mouseY > i*sizeY/12 && mouseY < (i+1)*sizeY/12) {
      a_tester = i;
      fill(255);
    } 
    else {
      fill(10+random(10)+i*2,random(10)+30-i*2,60);
    }
    text("table de "+ i + temps[i], sizeX/2, (sizeY/12)*(i+0.8));
  }
  fill(random(90),255,random(90));
  if (coups == 0)
  {
    textFont(font, sizeY/15);
    text("Au boulot, mon coco!", sizeX/2, (sizeY/12)*11.7);
  } 
  else {
    textFont(font, sizeY/20);
    text(cumul/60 + " mn. et " + (cumul-cumul/60*60) + " sec. (" + cumul/(coups*20) + "sec. par réponse)", sizeX/2, (sizeY/12)*(11.8));
  }
}

void exo()
{
  fill(255);
  textFont(font, sizeY/20);
  aaa = second()+minute()*60+hour()*3600-compteur;
  text(aaa/60 + " mn. et " + max(aaa-aaa/60*60,0) + " sec.", sizeX/2, sizeY/15);
  for (int i = decompte; i > 0; i = i - 1) {
    ellipse((sizeX/decompte)*i-sizeX/(decompte*2),sizeY/8,sizeY/48,sizeY/48);
  }
  textFont(font, sizeY/5);
  text(aleatoire + "x" + laquelle, sizeX/2, sizeY/3);
  textFont(font, sizeY/8);
  for (int i = 0; i < 3; i = i + 1) {
    for (int j = 0; j < 3; j = j + 1) {
      if(mouseX > sizeX/5*(i+1) && mouseX < sizeX/5*(i+2) && mouseY > sizeY/5*(j+2) && mouseY < sizeY/5*(j+3)) {
        fill(random(90),255,random(90));
        a_tester=i+3*j;
      } 
      else {
        fill(10+random(10)+i*2,random(20)+30-i*2,60);
      }
      text(resultats[i+3*j], sizeX/5*(i+1.5), sizeY/5*(j+2.5));
    }
  }
}

void propose()
{
  aleatoire = int(random(11));
  for (int i = 0; i < 9; i = i + 1) {
    resultats[i] = int(random(101));
  }
  resultats[int(random(9))] = min(aleatoire*laquelle+10,100);
  resultats[int(random(9))] = max(aleatoire*laquelle-10,0);
  resultats[int(random(9))] = min(aleatoire*laquelle+5,100);
  resultats[int(random(9))] = max(aleatoire*laquelle-5,0);
  resultats[int(random(9))] = min(aleatoire*laquelle+1,100);
  resultats[int(random(9))] = max(aleatoire*laquelle-1,0);
  resultats[int(random(9))] = min(aleatoire*laquelle+2,100);
  resultats[int(random(9))] = max(aleatoire*laquelle-2,0);
  resultats[int(random(9))] = min((aleatoire+1)*laquelle,100);
  resultats[int(random(9))] = max((aleatoire-1)*laquelle,0);
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
  if(laquelle != 11 && a_tester != 20) {
    if(resultats[a_tester] == aleatoire*laquelle) {
      if(decompte == 1) {
        temps[laquelle] = " en " + aaa/60 + " mn. et " + max(aaa-aaa/60*60,0) + " sec.";
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
      decompte = min(20,decompte + 1);
    }
  }
  if(laquelle == 11 && a_tester != 20) {
    decompte = 21;
    ouinon = true;
    laquelle = a_tester;
    compteur = 1+second()+minute()*60+hour()*3600;
  }
}

