


//the 3 fonts I use.
PFont f;
PFont f1;
PFont f2;


//time variables
float startMillis; 
boolean printMillis = true; //st this to true if you want a visual confirmation on where you are in the timeline

boolean savetofile = false; //set this to false if you dont want your hdd full with JP


float spacer =1000.0/30.0 ;

textData[] myText; //array of the actual text
imageData[] myBGs; //array of my different backgrounds

imageData[] myImages; // I decided not to use images but only text

//varables to load the backgrounds in
PImage bg1; 
PImage bg2;

//Variables for those images that I dont use
PImage cubicle;
PImage clock;
PImage coffe;
PImage truck;
PImage gyro;

void setup()
{
  int i=0;

  bg1 = loadImage("bg.png");
  bg2 = loadImage("bg2.png");


  cubicle = loadImage("cubicle.png" );
  clock= loadImage("clock.png" );
  coffe= loadImage("coffe.png" );
  truck= loadImage("truck.png" );
  gyro= loadImage("gyro.png" );


  size(640, 480);

  //if (!savetofile)
  frameRate(10);

//allocating space for my data
  myText = new textData[120];
  myBGs = new imageData[5];
  myImages  = new imageData[5];

//filling the variables up
  myImages[i++] = new imageData(0.0, 10.0,     cubicle);
  myImages[i++] = new imageData(10.0,20.0 ,    clock);
  myImages[i++] = new imageData(20.0, 40.0,  coffe);
  myImages[i++] = new imageData(40.0,60 ,    truck);
  myImages[i++] = new imageData(60.0, 80.0,    gyro);

  i=0;


  myBGs[i++] = new imageData(0.0, 96.0,     bg1);
  myBGs[i++] = new imageData(96.0,102.0 ,    bg2);
  myBGs[i++] = new imageData(102.0, 180.0,    bg1);
  myBGs[i++] = new imageData(180.0,190 ,    bg2);
  myBGs[i++] = new imageData(190.0, 950.0,    bg1);



  f = loadFont("Verdana-Italic-66.vlw");
  f1 = loadFont("Cochin-Italic-66.vlw");
  f2 = loadFont("MarkerFelt-Wide-66.vlw");


  fill(255);

  color myBlack = color(0,0,0);
  color myWhite = color(255,255,255);
  color myRed = color(255,0,0);
  color myGray = color(0xc0,0xc0,0xc0);
  color myIntroGray = color(0xf0,0xf0,0xf0);
  i=0;

//all these times are taken from the aduio file, it was booring work

  //                                               COLORS                SIZE            positionX          PositionY
  myText[i++] = new textData("Late", 18.3, 23,     myBlack,myBlack,     66.0, 66.0,            110.0, 110.0,       100.0, 100.0, f);
  myText[i++] = new textData("afternoon", 19.0, 23.0,     myBlack,myBlack,     66.0, 66.0,     160.0, 160.0,       160.0, 160.0, f);
  myText[i++] = new textData("papercut", 21.40, 23.0,     myBlack,myRed,     66.0, 66.0,     220.0, 220.0,       220.0, 220.0, f2);

  myText[i++] = new textData("at", 23.9, 25.7,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       300.0, 300.0, f);
  myText[i++] = new textData("the", 24.5, 25.7,     myBlack,myBlack,     66.0, 66.0,     180.0, 180.0,       300.0, 300.0, f);
  myText[i++] = new textData("office.", 24.8, 25.7,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       300.0, 300.0, f1);



  myText[i++] = new textData("another", 27.1, 32.0,     myBlack,myBlack,     66.0, 66.0,     70.0, 70.0,       100.0, 100.0, f);
  myText[i++] = new textData("perfect", 28.3, 32.0,     myBlack,myBlack,     66.0, 66.0,     350.0, 350.0,       100.0, 100.0, f);
  myText[i++] = new textData("day", 29.4, 32.0,     myBlack,myBlack,     66.0, 66.0,     20.0, 20.0,       150.0, 150.0, f);
  myText[i++] = new textData("for", 30.0, 32.0,     myBlack,myBlack,     66.0, 66.0,     140.0, 140.0,       150.0, 150.0, f);
  myText[i++] = new textData("the", 30.6, 32.0,     myBlack,myBlack,     66.0, 66.0,     240.0, 240.0,       150.0, 150.0, f);
  myText[i++] = new textData("disgruntled", 31.7, 33.0,     myBlack,myBlack,     66.0, 66.0,     20.0, 20.0,       300.0, 300.0, f);
  myText[i++] = new textData("employee.", 32.8, 34.0,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       350.0, 350.0, f);

  float startime=  0;

  myText[i++] = new textData("The", 40.8, 46.8,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("coffee", 41.1, 46.80,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("machine", 41.7, 46.8,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("is", 42.6, 46.8,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("broken", 43.1, 46.8,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("again", 44.0, 46.8,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("empty", 46.8, 54.0,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("staring", 47.5, 54.0,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("another", 50.0, 54.0,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("caffeine", 50.8, 54.0,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);
  myText[i++] = new textData("casualty.", 52.3, 54.6,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       -10.0, 1500.0, f);

  myText[i++] = new textData("Disgruntled", 54.6, 0.0,     myRed,myRed,     66.0, 66.0,     100.0, 100.0,       100.0, 200.0, f);
  myText[i++] = new textData("employee.", 55.7, 0.0,     myRed,myRed,     66.0, 66.0,     100.0, 100.0,       100.0, 200.0, f);

  myText[i++] = new textData("Perfect", 68.5,69.0,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       300.0, 300.0, f);
  myText[i++] = new textData("spinning", 69.3, 69.8,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       300.0, 300.0, f);
  myText[i++] = new textData("hamster", 70.6, 71.1,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       300.0, 300.0, f);
  myText[i++] = new textData("gyro", 71.4, 71.9,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       300.0, 300.0, f);
  myText[i++] = new textData("rewards", 73.2, 73.70,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       300.0, 300.0, f);
  myText[i++] = new textData("will", 74.2, 74.7,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       300.0, 300.0, f);
  myText[i++] = new textData("be", 74.5, 75.0,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       300.0, 300.0, f);
  myText[i++] = new textData("here", 75.1, 75.6,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       300.0, 300.0, f);
  myText[i++] = new textData("tomorrow.", 75.7, 76.7,     myBlack,myBlack,     66.0, 66.0,      250.0, 250.0,       300.0, 300.0,  f);

  myText[i++] = new textData("Do", 77.7, 83.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       100.0, 100.0, f);
  myText[i++] = new textData("your", 78.0, 83.0,     myBlack,myBlack,     66.0, 66.0,     110.0, 110.0,       100.0, 100.0, f);
  myText[i++] = new textData("kids", 78.8, 83.0,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       100.0, 100.0, f2);
  myText[i++] = new textData("know", 79.1, 83.0,     myBlack,myBlack,     66.0, 66.0,     100.0, 200.0,       150.0, 150.0, f);
  myText[i++] = new textData("your", 80.8, 83.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       200.0, 200.0, f);
  myText[i++] = new textData("middle", 81.1, 83.0,     myBlack,myBlack,     66.0, 66.0,     180.0, 180.0,       200.0, 200.0, f);
  myText[i++] = new textData("name?", 82.0, 83.0,     myBlack,myBlack,     66.0, 66.0,     410.0, 410.0,       200.0, 200.0, f);


  myText[i++] = new textData("Posture", 86.8, 91.6,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       100.0, 100.0, f);
  myText[i++] = new textData("of", 87.8, 91.6,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       150.0, 150.0, f);
  myText[i++] = new textData("an", 88.3, 91.6,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       150.0, 150.0, f);
  myText[i++] = new textData("old", 88.9, 91.6,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       150.0, 150.0, f);
  myText[i++] = new textData("truck driver", 89.2, 91.6,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       200.0, 200.0, f);
  myText[i++] = new textData("this", 91.6, 95.4,     myBlack,myBlack,     66.0, 66.0,     30.0, 30.0,       250.0, 250.0, f);
  myText[i++] = new textData("life", 91.9, 95.4,     myBlack,myBlack,     66.0, 66.0,     180.0, 180.0,       250.0, 250.0, f);
  myText[i++] = new textData("seems", 92.3, 95.4,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       250.0, 250.0, f);
  myText[i++] = new textData("to", 92.8, 95.4,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       300.0, 300.0, f);
  myText[i++] = new textData("have", 93.1, 95.4,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       300.0, 300.0, f);
  myText[i++] = new textData("run", 93.4, 95.4,     myBlack,myBlack,     66.0, 66.0,     290.0, 800.0,       300.0, 300.0, f2);
  myText[i++] = new textData("you", 93.9, 95.4,     myBlack,myBlack,     66.0, 66.0,     210.0, 210.0,       350.0, 350.0, f);
  myText[i++] = new textData("over.", 94.6, 95.4,     myRed,myRed,     66.0, 66.0,     350.0, 350.0,       350.0, 350.0, f);



  myText[i++] = new textData("Did", 96.0, 101.0,     myIntroGray,myGray,     66.0, 66.0,     50.0, 50.0,       100.0, 100.0, f);
  myText[i++] = new textData("you", 96.4, 101.0,     myIntroGray,myGray,     66.0, 66.0,     200.0, 200.0,       100.0, 100.0, f);
  myText[i++] = new textData("notice", 97.1, 101.0,     myIntroGray,myGray,     66.0, 66.0,     300.0, 300.0,       150.0, 150.0, f);
  myText[i++] = new textData("every", 98.3, 101.0,     myIntroGray,myGray,     66.0, 66.0,     50.0, 50.0,       200.0, 200.0, f);
  myText[i++] = new textData("day's", 99.0, 101.0,     myIntroGray,myGray,     66.0, 66.0,     250.0, 250.0,       200.0, 200.0, f);
  myText[i++] = new textData("the", 99.9, 101.0,     myIntroGray,myGray,     66.0, 66.0,     150.0, 150.0,       250.0, 250.0, f);
  myText[i++] = new textData("same.", 100.1, 101.0,     myIntroGray,myGray,     66.0, 66.0,     300.0, 300.0,       250.0, 250.0, f);



  myText[i++] = new textData("Managers", 123.4, 135.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       50.0, 50.0, f);
  myText[i++] = new textData("disturbing", 124.8, 135.0,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       100.0, 100.0, f);
  myText[i++] = new textData("me,", 126.4, 135.0,     myBlack,myBlack,     66.0, 66.0,     340.0, 340.0,       50.0, 50.0, f);
  myText[i++] = new textData("there", 128.8, 135.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       150.0, 150.0, f);
  myText[i++] = new textData("is", 129.3, 135.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       200.0, 200.0, f);
  myText[i++] = new textData("an", 129.7, 135.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       250.0, 250.0, f);
  myText[i++] = new textData("issue...", 130.0, 135.0,     myBlack,myRed,     66.0, 66.0,     10.0, 10.0,       300.0, 300.0, f);
  myText[i++] = new textData("of", 132.5, 135.0,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       200.0, 200.0, f);
  myText[i++] = new textData("extreme", 132.9, 135.0,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       250.0, 250.0, f);
  myText[i++] = new textData("importancy", 134.0, 135.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       350.0, 350.0, f);


  myText[i++] = new textData("Disgruntled", 136.8, 140.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       275.0, 250.0, f);
  myText[i++] = new textData("employee.", 137.9, 140.0,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       275.0, 300.0, f);

  //Lets repeat.


  float increaser1 = (60+60+60+6.2)-68.5;


  myText[i++] = new textData("Perfect",increaser1+ 68.5,increaser1+69.0,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       300.0, 300.0, f);
  myText[i++] = new textData("spinning",increaser1+ 69.3, increaser1+69.8,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       300.0, 300.0, f);
  myText[i++] = new textData("hamster", increaser1+70.6, increaser1+71.1,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       300.0, 300.0, f);
  myText[i++] = new textData("gyro", increaser1+71.4, increaser1+71.9,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       300.0, 300.0, f);
  myText[i++] = new textData("rewards", increaser1+73.2, increaser1+73.70,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       300.0, 300.0, f);
  myText[i++] = new textData("will", increaser1+74.2, increaser1+74.7,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       300.0, 300.0, f);
  myText[i++] = new textData("be", increaser1+74.5, increaser1+75.0,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       300.0, 300.0, f);
  myText[i++] = new textData("here", increaser1+75.1, increaser1+75.6,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       300.0, 300.0, f);
  myText[i++] = new textData("tomorrow.", increaser1+75.7, increaser1+76.7,     myBlack,myBlack,     66.0, 66.0,      250.0, 250.0,       300.0, 300.0,  f);

  float increaser2 = (180.5)-77.7;

  myText[i++] = new textData("Do", increaser2+77.7, increaser2+83.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       100.0, 100.0, f);
  myText[i++] = new textData("your", increaser2+78.0, increaser2+83.0,     myBlack,myBlack,     66.0, 66.0,     110.0, 110.0,       100.0, 100.0, f);
  myText[i++] = new textData("kids", increaser2+78.8, increaser2+83.0,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       100.0, 100.0, f2);
  myText[i++] = new textData("know", increaser2+79.1, increaser2+83.0,     myBlack,myBlack,     66.0, 66.0,     100.0, 200.0,       150.0, 150.0, f);
  myText[i++] = new textData("your", increaser2+80.8, increaser2+83.0,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       200.0, 200.0, f);
  myText[i++] = new textData("middle", increaser2+81.1, increaser2+83.0,     myBlack,myBlack,     66.0, 66.0,     180.0, 180.0,       200.0, 200.0, f);
  myText[i++] = new textData("name?", increaser2+82.0, increaser2+83.0,     myBlack,myBlack,     66.0, 66.0,     410.0, 410.0,       200.0, 200.0, f);


  float increaser3 = (60+60+60+44.5)-86.8;


  myText[i++] = new textData("Posture", increaser3+86.8, increaser3+91.6,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       100.0, 100.0, f);
  myText[i++] = new textData("of", increaser3+87.8, increaser3+91.6,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       150.0, 150.0, f);
  myText[i++] = new textData("an", increaser3+88.3, increaser3+91.6,     myBlack,myBlack,     66.0, 66.0,     200.0, 200.0,       150.0, 150.0, f);
  myText[i++] = new textData("old", increaser3+88.9, increaser3+91.6,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       150.0, 150.0, f);
  myText[i++] = new textData("truc kdriver", increaser3+89.2,increaser3+ 91.6,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       200.0, 200.0, f);
  myText[i++] = new textData("this", increaser3+91.6, increaser3+95.4,     myBlack,myBlack,     66.0, 66.0,     30.0, 30.0,       250.0, 250.0, f);
  myText[i++] = new textData("life", increaser3+91.9, increaser3+95.4,     myBlack,myBlack,     66.0, 66.0,     180.0, 180.0,       250.0, 250.0, f);
  myText[i++] = new textData("seems", increaser3+92.3,increaser3+ 95.4,     myBlack,myBlack,     66.0, 66.0,     300.0, 300.0,       250.0, 250.0, f);
  myText[i++] = new textData("to", increaser3+92.8, increaser3+95.4,     myBlack,myBlack,     66.0, 66.0,     10.0, 10.0,       300.0, 300.0, f);
  myText[i++] = new textData("have", increaser3+93.1,increaser3+ 95.4,     myBlack,myBlack,     66.0, 66.0,     100.0, 100.0,       300.0, 300.0, f);
  myText[i++] = new textData("run",increaser3+ 93.4,increaser3+ 95.4,     myBlack,myBlack,     66.0, 66.0,     290.0, 800.0,       300.0, 300.0, f2);
  myText[i++] = new textData("you", increaser3+93.9, increaser3+ 95.4,     myBlack,myBlack,     66.0, 66.0,     210.0, 210.0,       350.0, 350.0, f);
  myText[i++] = new textData("over.", increaser3+94.6, increaser3+ 95.4,     myRed,myRed,     66.0, 66.0,     350.0, 350.0,       350.0, 350.0, f);

  float increaser4 = (60+60+60+53.7)-96.8;

  myText[i++] = new textData("Did", 96.0+increaser4, 101.0+increaser4,     myIntroGray,myGray,     66.0, 66.0,     50.0, 50.0,       100.0, 100.0, f);
  myText[i++] = new textData("you", 96.4+increaser4, 101.0+increaser4,     myIntroGray,myGray,     66.0, 66.0,     200.0, 200.0,       100.0, 100.0, f);
  myText[i++] = new textData("notice", 97.1+increaser4, 101.0+increaser4,     myIntroGray,myGray,     66.0, 66.0,     300.0, 300.0,       150.0, 150.0, f);
  myText[i++] = new textData("every", 98.3+increaser4, 101.0+increaser4,     myIntroGray,myGray,     66.0, 66.0,     50.0, 50.0,       200.0, 200.0, f);
  myText[i++] = new textData("day's", 99.0+increaser4, 101.0+increaser4,     myIntroGray,myGray,     66.0, 66.0,     250.0, 250.0,       200.0, 200.0, f);
  myText[i++] = new textData("the", 99.9+increaser4, 101.0+increaser4,     myIntroGray,myGray,     66.0, 66.0,     150.0, 150.0,       250.0, 250.0, f);
  myText[i++] = new textData("same.", 100.1+increaser4, 101.0+increaser4,     myIntroGray,myGray,     66.0, 66.0,     300.0, 300.0,       250.0, 250.0, f);

  if (!savetofile)
    startMillis=millis();
  else
    startMillis=0.0;

  if (savetofile)
    noLoop();

}

float currentMillis = 0; 

void draw()
{

  if(!savetofile)
  {
    currentMillis = millis()-startMillis;
    drawFrame();
    println("no save " + currentMillis );
  }
  else
  {
    boolean toRepeat=true;
    while(toRepeat)
    {
      currentMillis += spacer;
      drawFrame();
      frameCount++;
      saveFrame("hamstergyro-#######.png");
      println("save " + currentMillis +" " +frameCount );
      if(currentMillis>(150*1000))
      {
        toRepeat = false;
        break;
      }
    }   
  }

}
void drawFrame()
{

  for (int i= 0; i<5;i++)
  {

    if(myBGs[i].start_time*1000.0f < currentMillis  )
      if(myBGs[i].end_time*1000.0f > currentMillis  )
      {
        background(myBGs[i].myimage);  
      }
  }


  for (int i= 0; i<5;i++)
  {

    if(myImages[i].start_time*1000.0f < currentMillis  )
      if(myImages[i].end_time*1000.0f > currentMillis  )
      {
        //this is where the images would have been painted
        //background(myImages[i].myimage);  
        // image(myImages[i].myimage,0,0);
      }


  }



//printing the text's
  for (int i= 0; i<108;i++)
  {

    if(myText[i].start_time*1000.0f < currentMillis  )
      if(myText[i].end_time*1000.0f > currentMillis  )
      {
        textFont(myText[i].f, myText[i].getCurrentSize(currentMillis) );
        fill(myText[i].getCurrentColor(currentMillis));
        text(myText[i].word, myText[i].getCurrentX(currentMillis) ,myText[i].getCurrentY(currentMillis));
      }
  }

  if(printMillis)
  {
    textFont(f, 27 );
    fill(color(0,0,0));
    text(" "+currentMillis,10,20);
  }
}



//convinience class for holding data
class imageData 
{

  float start_time;
  float end_time;
  PImage myimage;

  imageData(float in_start_time,float in_end_time,PImage inmyimage) 
  {
    start_time = in_start_time;
    end_time = in_end_time ;
    myimage = inmyimage;
  }

}


//convinience class for holding and calcylating data that has with the text's
class textData 
{

  color text_start_color = color(204, 153, 0);
  color text_end_color  = color(204, 153, 0);
  float text_start_size = 105.0;
  float text_end_size = 105.0;

  float text_start_positionX;
  float text_end_positionX;
  float text_start_positionY;
  float text_end_positionY;
  String word = "AAAAA";
  float start_time;
  float end_time;
  PFont f;

  textData(String inW,float in_start_time,float in_end_time,
  color in_text_start_color,color in_text_end_color, 
  float in_text_start_size,float in_text_end_size,
  float in_text_start_positionX ,float in_text_end_positionX,
  float in_text_start_positionY,float in_text_end_positionY, PFont inff) 
  {


    word = inW;
    start_time = in_start_time;
    end_time = in_end_time ;

    text_start_color =in_text_start_color;
    text_end_color  = in_text_end_color;

    text_start_size = in_text_start_size;
    text_end_size = in_text_end_size;

    text_start_positionX = in_text_start_positionX;
    text_end_positionX = in_text_end_positionX;

    text_start_positionY = in_text_start_positionY;
    text_end_positionY = in_text_end_positionY;



    f= inff;
  }

  float getCurrentX(float milliseconds)
  {

    float lengthOfMeX = text_end_positionX - text_start_positionX;
    float timeLength = (end_time - start_time);
    float MintPos = lengthOfMeX/timeLength;
    float derivateTime = (milliseconds/1000)-(start_time);
    float currentPos =   (MintPos)*(derivateTime);

    return text_start_positionX+currentPos;
  }

  float getCurrentY(float milliseconds)
  {
    float lengthOfMeY = text_end_positionY - text_start_positionY;
    float timeLength = (end_time - start_time);
    float MintPos = lengthOfMeY/timeLength;
    float derivateTime = (milliseconds/1000)-(start_time);
    float currentPos =   (MintPos)*(derivateTime);

    return text_start_positionY+currentPos;
  }


  float getCurrentSize(float milliseconds)
  {
    float sizeOfMe = text_end_size - text_start_size;
    float timeLength = (end_time - start_time);
    float MintPos = sizeOfMe/timeLength;
    float derivateTime = (milliseconds/1000)-(start_time);
    float currentPos =   (MintPos)*(derivateTime);

    return text_start_size+currentPos;
  }

  color getCurrentColor(float milliseconds)
  {

    float derivateTime = (milliseconds/1000)-(start_time);
    float timeLength = (end_time - start_time);

    float MeR = red (text_end_color)- red(text_start_color);
    float MintPosR = MeR/timeLength;
    float currentPosR =   (MintPosR)*(derivateTime);

    float MeG = green (text_end_color)- green(text_start_color);
    float MintPosG = MeG/timeLength;
    float currentPosG =   (MintPosG)*(derivateTime);

    float MeB = blue (text_end_color)- blue(text_start_color);
    float MintPosB = MeB/timeLength;
    float currentPosB =   (MintPosB)*(derivateTime);

    return  color (red(text_start_color)+currentPosR, green(text_start_color)+currentPosG, blue(text_start_color)+currentPosB) ;

  }
}


void stop()
{
  super.stop();
}



