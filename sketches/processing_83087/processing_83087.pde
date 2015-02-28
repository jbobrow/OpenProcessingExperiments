
PImage img;
String[] dict;
String word_to_guess;
String guessed_let = "";
int penalty;
boolean[] visible;
boolean solved_word;
int l = 40; 
int h = 185;
int left_space = (250-3*l+5);
int life_level;
float[] colour;
int col;
float s = 14; 
float px = -17*s; 
float py = 550;
float ew = 40; 
float eh = 90;
float gx; 
float gy;
float wx; 
float wy;
float bx = 540; 
float by = 470; 
float angle = PI;
int t_fill[] = {200, 200, 200};
String URL = "http://oxforddictionaries.com/us/definition/american_english/";
boolean linkbox = false;
boolean the_end = false;
boolean away_from_gallows = false;
String online_dictionary;
boolean introduction = true;
boolean first_time = true;
int c = int(random(0,8));

void setup() {
  size(850, 700);
  colorMode(HSB);
  colour = new float[9];
  col = 4; 
  life_level = 4;
  for (int i=0; i<9; i++) {
    colour[i] = 255/11*(i+3);
  }
  img = loadImage("IMG_0638.JPG");
  PFont font = loadFont("myFont.vlw");
  textAlign(CENTER, BOTTOM);
  dict = loadStrings("GREdictionary.txt");
  word_to_guess = dict[int(random(dict.length))];
  visible = new boolean[word_to_guess.length()];
  println(word_to_guess);
  for (int i =0; i <visible.length; i++) {
    visible[i] = false;
  }
  online_dictionary = URL+word_to_guess+"?q="+word_to_guess;
}


void draw() {
  image(img, 0, 0, width, height);
  if (introduction) {
  colorMode(RGB); fill(0,200); noStroke();
  rect(0,100,width,450);
  colorMode(HSB);
  fill(0); textSize(20);textAlign(CENTER,CENTER);
  fill(colour[0],255,255);
  text("Welcome to GRE Hangman!",width/2,120);
  fill(colour[1],255,255);
  text("The Prisoner is currently in the moderately good state of Blue.",width/2, 170);
  fill(colour[2],255,255);
  text("Guess words to help him move towards Green in the color array",width/2,220);
  fill(colour[3],255,255);
  text("and finally gain freedom.",width/2,270);
  fill(colour[4],255,255);
  text("If, after nine tries, you cannot guess a word, the Prisoner will regress towards Red",width/2,320);
  fill(colour[5],255,255);
  text("Until he loses his life.",width/2,370);
  fill(colour[6],255,255);
  text("The words come from a list of the 300 most frequenlty asked words on the GRE exam.",width/2,420);
  fill(colour[7],255,255);
  text("To look up the meaning of a word, click on the target when it appears",width/2,470);
  fill(colour[8],255,255);
  text("Source dictionary: http://gredic.com/hotlist.html",width/2,520);
  if (pmouseX>width/2-45 && pmouseX<width/2+45 && pmouseY<height-60 && pmouseY>height-100) fill(255,255,0);
  else fill(colour[4],255,255);
  stroke(0); strokeWeight(5); rect(width/2-45,height-100,90,40);
  noStroke();
  fill(255); textSize(25); text("START",width/2,height-82);
  textAlign(CENTER,BOTTOM); colorMode(HSB);
  }
  if (introduction == false) {
    strokeWeight(9);
    for (int i =0; i <word_to_guess.length(); i++) {
      stroke(255);
      fill(255);
      line(left_space+i*l, h, left_space-10+(i+1)*l, h);
    }
    textSize(50);
    for (int i =0; i <word_to_guess.length(); i++) {
      if (visible[i]) {
        colorMode(RGB); 
        fill(50, 50, 50, 90); 
        noStroke();
        rect(left_space+i*l, h-57, 40, 52, 7, 7, 7, 7);
        fill(255);
        text(word_to_guess.charAt(i), left_space+i*l+l/2-5, h-5);
      }
    }
    textSize(30);
    fill(0);
    for (int i =0; i <guessed_let.length(); i++) {
      text(guessed_let.charAt(i), 30, i*l+70);
    }

    draw_gallows();
    hang_man(600+gx+wx, 300+gy+wy);
    track_lives();
    if (life_level == 9) end_game();
    if (life_level == 0) win_game();

    if (linkbox) {
      colorMode(RGB);
      fill(255); textSize(30); if (first_time) text("Click on screen to continue",350,420);
      noStroke();
      if (715-20< pmouseX && pmouseX< 715+20 && -45+py+s< pmouseY && pmouseY<45+py+s) {
        t_fill[0] = 0; 
        t_fill[1] = 0; 
        t_fill[2] = 255;
      }
      else for (int i=0; i< 3; i++) t_fill[i] = 200;
      fill(50); 
      ellipse(715, py+s, ew, eh);
      fill(t_fill[0], t_fill[1], t_fill[2]); 
      ellipse(715, py+s, .8*ew, .8*eh);
      fill(50); 
      ellipse(715, py+s, .6*ew, .6*eh);
      fill(t_fill[0], t_fill[1], t_fill[2]); 
      ellipse(715, py+s, .4*ew, .4*eh);
      fill(50); 
      ellipse(715, py+s, .2*ew, .2*eh);
      fill(28, 76, 78); 
      noStroke(); colorMode(HSB); fill(colour[c],255,255);
      beginShape();
      vertex(px, py);
      vertex(px+10*s, py);
      vertex(px+10*s, py-2*s);
      vertex(px+17*s, py+s);
      vertex(px+10*s, py+4*s);
      vertex(px+10*s, py+2*s);
      vertex(px, py+2*s);
      endShape(CLOSE);
      textSize(22); 
      fill(0); 
      textAlign(LEFT, TOP); 
      if (first_time) text("click for definition", px+5, py);
      else text("Dictionary", px+5+45, py);
      if (px >= 711-17*s) px += 0; 
      else px+=10;
      strokeWeight(9); 
      textAlign(CENTER, BOTTOM);

    }
  }
} 

