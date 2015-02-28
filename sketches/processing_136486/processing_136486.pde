
//variables
PFont font;
String time;
int counter = 0; 
PImage headdown;
//PImage alarmed;
//PImage afteralarm;
PImage graybg;
PImage whitepeacock;
PImage colorfulslide1;
PImage colorfulslide2;
PImage colorfulslide3;
PImage colorfulslide4;
PImage colorfulslide5;
PImage colorfulslide6;
PImage colorfulslide7;

void setup(){
  size(600,450);
  headdown = loadImage("headdown.png");
  //alarmed = loadImage("alarmed.png");
  //afteralarm = loadImage("afteralarm.png");
  graybg = loadImage("graybg.png");
  whitepeacock = loadImage("whitepeacock.png");
  colorfulslide1 = loadImage("colorfulslide1.png");
  colorfulslide2 = loadImage("colorfulslide2.png");
  colorfulslide3 = loadImage("colorfulslide3.png");
  colorfulslide4 = loadImage("colorfulslide4.png");
  colorfulslide5 = loadImage("colorfulslide5.png");
  colorfulslide6 = loadImage("colorfulslide6.png");
  colorfulslide7 = loadImage("colorfulslide7.png");
  font = loadFont("GillSansMT-24.vlw");

}

void mouseClicked(){
 counter +=1; 
}

void draw(){
  if(counter==0){
  image(graybg,0,0,600,450);
  image(headdown,0,0,600,450);
  text ("click for something colorful", 100, 200);
  }
  if(counter==1){
  float sec = millis()/1000;
  if (sec == 1){
    image(colorfulslide1,0,0,600,450);
    image(whitepeacock,0,0,600,450);
  }
  if (sec == 2){
    image(colorfulslide2,0,0,600,450);
    image(whitepeacock,0,0,600,450);
  }
    if (sec == 3){
    image(colorfulslide3,0,0,600,450);
    image(whitepeacock,0,0,600,450);
}
if (sec == 4){
    image(colorfulslide4,0,0,600,450);
    image(whitepeacock,0,0,600,450);
}
if (sec == 5){
    image(colorfulslide5,0,0,600,450);
    image(whitepeacock,0,0,600,450);
}
if (sec == 6){
    image(colorfulslide6,0,0,600,450);
    image(whitepeacock,0,0,600,450);
}
if (sec == 7){
    image(colorfulslide7,0,0,600,450);
    image(whitepeacock,0,0,600,450);
}
}
}


