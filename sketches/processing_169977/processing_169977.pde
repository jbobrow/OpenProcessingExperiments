
Wordcount Obama;
Wordcount Bush;
 
void setup() {
  background(255);
  size(1000, 700);
  Bush = new Wordcount();
  Obama = new Wordcount();
  
  Bush.leaderSpeak();
  Bush.countB();
  Bush.display();
  
  Obama.leaderSpeak();
  Obama.countO();
  Obama.display();
  
  }
 
void draw() {
}
class Wordcount {
  String[] allBush; 
  String[] allObama;

  String [] words = {
    "america", "god", "freedom", "war", "peace", "we"
  };

  String delimiters = " \",.?!;:[]()-_'s<>";

  IntDict concordanceBush, concordanceObama;

  int countAmer, countAmerO;
  int countGod, countGodO;
  int countFree, countFreeO;
  int countWar, countWarO;
  int countPeace, countPeaceO;
  int countI, countIO;

  PImage imgAmer = loadImage("america.png");
  PImage imgGod = loadImage("god.png");
  PImage imgFree = loadImage("freedom.png");
  PImage imgWar = loadImage("war.png");
  PImage imgPeace = loadImage("peace.png");
  PImage imgwe = loadImage("we.png");

  float lastY;


  Wordcount()
  { 
    textSize(16);
    fill(0);
  }

  void leaderSpeak() {
    String[] rawtextBush = loadStrings("Bush.txt");
    String[] rawtextObama = loadStrings("Obama.txt");

    // Create contiguous string
    String everythingBush = join(rawtextBush, "" );
    String everythingObama = join(rawtextObama, "" );

    //Delimit string
    allBush = splitTokens(everythingBush, delimiters);
    allObama = splitTokens(everythingObama, delimiters);

    // Make new IntDicts
    concordanceBush = new IntDict();
    concordanceObama = new IntDict();

    for (int i = 0; i < allBush.length; i++) {
      String s = allBush[i].toLowerCase();
      concordanceBush.increment(s);
    }
    for (int i = 0; i < allObama.length; i++) {
      String t = allObama[i].toLowerCase();
      concordanceObama.increment(t);
    }
  }

  void countB() {
    countAmer = concordanceBush.get(words[0]);
    countGod = concordanceBush.get(words[1]);
    countFree = concordanceBush.get(words[2]);
    countWar = concordanceBush.get(words[3]);
    countPeace = concordanceBush.get(words[4]);
    countI = concordanceBush.get(words[5]);
  }

  void countO() {
    countAmerO = concordanceObama.get(words[0]);
    countGodO = concordanceObama.get(words[1]);
    countFreeO = concordanceObama.get(words[2]);
    countWarO = concordanceObama.get(words[3]);
    countPeaceO = concordanceObama.get(words[4]);
    countIO = concordanceObama.get(words[5]);
  }

