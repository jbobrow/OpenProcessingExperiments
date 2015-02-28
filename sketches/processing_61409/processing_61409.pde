
PImage a;
PFont font;
int damageBonus;
int [] statRoll= { 
  int(random(3, 19)), int(random(3, 19)), int(random(3, 19)), int(random(3, 19)), int(random(3, 19)), int(random(3, 19))
};

int[]intelSizeStat= {
  int(random(2, 7)), int(random(2, 7)), int(random(2, 7)), int(random(2, 7)),
};

void setup () {
  size (998, 1200);
  a=loadImage ("CallCthulu CharSheet.png");
  //println (statRoll);
  println (intelSizeStat);
}

void draw() {
  image (a, 0, 0, width, height);
  font=loadFont ("PrestigeEliteStd-Bd-48.vlw");
  stats();
}

void stats () {
  damageBonus= statRoll[0]+((intelSizeStat[1]+intelSizeStat[2])+6);
  stroke(0);
  fill(0);
  textSize (18);
  text (statRoll[0], 622, 88);//str
  text (statRoll[1], 722, 88);//dex
  text (statRoll[2], 622, 118);//con
  text (statRoll[3], 722, 118);//app
  text (statRoll[4], 822, 118);//pow
  text (statRoll[4]*6, 722, 153);//san
  text (statRoll[5]+3, 822, 153);//edu
  text ((statRoll[5]+3)*5, 922, 153);//know
  text (statRoll[4]*5, 922, 118);//luck
  text((intelSizeStat[0]+intelSizeStat[1])+6, 822, 88);//int
  text((intelSizeStat[1]+intelSizeStat[2])+6, 622, 153);//siz
  text(((intelSizeStat[0]+intelSizeStat[1])+6)*5, 922, 88);//idea
  fill (255);
  text (statRoll[4], 722, 238);//magic points
  text ((((intelSizeStat[1]+intelSizeStat[2])+6)+statRoll[2])/2, 925, 238);//hit points
  text (statRoll[4]*5, 400, 238);//sanity points
  fill (0); 
  if (damageBonus<=12) {
    text ("-1D6", 900, 190);
  }
  if (damageBonus>12&&damageBonus<=16) {
    text ("-1D4", 900, 190);
  }
      if (damageBonus>16&&damageBonus<=24) {
    text ("0", 900, 190);
  }
      if (damageBonus>24&&damageBonus<=32) {
    text ("+1D4", 900, 190);
  }
      if (damageBonus>32&&damageBonus<=40) {
    text ("+1D6", 900, 190);
  }
}


