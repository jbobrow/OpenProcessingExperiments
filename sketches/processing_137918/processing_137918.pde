
/* 
 *** *** *** 
 *** RANDOM WISDOM :) 
 *** by Atoro, 2014
 *** The program generates random scenes and sentences. 
 *** The idea is to show how with a random combination of images and words can be achieved 
 *** an interesting situation.
 *** USE IT JUST FOR FUN !!! 
 *** 
 *** All images are from: http://openclipart.org/
 *** All of them are under Creative Common License 
 ***
 *** !!! PLEASE, WAIT 1 MINUTE WHILE PROGRAM IS LOADING !!!
 *** 
 *** *** *** 
 */

int BALLOONS_NUM = 8; 
int BGNDS_NUM = 25; 
int PERSONS_NUM = 95; 
int TEXT_SIZE = 32; 
PFont font; 

// *** Word sets 
String[] conditions = {
  "If", "If", "If", "If", 
  "In case that", "When", "Whenever", "While"
}; 
String[] pronouns = {
  "I", "you", "he", "she", "it", "we", "you", "they"
}; 
String[] auxVerbs = {
  "do not", "don't", "do NOT", "DO NOT", "DON'T"
}; 
String[] verbs = {
  "allow", "answer", "arrive", "ask", 
  "become", "begin", "believe", "bring", "burn", "buy", 
  "call", "change", "choose", "clean", "close", "come", "compare", "continue", "cook", "cost", "count", "cry", "cut", 
  "dance", "decide", "describe", "destroy", "die", "drink", "drive", 
  "eat", "end", "enjoy", "explain", 
  "fall", "feel", "fight", "fill", "find", "finish", "forget", "forgive", 
  "give", "go", 
  "hate", "have", "hear", "help", "hide", "hold", "hope", "hurt", 
  "improve", 
  "jump", 
  "kill", "know", 
  "laugh", "learn", "leave", "lie", "like", "listen", "live", "look", "lose", "love", 
  "make", "meet", "move", 
  "need", 
  "occur", "offer", "open", 
  "pay", "play", "prefer", "prepare", "press", "promise", "pull", "push", "put", 
  "read", "receive", "recognize", "remember", "repeat", "rest", "return", "run", 
  "say", "see", "sell", "send", "shout", "show", "sing", "sit", "sleep", "smile", "speak", "start", "stay", "study", "suggest", "support", 
  "take", "talk", "teach", "tell", "think", "throw", "touch", "travel", "treat", "try", 
  "understand", "use", "visit", "want", "wash", "win", "work", "write"
}; 
String[] commas = {
  ",", " -", " --"
}; 
String[] modVerbs = {
  "can", "may", "must", "should"
}; 
String[] neg = {
  "not", "NOT"
}; 
String[] punct = {
  "", ".", "...", "!", "!!", "!!!"
}; 

void setup() {
  size(900, 675);
  // *** Initial screen 
  background(0); 
  font = loadFont("data/fonts/ComicSansMS-Bold-48.vlw");
  textAlign(CENTER); 
  textFont(font, TEXT_SIZE*2); 
  fill(255); 
  text("RANDOM WISDOM :)", width/2, height/2-TEXT_SIZE*2);
  textFont(font, TEXT_SIZE); 
  fill(191); 
  text("Press [SPACE] to redraw", width/2, height/2);
  // text("or", width/2, height/2+TEXT_SIZE);
  // text("[S] to save", width/2, height/2+TEXT_SIZE*2);
  textAlign(RIGHT); 
  textFont(font, TEXT_SIZE); 
  fill(255); 
  text("by Atoro", width-TEXT_SIZE*2, height-TEXT_SIZE*3);
  textFont(font, TEXT_SIZE*0.75); 
  text("2014", width-TEXT_SIZE*2, height-TEXT_SIZE*2);
}

void draw() {
  noLoop(); // See keyPressed()
}

