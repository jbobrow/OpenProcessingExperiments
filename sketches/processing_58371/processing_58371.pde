
float mRightn300 = 300;
float mRightn160 = 160;
float mRightn100 = -100;
float mRight = 0;
float mRight200 = 200;
float mRight180 = 180;
float mRight250 = 250;

float mLeftn200 = -200;
float mLeft = 400;
float mLeft100 = 100;
float mLeft120 = 120;
float mLeft140 = 140;
float mLeft180 = 180;
float mLeft200 = 200;

float randY = random(1,400);
float randY2 = random(1,400);
float randY3 = random(1,400);
float randY4 = random(1,400);
float randY5 = random(1,400);
float randY6 = random(1,400);
float randY7 = random(1,400);
float randY8 = random(1,400);
float randY9 = random(1,400);
float randY10 = random(1,400);
float randY11 = random(1,400);
float randY12 = random(1,400);
float randY13 = random(1,400);
float randY14 = random(1,400);

float RandR = random(0,255);
float RandG = random(0,255);
float RandB = random(0,255);

void setup() {
  size(400,400);
  
}

void draw() {
  background (0,0,0);
  
//---Typography:
  aliceInWonderlandQuote ();
  roughTypewriter ();
  splendid66 ();
  _1942Report ();
  landromat1967 ();
  radarOne ();
  imWeird ();
  arcadeClassic ();
  anorexia ();
  aristotlePunk ();
  draconianTypewriter ();

}

//----Typography:

void aliceInWonderlandQuote () {
 PFont font;
 font = loadFont("Facelift-10.vlw");
 textFont (font, 10);
 fill(250,250,250,40);
 text("“If I had a world of my own, everything would be nons",8,9);
 text("ense. Nothing would be what it is, because everything" ,4,89);
 text("would be what it isn't. And contrary wise, what it is, it",4,169);
 text("wouldn't be. And what it wouldn't be, it would. You see?”",4,209);
 text(" ~ Alice, Disney's animated Alice in Wonderland [Ani",2,329);
 text("mation, 1951]",4,379);
}

void roughTypewriter () {
  PFont font;
 font = loadFont("Rough_Typewriter-48.vlw");
 textFont (font, 20);
 fill(random(200,255),0,0);
 text("What a Plague Nonsense can Be",mLeft,randY);
 mLeft = mLeft - 3;
 if(mLeft < -320) {mLeft = 400; randY = random(1,400);}
}
 
void splendid66 () {
  PFont font;
 font = loadFont("Splendid66-Bold-25.vlw");
 textFont(font,20);
 noStroke();
 fill(1,random(0,255),random(0,255));
 text("Running around all day, and doing what?", mRight,randY2);
 mRight = mRight + 3;
 if(mRight > 400) {
   mRight = -370;
   randY2 = random(1,400);}
}
  
void _1942Report () {
  PFont font;
 font = loadFont("1942report-14.vlw");
 textFont(font,10);
 noStroke();
 fill(random(0,255),random(0,255),random(0,255));
 text("Am I not wasting my time by thinking about whether or not I'm wasting my time?", mRight200,randY3);
 mRight200 = mRight200 + 3;
 if(mRight200 > 400) {
   mRight200 = -550;
   randY3 = random(1,400);}
}
 
void landromat1967 () {
  PFont font;
 font = loadFont("laundromat1967-12.vlw");
 textFont(font,12);
 noStroke();
 fill(random(230,255),random(230,255),random(230,255));
 text("How peculiar it is when people say they are better than animals. Is there really much difference?", mRight250,randY4);
 mRight250 = mRight250 + 5;
 if(mRight250 > 400) {
   mRight250 = -600;
   randY4 = random(1,400);}
}
 
void radarOne () {
  PFont font;
 font = loadFont("radar.one-15.vlw");
 textFont (font, 15);
 fill(random(0,100),random(0,100),random(0,100));
 text("There's a strong difference between knowledge and intelligence, you know.",mLeft100,randY5);
 mLeft100 = mLeft100 - 3;
 if(mLeft100 < -670) {
 mLeft100 = 400; 
 randY5 = random(1,400);}
}
 
