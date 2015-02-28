
//Max Perim 
//2012
//selection sort from Christopher Warnow from openprocessing community

PFont font; 
boolean   bool1=true, bool2=true, bool3=true, bool4 = true, bool5=true, bool6=true, bool7=true, bool8=true, bool9=true, bool10=true, bool11=true;
float d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11;
int buttw, butth, dr1, dr2, dr3, dr4, dr5, dr6, s1, s2, s3, s4, s5, s6;
int mainStep = 0;
int mainY=0;
PImage a;
//Stat Array 
int [] statRoll= {
  int(random(1, 5)), int(random(1, 5)), int(random(1, 5)), int(random(1, 5)), int(random(1, 5)), int(random(1, 5))
};
//Base Attack Bonus, Saving Throws, and Hit Die (last)
int [] barbarian= {
  1, 2, 0, 0, 12
};
int [] bard= {
  0, 0, 2, 2, 8
};
int [] cleric= {
  0, 2, 0, 2, 8
};
int [] druid= {
  0, 2, 0, 2, 8
};
int [] fighter= {
  1, 2, 0, 0, 10
};
int [] monk= {
  0, 2, 2, 2, 8
};
int [] paladin= {
  1, 2, 0, 2, 10
};
int [] ranger= {
  1, 2, 2, 0, 10
};
int [] rogue= {
  0, 0, 2, 0, 8
};
int [] sorcerer= {
  0, 0, 0, 2, 6
};
int [] wizard= {
  0, 0, 0, 2, 6
};


void setup( )
{
  size( 927, 1200 );
  smooth ();
  buttw=butth=25;
  doSort();
  a=loadImage("CharSheet.png");
  background (255);
}

void draw() 
{
  noStroke();
  if (bool1==true&& bool2==true&& bool3==true&& bool4==true&& bool5==true&& bool6==true&& bool7==true&& bool8==true&& bool9==true&& bool10==true&& bool11==true) {
    phase();
  }
}
void phase() {
  font= loadFont("LucidaBlackletter-48.vlw");
  stroke(0);
  fill (0);
  textAlign (CENTER);
  textFont (font);
  text ("Choose your adventurer:", width/2, 50);
  textSize(32);
  text ("Barbarian", width/2, 125);
  noFill();
  ellipse ((width/2)-100, 115, buttw, butth);
  fill (0);
  text ("Bard", width/2, 175);
  noFill();
  ellipse ((width/2)-75, 165, buttw, butth);
  fill (0);
  text ("Cleric", width/2, 225);
  noFill();
  ellipse ((width/2)-75, 215, buttw, butth);
  fill (0);
  text ("Druid", width/2, 275);
  noFill();
  ellipse ((width/2)-75, 265, buttw, butth);
  fill (0);
  text ("Fighter", width/2, 325);
  noFill();
  ellipse ((width/2)-75, 315, buttw, butth);
  fill (0);
  text ("Monk", width/2, 375);
  noFill();
  ellipse ((width/2)-75, 365, buttw, butth);
  fill (0);
  text ("Paladin", width/2, 425);
  noFill();
  ellipse ((width/2)-75, 415, buttw, butth);
  fill (0);
  text ("Ranger", width/2, 475);
  noFill();
  ellipse ((width/2)-75, 465, buttw, butth);
  fill (0);
  text ("Rogue", width/2, 525);
  noFill();
  ellipse ((width/2)-75, 515, buttw, butth);
  fill (0);
  text ("Sorcerer", width/2, 575);
  noFill();
  ellipse ((width/2)-75, 565, buttw, butth);
  fill (0);
  text ("Wizard", width/2, 625);
  noFill();
  ellipse ((width/2)-75, 615, buttw, butth);
  fill (0);
  //scroll over to make words bigger
}

void phase2() {
  image(a, 0, 0, width, height);
}

void mousePressed() {
  //barbarian
  d1=dist((width/2)-100, 115, mouseX, mouseY);
  if ((d1<=buttw/2)&&(bool1=bool1)) {
    image(a, 0, 0, width, height);
    barbarian();
    bool1 = !bool1;
  }
  //bard
  d2=dist((width/2)-75, 165, mouseX, mouseY);
  if ((d2<=buttw/2)&&(bool2=bool2)) {
    image(a, 0, 0, width, height);
    bard();
    bool2 = !bool2;
  }
  //cleric
  d3=dist((width/2)-75, 215, mouseX, mouseY);
  if ((d3<=buttw/2)&&(bool3=bool3)) {
    image(a, 0, 0, width, height);
    cleric();
    bool3 = !bool3;
  }
  //druid
  d4=dist((width/2)-75, 265, mouseX, mouseY);
  if ((d4<=buttw/2)&&(bool4=bool4)) {
    image(a, 0, 0, width, height);
    druid();
    bool4 = !bool4;
  }
  //fighter
  d5=dist((width/2)-75, 315, mouseX, mouseY);
  if ((d5<=buttw/2)&&(bool5=bool5)) {
    image(a, 0, 0, width, height);
    fighter();
    bool5 = !bool5;
  }
  //monk
  d6=dist((width/2)-75, 365, mouseX, mouseY);
  if ((d6<=buttw/2)&&(bool6=bool6)) {
    image(a, 0, 0, width, height);
    monk();
    bool6 = !bool6;
  }
  //paladin
  d7=dist((width/2)-75, 415, mouseX, mouseY);
  if ((d7<=buttw/2)&&(bool7=bool7)) {
    image(a, 0, 0, width, height);
    paladin();
    bool7 = !bool7;
  }
  //ranger
  d8=dist((width/2)-75, 465, mouseX, mouseY);
  if ((d8<=buttw/2)&&(bool8=bool8)) {
    image(a, 0, 0, width, height);
    ranger();
    bool8 = !bool8;
  }
  //rogue
  d9=dist((width/2)-75, 515, mouseX, mouseY);
  if ((d9<=buttw/2)&&(bool9=bool9)) {
    image(a, 0, 0, width, height);
    rogue();
    bool9 = !bool9;
  }
  //sorcerer
  d10=dist((width/2)-75, 565, mouseX, mouseY);
  if ((d10<=buttw/2)&&(bool10=bool10)) {
    image(a, 0, 0, width, height);
    sorcerer();
    bool10 = !bool10;
  }
  //wizard
  d11=dist((width/2)-75, 615, mouseX, mouseY);
  if ((d11<=buttw/2)&&(bool11=bool11)) {
    image(a, 0, 0, width, height);
    wizard();
    bool11 = !bool11;
  }
}

void doSort() {
  mainY=0;
  mainStep=0;
  selectionSort (statRoll);
  println (statRoll);
}
public void selectionSort(int[] arr) {
  int i, j, minIndex, tmp;
  int n = arr.length;
  for (i = 0; i < n - 1; i++) {
    minIndex = i;
    for (j = i + 1; j < n; j++)
      if (arr[j] < arr[minIndex])
        minIndex = j;
    if (minIndex != i) {
      tmp = arr[i];
      arr[i] = arr[minIndex];
      arr[minIndex] = tmp;
      if (mainStep++%2==0) drawArray(arr);
    }
  }
}
void drawArray(int[] array) {
  for (int i=0;i<array.length;i++) {
    stroke(array[i]);
    line(i, mainY, i, mainY+1);
  }
  mainY++;
}
void drawArraySaves(int[]array) {
  int a=0;
  for (int i=0;i<array.length;i++) {
    a=barbarian[i];
  }
}