// *** When keyboard button is pressed 
void keyPressed() {
  if (key == ' ') { 
    displayBgnd(); 
    displayPersonLeft(); 
    displayPersonRight(); 
    displayBalloon(); 
    displaySentence(); 
    loop();
  }
  else if (key == 's' || key == 'S') save("im" + (frameCount+100000) + ".png");
}

// *** Display random background 
void displayBgnd() {
  imageMode(CORNER); 
  int ri = (int)random(BGNDS_NUM); 
  ri += 101; 
  PImage im = loadImage("bgnd" + ri + ".jpg"); 
  background(im);
  filter(BLUR);
}

// *** Display random person on the left side of the screen 
void displayPersonLeft() {
  int ri = (int)random(PERSONS_NUM); 
  ri += 101; 
  PImage im = loadImage(ri + ".png");
  imageMode(CORNER); 
  float re = (float)im.height / height; 
  float w = im.width/re; 
  float h = im.height/re; 
  image(im, 0, 0, w, h);
}

// *** Display random person on the right side of the screen 
void displayPersonRight() {
  pushMatrix(); 
  int ri = (int)random(PERSONS_NUM); 
  ri += 101; 
  PImage im = loadImage(ri + ".png");
  imageMode(CORNER); 
  float re = (float)im.height / height; 
  float w = im.width/re; 
  float h = im.height/re;   
  translate(w, 0);
  scale(-1, 1);
  image(im, w-width, 0, w, h);
  popMatrix();
}

// *** Display random caption balloon 
void displayBalloon() {
  pushMatrix(); 
  int ri = (int)random(BALLOONS_NUM); 
  ri += 101; 
  PImage im = loadImage("balloon" + ri + ".png");
  imageMode(CENTER); 
  float w = width*0.75; 
  float h = height*0.4; 
  color c = color(0, random(63, 255), random(63, 255));   
  tint(c); 
  if (random(1) > 0.5) {
    translate(width, 0);
    scale(-1, 1);
    image(im, width/2, height-h/2, w, h);
  }
  else image(im, width/2, height-h/2, w, h);
  noTint(); 
  popMatrix();
}

// *** Generate and display random sentence 
void displaySentence() {
  int ri = (int)random(conditions.length); 
  String wisdom = conditions[ri]; 

  do { 
    ri = (int)random(pronouns.length);
  }
  while (ri == 2 || ri == 3 || ri == 4); 
  wisdom += " " + pronouns[ri]; 

  if (random(1) > 0.5) { 
    ri = (int)random(auxVerbs.length); 
    wisdom += " " + auxVerbs[ri];
  }

  ri = (int)random(verbs.length); 
  wisdom += " " + verbs[ri]; 

  ri = (int)random(commas.length); 
  wisdom += commas[ri];

  color c = color(random(127, 255), 0, random(0, 255)); 
  fill(c); 
  textFont(font, TEXT_SIZE); 
  textAlign(CENTER); 
  textSize(TEXT_SIZE); 
  text(wisdom, width/2, height-TEXT_SIZE*4);
  // println(wisdom);

  ri = (int)random(pronouns.length); 
  wisdom = pronouns[ri]; 

  ri = (int)random(modVerbs.length); 
  wisdom += " " + modVerbs[ri]; 

  if (random(1) < 0.5) { 
    ri = (int)random(neg.length); 
    wisdom += " " + neg[ri];
  }

  ri = (int)random(verbs.length); 
  wisdom += " " + verbs[ri]; 

  ri = (int)random(punct.length); 
  wisdom += punct[ri]; 

  c = color(random(127, 255), 0, random(0, 255)); 
  fill(c); 
  textFont(font, TEXT_SIZE); 
  textAlign(CENTER); 
  textSize(TEXT_SIZE); 
  text(wisdom, width/2, height-TEXT_SIZE*2);
  // println(wisdom);
}

