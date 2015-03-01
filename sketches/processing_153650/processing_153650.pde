
/*
 * Creative Coding
 * Week 5, 02 - Digital Clock
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *  
 * Kathleen Healion
 *
 * This sketch shows how to use text in Processing
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 * Use the 'h', 'm' and 's' keys to enlarge the hours, minutes or seconds in the display.
 * This version is a cuckoo clock that chimes on the hour.
 * A bird   flies around the dial according to the hour and time of day.
 * The dial is 12 hours, different colours and birds for daytime (blue, skylark) and 
 * night (dark grey, owl).
 * The cuckoo sings on each new hour, the image lasting until the minute changes.
 * To test the cuckoo, press "t".
 */
PFont myFont;    // font data
char  selected;  // what is selected (h,m,s)
int   gap;       // gap between digits
PImage[] myImage;    // PImage is used to store an image in memory
float scaleOfImage;  // current scale of the image
PImage bgImage;      // display window image
PImage useImage;
int selectedImageNum;
float midX;
float midY;
boolean chime;
int testmin;
color bcolor;
color dcolor;
color ncolor;
color timeColor;
float [] Xtab;
float [] Ytab;
int [] times; 
String theText;
float TextWidth;

// setup the minim library and audio player
import ddf.minim.*;      // import the minim libraries into Processing
Minim minim;             // declare a variable "minim" of type "Minim"
AudioPlayer[] soundFx;   // an array of audio players

void setup() {
  size(600, 600);
  // create sound player and load samples
  minim = new Minim(this);
  soundFx = new AudioPlayer[4];  // 3 audio players - 1 for each sound
  soundFx[0] = minim.loadFile("sound01.wav");
  soundFx[1] = minim.loadFile("sound02.wav");
  soundFx[2] = minim.loadFile("sound03.wav");
  soundFx[3] = minim.loadFile("cuckooclock.mp3");
  chime = false;
  testmin = 0;
  bcolor = #FFCF86;
  dcolor = #ACF4FA;
  ncolor = 155;
  Xtab = new float [25];
  Ytab = new float [25];
  times = new int [25];
 

  // allocate a new array with space for three images
  myImage = new PImage[3];
  myImage[0] = loadImage("skylark.png");
  myImage[1] = loadImage("cuckoo.png");
  myImage[2] = loadImage("owl.png");
  bgImage = createImage(width, height, RGB);
  
  // set initial scale to be 0.5 and use the first image (index 0)
  scaleOfImage = 0.5;
  selectedImageNum = 0;
  midX = width/2;
  midY = height/2;



  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = 50;
  noStroke();
}