void keyPressed() {
  if (penalty == 9) return;
  char typed = 0;
  boolean success = false;
  boolean add_to_guessed_let = true;
  if (key >= 'a' && key <= 'z') typed = key; 
  else return;
  for (int i=0; i< word_to_guess.length(); i++) {
    if (typed == word_to_guess.charAt(i)) {
      visible[i] = true; 
      success = true;
    }
  }
  if (success == false) {
    for (int i=0; i<guessed_let.length(); i++) {
      if (guessed_let.charAt(i) == typed) add_to_guessed_let = false;
    }
    if (add_to_guessed_let == true) {
      guessed_let += typed;
      penalty++;
    }
  }
  if (penalty == 9) {
    for (int i=0; i< word_to_guess.length(); i++) {
      visible[i] = true;
    }
    linkbox = true;
    life_level++;
  }

  println(life_level);
  solved_word = false;
  for (int i= 0; i< word_to_guess.length(); i++) { 
    if (visible[i] == false) return;
    solved_word = true;
  }
  if (penalty < 9 && solved_word==true) {
    col--;
    life_level--;
    linkbox = true;
    penalty = 0;
  }
} 

void add_life() {
  guessed_let = "";
  solved_word=false;
  linkbox = false; 
  px = -17*s;
  word_to_guess = dict[int(random(dict.length))]; 
  println(word_to_guess);
  online_dictionary = URL+word_to_guess+"?q="+word_to_guess;
  visible = new boolean[word_to_guess.length()];
  for (int i=0; i< word_to_guess.length(); i++) visible[i] = false;
  first_time = false;
  c = int(random(0,8));
}


