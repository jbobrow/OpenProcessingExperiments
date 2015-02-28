
int monsterX;
int monsterY;
int richting;
int kleur;
int teller;
boolean test;

void setup() {
  size(500,500);
  monsterX = 150;
  monsterY = 150;
  richting = 10;
  kleur = 0;
  teller = 5;
}

void draw() {
  for(int i = 0; i < 5; i++) {
    kleur = kleur + i;
  }
  if(kleur >= 255) {
    kleur = 0;
  }
  background(kleur);
  rectMode(CENTER);
  stroke(0);
  
  /* Antenne */
  if(test == true) {
  fill(0);
  } else {
  fill(255,10,0);
  }
  ellipse(monsterX,monsterY,10,10); //220 194
  fill(0);
  rect(monsterX,monsterY+16,1,20); //220 210
  /* Lijf */
  if(test == true) {
  fill(0);
  } else {
  fill(255,245,5);
  }
  rect(monsterX+30,monsterY+56,100,60); //250 250
  if(test == true) {
  fill(0);
  } else {
  fill(180,180,180);
  }
  rect(monsterX+30,monsterY+116,40,60); //250 310
  /* Armen */
  line(monsterX+10,monsterY+106,monsterX+30,monsterY+126); //230 300 250 320
  line(monsterX+50,monsterY+106,monsterX+70,monsterY+126); //270 300 290 320
  /* Benen */
  line(monsterX+10,monsterY+146,monsterX+10,monsterY+176); //230 340 230 370
  line(monsterX+50,monsterY+146,monsterX+50,monsterY+176); //270 340 270 370
  /* Ogen */
  if(test == true) {
  fill(0);
  } else {
  fill(0,100,255);
  }
  ellipse(monsterX+10,monsterY+46,12,12); //230 240
  if(test == true) {
  fill(0);
  } else {
  fill(0,100,255);
  }
  ellipse(monsterX+40,monsterY+46,10,10); //260 240
  
  monsterX = monsterX + richting;
  if(monsterX > 500 || monsterX < 0){
    richting = -richting;
    teller++;
  }
  
  if(teller == 10) {
    teller = 0;
    test = !test;
  }
}