void barbarian() {
  textSize(18);
  //stat rolls
  text (statRoll[5], 180, 203);
  text (statRoll[4], 180, 230);
  text (statRoll[3], 180, 256);
  text (statRoll[0], 180, 281);
  text (statRoll[1], 180, 307);
  text (statRoll[2], 180, 335);
  //AC dex mod
  text( statRoll[4], 300, 380);
  //initiative dex mod
  text (statRoll[3], 430, 335);
  //Fort Save
  text(statRoll[3], 274, 472);
  text (barbarian[1], 234, 472);
  text((barbarian[1]+statRoll[3]), 194, 472);
  //Ref Save
  text (statRoll [4], 274, 498);
  text (barbarian[2], 234, 498);
  text((barbarian[2]+statRoll[4]), 194, 498);
  //Will Save
  text (statRoll [1], 274, 524);
  text (barbarian[3], 234, 524);
  text((barbarian[3]+statRoll[1]), 194, 524);
  //BAB
  text (barbarian[0], 300, 565);
  //CMB
  text (barbarian[0], 295, 605);
  text (statRoll [5], 345, 605);
  text ('0', 400, 607);
  text (barbarian[0]+statRoll [5], 225, 605);
  //health
  text (barbarian [4]+statRoll[3], 390, 193); 
  // skills
  text (statRoll [4], 760, 311);
  text (statRoll [0], 760, 331);
  text (statRoll [2], 760, 349);
  text (statRoll [5], 760, 365);
  text (statRoll [0], 760, 383);
  text (statRoll [0], 760, 401);
  text (statRoll [0], 760, 419);
  text (statRoll [2], 760, 435);
  text (statRoll [0], 760, 454);
  text (statRoll [2], 760, 469);
  text (statRoll [4], 760, 487);
  text (statRoll [4], 760, 505);
  text (statRoll [2], 760, 524);
  text (statRoll [1], 760, 541);
  text (statRoll [2], 760, 558);
  text (statRoll [0], 760, 576);
  text (statRoll [0], 760, 593);
  text (statRoll [0], 760, 609);
  text (statRoll [0], 760, 627);
  text (statRoll [0], 760, 645);
  text (statRoll [0], 760, 662);
  text (statRoll [0], 760, 680);
  text (statRoll [0], 760, 697);
  text (statRoll [0], 760, 714);
  text (statRoll [0], 760, 729);
  text (statRoll [0], 760, 747);
  text (statRoll [1], 760, 765);
  text (statRoll [2], 760, 783);
  text (statRoll [1], 760, 799);
  text (statRoll [1], 760, 817);
  text (statRoll [1], 760, 835);
  text (statRoll [4], 760, 850);
  text (statRoll [1], 760, 869);
  text (statRoll [4], 760, 883);
  text (statRoll [4], 760, 900);
  text (statRoll [4], 760, 918);
  text (statRoll [1], 760, 936);
  text (statRoll [4], 760, 954);
  text (statRoll [2], 760, 972);
  //trained skills
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//acrobatics
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//climb
  textSize (12);
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 401);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 419);//craft
  textSize (12);
  text ('x', 500, 522);
  textSize (18);
  text ('3', 860, 520);//handle animal
  textSize (12);
  text ('x', 500, 558);
  textSize (18);
  text ('3', 860, 556);//intimidate
  textSize (12);
  text ('x', 500, 679);
  textSize (18);
  text ('3', 860, 677);//knowledge nature
  textSize (12);
  text ('x', 500, 765);
  textSize (18);
  text ('3', 860, 763);//perception
  textSize (12);
  text ('x', 500, 851);
  textSize (18);
  text ('3', 860, 849);//ride
  textSize (12);
  text ('x', 500, 937);
  textSize (18);
  text ('3', 860, 935);//survival
}
void bard() {
  textSize(18);
  //stat rolls
  text (statRoll[4], 180, 203);
  text (statRoll[2], 180, 230);
  text (statRoll[1], 180, 256);
  text (statRoll[3], 180, 281);
  text (statRoll[0], 180, 307);
  text (statRoll[5], 180, 335);
  //AC dex mod
  text( statRoll[2], 300, 380);
  //initiative dex mod
  text (statRoll[2], 430, 335);
  //Fort Save
  text(statRoll[1], 274, 472);
  text (bard[1], 234, 472);
  text((bard[1]+statRoll[1]), 194, 472);
  //Ref Save
  text (statRoll [2], 274, 498);
  text (bard[2], 234, 498);
  text((bard[2]+statRoll[2]), 194, 498);
  //Will Save
  text (statRoll [0], 274, 524);
  text (bard[3], 234, 524);
  text((bard[3]+statRoll[0]), 194, 524);
  //BAB
  text (bard[0], 300, 565);
  //CMB
  text (bard[0], 295, 605);
  text (statRoll [4], 345, 605);
  text ('0', 400, 607);
  text (bard[0]+statRoll [4], 225, 605);
  //health
  text (bard [4]+statRoll[1], 390, 193); 
  // skills
  text (statRoll [2], 760, 311);
  text (statRoll [3], 760, 331);
  text (statRoll [5], 760, 349);
  text (statRoll [4], 760, 365);
  text (statRoll [3], 760, 383);
  text (statRoll [3], 760, 401);
  text (statRoll [3], 760, 419);
  text (statRoll [5], 760, 435);
  text (statRoll [3], 760, 454);
  text (statRoll [5], 760, 469);
  text (statRoll [2], 760, 487);
  text (statRoll [2], 760, 505);
  text (statRoll [5], 760, 524);
  text (statRoll [0], 760, 541);
  text (statRoll [5], 760, 558);
  text (statRoll [3], 760, 576);
  text (statRoll [3], 760, 593);
  text (statRoll [3], 760, 609);
  text (statRoll [3], 760, 627);
  text (statRoll [3], 760, 645);
  text (statRoll [3], 760, 662);
  text (statRoll [3], 760, 680);
  text (statRoll [3], 760, 697);
  text (statRoll [3], 760, 714);
  text (statRoll [3], 760, 729);
  text (statRoll [3], 760, 747);
  text (statRoll [0], 760, 765);
  text (statRoll [5], 760, 783);
  text (statRoll [0], 760, 799);
  text (statRoll [0], 760, 817);
  text (statRoll [0], 760, 835);
  text (statRoll [2], 760, 850);
  text (statRoll [0], 760, 869);
  text (statRoll [2], 760, 883);
  text (statRoll [2], 760, 900);
  text (statRoll [2], 760, 918);
  text (statRoll [0], 760, 936);
  text (statRoll [2], 760, 954);
  text (statRoll [5], 760, 972);
  //trained skills
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//acrobatics
  textSize (12);
  text ('x', 500, 332);
  textSize (18);
  text ('3', 860, 330);//appraise
  textSize (12);
  text ('x', 500, 350);
  textSize (18);
  text ('3', 860, 348);//bluff
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 437);
  textSize (18);
  text ('3', 860, 434);//diplomacy
  textSize (12);
  text ('x', 500, 471);
  textSize (18);
  text ('3', 860, 468);//disguise
  textSize (12);
  text ('x', 500, 488);
  textSize (18);
  text ('3', 860, 486);//escape artist
  textSize (12);
  text ('x', 500, 558);
  textSize (18);
  text ('3', 860, 556);//intimidate
  textSize (12);
  text ('x', 500, 575);
  textSize (18);
  text ('3', 860, 573);//knowledge arcana
  textSize (12);
  text ('x', 500, 591);
  textSize (18);
  text ('3', 860, 589);//knowledge dungeoneering
  textSize (12);
  text ('x', 500, 608);
  textSize (18);
  text ('3', 860, 606);//knowledge engineering
  textSize (12);
  text ('x', 500, 626);
  textSize (18);
  text ('3', 860, 624);//knowledge geography
  textSize (12);
  text ('x', 500, 643);
  textSize (18);
  text ('3', 860, 641);//knowledge history
  textSize (12);
  text ('x', 500, 661);
  textSize (18);
  text ('3', 860, 659);//knowledge local
  textSize (12);
  text ('x', 500, 679);
  textSize (18);
  text ('3', 860, 677);//knowledge nature
  textSize (12);
  text ('x', 500, 697);
  textSize (18);
  text ('3', 860, 695);//knowledge nobility
  textSize (12);
  text ('x', 500, 713);
  textSize (18);
  text ('3', 860, 711);//knowledge planes
  textSize (12);
  text ('x', 500, 731);
  textSize (18);
  text ('3', 860, 729);//knowledge religion
  textSize (12);
  text ('x', 500, 749);
  textSize (18);
  text ('3', 860, 747);//linguistics
  textSize (12);
  text ('x', 500, 765);
  textSize (18);
  text ('3', 860, 763);//perception
  textSize (12);
  text ('x', 500, 783);
  textSize (18);
  text ('3', 860, 781);//perform
  textSize (12);
  text ('x', 500, 869);
  textSize (18);
  text ('3', 860, 867);//sense motive
  textSize(12);
  text ('x', 500, 887);
  textSize (18);
  text ('3', 860, 885);//sleight of hand
  textSize(12);
  text ('x', 500, 903);
  textSize (18);
  text ('3', 860, 901);//spellcraft
  textSize(12); 
  text ('x', 500, 921);
  textSize (18);
  text ('3', 860, 919);//stealth
  textSize(12);
  text ('x', 500, 972);
  textSize (18);
  text ('3', 860, 970);//use magic device
}
void cleric() {
  textSize(18);
  //stat rolls
  text (statRoll[4], 180, 203);
  text (statRoll[1], 180, 230);
  text (statRoll[3], 180, 256);
  text (statRoll[0], 180, 281);
  text (statRoll[5], 180, 307);
  text (statRoll[2], 180, 335);
  //AC dex mod
  text( statRoll[1], 300, 380);
  //initiative dex mod
  text (statRoll[1], 430, 335);
  //Fort Save
  text(statRoll[3], 274, 472);
  text (cleric[1], 234, 472);
  text((cleric[1]+statRoll[3]), 194, 472);
  //Ref Save
  text (statRoll [1], 274, 498);
  text (cleric[2], 234, 498);
  text((cleric[2]+statRoll[1]), 194, 498);
  //Will Save
  text (statRoll [5], 274, 524);
  text (cleric[3], 234, 524);
  text((cleric [3]+statRoll[5]), 194, 524);
  //BAB
  text (cleric[0], 300, 565);
  //CMB
  text (cleric[0], 295, 605);
  text (statRoll [4], 345, 605);
  text ('0', 400, 607);
  text (cleric[0]+statRoll [4], 225, 605);
  //health
  text (cleric [4]+statRoll[3], 390, 193); 
  // skills
  text (statRoll [1], 760, 311);
  text (statRoll [0], 760, 331);
  text (statRoll [2], 760, 349);
  text (statRoll [4], 760, 365);
  text (statRoll [0], 760, 383);
  text (statRoll [0], 760, 401);
  text (statRoll [0], 760, 419);
  text (statRoll [2], 760, 435);
  text (statRoll [0], 760, 454);
  text (statRoll [2], 760, 469);
  text (statRoll [1], 760, 487);
  text (statRoll [1], 760, 505);
  text (statRoll [2], 760, 524);
  text (statRoll [5], 760, 541);
  text (statRoll [2], 760, 558);
  text (statRoll [0], 760, 576);
  text (statRoll [0], 760, 593);
  text (statRoll [0], 760, 609);
  text (statRoll [0], 760, 627);
  text (statRoll [0], 760, 645);
  text (statRoll [0], 760, 662);
  text (statRoll [0], 760, 680);
  text (statRoll [0], 760, 697);
  text (statRoll [0], 760, 714);
  text (statRoll [0], 760, 729);
  text (statRoll [0], 760, 747);
  text (statRoll [5], 760, 765);
  text (statRoll [2], 760, 783);
  text (statRoll [5], 760, 799);
  text (statRoll [5], 760, 817);
  text (statRoll [5], 760, 835);
  text (statRoll [1], 760, 850);
  text (statRoll [5], 760, 869);
  text (statRoll [1], 760, 883);
  text (statRoll [1], 760, 900);
  text (statRoll [1], 760, 918);
  text (statRoll [5], 760, 936);
  text (statRoll [1], 760, 954);
  text (statRoll [2], 760, 972);
  //trained skills
  textSize (12);
  text ('x', 500, 332);
  textSize (18);
  text ('3', 860, 330);//appraise
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 540);
  textSize (18);
  text ('3', 860, 538);//heal
  textSize (12);
  text ('x', 500, 575);
  textSize (18);
  text ('3', 860, 573);//knowledge arcana
  textSize (12);
  text ('x', 500, 643);
  textSize (18);
  text ('3', 860, 641);//knowledge history
  textSize (12);
  text ('x', 500, 697);
  textSize (18);
  text ('3', 860, 695);//knowledge nobility
  textSize (12);
  text ('x', 500, 713);
  textSize (18);
  text ('3', 860, 711);//knowledge planes
  textSize (12);
  text ('x', 500, 731);
  textSize (18);
  text ('3', 860, 729);//knowledge religion
  textSize (12);
  text ('x', 500, 749);
  textSize (18);
  text ('3', 860, 747);//linguistics
  textSize (12);
  text ('x', 500, 800);
  textSize (18);
  text ('3', 860, 798);//profession
  textSize (12);
  text ('x', 500, 817);
  textSize (18);
  text ('3', 860, 815);//profession
  textSize (12);
  text ('x', 500, 834);
  textSize (18);
  text ('3', 860, 832);//profession
  textSize (12);
  text ('x', 500, 869);
  textSize (18);
  text ('3', 860, 867);//sense motive
  textSize(12);
  text ('x', 500, 903);
  textSize (18);
  text ('3', 860, 901);//spellcraft
}
void druid() {
  textSize(18);
  //stat rolls
  text (statRoll[3], 180, 203);
  text (statRoll[2], 180, 230);
  text (statRoll[1], 180, 256);
  text (statRoll[0], 180, 281);
  text (statRoll[5], 180, 307);
  text (statRoll[4], 180, 335);
  //AC dex mod
  text( statRoll[2], 300, 380);
  //initiative dex mod
  text (statRoll[2], 430, 335);
  //Fort Save
  text(statRoll[1], 274, 472);
  text (druid[1], 234, 472);
  text((druid[1]+statRoll[1]), 194, 472);
  //Ref Save
  text (statRoll [2], 274, 498);
  text (druid[2], 234, 498);
  text((druid[2]+statRoll[2]), 194, 498);
  //Will Save
  text (statRoll [5], 274, 524);
  text (druid[3], 234, 524);
  text((druid[3]+statRoll[5]), 194, 524);
  //BAB
  text (druid[0], 300, 565);
  //CMB
  text (druid[0], 295, 605);
  text (statRoll [3], 345, 605);
  text ('0', 400, 607);
  text (druid[0]+statRoll [3], 225, 605);
  //health
  text (druid [4]+statRoll[1], 390, 193); 
  // skills
  text (statRoll [2], 760, 311);
  text (statRoll [0], 760, 331);
  text (statRoll [4], 760, 349);
  text (statRoll [3], 760, 365);
  text (statRoll [0], 760, 383);
  text (statRoll [0], 760, 401);
  text (statRoll [0], 760, 419);
  text (statRoll [4], 760, 435);
  text (statRoll [0], 760, 454);
  text (statRoll [4], 760, 469);
  text (statRoll [2], 760, 487);
  text (statRoll [2], 760, 505);
  text (statRoll [4], 760, 524);
  text (statRoll [5], 760, 541);
  text (statRoll [4], 760, 558);
  text (statRoll [0], 760, 576);
  text (statRoll [0], 760, 593);
  text (statRoll [0], 760, 609);
  text (statRoll [0], 760, 627);
  text (statRoll [0], 760, 645);
  text (statRoll [0], 760, 662);
  text (statRoll [0], 760, 680);
  text (statRoll [0], 760, 697);
  text (statRoll [0], 760, 714);
  text (statRoll [0], 760, 729);
  text (statRoll [0], 760, 747);
  text (statRoll [5], 760, 765);
  text (statRoll [4], 760, 783);
  text (statRoll [5], 760, 799);
  text (statRoll [5], 760, 817);
  text (statRoll [5], 760, 835);
  text (statRoll [2], 760, 850);
  text (statRoll [5], 760, 869);
  text (statRoll [2], 760, 883);
  text (statRoll [2], 760, 900);
  text (statRoll [2], 760, 918);
  text (statRoll [5], 760, 936);
  text (statRoll [2], 760, 954);
  text (statRoll [4], 760, 972);
  //trained skills
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//climb
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 506);
  textSize (18);
  text ('3', 860, 504);//fly 
  textSize (12);
  text ('x', 500, 522);
  textSize (18);
  text ('3', 860, 520);//handle animal
  textSize (12);
  text ('x', 500, 540);
  textSize (18);
  text ('3', 860, 538);//heal
  textSize (12);
  text ('x', 500, 626);
  textSize (18);
  text ('3', 860, 624);//knowledge geography
  textSize (12);
  text ('x', 500, 679);
  textSize (18);
  text ('3', 860, 677);//knowledge nature
  textSize (12);
  text ('x', 500, 765);
  textSize (18);
  text ('3', 860, 763);//perception
  textSize (12);
  text ('x', 500, 800);
  textSize (18);
  text ('3', 860, 798);//profession
  textSize (12);
  text ('x', 500, 817);
  textSize (18);
  text ('3', 860, 815);//profession
  textSize (12);
  text ('x', 500, 834);
  textSize (18);
  text ('3', 860, 832);//profession
  textSize (12);
  text ('x', 500, 851);
  textSize (18);
  text ('3', 860, 849);//ride
  textSize(12);
  text ('x', 500, 903);
  textSize (18);
  text ('3', 860, 901);//spellcraft
  textSize (12);
  text ('x', 500, 937);
  textSize (18);
  text ('3', 860, 935);//survival
  textSize (12);
  text ('x', 500, 955);
  textSize (18);
  text ('3', 860, 953);//swim
}
void fighter() {
  textSize(18);
  //stat rolls
  text (statRoll[5], 180, 203);
  text (statRoll[3], 180, 230);
  text (statRoll[4], 180, 256);
  text (statRoll[1], 180, 281);
  text (statRoll[0], 180, 307);
  text (statRoll[2], 180, 335);
  //AC dex mod
  text( statRoll[3], 300, 380);
  //initiative dex mod
  text (statRoll[3], 430, 335);
  //Fort Save
  text(statRoll[4], 274, 472);
  text (fighter[1], 234, 472);
  text((fighter[1]+statRoll[4]), 194, 472);
  //Ref Save
  text (statRoll [3], 274, 498);
  text (fighter[2], 234, 498);
  text((fighter[2]+statRoll[3]), 194, 498);
  //Will Save
  text (statRoll [0], 274, 524);
  text (fighter[3], 234, 524);
  text((fighter[3]+statRoll[0]), 194, 524);
  //BAB
  text (fighter[0], 300, 565);
  //CMB
  text (fighter[0], 295, 605);
  text (statRoll [5], 345, 605);
  text ('0', 400, 607);
  text (fighter[0]+statRoll [5], 225, 605);
  //health
  text (fighter [4]+statRoll[4], 390, 193); 
  // skills
  text (statRoll [3], 760, 311);
  text (statRoll [1], 760, 331);
  text (statRoll [2], 760, 349);
  text (statRoll [5], 760, 365);
  text (statRoll [1], 760, 383);
  text (statRoll [1], 760, 401);
  text (statRoll [1], 760, 419);
  text (statRoll [2], 760, 435);
  text (statRoll [1], 760, 454);
  text (statRoll [2], 760, 469);
  text (statRoll [3], 760, 487);
  text (statRoll [3], 760, 505);
  text (statRoll [2], 760, 524);
  text (statRoll [2], 760, 541);
  text (statRoll [0], 760, 558);
  text (statRoll [1], 760, 576);
  text (statRoll [1], 760, 593);
  text (statRoll [1], 760, 609);
  text (statRoll [1], 760, 627);
  text (statRoll [1], 760, 645);
  text (statRoll [1], 760, 662);
  text (statRoll [1], 760, 680);
  text (statRoll [1], 760, 697);
  text (statRoll [1], 760, 714);
  text (statRoll [1], 760, 729);
  text (statRoll [1], 760, 747);
  text (statRoll [0], 760, 765);
  text (statRoll [2], 760, 783);
  text (statRoll [0], 760, 799);
  text (statRoll [0], 760, 817);
  text (statRoll [0], 760, 835);
  text (statRoll [3], 760, 850);
  text (statRoll [0], 760, 869);
  text (statRoll [2], 760, 883);
  text (statRoll [2], 760, 900);
  text (statRoll [2], 760, 918);
  text (statRoll [0], 760, 936);
  text (statRoll [3], 760, 954);
  text (statRoll [2], 760, 972);
  //trained skills
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//climb
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 522);
  textSize (18);
  text ('3', 860, 520);//handle animal
  textSize (12);
  text ('x', 500, 558);
  textSize (18);
  text ('3', 860, 556);//intimidate
  textSize (12);
  text ('x', 500, 591);
  textSize (18);
  text ('3', 860, 589);//knowledge dungeoneering 
  textSize (12);
  text ('x', 500, 608);
  textSize (18);
  text ('3', 860, 606);//knowledge engineering
  textSize (12);
  text ('x', 500, 800);
  textSize (18);
  text ('3', 860, 798);//profession
  textSize (12);
  text ('x', 500, 817);
  textSize (18);
  text ('3', 860, 815);//profession
  textSize (12);
  text ('x', 500, 834);
  textSize (18);
  text ('3', 860, 832);//profession
  textSize (12);
  text ('x', 500, 851);
  textSize (18);
  text ('3', 860, 849);//ride
  textSize (12);
  text ('x', 500, 937);
  textSize (18);
  text ('3', 860, 935);//survival
  textSize (12);
  text ('x', 500, 955);
  textSize (18);
  text ('3', 860, 953);//swim
}
void monk() {
  textSize(18);
  //stat rolls
  text (statRoll[5], 180, 203);
  text (statRoll[4], 180, 230);
  text (statRoll[2], 180, 256);
  text (statRoll[1], 180, 281);
  text (statRoll[3], 180, 307);
  text (statRoll[0], 180, 335);
  //AC dex mod
  text( statRoll[4], 300, 380);
  //initiative dex mod
  text (statRoll[4], 430, 335);
  //Fort Save
  text(statRoll[2], 274, 472);
  text (monk[1], 234, 472);
  text((monk[1]+statRoll[2]), 194, 472);
  //Ref Save
  text (statRoll [4], 274, 498);
  text (monk[2], 234, 498);
  text((monk[2]+statRoll[4]), 194, 498);
  //Will Save
  text (statRoll [3], 274, 524);
  text (monk[3], 234, 524);
  text((monk[3]+statRoll[3]), 194, 524);
  //BAB
  text (monk[0], 300, 565);
  //CMB
  text (monk[0], 295, 605);
  text (statRoll [5], 345, 605);
  text ('0', 400, 607);
  text (monk[0]+statRoll [5], 225, 605);
  //health
  text (monk [4]+statRoll[2], 390, 193); 
  // skills
  text (statRoll [4], 760, 311);
  text (statRoll [1], 760, 331);
  text (statRoll [0], 760, 349);
  text (statRoll [5], 760, 365);
  text (statRoll [1], 760, 383);
  text (statRoll [1], 760, 401);
  text (statRoll [1], 760, 419);
  text (statRoll [0], 760, 435);
  text (statRoll [1], 760, 454);
  text (statRoll [0], 760, 469);
  text (statRoll [4], 760, 487);
  text (statRoll [4], 760, 505);
  text (statRoll [0], 760, 524);
  text (statRoll [0], 760, 541);
  text (statRoll [3], 760, 558);
  text (statRoll [1], 760, 576);
  text (statRoll [1], 760, 593);
  text (statRoll [1], 760, 609);
  text (statRoll [1], 760, 627);
  text (statRoll [1], 760, 645);
  text (statRoll [1], 760, 662);
  text (statRoll [1], 760, 680);
  text (statRoll [1], 760, 697);
  text (statRoll [1], 760, 714);
  text (statRoll [1], 760, 729);
  text (statRoll [1], 760, 747);
  text (statRoll [3], 760, 765);
  text (statRoll [0], 760, 783);
  text (statRoll [3], 760, 799);
  text (statRoll [3], 760, 817);
  text (statRoll [3], 760, 835);
  text (statRoll [4], 760, 850);
  text (statRoll [3], 760, 869);
  text (statRoll [0], 760, 883);
  text (statRoll [0], 760, 900);
  text (statRoll [0], 760, 918);
  text (statRoll [3], 760, 936);
  text (statRoll [4], 760, 954);
  text (statRoll [0], 760, 972);
  //trained skills
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//acrobatics
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//climb
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 488);
  textSize (18);
  text ('3', 860, 486);//escape artist
  textSize (12);
  text ('x', 500, 558);
  textSize (18);
  text ('3', 860, 556);//intimidate
  textSize (12);
  text ('x', 500, 643);
  textSize (18);
  text ('3', 860, 641);//knowledge history
  textSize (12);
  text ('x', 500, 731);
  textSize (18);
  text ('3', 860, 729);//knowledge religion
  textSize (12);
  text ('x', 500, 765);
  textSize (18);
  text ('3', 860, 763);//perception
  textSize (12);
  text ('x', 500, 783);
  textSize (18);
  text ('3', 860, 781);//perform
  textSize (12);
  text ('x', 500, 800);
  textSize (18);
  text ('3', 860, 798);//profession
  textSize (12);
  text ('x', 500, 817);
  textSize (18);
  text ('3', 860, 815);//profession
  textSize (12);
  text ('x', 500, 834);
  textSize (18);
  text ('3', 860, 832);//profession
  textSize (12);
  text ('x', 500, 851);
  textSize (18);
  text ('3', 860, 849);//ride
  textSize (12);
  text ('x', 500, 869);
  textSize (18);
  text ('3', 860, 867);//sense motive
  textSize(12); 
  text ('x', 500, 921);
  textSize (18);
  text ('3', 860, 919);//stealth
  textSize (12);
  text ('x', 500, 955);
  textSize (18);
  text ('3', 860, 953);//swim
}
void paladin() {
  textSize(18);
  //stat rolls
  text (statRoll[4], 180, 203);
  text (statRoll[2], 180, 230);
  text (statRoll[3], 180, 256);
  text (statRoll[1], 180, 281);
  text (statRoll[0], 180, 307);
  text (statRoll[5], 180, 335);
  //AC dex mod
  text( statRoll[2], 300, 380);
  //initiative dex mod
  text (statRoll[2], 430, 335);
  //Fort Save
  text(statRoll[3], 274, 472);
  text (paladin[1], 234, 472);
  text((paladin[1]+statRoll[3]), 194, 472);
  //Ref Save
  text (statRoll [2], 274, 498);
  text (paladin[2], 234, 498);
  text((paladin[2]+statRoll[2]), 194, 498);
  //Will Save
  text (statRoll [0], 274, 524);
  text (paladin[3], 234, 524);
  text((paladin[3]+statRoll[0]), 194, 524);
  //BAB
  text (paladin[0], 300, 565);
  //CMB
  text (paladin[0], 295, 605);
  text (statRoll [4], 345, 605);
  text ('0', 400, 607);
  text (paladin[0]+statRoll [4], 225, 605);
  //health
  text (paladin [4]+statRoll[3], 390, 193); 
  // skills
  text (statRoll [2], 760, 311);
  text (statRoll [1], 760, 331);
  text (statRoll [5], 760, 349);
  text (statRoll [4], 760, 365);
  text (statRoll [1], 760, 383);
  text (statRoll [1], 760, 401);
  text (statRoll [1], 760, 419);
  text (statRoll [5], 760, 435);
  text (statRoll [1], 760, 454);
  text (statRoll [5], 760, 469);
  text (statRoll [2], 760, 487);
  text (statRoll [2], 760, 505);
  text (statRoll [5], 760, 524);
  text (statRoll [5], 760, 541);
  text (statRoll [5], 760, 558);
  text (statRoll [1], 760, 576);
  text (statRoll [1], 760, 593);
  text (statRoll [1], 760, 609);
  text (statRoll [1], 760, 627);
  text (statRoll [1], 760, 645);
  text (statRoll [1], 760, 662);
  text (statRoll [1], 760, 680);
  text (statRoll [1], 760, 697);
  text (statRoll [1], 760, 714);
  text (statRoll [1], 760, 729);
  text (statRoll [1], 760, 747);
  text (statRoll [0], 760, 765);
  text (statRoll [5], 760, 783);
  text (statRoll [0], 760, 799);
  text (statRoll [0], 760, 817);
  text (statRoll [0], 760, 835);
  text (statRoll [2], 760, 850);
  text (statRoll [0], 760, 869);
  text (statRoll [2], 760, 883);
  text (statRoll [2], 760, 900);
  text (statRoll [2], 760, 918);
  text (statRoll [0], 760, 936);
  text (statRoll [2], 760, 954);
  text (statRoll [5], 760, 972);
  //trained skills
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 437);
  textSize (18);
  text ('3', 860, 434);//diplomacy
  textSize (12);
  text ('x', 500, 522);
  textSize (18);
  text ('3', 860, 520);//handle animal
  textSize (12);
  text ('x', 500, 540);
  textSize (18);
  text ('3', 860, 538);//heal
  textSize (12);
  text ('x', 500, 697);
  textSize (18);
  text ('3', 860, 695);//knowledge nobility
  textSize (12);
  text ('x', 500, 731);
  textSize (18);
  text ('3', 860, 729);//knowledge religion
  textSize (12);
  text ('x', 500, 800);
  textSize (18);
  text ('3', 860, 798);//profession
  textSize (12);
  text ('x', 500, 817);
  textSize (18);
  text ('3', 860, 815);//profession
  textSize (12);
  text ('x', 500, 834);
  textSize (18);
  text ('3', 860, 832);//profession
  textSize (12);
  text ('x', 500, 851);
  textSize (18);
  text ('3', 860, 849);//ride
  textSize (12);
  text ('x', 500, 869);
  textSize (18);
  text ('3', 860, 867);//sense motive
  textSize(12);
  text ('x', 500, 903);
  textSize (18);
  text ('3', 860, 901);//spellcraft
}
void ranger() {
  textSize(18);
  //stat rolls
  text (statRoll[3], 180, 203);
  text (statRoll[5], 180, 230);
  text (statRoll[4], 180, 256);
  text (statRoll[1], 180, 281);
  text (statRoll[2], 180, 307);
  text (statRoll[0], 180, 335);
  //AC dex mod
  text( statRoll[5], 300, 380);
  //initiative dex mod
  text (statRoll[5], 430, 335);
  //Fort Save
  text(statRoll[4], 274, 472);
  text (ranger[1], 234, 472);
  text((ranger[1]+statRoll[4]), 194, 472);
  //Ref Save
  text (statRoll [5], 274, 498);
  text (ranger[2], 234, 498);
  text((ranger[2]+statRoll[5]), 194, 498);
  //Will Save
  text (statRoll [2], 274, 524);
  text (ranger[3], 234, 524);
  text((ranger[3]+statRoll[2]), 194, 524);
  //BAB
  text (ranger[0], 300, 565);
  //CMB
  text (ranger[0], 295, 605);
  text (statRoll [3], 345, 605);
  text ('0', 400, 607);
  text (ranger[0]+statRoll [3], 225, 605);
  //health
  text (ranger [4]+statRoll[4], 390, 193); 
  // skills
  text (statRoll [5], 760, 311);
  text (statRoll [1], 760, 331);
  text (statRoll [0], 760, 349);
  text (statRoll [3], 760, 365);
  text (statRoll [1], 760, 383);
  text (statRoll [1], 760, 401);
  text (statRoll [1], 760, 419);
  text (statRoll [0], 760, 435);
  text (statRoll [1], 760, 454);
  text (statRoll [0], 760, 469);
  text (statRoll [5], 760, 487);
  text (statRoll [5], 760, 505);
  text (statRoll [0], 760, 524);
  text (statRoll [2], 760, 541);
  text (statRoll [0], 760, 558);
  text (statRoll [1], 760, 576);
  text (statRoll [1], 760, 593);
  text (statRoll [1], 760, 609);
  text (statRoll [1], 760, 627);
  text (statRoll [1], 760, 645);
  text (statRoll [1], 760, 662);
  text (statRoll [1], 760, 680);
  text (statRoll [1], 760, 697);
  text (statRoll [1], 760, 714);
  text (statRoll [1], 760, 729);
  text (statRoll [1], 760, 747);
  text (statRoll [2], 760, 765);
  text (statRoll [0], 760, 783);
  text (statRoll [2], 760, 799);
  text (statRoll [2], 760, 817);
  text (statRoll [2], 760, 835);
  text (statRoll [5], 760, 850);
  text (statRoll [2], 760, 869);
  text (statRoll [5], 760, 883);
  text (statRoll [5], 760, 900);
  text (statRoll [5], 760, 918);
  text (statRoll [2], 760, 936);
  text (statRoll [5], 760, 954);
  text (statRoll [0], 760, 972);
  //trained skills
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//climb
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 522);
  textSize (18);
  text ('3', 860, 520);//handle animal
  textSize (12);
  text ('x', 500, 540);
  textSize (18);
  text ('3', 860, 538);//heal
  textSize (12);
  text ('x', 500, 558);
  textSize (18);
  text ('3', 860, 556);//intimidate
  textSize (12);
  text ('x', 500, 591);
  textSize (18);
  text ('3', 860, 589);//knowledge dungeoneering 
  textSize (12);
  text ('x', 500, 626);
  textSize (18);
  text ('3', 860, 624);//knowledge geography
  textSize (12);
  text ('x', 500, 679);
  textSize (18);
  text ('3', 860, 677);//knowledge nature
  textSize (12);
  text ('x', 500, 765);
  textSize (18);
  text ('3', 860, 763);//perception
  textSize (12);
  text ('x', 500, 800);
  textSize (18);
  text ('3', 860, 798);//profession
  textSize (12);
  text ('x', 500, 817);
  textSize (18);
  text ('3', 860, 815);//profession
  textSize (12);
  text ('x', 500, 834);
  textSize (18);
  text ('3', 860, 832);//profession
  textSize (12);
  text ('x', 500, 851);
  textSize (18);
  text ('3', 860, 849);//ride
  textSize(12);
  text ('x', 500, 903);
  textSize (18);
  text ('3', 860, 901);//spellcraft
  textSize(12); 
  text ('x', 500, 921);
  textSize (18);
  text ('3', 860, 919);//stealth
  textSize (12);
  text ('x', 500, 937);
  textSize (18);
  text ('3', 860, 935);//survival
  textSize (12);
  text ('x', 500, 955);
  textSize (18);
  text ('3', 860, 953);//swim
}
void rogue() {
  textSize(18);
  //stat rolls
  text (statRoll[0], 180, 203);
  text (statRoll[5], 180, 230);
  text (statRoll[2], 180, 256);
  text (statRoll[3], 180, 281);
  text (statRoll[1], 180, 307);
  text (statRoll[4], 180, 335);
  //AC dex mod
  text( statRoll[5], 300, 380);
  //initiative dex mod
  text (statRoll[5], 430, 335);
  //Fort Save
  text(statRoll[2], 274, 472);
  text (rogue[1], 234, 472);
  text((rogue[1]+statRoll[2]), 194, 472);
  //Ref Save
  text (statRoll [5], 274, 498);
  text (rogue[2], 234, 498);
  text((rogue[2]+statRoll[5]), 194, 498);
  //Will Save
  text (statRoll [1], 274, 524);
  text (rogue[3], 234, 524);
  text((rogue[3]+statRoll[1]), 194, 524);
  //BAB
  text (rogue[0], 300, 565);
  //CMB
  text (rogue[0], 295, 605);
  text (statRoll [0], 345, 605);
  text ('0', 400, 607);
  text (rogue[0]+statRoll [0], 225, 605);
  //health
  text (rogue [4]+statRoll[2], 390, 193); 
  // skills
  text (statRoll [5], 760, 311);
  text (statRoll [3], 760, 331);
  text (statRoll [4], 760, 349);
  text (statRoll [0], 760, 365);
  text (statRoll [3], 760, 383);
  text (statRoll [3], 760, 401);
  text (statRoll [3], 760, 419);
  text (statRoll [4], 760, 435);
  text (statRoll [3], 760, 454);
  text (statRoll [4], 760, 469);
  text (statRoll [5], 760, 487);
  text (statRoll [5], 760, 505);
  text (statRoll [4], 760, 524);
  text (statRoll [1], 760, 541);
  text (statRoll [4], 760, 558);
  text (statRoll [3], 760, 576);
  text (statRoll [3], 760, 593);
  text (statRoll [3], 760, 609);
  text (statRoll [3], 760, 627);
  text (statRoll [3], 760, 645);
  text (statRoll [3], 760, 662);
  text (statRoll [3], 760, 680);
  text (statRoll [3], 760, 697);
  text (statRoll [3], 760, 714);
  text (statRoll [3], 760, 729);
  text (statRoll [3], 760, 747);
  text (statRoll [1], 760, 765);
  text (statRoll [4], 760, 783);
  text (statRoll [1], 760, 799);
  text (statRoll [1], 760, 817);
  text (statRoll [1], 760, 835);
  text (statRoll [5], 760, 850);
  text (statRoll [1], 760, 869);
  text (statRoll [5], 760, 883);
  text (statRoll [5], 760, 900);
  text (statRoll [5], 760, 918);
  text (statRoll [1], 760, 936);
  text (statRoll [5], 760, 954);
  text (statRoll [4], 760, 972);
  //rogue
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//acrobatics
  textSize (12);
  text ('x', 500, 332);
  textSize (18);
  text ('3', 860, 330);//appraise
  textSize (12);
  text ('x', 500, 350);
  textSize (18);
  text ('3', 860, 348);//bluff
  textSize (12);
  text ('x', 500, 315);
  textSize (18);
  text ('3', 860, 311);//climb
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 437);
  textSize (18);
  text ('3', 860, 434);//diplomacy
  textSize (12);
  text ('x', 500, 454);
  textSize (18);
  text ('3', 860, 452);//disable device
  textSize (12);
  text ('x', 500, 471);
  textSize (18);
  text ('3', 860, 468);//disguise
  textSize (12);
  text ('x', 500, 488);
  textSize (18);
  text ('3', 860, 486);//escape artist
  textSize (12);
  text ('x', 500, 558);
  textSize (18);
  text ('3', 860, 556);//intimidate
  textSize (12);
  text ('x', 500, 591);
  textSize (18);
  text ('3', 860, 589);//knowledge dungeoneering
  textSize (12);
  text ('x', 500, 661);
  textSize (18);
  text ('3', 860, 659);//knowledge local
  textSize (12);
  text ('x', 500, 749);
  textSize (18);
  text ('3', 860, 747);//linguistics
  textSize (12);
  text ('x', 500, 765);
  textSize (18);
  text ('3', 860, 763);//perception
  textSize (12);
  text ('x', 500, 783);
  textSize (18);
  text ('3', 860, 781);//perform
  textSize (12);
  text ('x', 500, 800);
  textSize (18);
  text ('3', 860, 798);//profession
  textSize (12);
  text ('x', 500, 817);
  textSize (18);
  text ('3', 860, 815);//profession
  textSize (12);
  text ('x', 500, 834);
  textSize (18);
  text ('3', 860, 832);//profession
  textSize (12);
  text ('x', 500, 869);
  textSize (18);
  text ('3', 860, 867);//sense motive
  textSize(12);
  text ('x', 500, 887);
  textSize (18);
  text ('3', 860, 885);//sleight of hand
  textSize(12); 
  text ('x', 500, 921);
  textSize (18);
  text ('3', 860, 919);//stealth
  textSize(12);
  text ('x', 500, 972);
  textSize (18);
  text ('3', 860, 970);//use magic device
}
void sorcerer() {
  textSize(18);
  //stat rolls
  text (statRoll[0], 180, 203);
  text (statRoll[3], 180, 230);
  text (statRoll[1], 180, 256);
  text (statRoll[4], 180, 281);
  text (statRoll[2], 180, 307);
  text (statRoll[5], 180, 335);
  //AC dex mod
  text( statRoll[3], 300, 380);
  //initiative dex mod
  text (statRoll[3], 430, 335);
  //Fort Save
  text(statRoll[1], 274, 472);
  text (sorcerer[1], 234, 472);
  text((sorcerer[1]+statRoll[1]), 194, 472);
  //Ref Save
  text (statRoll [3], 274, 498);
  text (sorcerer[2], 234, 498);
  text((sorcerer[2]+statRoll[3]), 194, 498);
  //Will Save
  text (statRoll [2], 274, 524);
  text (sorcerer[3], 234, 524);
  text((sorcerer[3]+statRoll[2]), 194, 524);
  //BAB
  text (sorcerer[0], 300, 565);
  //CMB
  text (sorcerer[0], 295, 605);
  text (statRoll [0], 345, 605);
  text ('0', 400, 607);
  text (sorcerer[0]+statRoll [0], 225, 605);
  //health
  text (sorcerer [4]+statRoll[1], 390, 193); 
  // skills
  text (statRoll [3], 760, 311);
  text (statRoll [4], 760, 331);
  text (statRoll [5], 760, 349);
  text (statRoll [0], 760, 365);
  text (statRoll [4], 760, 383);
  text (statRoll [4], 760, 401);
  text (statRoll [4], 760, 419);
  text (statRoll [5], 760, 435);
  text (statRoll [4], 760, 454);
  text (statRoll [5], 760, 469);
  text (statRoll [3], 760, 487);
  text (statRoll [3], 760, 505);
  text (statRoll [5], 760, 524);
  text (statRoll [2], 760, 541);
  text (statRoll [5], 760, 558);
  text (statRoll [4], 760, 576);
  text (statRoll [4], 760, 593);
  text (statRoll [4], 760, 609);
  text (statRoll [4], 760, 627);
  text (statRoll [4], 760, 645);
  text (statRoll [4], 760, 662);
  text (statRoll [4], 760, 680);
  text (statRoll [4], 760, 697);
  text (statRoll [4], 760, 714);
  text (statRoll [4], 760, 729);
  text (statRoll [4], 760, 747);
  text (statRoll [2], 760, 765);
  text (statRoll [5], 760, 783);
  text (statRoll [2], 760, 799);
  text (statRoll [2], 760, 817);
  text (statRoll [2], 760, 835);
  text (statRoll [3], 760, 850);
  text (statRoll [2], 760, 869);
  text (statRoll [3], 760, 883);
  text (statRoll [3], 760, 900);
  text (statRoll [3], 760, 918);
  text (statRoll [2], 760, 936);
  text (statRoll [3], 760, 954);
  text (statRoll [5], 760, 972);
  //trained skills
  textSize (12);
  text ('x', 500, 332);
  textSize (18);
  text ('3', 860, 330);//appraise
  textSize (12);
  text ('x', 500, 350);
  textSize (18);
  text ('3', 860, 348);//bluff
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 506);
  textSize (18);
  text ('3', 860, 504);//fly
    textSize (12);
  text ('x', 500, 558);
  textSize (18);
  text ('3', 860, 556);//intimidate
    textSize (12);
  text ('x', 500, 575);
  textSize (18);
  text ('3', 860, 573);//knowledge arcana
   textSize (12);
  text ('x', 500, 800);
  textSize (18);
  text ('3', 860, 798);//profession
  textSize (12);
  text ('x', 500, 817);
  textSize (18);
  text ('3', 860, 815);//profession
  textSize (12);
  text ('x', 500, 834);
  textSize (18);
  text ('3', 860, 832);//profession
    textSize(12);
  text ('x', 500, 903);
  textSize (18);
  text ('3', 860, 901);//spellcraft
    textSize(12);
  text ('x', 500, 972);
  textSize (18);
  text ('3', 860, 970);//use magic device
}
void wizard() {
  textSize(18);
  //stat rolls
  text (statRoll[0], 180, 203);
  text (statRoll[4], 180, 230);
  text (statRoll[2], 180, 256);
  text (statRoll[5], 180, 281);
  text (statRoll[3], 180, 307);
  text (statRoll[1], 180, 335);
  //AC dex mod
  text( statRoll[4], 300, 380);
  //initiative dex mod
  text (statRoll[4], 430, 335);
  //Fort Save
  text(statRoll[2], 274, 472);
  text (wizard[1], 234, 472);
  text((wizard[1]+statRoll[2]), 194, 472);
  //Ref Save
  text (statRoll [4], 274, 498);
  text (wizard[2], 234, 498);
  text((wizard[2]+statRoll[4]), 194, 498);
  //Will Save
  text (statRoll [3], 274, 524);
  text (wizard[3], 234, 524);
  text((wizard[3]+statRoll[3]), 194, 524);
  //BAB
  text (wizard[0], 300, 565);
  //CMB
  text (wizard[0], 295, 605);
  text (statRoll [0], 345, 605);
  text ('0', 400, 607);
  text (wizard[0]+statRoll [0], 225, 605);
  //health
  text (wizard [4]+statRoll[2], 390, 193); 
  // skills
  text (statRoll [4], 760, 311);
  text (statRoll [5], 760, 331);
  text (statRoll [1], 760, 349);
  text (statRoll [0], 760, 365);
  text (statRoll [5], 760, 383);
  text (statRoll [5], 760, 401);
  text (statRoll [5], 760, 419);
  text (statRoll [1], 760, 435);
  text (statRoll [5], 760, 454);
  text (statRoll [1], 760, 469);
  text (statRoll [4], 760, 487);
  text (statRoll [4], 760, 505);
  text (statRoll [1], 760, 524);
  text (statRoll [3], 760, 541);
  text (statRoll [1], 760, 558);
  text (statRoll [5], 760, 576);
  text (statRoll [5], 760, 593);
  text (statRoll [5], 760, 609);
  text (statRoll [5], 760, 627);
  text (statRoll [5], 760, 645);
  text (statRoll [5], 760, 662);
  text (statRoll [5], 760, 680);
  text (statRoll [5], 760, 697);
  text (statRoll [5], 760, 714);
  text (statRoll [5], 760, 729);
  text (statRoll [5], 760, 747);
  text (statRoll [3], 760, 765);
  text (statRoll [1], 760, 783);
  text (statRoll [3], 760, 799);
  text (statRoll [3], 760, 817);
  text (statRoll [3], 760, 835);
  text (statRoll [4], 760, 850);
  text (statRoll [3], 760, 869);
  text (statRoll [4], 760, 883);
  text (statRoll [4], 760, 900);
  text (statRoll [4], 760, 918);
  text (statRoll [3], 760, 936);
  text (statRoll [4], 760, 954);
  text (statRoll [1], 760, 972);
  //trained skills
    textSize (12);
  text ('x', 500, 332);
  textSize (18);
  text ('3', 860, 330);//appraise
  textSize (12);
  text ('x', 500, 350);
  textSize (18);
  text ('3', 860, 348);//bluff
  textSize (12);
  text ('x', 500, 386);
  textSize (18);
  text ('3', 860, 383);//craft
  textSize (12);
  text ('x', 500, 404);
  textSize (18);
  text ('3', 860, 399);//craft
  textSize (12);
  text ('x', 500, 421);
  textSize (18);
  text ('3', 860, 417);//craft
  textSize (12);
  text ('x', 500, 506);
  textSize (18);
  text ('3', 860, 504);//fly
    textSize (12);
  text ('x', 500, 575);
  textSize (18);
  text ('3', 860, 573);//knowledge arcana
  textSize (12);
  text ('x', 500, 591);
  textSize (18);
  text ('3', 860, 589);//knowledge dungeoneering
  textSize (12);
  text ('x', 500, 608);
  textSize (18);
  text ('3', 860, 606);//knowledge engineering
  textSize (12);
  text ('x', 500, 626);
  textSize (18);
  text ('3', 860, 624);//knowledge geography
  textSize (12);
  text ('x', 500, 643);
  textSize (18);
  text ('3', 860, 641);//knowledge history
  textSize (12);
  text ('x', 500, 661);
  textSize (18);
  text ('3', 860, 659);//knowledge local
  textSize (12);
  text ('x', 500, 679);
  textSize (18);
  text ('3', 860, 677);//knowledge nature
  textSize (12);
  text ('x', 500, 697);
  textSize (18);
  text ('3', 860, 695);//knowledge nobility
  textSize (12);
  text ('x', 500, 713);
  textSize (18);
  text ('3', 860, 711);//knowledge planes
  textSize (12);
  text ('x', 500, 731);
  textSize (18);
  text ('3', 860, 729);//knowledge religion
  textSize (12);
  text ('x', 500, 749);
  textSize (18);
  text ('3', 860, 747);//linguistics
     textSize (12);
  text ('x', 500, 800);
  textSize (18);
  text ('3', 860, 798);//profession
  textSize (12);
  text ('x', 500, 817);
  textSize (18);
  text ('3', 860, 815);//profession
  textSize (12);
  text ('x', 500, 834);
  textSize (18);
  text ('3', 860, 832);//profession
    textSize(12);
  text ('x', 500, 903);
  textSize (18);
  text ('3', 860, 901);//spellcraft
}