void imWeird () {
  PFont font;
 font = loadFont("i'mWeird-25.vlw");
 textFont (font, 15);
 fill(random(0,255),random(0,100),random(0,100));
 text("“Few people are capable of expressing with equanimity opinions which differ from the prejudices of their social environment. Most people are even incapable of forming such opinions.” ~ Albert Einstein",mLeft120,randY6);
 mLeft120 = mLeft120 - 7;
 if(mLeft120 < -1400) {
 mLeft120 = 400; 
 randY6 = random(1,400);}
}
 
void arcadeClassic () {
  PFont font;
 font = loadFont("ArcadeClassic-40.vlw");
 textFont (font, 40);
 fill(random(1,255),random(0,50),random(0,50), 50);
 text("ERROR - SYSTEM DOWN - ERROR - SYSTEM DOWN - ERROR - SYSTEM DOWN - ERROR",mLeft140,randY7);
 mLeft140 = mLeft140 - 7;
 if(mLeft140 < -1400) {
 mLeft140 = 400; 
 randY7 = random(1,400);}
 
 font = loadFont("ArcadeClassic-40.vlw");
 textFont (font, 40);
 fill(random(1,255),random(0,50),random(0,50), 90);
 text("ERROR - SYSTEM DOWN - ERROR - SYSTEM DOWN - ERROR - SYSTEM DOWN - ERROR",mLeft180,randY8);
 mLeft180 = mLeft180 - 3;
 if(mLeft180 < -1400) {
 mLeft180 = 400; 
 randY8 = random(1,400);}
 
 font = loadFont("ArcadeClassic-40.vlw");
 textFont (font, 40);
 fill(random(0,50),random(0,50),random(1,255), 80);
 text("SYSTEM DOWN - ERROR - SYSTEM DOWN - ERROR - SYSTEM DOWN - ERROR - SYSTEM DOWN",mLeft200,randY9);
 mLeft200 = mLeft200 - 10;
 if(mLeft200 < -1400) {
 mLeft200 = 400; 
 randY9 = random(1,400);}
 
 font = loadFont("ArcadeClassic-40.vlw");
 textFont(font,40);
 noStroke();
 fill(random(0,50),random(1,255),random(0,50), 60);
 text("SYSTEM DOWN - ERROR - SYSTEM DOWN - ERROR - SYSTEM DOWN - ERROR - SYSTEM DOWN", mRight180,randY10);
 mRight180 = mRight180 + 5;
 if(mRight180 > 400) {
   mRight180 = -1400;
   randY10 = random(1,400);}
}
   
void anorexia () {
  PFont font;
 font = loadFont("Anorexia-35.vlw");
 textFont(font,35);
 noStroke();
 fill(250,250,250,50);
 text("Twizted Whisperz in your Head", mRightn100,randY11);
 mRightn100 = mRightn100 + 5;
 if(mRightn100 > 400) {
   mRightn100 = -300;
   randY11 = random(1,400);}
   
 font = loadFont("Anorexia-35.vlw");
 textFont(font,12);
 noStroke();
 fill(250,250,250);
 text("“The mind must be a passive, reactionless sheet of white paper, on which reality will simply come and register its philosophic definition, as a chronograph.” - William James, Psychologist", mRightn300,randY12);
 mRightn300 = mRightn300 + 5;
 if(mRightn300 > 400) {
   mRightn300 = -700;
   randY12 = random(1,400);}
}
   
void aristotlePunk () {
  PFont font;
 font = loadFont("AristotlePunk-35.vlw");
 textFont (font, 35);
 fill(20,255,20);
 text("“I believe in originality. Imitation is suicide. When all think alike, then no one is thinking.” ~ Walter Lipphan",mLeftn200,randY13);
 mLeftn200 = mLeftn200 - 15;
 if(mLeftn200 < -1400) {
 mLeftn200 = 400; 
 randY13 = random(1,400);}
}
 
void draconianTypewriter () {
  PFont font;
 font = loadFont("DraconianTypewriter-35.vlw");
 textFont (font, 35);
 fill(255,0,144);
 text("“I think, as an artist, you have to have a kind of style that represents your entire life, not just your work.” – Michael James [Make-Up Artist]",mRightn160,randY14);
 mRightn160 = mRightn160 + 5;
 if(mRightn160 > 400) {
   mRightn160 = -3800;
   randY14 = random(1,400);}
}

