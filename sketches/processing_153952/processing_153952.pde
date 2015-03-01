
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//The original work has been modified by Georgi Yankov for the first
//assessment for the "Creative Programming for Digital Media and
//Mobile Apps" course at the University of London.

//The code is fully functional but it needs to be cleaned and
//re-ordered. At the time of writing the code I declared individual
//variables instead of arrays. Using arrays will make code look 
//cleaner and will improve the scalability of the program.

// - georgi

int tvx, tvy;
int animx, animy;
int deck1x, deck1y;
int deck2x, deck2y;

float tintValue=128;
float rValue=128;
float gValue=128;
float bValue=128;

boolean deck1Playing = false;
boolean deck2Playing = false;
float rotateDeck1 = 0;
float rotateDeck2 = 0;
float currentFrame01p= 0;
float currentFrame02p= 0;
float currentFrame03p= 0;
float currentFrame04p= 0;
float currentFrame05p= 0;
float currentFrame06p= 0;
float currentFrame07p= 0;
float currentFrame08p= 0;
float currentFrame01 = 0;
float currentFrame02 = 0;
float currentFrame03 = 0;
float currentFrame04 = 0;
float currentFrame05 = 0;
float currentFrame06 = 0;
float currentFrame07 = 0;
float currentFrame08 = 0;
int margin = width/40;
int smallMargin=22;
PImage [] images01;
PImage [] images02;
PImage [] images03;
PImage [] images04;
PImage [] images05;
PImage [] images06;
PImage [] images07;
PImage [] images08;
PImage [] recordPlayer;
PImage TV;
PImage videoLoad;
PImage StartupScreen;
PImage PlayButton;
PImage StopButton;
PImage AddButton;
PImage AddedButton;
PImage FullScreenButton;
PImage notFullScreenButton;
PImage LoadScreenButton;
PImage ResetButton;
PImage Audio01;
PImage Audio02;
PImage Audio03;
PImage Audio04;
PImage Audio05;
Maxim maxim;
AudioPlayer player1;
AudioPlayer player1rev;
AudioPlayer player2;
AudioPlayer player2rev;
AudioPlayer player3;
AudioPlayer player3rev;
AudioPlayer player4;
AudioPlayer player4rev;
AudioPlayer player5;
AudioPlayer player5rev;
float speedAdjust=1.0;
int startupCounter = 0;
boolean startupScreen = true;
boolean loadDeck1 = false;
boolean loadDeck2 = false;
boolean videoLoaded = false;
boolean audioLoaded = false;
boolean loadScreen = true;
boolean playScreen = false;

int deck1video = 0;
int deck2video = 0;
int deck1audio = 0;
int deck2audio = 0;

void setup()
{
  size(640, 1136);
  imageMode(CENTER);
  images01 = loadImages("Animation_data/video_10_", ".jpg", 10);
  images02 = loadImages("Animation_data/video_02_", ".jpg", 10);
  images03 = loadImages("Animation_data/video_03_", ".jpg", 10);
  images04 = loadImages("Animation_data/video_04_", ".jpg", 10);
  images05 = loadImages("Animation_data/video_05_", ".jpg", 10);
  images06 = loadImages("Animation_data/video_06_", ".jpg", 10);
  images07 = loadImages("Animation_data/video_07_", ".jpg", 10);
  images08 = loadImages("Animation_data/video_08_", ".jpg", 10);
  Audio01 = loadImage("audio01.png");
  Audio02 = loadImage("audio02.png");
  Audio03 = loadImage("audio03.png");
  Audio04 = loadImage("audio04.png");
  Audio05 = loadImage("audio05.png");
  recordPlayer = loadImages("black-record_", ".png", 36);
  TV = loadImage("TV2s.png");
  StartupScreen = loadImage("StartupScreen.png");
  PlayButton = loadImage("play.png");
  StopButton = loadImage("stop.png");
  AddButton = loadImage("addred.png");
  AddedButton = loadImage("addgreen.png");
  videoLoad = loadImage("TV2s_load.png");
  FullScreenButton = loadImage("ok.png");
  notFullScreenButton = loadImage("notReady.png");
  LoadScreenButton = loadImage("back.png");
  ResetButton = loadImage("reset.png");
  maxim = new Maxim(this);
  player1 = maxim.loadFile("loop1.wav");
  player1.setLooping(true);
  player1rev = maxim.loadFile("loop1rev.wav");
  player1rev.setLooping(true);
  player2 = maxim.loadFile("loop2.wav");
  player2.setLooping(true);
  player2rev = maxim.loadFile("loop2rev.wav");
  player2rev.setLooping(true);
  player3 = maxim.loadFile("loop3.wav");
  player3.setLooping(true);
  player3rev = maxim.loadFile("loop3rev.wav");
  player3rev.setLooping(true);
  player4 = maxim.loadFile("loop4.wav");
  player4.setLooping(true);
  player4rev = maxim.loadFile("loop4rev.wav");
  player4rev.setLooping(true);
  player5 = maxim.loadFile("loop5.wav");
  player5.setLooping(true);
  player5rev = maxim.loadFile("loop5rev.wav");
  player5rev.setLooping(true);
  background(10);
}