  void display() {

    fill(0);
    for (int i=0; i<words.length; i++) {
      textSize(20);
      textAlign(CENTER);
      text(words[i], width/2, 70+i*100);
    }
    textAlign(LEFT);
    smooth();
    fill(255, 0, 0);
    text("BUSH", 20, 30);

    float imgXB=25;
    float imgYB=60;

    for (int i = 0; i <countAmer; i++) {
      text((countAmer), 20, 60);
      imgAmer.resize(25, 25);
      image(imgAmer, imgXB+=25, imgYB);

      //println(i);
      if (imgXB >=(width/2)) {
        imgXB=0;
        imgYB+=20;
      }
    }

    textAlign(LEFT);
    fill(0, 0, 255);
    text("OBAMA", width-120, 40);

    float imgXO=width/2+100;
    float imgYO=60;

    for (int i = 0; i <countAmerO; i++) {
      text((countAmerO), width-75, 60);
      imgAmer.resize(25, 25);
      image(imgAmer, imgXO+=25, imgYO);

      //println(i);
      if (imgXO >=(width-100)) {
        imgXO=width/2+100;
        imgYB+=20;
      }
    }
    float godXB = 20;
    float godYB = 140;
    for (int i = 0; i <countGod; i++) {
      fill(255, 0, 0);
      text((countGod), 20, 160);
      imgGod.resize(50, 50);
      image(imgGod, godXB+=60, godYB);

      //println(i);
      if (godXB >=(width/2)) {
        godXB=0;
        godYB+=20;
      }
    }
    float godXO=width-450;
    float godYO=140;

    for (int i = 0; i <countGodO; i++) {
      fill(0, 0, 255);
      text((countGodO), width-75, 160);
      imgGod.resize(50, 50);
      image(imgGod, godXO+=60, godYO);

      //println(i);
      if (imgXO >=(width-100)) {
        imgXO=width/2+100;
        imgYO+=20;
      }
    }

    float bellXB = 25;
    float bellYB = 250;
    for (int i = 0; i <countFree; i++) {
      fill(255, 0, 0);
      text((countFree), 20, 250);
      imgFree.resize(20, 20);
      image(imgFree, bellXB+=30, bellYB);

      //println(i);
      if (bellXB >=(width/2-100)) {
        bellXB=20;
        bellYB+=30;
      }
    }
    float bellXO=750;
    float bellYO=250;

    for (int i = 0; i <countFreeO; i++) {
      fill(0, 0, 255);
      text((countFreeO), width-75, 250);
      imgFree.resize(20, 20);
      image(imgFree, bellXO+=30, bellYO);

      //println(i);
      if (bellXO >=(width-100)) {
        bellXO=width/2+100;
        bellYO+=20;
      }
    }

    float warXB = 25;
    float warYB = 350;
    for (int i = 0; i <countWar; i++) {
      fill(255, 0, 0);
      text(('0'), 20, 350);
      imgWar.resize(20, 20);
      image(imgWar, warXB+=30, warYB);

      //println(i);
      if (warXB >=(width/2-100)) {
        warXB=20;
        warYB+=30;
      }
    }
    float warXO=780;
    float warYO=350;

    for (int i = 0; i <countWarO; i++) {
      fill(0, 0, 255);
      text((countWarO), width-75, 350);
      imgWar.resize(20, 20);
      image(imgWar, warXO+=30, warYO);

      //println(i);
      if (warXO >=(width-100)) {
        warXO=width/2+100;
        warYO+=20;
      }
    }

    float peaceXB = 200;
    float peaceYB = 450;

    for (int i = 0; i <countPeace; i++) {
      fill(255, 0, 0);
      text((countPeace), 20, 450);
      imgPeace.resize(30, 30);
      image(imgPeace, peaceXB+=40, peaceYB);

      // println(i);
      if (peaceXB >=(width/2-100)) {
        peaceXB=20;
        peaceYB+=30;
      }
    }
    float peaceXO=700;
    float peaceYO=450;

    for (int i = 0; i <countPeaceO; i++) {
      fill(0, 0, 255);
      text((countPeaceO), width-75, 450);
      imgPeace.resize(30, 30);
      image(imgPeace, peaceXO+=40, peaceYO);

      //println(i);
      if (peaceXO >=(width-100)) {
        peaceXO=width/2+100;
        peaceYO+=20;
      }
    }   
    float IXB = 25;
    float IYB = 550;
    for (int i = 0; i <countI; i++) {
      fill(255, 0, 0);
      text((countI), 20, 550);
      imgwe.resize(30, 30);
      image(imgwe, IXB+=40, IYB);

      // println(i);
      if (IXB >=(width/2-100)) {
        IXB=20;
        IYB+=30;
      }
    }
    float IXO=700;
    float IYO=500;

    for (int i = 0; i <countIO; i++) {
      fill(0, 0, 255);
      text((countIO), width-75, 500);
      imgwe.resize(30, 30);
      image(imgwe, IXO+=40, IYO);

      //println(i);
      if (IXO >=(width-100)) {
        IXO=width/2+100;
        IYO+=20;
      }
    }
  }
}


