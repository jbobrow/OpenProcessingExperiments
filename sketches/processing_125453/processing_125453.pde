
import ddf.minim.*;  

color green = #1A8702;
color red = #FF0000;
color gold = #FFB604;
color white = #FFFFFF;

Minim minim;
AudioPlayer WeWishYou;
AudioSample bell;

void setup() {
  background(green);
  fill(white);
  text("Merry Christmas!", width/2, height/2);
  size(1000, 700);
  //importing bells sound and music
  minim = new Minim(this);
  WeWishYou = minim.loadFile("WeWishYouAMerryChristmasMIDIcath.wav");
  WeWishYou.play();
  WeWishYou.loop();
  bell = minim.loadSample("BellOnce.wav");
}

void draw() {
  textAlign(CENTER); 
  textSize(20);
  text("Key assignments... B: Bell, M: Mute Audio, U: Unmute Audio, Mouse Dragged or Moved: ?", width/2, height - 20);
  textSize(75);
  }

//muting audio and triggering the bells sound
void keyPressed() {
 if ( key == 'm' ) WeWishYou.mute();                      //audio mute
 if ( key == 'u' ) WeWishYou.unmute();                    //audio unmute
 if ( key == 'b' ) {                                      //triggering the bells and diplaying Ho!
   bell.trigger(); 
   background(red);
   text("Merry Christmas!", width/2, height/2);
   textSize(250);
   text("Ho!", width/2, height/5*2);
   text("Ho!", width/2, height/5*4);
   }  
  }

void keyReleased() {                                      //any key released shows Merry Christmas
  background(green);
  textSize(75);
  fill(white);
  text("Merry Christmas!", width/2, height/2);
  }  

//merry christmas on mouse move
void mouseMoved() {
  background(green);
  textSize(75);
  fill(white);
  text("Merry Christmas!", width/2, height/2);
  }

//happy new year on mouse drag
void mouseDragged() {
  textSize(10);
  text("Key assignments... B: Bell, M: Mute Audio, U: Unmute Audio", width/2, height - 20);
  background(green);
  textSize(75);
  text("And a Great 2014!", width/2, height/2);
  stroke(white);
  strokeWeight(3);
  line(width/2, height/2, random(0,1000),random(0,700));
  }


