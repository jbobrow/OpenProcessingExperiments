
PFont font;
PImage cover;
PImage ear;
PImage eye;
PImage mouth;
PImage sure;
PImage no;
PImage hand;
PImage foot;

int frame = 0;

void setup () {
size (640,480);
smooth();

font = loadFont("CrappyDan-35.vlw");

cover = loadImage("cover.jpg");
ear = loadImage("ear.jpg");
eye = loadImage("eye.jpg");
mouth = loadImage("mouth.jpg");
sure = loadImage("sure.jpg");
no = loadImage("no.jpg");
hand = loadImage("hand.jpg");
foot = loadImage("foot.jpg");

}


void draw() {
  image(cover, 0,0);
  textFont (font);
  fill(0);
  text ("Hmm...", 448,426);
  
  if (frame ==1) {
    image(eye,0,0);
    text ("boooring", 300, 438);
  }
   if (frame ==2) {
     image(mouth,0,0);
     text("it's gotta be in here somewhere", 6, 456);
   }
   if (frame == 3) {
     image(foot, 0, 0);
     text ("no no no no", 333, 455);
   }
   if (frame==4) {
     image(ear, 0,0);
     text("just take me to the boobies!",7,460);
   }
   if (frame==5) {
     image(sure, 0, 0);
     text("yesss", 412, 350);
   }
   if (frame==6) {
     image(no,0,0);
     text (" >:(", 290, 360);
   }
   if (frame==7) {
     image(hand,0,0);
     text ("i give up", 257,425);
   }
}

void mousePressed() {
 frame++; 
 if (frame > 7) {
   frame = 0;
 }
}

