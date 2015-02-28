
Lyrics block1;
//Loaded
String[] LingedVerbs;
String[] LLocPreps;
String[] LPluralNouns;
String[] LNouns1;
String[] LAdds;
String[] LprepVerbs;
String[] LcompList;
String[] LverbsSAY;

//Splited
String[]  ingedVerbs;
String[]  LocPreps;
String[]  PluralNouns;
String[]  Nouns1;
String[]  Adds;
String[]  prepVerbs1;
String[]  prepVerbs2;
String[]  compList;
String[]  verbsSAY;

void setup() {
  //Load 'em
  LingedVerbs = loadStrings("ingedVerbs.txt");
  LLocPreps = loadStrings("LocPreps.txt");
  LPluralNouns = loadStrings("PluralNouns.txt");
  LNouns1 = loadStrings("Nouns1.txt");
  LAdds = loadStrings("Adds.txt");
  LprepVerbs = loadStrings("prepVerbs1.txt");
  LcompList = loadStrings("compList.txt");
  LverbsSAY = loadStrings("verbsSAY.txt");
  //Split 'em
  ingedVerbs = split(LingedVerbs[0], " ");
  LocPreps = split(LLocPreps[0], " ");
  PluralNouns = split(LPluralNouns[0], " ");
  Nouns1 = split(LNouns1[0], " ");
  Adds = split(LAdds[0], " ");
  prepVerbs1 = split(LprepVerbs[0], " ");
  compList = split(LcompList[0], " ");
  prepVerbs2 = split(LprepVerbs[0], '*');
  verbsSAY = split(LverbsSAY[0], " ");

  size(500, 650);
  block1 = new Lyrics();
}

void draw() {
  block1.cover1();
  block1.correction();
  block1.text1();
  block1.text2();
  block1.cover2();
  block1.reset();
  block1.saveText();
  //More
  block1.scroll();
}



class Lyrics {
  String ana = " a";
  String ana2 = " a";

  //Block1
  int wrd1 = int(random(0, ingedVerbs.length));
  int wrd2 = int(random(0, LocPreps.length));
  int wrd3 = int(random(0, PluralNouns.length));
  int wrd4 = int(random(0, ingedVerbs.length));
  int wrd5 = int(random(0, Adds.length));
  int wrd55 = int(random(0, Nouns1.length));
  int wrd6 = int(random(0, ingedVerbs.length));
  int wrd7 = int(random(0, Adds.length));
  int wrd8 = int(random(0, ingedVerbs.length));
  int wrd9 = int(random(0, Nouns1.length));

  //Block2
  int wrd10 = int(random(0, prepVerbs2.length));
  int wrd11 = int(random(0, compList.length));
  int wrd12 = int(random(0, Nouns1.length));
  int rsay = int(random(0,7));
  int easyOrHard = int(random(0, 2));
  int randomww = int(random(0,2));
  int riweyou = int(random(0,3));
  PImage img;
  PImage img2;
  PFont f;

  int tp = 200;


  //Lines
  String line1;
  String line2;
  String line3;
  String line4;

  String line5;
  String line6;
  String line7;
  String line8;

  Lyrics() {
    img = loadImage("AICLG.png");
    img2 = loadImage("AICLG2.png");
    f = createFont("Facelift", 17);
  }

  //Functions

  void correction() {
    /*if (PluralNouns[wrd3].charAt(PluralNouns[wrd3].length()-1) != 's') {
      wrd3+=1;
    }
    */
    if (Nouns1[wrd9].charAt(Nouns1[wrd9].length()-1) == 's') {
      wrd9+=1;
    }
    if (Nouns1[wrd12].charAt(Nouns1[wrd12].length()-1) == 's') {
      wrd12+=1;
    }
    /*
    if (Nouns1[wrd55].charAt(Nouns1[wrd55].length()-1) != 's') {
      wrd55+=1;
    }*/

    if (ingedVerbs[wrd8].charAt(0)=='a' || ingedVerbs[wrd8].charAt(0)=='e' ||
      ingedVerbs[wrd8].charAt(0)=='i' || ingedVerbs[wrd8].charAt(0)=='y' || ingedVerbs[wrd8].charAt(0)=='u' || ingedVerbs[wrd8].charAt(0)=='o' ) {
      ana = " an";
    } 
    else {
      ana = " a";
    }

    if (compList[wrd11].charAt(0)=='a' || compList[wrd11].charAt(0)=='e' ||
      compList[wrd11].charAt(0)=='i' || compList[wrd11].charAt(0)=='y' || compList[wrd11].charAt(0)=='u' || compList[wrd11].charAt(0)=='o' ) {
      ana2 = " an";
    } 
    else {
      ana2 = " a";
    }
  }