// *** *** *** Only for Processing.js
// @pjs //preload must be used to preload the image
/* 
 @pjs 
 preload="bgnd101.jpg"; 
 preload="bgnd102.jpg"; 
 preload="bgnd103.jpg"; 
 preload="bgnd104.jpg"; 
 preload="bgnd105.jpg"; 
 preload="bgnd106.jpg"; 
 preload="bgnd107.jpg"; 
 preload="bgnd108.jpg"; 
 preload="bgnd109.jpg"; 
 preload="bgnd110.jpg"; 
 preload="bgnd111.jpg"; 
 preload="bgnd112.jpg"; 
 preload="bgnd113.jpg"; 
 preload="bgnd114.jpg"; 
 preload="bgnd115.jpg"; 
 preload="bgnd116.jpg"; 
 preload="bgnd117.jpg"; 
 preload="bgnd118.jpg"; 
 preload="bgnd119.jpg"; 
 preload="bgnd120.jpg"; 
 preload="bgnd121.jpg"; 
 preload="bgnd122.jpg"; 
 preload="bgnd123.jpg"; 
 preload="bgnd124.jpg"; 
 preload="bgnd125.jpg"; 
 
 preload="101.png"; 
 preload="102.png"; 
 preload="103.png"; 
 preload="104.png"; 
 preload="105.png"; 
 preload="106.png"; 
 preload="107.png"; 
 preload="108.png"; 
 preload="109.png"; 
 preload="110.png"; 
 preload="111.png"; 
 preload="112.png"; 
 preload="113.png"; 
 preload="114.png"; 
 preload="115.png"; 
 preload="116.png"; 
 preload="117.png"; 
 preload="118.png"; 
 preload="119.png"; 
 preload="120.png"; 
 preload="121.png"; 
 preload="122.png"; 
 preload="123.png"; 
 preload="124.png"; 
 preload="125.png"; 
 preload="126.png"; 
 preload="127.png"; 
 preload="128.png"; 
 preload="129.png"; 
 preload="130.png"; 
 preload="131.png"; 
 preload="132.png"; 
 preload="133.png"; 
 preload="134.png"; 
 preload="135.png"; 
 preload="136.png"; 
 preload="137.png"; 
 preload="138.png"; 
 preload="139.png"; 
 preload="140.png"; 
 preload="141.png"; 
 preload="142.png"; 
 preload="143.png"; 
 preload="144.png"; 
 preload="145.png"; 
 preload="146.png"; 
 preload="147.png"; 
 preload="148.png"; 
 preload="149.png"; 
 preload="150.png"; 
 preload="151.png"; 
 preload="152.png"; 
 preload="153.png"; 
 preload="154.png"; 
 preload="155.png"; 
 preload="156.png"; 
 preload="157.png"; 
 preload="158.png"; 
 preload="159.png"; 
 preload="160.png"; 
 preload="161.png"; 
 preload="162.png"; 
 preload="163.png"; 
 preload="164.png"; 
 preload="165.png"; 
 preload="166.png"; 
 preload="167.png"; 
 preload="168.png"; 
 preload="169.png"; 
 preload="170.png"; 
 preload="171.png"; 
 preload="172.png"; 
 preload="173.png"; 
 preload="174.png"; 
 preload="175.png"; 
 preload="176.png"; 
 preload="177.png"; 
 preload="178.png"; 
 preload="179.png"; 
 preload="180.png"; 
 preload="181.png"; 
 preload="182.png"; 
 preload="183.png"; 
 preload="184.png"; 
 preload="185.png"; 
 preload="186.png"; 
 preload="187.png"; 
 preload="188.png"; 
 preload="189.png"; 
 preload="190.png"; 
 preload="191.png"; 
 preload="192.png"; 
 preload="193.png"; 
 preload="194.png"; 
 preload="195.png"; 
 
 preload="balloon101.png"; 
 preload="balloon102.png"; 
 preload="balloon103.png"; 
 preload="balloon104.png"; 
 preload="balloon105.png"; 
 preload="balloon106.png"; 
 preload="balloon107.png"; 
 preload="balloon108.png"; 
 
 */