void draw()
{
  if (startupScreen) {
    if (startupScreen) {      
      startupCounter+=2;
      if (startupCounter>=255) {
        startupScreen=false;
      }
      if (startupCounter>0) {
        background(0);
        image(StartupScreen, width/2, height/2, StartupScreen.width, StartupScreen.height);
      } else {
        background(0);
      }
      if (startupCounter<128) {
        fill(0, 0, 0, 255-2*startupCounter);
      } else {
        fill(0, 0, 0, 2*(startupCounter-128));
      }
      rect(0, 0, width, height);
    }
  } else if (loadScreen) {
    background(10); 
    imageMode(CENTER);
    tint(255, 128);

    //// Main Screen video
    if (deck1video==1||deck2video==1) {
      image(images01[(int)currentFrame01p], width/2, images01[0].height/2+margin, images01[0].width, images01[0].height);
    }
    if (deck1video==2||deck2video==2) {
      image(images02[(int)currentFrame02p], width/2, images02[0].height/2+margin, images02[0].width, images02[0].height);
    }
    if (deck1video==3||deck2video==3) {
      image(images03[(int)currentFrame03p], width/2, images03[0].height/2+margin, images03[0].width, images03[0].height);
    }
    if (deck1video==4||deck2video==4) {
      image(images04[(int)currentFrame04p], width/2, images04[0].height/2+margin, images04[0].width, images04[0].height);
    }
    if (deck1video==5||deck2video==5) {
      image(images05[(int)currentFrame05p], width/2, images05[0].height/2+margin, images05[0].width, images05[0].height);
    }
    if (deck1video==6||deck2video==6) {
      image(images06[(int)currentFrame06p], width/2, images06[0].height/2+margin, images06[0].width, images06[0].height);
    }
    if (deck1video==7||deck2video==7) {
      image(images07[(int)currentFrame07p], width/2, images07[0].height/2+margin, images07[0].width, images07[0].height);
    }
    if (deck1video==8||deck2video==8) {
      image(images08[(int)currentFrame08p], width/2, images08[0].height/2+margin, images08[0].width, images08[0].height);
    }

    noTint();
    //// Left previews
    image(images01[(int)currentFrame01], width/16, images01[0].height/10, images01[0].width/5, images01[0].height/5);
    image(images02[(int)currentFrame02], width/16, 1.5*images02[0].height/5+smallMargin, images02[0].width/5, images02[0].height/5);
    image(images03[(int)currentFrame03], width/16, 2.5*images03[0].height/5+2*smallMargin, images03[0].width/5, images03[0].height/5);
    image(images04[(int)currentFrame04], width/16, 3.5*images04[0].height/5+3*smallMargin, images04[0].width/5, images04[0].height/5);
    //// Right previews
    image(images05[(int)currentFrame05], width-width/16, images05[0].height/10, images05[0].width/5, images05[0].height/5);
    image(images06[(int)currentFrame06], width-width/16, 1.5*images06[0].height/5+smallMargin, images06[0].width/5, images06[0].height/5);
    image(images07[(int)currentFrame07], width-width/16, 2.5*images07[0].height/5+2*smallMargin, images07[0].width/5, images07[0].height/5);
    image(images08[(int)currentFrame08], width-width/16, 3.5*images08[0].height/5+3*smallMargin, images07[0].width/5, images08[0].height/5);
    ////
    image(TV, width/2, TV.height/2+margin, TV.width, TV.height);
    if (!videoLoaded) {
      image(videoLoad, width/2, TV.height/2+margin, TV.width, TV.height);
    }
    deck1x = (width/2)-recordPlayer[0].width/2-(margin*2);
    deck1y = TV.height+recordPlayer[0].height/2+margin;
    image(recordPlayer[(int) rotateDeck1], deck1x, deck1y, recordPlayer[0].width, recordPlayer[0].height);
    if (deck1Playing) {
      image(StopButton, deck1x, deck1y, StopButton.width, StopButton.height);
    } else {
      image(PlayButton, deck1x, deck1y, PlayButton.width, PlayButton.height);
    }
    deck2x = (width/2)+recordPlayer[0].width/2+(margin*2);
    deck2y = TV.height+recordPlayer[0].height/2+margin;
    image(recordPlayer[(int) rotateDeck2], deck2x, deck2y, recordPlayer[0].width, recordPlayer[0].height);
    if (deck2Playing) {
      image(StopButton, deck2x, deck2y, StopButton.width, StopButton.height);
    } else {
      image(PlayButton, deck2x, deck2y, PlayButton.width, PlayButton.height);
    }
    if (loadDeck1) {
      image(AddedButton, deck1x/2, deck1y, AddedButton.width, AddedButton.height);
    } else {
      image(AddButton, deck1x/2, deck1y, AddButton.width, AddButton.height);
    }
    if (loadDeck2) {
      image(AddedButton, width-deck1x/2, deck1y, AddedButton.width, AddedButton.height);
    } else {
      image(AddButton, width-deck1x/2, deck1y, AddButton.width, AddButton.height);
    }
    if (!audioLoaded&&!videoLoaded) {
      image(notFullScreenButton, 2*notFullScreenButton.width, height/2-2*notFullScreenButton.height, notFullScreenButton.width, notFullScreenButton.height);
    } else {
      image(FullScreenButton, 2*FullScreenButton.width, height/2-2*FullScreenButton.height, FullScreenButton.width, FullScreenButton.height);
    }
    image(ResetButton, width-2*ResetButton.width, height/2-2*ResetButton.height, ResetButton.width, ResetButton.height);
    image(Audio01, 1.5*width/8, height/2-3*Audio01.height, Audio01.width, Audio01.height);
    image(Audio02, width/2-2.5*width/16, height/2-3*Audio02.height, Audio02.width, Audio02.height);
    image(Audio03, width/2, height/2-3*Audio03.height, Audio03.width, Audio03.height);
    image(Audio04, width/2+2.5*width/16, height/2-3*Audio04.height, Audio04.width, Audio04.height);
    image(Audio05, width-1.5*width/8, height/2-3*Audio05.height, Audio05.width, Audio05.height);


    if (deck1Playing || deck2Playing) {
      if (speedAdjust<0) {
        player1rev.speed(abs(speedAdjust));
        player2rev.speed(abs((player2rev.getLengthMs()/player1rev.getLengthMs())*speedAdjust));
        player3rev.speed(abs((player3rev.getLengthMs()/player1rev.getLengthMs())*speedAdjust));
        player4rev.speed(abs((player4rev.getLengthMs()/player1rev.getLengthMs())*speedAdjust));
        player5rev.speed(abs((player5rev.getLengthMs()/player1rev.getLengthMs())*speedAdjust));
        currentFrame01p= currentFrame01p+1*speedAdjust;
        currentFrame02p= currentFrame02p+1*speedAdjust;
        currentFrame03p= currentFrame03p+1*speedAdjust;
        currentFrame04p= currentFrame04p+1*speedAdjust;
        currentFrame05p= currentFrame05p+1*speedAdjust;
        currentFrame06p= currentFrame06p+1*speedAdjust;
        currentFrame07p= currentFrame07p+1*speedAdjust;
        currentFrame08p= currentFrame08p+1*speedAdjust;
      } else {
        player1.speed(speedAdjust);
        player2.speed((player2.getLengthMs()/player1.getLengthMs())*speedAdjust);
        player3.speed((player3.getLengthMs()/player1.getLengthMs())*speedAdjust);
        player4.speed((player4.getLengthMs()/player1.getLengthMs())*speedAdjust);
        player5.speed((player2.getLengthMs()/player1.getLengthMs())*speedAdjust);
        currentFrame01p= currentFrame01p+1*speedAdjust;
        currentFrame02p= currentFrame02p+1*speedAdjust;
        currentFrame03p= currentFrame03p+1*speedAdjust;
        currentFrame04p= currentFrame04p+1*speedAdjust;
        currentFrame05p= currentFrame05p+1*speedAdjust;
        currentFrame06p= currentFrame06p+1*speedAdjust;
        currentFrame07p= currentFrame07p+1*speedAdjust;
        currentFrame08p= currentFrame08p+1*speedAdjust;
      }
    }
    currentFrame01= currentFrame01+1;
    currentFrame02= currentFrame02+1;
    currentFrame03= currentFrame03+1;
    currentFrame04= currentFrame04+1;
    currentFrame05= currentFrame05+1;
    currentFrame06= currentFrame06+1;
    currentFrame07= currentFrame07+1;
    currentFrame08= currentFrame08+1;
    if (currentFrame01 >= images01.length) { 
      currentFrame01 = 0;
    }
    if (currentFrame02 >= images02.length) { 
      currentFrame02 = 0;
    }
    if (currentFrame03 >= images03.length) { 
      currentFrame03 = 0;
    }
    if (currentFrame04 >= images04.length) { 
      currentFrame04 = 0;
    }
    if (currentFrame05 >= images05.length) { 
      currentFrame05 = 0;
    }
    if (currentFrame06 >= images06.length) { 
      currentFrame06 = 0;
    }
    if (currentFrame07 >= images07.length) { 
      currentFrame07 = 0;
    }
    if (currentFrame08 >= images08.length) { 
      currentFrame08 = 0;
    }

    if (currentFrame01p >= images01.length) {
      currentFrame01p = 0;
    }
    if (currentFrame01p < 0) {
      currentFrame01p = images01.length-1;
    }
    if (currentFrame02p >= images02.length) {
      currentFrame02p = 0;
    }
    if (currentFrame02p < 0) {
      currentFrame02p = images02.length-1;
    }
    if (currentFrame03p >= images03.length) {
      currentFrame03p = 0;
    }
    if (currentFrame03p < 0) {
      currentFrame03p = images03.length-1;
    }
    if (currentFrame04p >= images04.length) {
      currentFrame04p = 0;
    }
    if (currentFrame04p < 0) {
      currentFrame04p = images04.length-1;
    }
    if (currentFrame05p >= images05.length) {
      currentFrame05p = 0;
    }
    if (currentFrame05p < 0) {
      currentFrame05p = images05.length-1;
    }
    if (currentFrame06p >= images06.length) {
      currentFrame06p = 0;
    }
    if (currentFrame06p < 0) {
      currentFrame06p = images06.length-1;
    }
    if (currentFrame07p >= images07.length) {
      currentFrame07p = 0;
    }
    if (currentFrame07p < 0) {
      currentFrame07p = images07.length-1;
    }
    if (currentFrame08p >= images08.length) {
      currentFrame08p = 0;
    }
    if (currentFrame08p < 0) {
      currentFrame08p = images08.length-1;
    }

    if (deck1Playing) {

      rotateDeck1 += 1*speedAdjust;

      if (rotateDeck1 >= recordPlayer.length) {

        rotateDeck1 = 0;
      }
      if (rotateDeck1 < 0) {

        rotateDeck1 = recordPlayer.length-1;
      }
    }

    if (deck2Playing) {

      rotateDeck2 += 1*speedAdjust;

      if (rotateDeck2 >= recordPlayer.length) {

        rotateDeck2 = 0;
      }
      if (rotateDeck2 < 0) {

        rotateDeck2 = recordPlayer.length-1;
      }
    }
    
    // Stop non-loaded players
    if (deck1audio!=1&&deck2audio!=1) {player1.stop(); player1rev.stop();}
    if (deck1audio!=2&&deck2audio!=2) {player2.stop(); player2rev.stop();}
    if (deck1audio!=3&&deck2audio!=3) {player3.stop(); player3rev.stop();}
    if (deck1audio!=4&&deck2audio!=4) {player4.stop(); player4rev.stop();}
    if (deck1audio!=5&&deck2audio!=5) {player5.stop(); player5rev.stop();}
    
  } else if (playScreen) {
    background (rValue, gValue, bValue);
    imageMode(CENTER);
    tint(255, tintValue);

    //// Main Screen video
    if (deck1video==1) {
      image(images01[(int)currentFrame01p], width/2, images01[0].height/2+margin, images01[0].width, images01[0].height);
    }
    if (deck1video==2) {
      image(images02[(int)currentFrame02p], width/2, images02[0].height/2+margin, images02[0].width, images02[0].height);
    }
    if (deck1video==3) {
      image(images03[(int)currentFrame03p], width/2, images03[0].height/2+margin, images03[0].width, images03[0].height);
    }
    if (deck1video==4) {
      image(images04[(int)currentFrame04p], width/2, images04[0].height/2+margin, images04[0].width, images04[0].height);
    }
    if (deck1video==5) {
      image(images05[(int)currentFrame05p], width/2, images05[0].height/2+margin, images05[0].width, images05[0].height);
    }
    if (deck1video==6) {
      image(images06[(int)currentFrame06p], width/2, images06[0].height/2+margin, images06[0].width, images06[0].height);
    }
    if (deck1video==7) {
      image(images07[(int)currentFrame07p], width/2, images07[0].height/2+margin, images07[0].width, images07[0].height);
    }
    if (deck1video==8) {
      image(images08[(int)currentFrame08p], width/2, images08[0].height/2+margin, images08[0].width, images08[0].height);
    }
    
    
    tint(255, 255-tintValue);
    if (deck2video==1) {
      image(images01[(int)currentFrame01p], width/2, images01[0].height/2+margin, images01[0].width, images01[0].height);
    }
    if (deck2video==2) {
      image(images02[(int)currentFrame02p], width/2, images02[0].height/2+margin, images02[0].width, images02[0].height);
    }
    if (deck2video==3) {
      image(images03[(int)currentFrame03p], width/2, images03[0].height/2+margin, images03[0].width, images03[0].height);
    }
    if (deck2video==4) {
      image(images04[(int)currentFrame04p], width/2, images04[0].height/2+margin, images04[0].width, images04[0].height);
    }
    if (deck2video==5) {
      image(images05[(int)currentFrame05p], width/2, images05[0].height/2+margin, images05[0].width, images05[0].height);
    }
    if (deck2video==6) {
      image(images06[(int)currentFrame06p], width/2, images06[0].height/2+margin, images06[0].width, images06[0].height);
    }
    if (deck2video==7) {
      image(images07[(int)currentFrame07p], width/2, images07[0].height/2+margin, images07[0].width, images07[0].height);
    }
    if (deck2video==8) {
      image(images08[(int)currentFrame08p], width/2, images08[0].height/2+margin, images08[0].width, images08[0].height);
    }
    
    noTint();
    image(TV, width/2, TV.height/2+margin, TV.width, TV.height);
    image(LoadScreenButton, 2*LoadScreenButton.width, height/2-2*LoadScreenButton.height, LoadScreenButton.width, LoadScreenButton.height);
    image(ResetButton, width-2*ResetButton.width, height/2-2*ResetButton.height, ResetButton.width, ResetButton.height);
    if (deck1Playing || deck2Playing) {
      if (speedAdjust<0) {
        player1rev.speed(abs(speedAdjust));
        player2rev.speed(abs((player2rev.getLengthMs()/player1rev.getLengthMs())*speedAdjust));
        player3rev.speed(abs((player3rev.getLengthMs()/player1rev.getLengthMs())*speedAdjust));
        player4rev.speed(abs((player4rev.getLengthMs()/player1rev.getLengthMs())*speedAdjust));
        player5rev.speed(abs((player5rev.getLengthMs()/player1rev.getLengthMs())*speedAdjust));
        currentFrame01p= currentFrame01p+1*speedAdjust;
        currentFrame02p= currentFrame02p+1*speedAdjust;
        currentFrame03p= currentFrame03p+1*speedAdjust;
        currentFrame04p= currentFrame04p+1*speedAdjust;
        currentFrame05p= currentFrame05p+1*speedAdjust;
        currentFrame06p= currentFrame06p+1*speedAdjust;
        currentFrame07p= currentFrame07p+1*speedAdjust;
        currentFrame08p= currentFrame08p+1*speedAdjust;
      } else {
        player1.speed(speedAdjust);
        player2.speed((player2.getLengthMs()/player1.getLengthMs())*speedAdjust);
        player3.speed((player3.getLengthMs()/player1.getLengthMs())*speedAdjust);
        player4.speed((player4.getLengthMs()/player1.getLengthMs())*speedAdjust);
        player5.speed((player2.getLengthMs()/player1.getLengthMs())*speedAdjust);
        currentFrame01p= currentFrame01p+1*speedAdjust;
        currentFrame02p= currentFrame02p+1*speedAdjust;
        currentFrame03p= currentFrame03p+1*speedAdjust;
        currentFrame04p= currentFrame04p+1*speedAdjust;
        currentFrame05p= currentFrame05p+1*speedAdjust;
        currentFrame06p= currentFrame06p+1*speedAdjust;
        currentFrame07p= currentFrame07p+1*speedAdjust;
        currentFrame08p= currentFrame08p+1*speedAdjust;
      }
    }
    currentFrame01= currentFrame01+1;
    currentFrame02= currentFrame02+1;
    currentFrame03= currentFrame03+1;
    currentFrame04= currentFrame04+1;
    currentFrame05= currentFrame05+1;
    currentFrame06= currentFrame06+1;
    currentFrame07= currentFrame07+1;
    currentFrame08= currentFrame08+1;
    if (currentFrame01 >= images01.length) { 
      currentFrame01 = 0;
    }
    if (currentFrame02 >= images02.length) { 
      currentFrame02 = 0;
    }
    if (currentFrame03 >= images03.length) { 
      currentFrame03 = 0;
    }
    if (currentFrame04 >= images04.length) { 
      currentFrame04 = 0;
    }
    if (currentFrame05 >= images05.length) { 
      currentFrame05 = 0;
    }
    if (currentFrame06 >= images06.length) { 
      currentFrame06 = 0;
    }
    if (currentFrame07 >= images07.length) { 
      currentFrame07 = 0;
    }
    if (currentFrame08 >= images08.length) { 
      currentFrame08 = 0;
    }

    if (currentFrame01p >= images01.length) {
      currentFrame01p = 0;
    }
    if (currentFrame01p < 0) {
      currentFrame01p = images01.length-1;
    }
    if (currentFrame02p >= images02.length) {
      currentFrame02p = 0;
    }
    if (currentFrame02p < 0) {
      currentFrame02p = images02.length-1;
    }
    if (currentFrame03p >= images03.length) {
      currentFrame03p = 0;
    }
    if (currentFrame03p < 0) {
      currentFrame03p = images03.length-1;
    }
    if (currentFrame04p >= images04.length) {
      currentFrame04p = 0;
    }
    if (currentFrame04p < 0) {
      currentFrame04p = images04.length-1;
    }
    if (currentFrame05p >= images05.length) {
      currentFrame05p = 0;
    }
    if (currentFrame05p < 0) {
      currentFrame05p = images05.length-1;
    }
    if (currentFrame06p >= images06.length) {
      currentFrame06p = 0;
    }
    if (currentFrame06p < 0) {
      currentFrame06p = images06.length-1;
    }
    if (currentFrame07p >= images07.length) {
      currentFrame07p = 0;
    }
    if (currentFrame07p < 0) {
      currentFrame07p = images07.length-1;
    }
    if (currentFrame08p >= images08.length) {
      currentFrame08p = 0;
    }
    if (currentFrame08p < 0) {
      currentFrame08p = images08.length-1;
    }
  }
}