void hang_man(float a, float b) {
  colorMode(HSB);
  fill(colour[col], 255, 255);
  stroke(colour[col], 255, 255);
  shade(col, 9);
  arc(a, b, 40, 50, PI, TWO_PI);
  shade(col, 8);
  arc(a, b, 40, 50, 0, PI);
  shade(col, 7);
  line(a, b+40, a+50, b+60);
  shade(col, 6);
  line(a, b+40, a-50, b+60);
  shade(col, 5);
  line(a, b+30, a, b+110); 
  if (away_from_gallows == false) {
    stroke(50);
    arc(600+gx, 335, 30, 20, -PI/8, PI+PI/8);
    if (penalty <= 4) stroke(colour[col], 255, 255);
    if (penalty > 4) stroke(colour[col+1], 255, 255);
  }
  shade(col, 4);
  line(a, b+110, a+40, b+160);
  shade(col, 3);
  line(a, b+110, a-40, b+160);
  shade(col, 2);
  line(a-40, b+160, a-60, b+160);
  shade(col, 1);
  line(a+40, b+160, a+60, b+160);
}

void shade(int a, int b) {
  if (penalty == b) {
    fill(colour[col+1], 255, 255);
    stroke(colour[col+1], 255, 255);
  }
}

void draw_gallows() {

  stroke(50);
  if (away_from_gallows==false) line(600+gx, 330+gy, 620, 230);
  fill(50); 
  stroke(50);
  rect(570, 230, 150, 10, 3, 3, 3, 3);
  rect(710, 240, 10, 430);
  strokeWeight(10);
  line(670, 235, 715, 290);
  line(bx, by, 715, 470);
  stroke(0); 
  point(715, 470);
}


void mousePressed() {
  if (introduction) {
    if (pmouseX>width/2-45 && pmouseX<width/2+45 && pmouseY<height-60 && pmouseY>height-100) introduction = false;
    else return;
  }
  if (the_end || away_from_gallows) {
    col = 4; 
    life_level = 4;
    word_to_guess = dict[int(random(dict.length))];
    visible = new boolean[word_to_guess.length()];
    for (int i=0; i< word_to_guess.length(); i++) visible[i] = false;
    online_dictionary = URL+word_to_guess+"?q="+word_to_guess;
    penalty = 0;
    guessed_let = "";
    linkbox = false; 
    px = -17*s;
    away_from_gallows = false;
    the_end = false;
    gx = 0; 
    gy = 0; 
    wx = 0; 
    wy = 0; 
    angle = PI;
  }
  if (linkbox) {
    if (225-20+17*s< pmouseX && pmouseX< 225+20+17*s && -45+py+s< pmouseY && pmouseY<45+py+2) {
      link(online_dictionary);
      linkbox = false; 
      px = -17*s;
      return;
    }
  }
  if (penalty == 9) {
    word_to_guess = dict[int(random(dict.length))];
    visible = new boolean[word_to_guess.length()];
    for (int i=0; i< word_to_guess.length(); i++) visible[i] = false;
    online_dictionary = URL+word_to_guess+"?q="+word_to_guess;
    penalty = 0;
    col++;
    guessed_let = "";
    linkbox = false; 
    px = -17*s;
    first_time = false;
    c = int(random(0,8));

  }
  if (penalty < 9 && solved_word==true) add_life(); 

  else return;
}

void track_lives() {
  for (int i=0; i<9; i++) {
    fill(colour[i], 255, 255);
    noStroke();
    rect(width-60, i*25+50, 25, 25);
  } 
  stroke(5); 
  noFill();
  if (the_end==false && away_from_gallows==false) rect(width-60, life_level*25+50, 25, 25, 2, 2, 2, 2);
}

void end_game() {
  if (gx <20 && angle < .8*PI) {
    gx+=2; 
    gy+=.5;
  }
  the_end = true;
  if (angle > HALF_PI*1.1) angle -= QUARTER_PI/10;
  bx = 175*cos(angle) + 715;
  by = 175*sin(angle) + 470;
  textSize(70); 
  fill(255); 
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2-100, height/2);
  textSize(30); 
  text("click on screen to restart", width/2, height-30);
  textAlign(CENTER, BOTTOM);
}

void win_game() {
  away_from_gallows = true;
  wx-=3;
  textSize(70); 
  fill(255); 
  textAlign(CENTER, CENTER);
  text("FREEDOM!", width/2, height/2);
  textSize(30); 
  text("click on screen to restart", width/2, height-30);
  textAlign(CENTER, BOTTOM);
}