void draw() {
  background(bcolor);
  if ((hour() < 6) | (hour() > 18)){
    timeColor = ncolor;
    
    useImage = myImage[2];
    for (int g = 12; g < 24; g++){
       times[g] =  (g + 7 ) % 24;
    }
  }
  else
  {
      timeColor = dcolor;
      useImage = myImage[0];
      
      for (int g = 12; g < 24; g++){
       times[g] =  (g - 5 );
    }
   }
  fill(timeColor);
  noStroke();
  ellipse( width/2, height/2, width, height);
  fill(#FFF3D8);
  ellipse( width/2, height/2, width * .70, height* .70);
  fill(bcolor);
  ellipse( width/2, height/2, width * .55, height* .55);
  rect(0,height/2, width, height/2);
  fill(255);
  float lX;
  float lY;
  float degs = 360/24;
  for(int a = 24; a > 11; a--){
     lX = midX + (cos(radians(a*degs))*midX);
     lY = midY + (sin(radians(a*degs))* midY);
     Xtab[a] = lX;
     Ytab[a] = lY;
     
     
 //    println(" cos(radians(a*degs) = " + cos(radians(a*degs)) +
 //                      " sin(radians(a*degs)) = " + sin(radians(a*degs)));
 //    println(" a = " + a +"  a*degs = " + a*degs + "  lX = " + lX + " lY  = " + lY);
     stroke(255, 0, 0);
     line(midX, midY, lX, lY);  
     
  }
  
// set positions for outer sections
// 
   for (int g = 12; g < 24; g++){
         
      lX = midX + (cos(radians((g*degs)+degs/2))*midX*.85);
      lY = midY + (sin(radians((g*degs)+degs/2))* midY*.85);
      Xtab[g] = lX;
      Ytab[g] = lY;
       
//         println("lX = " + lX + "  lY = " + lY);
      
      
    }
    int bX = (hour() - 7) % 24;
    imageMode(CENTER);
    image(useImage, Xtab[bX], Ytab[bX], 76, 57);  // time of day bird
       
// put numbers on dial    
    
    
    for (int g = 12; g < 24; g++){
        fill(0, 0, 255);
        lX = midX + (cos(radians((g*degs)+degs/2))*midX*.62);
        lY = midY + (sin(radians((g*degs)+degs/2))* midY*.62);
        Xtab[g] = lX;
        Ytab[g] = lY;
 
     textSize(20); 
 
     theText = str(times[g]);
     TextWidth = textWidth(theText) * 0.5; 
     text(times[g] , Xtab[g] - TextWidth, Ytab[g]);  
     
     
   
  }
  
//  check for hour change or cuckoo test
  if ((minute() == 0)  || testmin == minute() || (selected == 't')) {
      onHour(hour()) ;
 
   }
   else {
      chime = false;
   }

  imageMode(CENTER);
 
  // draw h, m, s
  fill(155);
  drawNumber(hour(), selected == 'h', -gap, 0);
  text(" : ", width/2  -(gap*2 /3), height  - 20 - (textAscent() * 0.375) );
  drawNumber(minute(), selected == 'm', 0, 0);
  text(" : ", width/2  + (gap / 2), height  - 20 - (textAscent() * 0.375) );
  drawNumber(second(), selected == 's', gap, 0);
  color c = color(selected == 'h' ? 255 : 0, selected == 'm' ? 255 : 0, selected == 's' ? 255 : 0);
  drawBanner(c, 10);

}

/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 *
 */
void drawNumber(int number, boolean big, float offsetX, float offsetY) {
  theText = str(number); // convert number to string
  if (big){
    textSize(400); // set big font size
  }
  else {
    textSize(20);  // normal font size
  }
  TextWidth = textWidth(theText) * 0.5;
  float TextAscent = textAscent() * 0.375;

  // draw text offset from the centre of the screen

  if (big) {
     fill(255);
     text(theText, width/2 - textWidth(theText)/2, height  - 20 - TextAscent - offsetY);
     fill(155);
     textSize(20); 
     TextWidth = textWidth(theText) * 0.5;
     TextAscent = textAscent() * 0.375;
     text(theText, width/2 - TextWidth + offsetX, height  - 20 - TextAscent - offsetY);
  }
  else {
     text(theText, width/2 - TextWidth + offsetX, height  - 20 - TextAscent - offsetY);
  }
   
}

/*
 * drawBanner
 * draw a coloured banner at the bottom of the screen in the supplied colour
 */
 void drawBanner(color c, float w) {
    noStroke();
    fill(c);
    rect(0, height - w, width, w);
 }



 void keyReleased() {
// set selected to be the last key released
  selected = key;
 }

 void onHour(int hr){
 fill(255,00,00);
 ellipseMode(CORNER); 

 ellipse(width/2 - 125, height - 250,  250, 200);
 ellipseMode(CENTER); 

 imageMode(CENTER);
 selectedImageNum = 0;

 if (chime == false){
    int selectSound = 3;
     
    soundFx[selectSound].rewind();
    soundFx[selectSound].play();
    selected = ' ';
    testmin = minute();
    chime = true;
 }
 image(myImage[1], width/2, height - 150, 200, 150);
 if (testmin != minute()){
    testmin = 0;
 }
  
}