void mouseClicked()
{
  if (startupScreen) {
    //startupScreen=false;
  } else if (loadScreen) {
    //if (mouseX > (width/2)-recordPlayer[0].width-(margin*10) && mouseX < recordPlayer[0].width+((width/2)-recordPlayer[0].width-(margin*10)) && mouseY>TV.height+margin && mouseY <TV.height+margin + recordPlayer[0].height) {
    if (dist(mouseX, mouseY, deck1x, deck1y) < recordPlayer[0].width/2) {
      deck1Playing = !deck1Playing;
    }

    if (deck1Playing&&speedAdjust>0) {
      if (deck1audio==1) {
        player1.play();
        player1rev.stop();
      }
      if (deck1audio==2) {
        player2.play();
        player2rev.stop();
      }
      if (deck1audio==3) {
        player3.play();
        player3rev.stop();
      }
      if (deck1audio==4) {
        player4.play();
        player4rev.stop();
      }
      if (deck1audio==5) {
        player5.play();
        player5rev.stop();
      }
    } else if (deck1Playing&&(speedAdjust<0)) {
      if (deck1audio==1) {
        player1.stop();
        player1rev.play();
      }
      if (deck1audio==2) {
        player2.stop();
        player2rev.play();
      }
      if (deck1audio==3) {
        player3.stop();
        player3rev.play();
      }
      if (deck1audio==4) {
        player4.stop();
        player4rev.play();
      }
      if (deck1audio==5) {
        player5.stop();
        player5rev.play();
      }
    } else {
      if (deck1audio==1) {
        player1.stop();
        player1rev.stop();
      }
      if (deck1audio==2) {
        player2.stop();
        player2rev.stop();
      }
      if (deck1audio==3) {
        player3.stop();
        player3rev.stop();
      }
      if (deck1audio==4) {
        player4.stop();
        player4rev.stop();
      }
      if (deck1audio==5) {
        player5.stop();
        player5rev.stop();
      }
    }

    if (dist(mouseX, mouseY, deck2x, deck2y) < recordPlayer[0].width/2) {
      deck2Playing = !deck2Playing;
    }

    if (deck2Playing&&(speedAdjust>0)) {
      if (deck2audio==1) {
        player1.play();
        player1rev.stop();
      }
      if (deck2audio==2) {
        player2.play();
        player2rev.stop();
      }
      if (deck2audio==3) {
        player3.play();
        player3rev.stop();
      }
      if (deck2audio==4) {
        player4.play();
        player4rev.stop();
      }
      if (deck2audio==5) {
        player5.play();
        player5rev.stop();
      }
    } else if (deck2Playing&&(speedAdjust<0)) {
      if (deck2audio==1) {
        player1.stop();
        player1rev.play();
      }
      if (deck2audio==2) {
        player2.stop();
        player2rev.play();
      }
      if (deck2audio==3) {
        player3.stop();
        player3rev.play();
      }
      if (deck2audio==4) {
        player4.stop();
        player4rev.play();
      }
      if (deck2audio==5) {
        player5.stop();
        player5rev.play();
      }
    } else {
      if (deck2audio==1) {
        player1.stop();
        player1rev.stop();
      }
      if (deck2audio==2) {
        player2.stop();
        player2rev.stop();
      }
      if (deck2audio==3) {
        player3.stop();
        player3rev.stop();
      }
      if (deck2audio==4) {
        player4.stop();
        player4rev.stop();
      }
      if (deck2audio==5) {
        player5.stop();
        player5rev.stop();
      }
    }

    if (dist(mouseX, mouseY, deck1x/2, deck1y) < AddButton.width) {
      loadDeck1 = !loadDeck1;
      if (loadDeck2) {
        loadDeck2=false;
      }
    }
    if (dist(mouseX, mouseY, width-deck1x/2, deck1y) < AddButton.width) {
      loadDeck2 = !loadDeck2;
      if (loadDeck1) {
        loadDeck1=false;
      }
    }
    if ((dist(mouseX, mouseY, 2*FullScreenButton.width, height/2-2*FullScreenButton.height) < FullScreenButton.width) && videoLoaded && audioLoaded) {
      loadScreen=false;
      playScreen=true;
    }
    if (dist(mouseX, mouseY, width-2*ResetButton.width, height/2-2*ResetButton.height) < ResetButton.width) {
      reset();
    }

    // load video
    if (dist(mouseX, mouseY, width/16, images01[0].height/10) < images01[0].height/5) {
      if (loadDeck1) {
        deck1video = 1;
        videoLoaded = true;
      }
      if (loadDeck2) {
        deck2video = 1;
        videoLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width/16, 1.5*images02[0].height/5+smallMargin) < images02[0].height/5) {
      if (loadDeck1) {
        deck1video = 2;
        videoLoaded = true;
      }
      if (loadDeck2) {
        deck2video = 2;
        videoLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width/16, 2.5*images03[0].height/5+2*smallMargin) < images03[0].height/5) {
      if (loadDeck1) {
        deck1video = 3;
        videoLoaded = true;
      }
      if (loadDeck2) {
        deck2video = 3;
        videoLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width/16, 3.5*images04[0].height/5+3*smallMargin) < images04[0].height/5) {
      if (loadDeck1) {
        deck1video = 4;
        videoLoaded = true;
      }
      if (loadDeck2) {
        deck2video = 4;
        videoLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width-width/16, images05[0].height/10) < images05[0].height/5) {
      if (loadDeck1) {
        deck1video = 5;
        videoLoaded = true;
      }
      if (loadDeck2) {
        deck2video = 5;
        videoLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width-width/16, 1.5*images06[0].height/5+smallMargin) < images06[0].height/5) {
      if (loadDeck1) {
        deck1video = 6;
        videoLoaded = true;
      }
      if (loadDeck2) {
        deck2video = 6;
        videoLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width-width/16, 2.5*images07[0].height/5+2*smallMargin) < images07[0].height/5) {
      if (loadDeck1) {
        deck1video = 7;
        videoLoaded = true;
      }
      if (loadDeck2) {
        deck2video = 7;
        videoLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width-width/16, 3.5*images08[0].height/5+3*smallMargin) < images08[0].height/5) {
      if (loadDeck1) {
        deck1video = 8;
        videoLoaded = true;
      }
      if (loadDeck2) {
        deck2video = 8;
        videoLoaded = true;
      }
    }

    // load audio
    if (dist(mouseX, mouseY, 1.5*width/8, height/2-3*Audio01.height) < Audio01.width) {
      if (loadDeck1&&deck2audio!=1) {
        deck1audio = 1;
        audioLoaded = true;
      }
      if (loadDeck2&&deck1audio!=1) {
        deck2audio = 1;
        audioLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width/2-2.5*width/16, height/2-3*Audio02.height) < Audio02.width) {
      if (loadDeck1&&deck2audio!=2) {
        deck1audio = 2;
        audioLoaded = true;
      }
      if (loadDeck2&&deck1audio!=2) {
        deck2audio = 2;
        audioLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width/2, height/2-3*Audio03.height) < Audio03.width) {
      if (loadDeck1&&deck2audio!=3) {
        deck1audio = 3;
        audioLoaded = true;
      }
      if (loadDeck2&&deck1audio!=3) {
        deck2audio = 3;
        audioLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width/2+2.5*width/16, height/2-3*Audio04.height) < Audio04.width) {
      if (loadDeck1&&deck2audio!=4) {
        deck1audio = 4;
        audioLoaded = true;
      }
      if (loadDeck2&&deck1audio!=4) {
        deck2audio = 4;
        audioLoaded = true;
      }
    }
    if (dist(mouseX, mouseY, width-1.5*width/8, height/2-3*Audio05.height) < Audio05.width) {
      if (loadDeck1&&deck2audio!=5) {
        deck1audio = 5;
        audioLoaded = true;
      }
      if (loadDeck2&&deck1audio!=5) {
        deck2audio = 5;
        audioLoaded = true;
      }
    }
  } else if (playScreen) {
    if (dist(mouseX, mouseY, 2*LoadScreenButton.width, height/2-2*LoadScreenButton.height) < LoadScreenButton.width) {
      loadScreen=true;
      playScreen=false;
    }
    if (dist(mouseX, mouseY, width-2*ResetButton.width, height/2-2*ResetButton.height) < ResetButton.width) {
      reset();
    }
  }
}