  /*TEXT
  BLOCK 1;
  */
  void text1() {
    fill(255);
    textFont(f);
    line1 = ingedVerbs[wrd1]+" "+LocPreps[wrd2]+" "+PluralNouns[wrd3];
    line2 = ingedVerbs[wrd4]+" "+Adds[wrd5] + " " + Nouns1[wrd55];
    line3 = ingedVerbs[wrd6]+" "+Adds[wrd7]+ ana;
    line4 = ingedVerbs[wrd8]+" "+Nouns1[wrd9];

    text(line1, 40, tp+0);
    text(line2, 40, tp+40);
    text(line3, 40, tp+80);
    text(line4, 40, tp+120);
  }
/*
Block 2;
  
  "Easy to feed off a weaker thing
  Harder to say what I really mean"
     
*/
  void text2() {
    fill(255);
    textFont(f);

    String[] prepVerbs = split(prepVerbs2[wrd10], ',');
    if (prepVerbs.length>2) {
      prepVerbs[1]=prepVerbs[1]+" "+prepVerbs[2];
    }

//Easy or hard
    String eh = "Easy to ,Hard to ";
    String[] eh1 = split(eh, ',');
    String eh2;
    if (easyOrHard == 0) {
      eh2 = "Harder to";
    } 
    else {
      eh2 = "Easier to";
    }
// Where or Why
 String ww = "Where ,Why ";
 String[] ww1 = split(ww, ',');
//IWeYou
 String iweyou = "I ,We ,You ";
 String[] iweyou1 = split(iweyou, ',');
//SAY
 String say = "recall ,say ,hear ,ask ,tell ,know ,grasp ";
 String[] say1 = split(say, ',');
//TXT       
    line5 = eh1[easyOrHard]+prepVerbs[0]+" "+prepVerbs[1]+ ana2;
    line6 = compList[wrd11] + " "+Nouns1[wrd12];
    line7 = eh2+" " + say1[rsay]+ww1[randomww] + iweyou1[riweyou];
    ;
    //line4 = ingedVerbs[wrd8]+" "+Nouns1[wrd9];

    text(line5, 40, tp+180);
    text(line6, 40, tp+220);
    text(line7, 40, tp+260);
    //text(line4,40,tp+150);
  }

  void saveText() {
    String alllines = line1+"  "+line2+"  "+line3+"  "+line4+"  ";
    String[] list1 = split(alllines, "  ");
    if (mouseY > 20 && mouseY < 60 && mouseX > width-60 && mouseX < width-20 && mousePressed) {
      saveStrings("lyrics.txt", list1);
      fill(#C3FF00, 80);
    } 
    else {
      fill(#24C106, 80);
    }
    rect(width-60, 20, 40, 40);
  }

  void reset() {
    if (mouseY > 20 && mouseY < 60 && mouseX > 20 && mouseX < 60 && mousePressed) {
      block1.guess();
    }
    fill(#FF5703, 80);
    rect(20, 20, 40, 40);
  }

  void guess() {
    //Words
    wrd1 = int(random(0, ingedVerbs.length));
    wrd2 = int(random(0, LocPreps.length));
    wrd3 = int(random(0, PluralNouns.length));
    wrd4 = int(random(0, ingedVerbs.length));
    wrd5 = int(random(0, Adds.length));
    wrd55 = int(random(0, Nouns1.length));
    wrd6 = int(random(0, ingedVerbs.length));
    wrd7 = int(random(0, Adds.length));
    wrd8 = int(random(0, ingedVerbs.length));
    wrd9 = int(random(0, Nouns1.length));
    wrd10 = int(random(0, prepVerbs2.length));
    wrd11 = int(random(0, compList.length));
    wrd12 = int(random(0, Nouns1.length));
    //Rest
    easyOrHard = int(random(0, 2));
    randomww = int(random(0,2));
    riweyou = int(random(0,3));
    rsay = int(random(0,7));
  }

  //Design
  void cover1() {
    image(img, 0, 0);
  }
  void cover2() {
    image(img2, 0, 0);
  }
  void scroll() {

    if (keyPressed && keyCode == DOWN) {
      tp-=3;
    } 
    else if (keyPressed && keyCode == UP) {
      tp+=3;
    }

    if (tp>200) {
      tp=200;
    }
  }
}


