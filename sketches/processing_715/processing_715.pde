
// faites le plein de serpents - par Guigui 8^)
// http://www.contextfreeart.org/gallery/view.php?by=Guigui
//***************************************************************************************
Module[] mods;
int[] divisions    = {int(random(15,90)),int(random(15,45))};
int[] surface      = {600,300};
int[] ofset_zone   = {10,10};
int[] zone         = {surface[0]-20,surface[1]-20};
float[] obj_taille = {zone[0]/float(divisions[0]),zone[1]/float(divisions[1])};
int tete           = int(random(divisions[0]*divisions[1]));
int direction      = 1+int(random(4));
int base_charge    = int(random(3,15));
float colorandom   = random(1);
color C_neutre, C_serpent, C_fruit;
//***************************************************************************************
void setup()
{
  size(600,300); //(surface[0],surface[1]);
  colorMode(HSB,1);
  frameRate(12);
  smooth();
  noStroke();
  mods = new Module[divisions[0]*divisions[1]];
  for (int i = 0 ; i < divisions[0]; i++) {
    for (int j = 0 ; j < divisions[1]; j++) {
      mods[i+j*divisions[0]] = new Module(i,j);  
    }
  }
  C_neutre  = color(colorandom,min(random(2),1),min(random(2),1));
  C_serpent = color(colorandom+1.0/3-floor(colorandom+1.0/3),1,1);
  C_fruit   = color(colorandom+2.0/3-floor(colorandom+2.0/3),1,1);
}
//***************************************************************************************
void draw()
{
  background(0);
  int iii=0;
  switch(direction) {
  case 1:
    tete = tete - divisions[0];
    if (tete < 0) {
      tete = tete + mods.length;
    }
    break;
  case 2:
    while(iii<tete) {
      iii = iii + divisions[0];
    }
    tete = tete + 1;
    if (tete == iii) {
      tete = tete - divisions[0];
    }
    break;
  case 3:
    while(iii <= tete-divisions[0]) {
      iii = iii + divisions[0];
    }
    if (tete == iii) {
      tete = tete + divisions[0];
    }
    tete = tete - 1;
    break;
  case 4:
    tete = tete + divisions[0];
    if (tete >= mods.length) {
      tete = tete - mods.length;
    }
    break;
  default:
    break;
  }
  for(int i=0; i < mods.length; i++) {
    mods[i].schtroumpf();
  }
}
//***************************************************************************************
class Module {
  float xxx, yyy, nnn;
  int charge;
  Module(int ii, int jj) {
    xxx = ofset_zone[0] + ii*obj_taille[0];
    yyy = ofset_zone[1] + jj*obj_taille[1];
    nnn = ii+jj*divisions[0];
    if (random(100) > 90) {
      charge = 200;
    } 
    else {
      charge = 0;
    }
  }
  void schtroumpf() {
    if(tete == nnn) {
      if(charge == 200) {
        base_charge = base_charge + 1;
      } else if (charge > 0){
        direction = 0;         //       dead  °..°  mort
      }
      charge = base_charge;
    } 
    else if (charge <= base_charge) {
      charge = max (charge-1, 0);
    } 
    if(charge == 0) {
      fill(C_neutre);
    } 
    else if (charge <= base_charge) { 
      fill(C_serpent);
    } 
    else {
      fill(C_fruit);
    } 
    rect(xxx, yyy, obj_taille[0]-1, obj_taille[1]-1);
  }
}
//***************************************************************************************
void keyPressed() 
{
  if (direction != 0) {
    switch(keyCode) {
    case UP: 
      if (direction != 4) {
        direction = 1;
      }
      break;
    case RIGHT: 
      if (direction != 3) {
        direction = 2;
      }
      break;
    case LEFT: 
      if (direction != 2) {
        direction = 3;
      }
      break;
    case DOWN: 
      if (direction != 1) {
        direction = 4;
      }
      break;
    default:
      break;
    }
  }
}