void mouseDragged() {

  if (loadScreen) {

    if (mouseY>height/2) {

      speedAdjust=map(mouseX, 0, width, -2, 2);
      if (deck1Playing&&(speedAdjust>0)) {
        if (deck1audio==1) {
          player1.play();
          player1rev.stop();
        }
        if (deck1audio==2) {
          player2.play();
          player2rev.stop();
        }
        if (deck1audio==3) {
          player3.play();
          player3rev.stop();
        }
        if (deck1audio==4) {
          player4.play();
          player4rev.stop();
        }
        if (deck1audio==5) {
          player5.play();
          player5rev.stop();
        }
      } else if (deck1Playing&&(speedAdjust<0)) {
        if (deck1audio==1) {
          player1.stop();
          player1rev.play();
        }
        if (deck1audio==2) {
          player2.stop();
          player2rev.play();
        }
        if (deck1audio==3) {
          player3.stop();
          player3rev.play();
        }
        if (deck1audio==4) {
          player4.stop();
          player4rev.play();
        }
        if (deck1audio==5) {
          player5.stop();
          player5rev.play();
        }
      }
      if (deck2Playing&&(speedAdjust>0)) {
        if (deck2audio==1) {
          player1.play();
          player1rev.stop();
        }
        if (deck2audio==2) {
          player2.play();
          player2rev.stop();
        }
        if (deck2audio==3) {
          player3.play();
          player3rev.stop();
        }
        if (deck2audio==4) {
          player4.play();
          player4rev.stop();
        }
        if (deck2audio==5) {
          player5.play();
          player5rev.stop();
        }
      } else if (deck2Playing&&(speedAdjust<0)) {
        if (deck2audio==1) {
          player1.stop();
          player1rev.play();
        }
        if (deck2audio==2) {
          player2.stop();
          player2rev.play();
        }
        if (deck2audio==3) {
          player3.stop();
          player3rev.play();
        }
        if (deck2audio==4) {
          player4.stop();
          player4rev.play();
        }
        if (deck2audio==5) {
          player5.stop();
          player5rev.play();
        }
      }
    }
  } else if (playScreen) {
    if (mouseY>height/4) {
      
      tintValue=map(mouseY, height/4, 3*height/4, 0, 255);
      gValue=tintValue;
      speedAdjust=map(mouseX, 30, width-30, -2, 2);
      rValue=map(mouseX, 30, width-30, 0, 255);
      bValue=map(mouseX, 30, width-30, 255, 0);
      if (deck1Playing&&(speedAdjust>0)) {
        if (deck1audio==1) {
          player1.play();
          player1rev.stop();
        }
        if (deck1audio==2) {
          player2.play();
          player2rev.stop();
        }
        if (deck1audio==3) {
          player3.play();
          player3rev.stop();
        }
        if (deck1audio==4) {
          player4.play();
          player4rev.stop();
        }
        if (deck1audio==5) {
          player5.play();
          player5rev.stop();
        }
      } else if (deck1Playing&&(speedAdjust<0)) {
        if (deck1audio==1) {
          player1.stop();
          player1rev.play();
        }
        if (deck1audio==2) {
          player2.stop();
          player2rev.play();
        }
        if (deck1audio==3) {
          player3.stop();
          player3rev.play();
        }
        if (deck1audio==4) {
          player4.stop();
          player4rev.play();
        }
        if (deck1audio==5) {
          player5.stop();
          player5rev.play();
        }
      }
      if (deck2Playing&&(speedAdjust>0)) {
        if (deck2audio==1) {
          player1.play();
          player1rev.stop();
        }
        if (deck2audio==2) {
          player2.play();
          player2rev.stop();
        }
        if (deck2audio==3) {
          player3.play();
          player3rev.stop();
        }
        if (deck2audio==4) {
          player4.play();
          player4rev.stop();
        }
        if (deck2audio==5) {
          player5.play();
          player5rev.stop();
        }
      } else if (deck2Playing&&(speedAdjust<0)) {
        if (deck2audio==1) {
          player1.stop();
          player1rev.play();
        }
        if (deck2audio==2) {
          player2.stop();
          player2rev.play();
        }
        if (deck2audio==3) {
          player3.stop();
          player3rev.play();
        }
        if (deck2audio==4) {
          player4.stop();
          player4rev.play();
        }
        if (deck2audio==5) {
          player5.stop();
          player5rev.play();
        }
      }
    }
  }
}

void reset () {
  deck1Playing = false;
  deck2Playing = false;
  rotateDeck1 = 0;
  rotateDeck2 = 0;
  currentFrame01p= 0;
  currentFrame02p= 0;
  currentFrame03p= 0;
  currentFrame04p= 0;
  currentFrame05p= 0;
  currentFrame06p= 0;
  currentFrame07p= 0;
  currentFrame08p= 0;
  currentFrame01 = 0;
  currentFrame02 = 0;
  currentFrame03 = 0;
  currentFrame04 = 0;
  currentFrame05 = 0;
  currentFrame06 = 0;
  currentFrame07 = 0;
  currentFrame08 = 0;
  speedAdjust=1.0;
  startupCounter = 0;
  startupScreen = true;
  loadDeck1 = false;
  loadDeck2 = false;
  videoLoaded = false;
  audioLoaded = false;
  loadScreen = true;
  playScreen = false;

  deck1video = 0;
  deck2video = 0;
  deck1audio = 0;
  deck2audio = 0;

  player1.stop();
  player1rev.stop();
  player2.stop();
  player2rev.stop();
  player3.stop();
  player3rev.stop();
  player4.stop();
  player4rev.stop();
  player5.stop();
  player5rev.stop();
}

//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}


