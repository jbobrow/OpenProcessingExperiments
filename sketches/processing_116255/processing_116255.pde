
// BGM & soundeffect
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/110498*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import ddf.minim.*;
Minim minim;
AudioSample move;
AudioSample hurt;
AudioSample GO;
AudioSample flowersound;
AudioSample mushroomsound;
AudioSample book;
AudioSample eat;
AudioPlayer BGM;

int jishu;

int AOM, AOF, AOFO, AOB, score;
String medal="";

int logoi, psi;
int poi;
float cx, cy;
float logox=-290, logoy=300, sx=400, sy=450;

float ch=68, cw=40;
int ww=80;
float X=200-cw/2, Y=550-ch;
int S=5;//speed
int health=50, hunger=50, bread=10, fear=0, food;

int wtl=255;//woods transpancy
int wtr=255;

String Fear = "Normal";
int fr=0, fg=255, fb=0;//color of fear mode

int sh=0;//steps about hunger
int sf=0;//steps about fear
int she=0;//steps about health

String words = "I can't wait to see my grandma.";

int L=1;//levels

//cover layers
float cr=255, cg, cb, ct;

//barriers
int aob=20;
float[] bx = new float[aob];
float[] by = new float[aob];

//flowers
int aof=5;
float[] fx = new float[aof];
float[] fy = new float[aof];

//mushrooms
int aom=10;
float[] mx = new float[aom];
float[] my = new float[aom];

//mode
int mode;//0=nothing;1=cover;2=introduction; 3=start;5=record

PImage up, down, left, right, character;
PImage wl1, wl2, wl3, wl4, wr1, wr2, wr3, wr4;
PImage g1, g2, g21, g22, g31, g32, g33;
PImage barrier, flower, mushroom;
PImage ic, i1, i2, i3, ibk;
PImage logo, ps;
PImage house;
PFont font, font02;

void setup() {
  size(400, 600);
  noStroke();
  smooth();

  //barriers
  for (int i=0; i<aob;i++) {
    bx[i] = random(ww-10, width-30-ww);
    by[i] = random(100, height-120);
  }
  //flowers
  for (int i=0; i<aof;i++) {
    fx[i] = random(ww-50, width-10-ww);
    fy[i] = random(100, height-100);
  }
  //mushrooms
  for (int i=0; i<aom;i++) {
    mx[i] = random(ww-40, width-20-ww);
    my[i] = random(100, height-100);
  }

  character = loadImage("ass5-character-up.png");
  down = loadImage("ass5-character-down.png");
  up = loadImage("ass5-character-up.png");
  left = loadImage("ass5-character-left.png");
  right = loadImage("ass5-character-right.png");

  wl1 = loadImage("ass5-woods-l1.png");
  wl2 = loadImage("ass5-woods-l2.png");  
  wl3 = loadImage("ass5-woods-l3.png");  
  wl4 = loadImage("ass5-woods-l4.png");  
  wr1 = loadImage("ass5-woods-r1.png");  
  wr2 = loadImage("ass5-woods-r2.png");    
  wr3 = loadImage("ass5-woods-r3.png");    
  wr4 = loadImage("ass5-woods-r4.png");

  g1 = loadImage("ass5-ground-1.png");
  g2 = loadImage("ass5-ground-2.png");  
  g21 = loadImage("ass5-ground-2-1.png");  
  g22 = loadImage("ass5-ground-2-2.png");  
  g31 = loadImage("ass5-ground-3-1.png");  
  g32 = loadImage("ass5-ground-3-2.png");    
  g33 = loadImage("ass5-ground-3-3.png");

  barrier = loadImage("barrier.png");
  flower = loadImage("flower.png");    
  mushroom = loadImage("food.png");

  ibk = loadImage("ass5-cover.jpg");
  ic = loadImage("ass5-cover.jpg");
  i1 = loadImage("ass5-1.jpg");
  i2 = loadImage("ass5-2.jpg");  
  i3 = loadImage("ass5-3.jpg");

  logo = loadImage("ass5-logo.png");  
  ps = loadImage("ass5-s.png");  

  house = loadImage("ass5-house.png");

  font = loadFont("font01.vlw");  
  font02 = loadFont("font02.vlw");

  minim = new Minim(this);
  move = minim.loadSample("Move.mp3");
  hurt = minim.loadSample("hurt.mp3");
  GO = minim.loadSample("GO.mp3");  
  flowersound = minim.loadSample("flower.mp3");
  mushroomsound = minim.loadSample("mushroom.mp3");
  book = minim.loadSample("Book.mp3");  
  eat = minim.loadSample("eat.mp3");
  BGM = minim.loadFile("BGM1.mp3");
  BGM.loop();
}

void keyPressed() {
  //start
  if (key == CODED && mode==1) {
    if (keyCode == SHIFT) {
      logoy=600;
      sy=600;
      mode++;
    }
  }

  //introduction
  if (key == CODED && mode==2) {
    if (keyCode == SHIFT && mode==2) {
      poi++;  
      println("mode"+mode);      
      println("poi"+poi);
      book.trigger();
    }
    if (keyCode == SHIFT) {
      if (poi==1) {
        ic=i1;
      }
      else if (poi==2) {
        ic=i2;
      }      
      else if (poi==3) {
        ic=i3;
      }
      else {
        cy=height;
        mode=3;
      }
    }
  }

  //walk
  if (key == CODED && mode ==3) {
    if (keyCode == UP && L<11) {
      Y=Y-S;
      sh++;
      she++;
      character = up;
    }
    if (keyCode == DOWN) {
      Y=Y+S;   
      sh++;
      she++;
      character = down;
    }
    if (keyCode == LEFT) {
      X=X-S;   
      sh++;
      she++;
      character = left;
    }
    if (keyCode == RIGHT) {
      X=X+S;   
      sh++;
      she++;
      character = right;
    }
  }

  //eat
  if (key == CODED && mode==3) {
    if ((keyCode == SHIFT && Food(food, bread)>0) && hunger<45) {
      food--;
      health++;
      hunger = hunger+5;
      sh=0;
      words="Sorry, grandma, but I'm really hungry.";
      eat.trigger();
      AOFO++;
    }
    else if (keyCode == SHIFT && Food(food, bread)==0) {
      words="Oh no! No food remains! I'd better collect some mushrooms.";
    }
    else if (keyCode == SHIFT && food != 0) {
      words="Keep them, they're for grandma.";
    }
  }

  //score
  if (key == CODED && mode==5) {
    if (keyCode==SHIFT) {
      fill(0);
      rect(0, 0, width, height);
      jishu=1;
      mode=6;
    }
  }
}

void draw() {
  background(g1);
  textFont(font);

  //during walking
  if (sh == 25) {
    hunger--;
    sh=0;
  }

  if ((X>ww && X<width-ww) && L<8) {
    fear--;
    wtl=255;
    wtr=255;
  }

  //Level
  if (L==1) {
    flowers(2);
  }
  if (L==2) {    
    flowers(2);
    barriers(1);
  }
  if (L==3) {    

    flowers(1);
    barriers(1);
    mushrooms(1);
  }
  if (L>=4 && L<=7) {
    ww=100;
    wl1=wl2;
    wr1=wr2;
    g1=g2;
    if (L==4) {
      barriers(2);
      flowers(4);
      mushrooms(3);
    }
    if (L==5) {
      barriers(5);
      flowers(2);
      mushrooms(2);
    }
    if (L==6) {
      g1=g21;
      barriers(9);
      flowers(4);
      mushrooms(4);
    }
    if (L==7)
      g1=g22;
    barriers(5);
    mushrooms(2);
    flowers(2);
  }
  if (L>=8 && L<=10) {
    ww=120;
    wl1=wl3;
    wr1=wr3;
    g1=g31;
    if (L==8) {
      g1=g32;    
      barriers(8);
      mushrooms(3);
      flowers(3);
    } 
    if (L==9) {
      g1=g32;    
      barriers(12);
      mushrooms(4);
      flowers(4);
    }    
    if (L>=10) {
      g1=g33;
      wl1=wl4;
      wr1=wr4;
      mushrooms(10);
      barriers(15);
      flowers(5);
    }
  }

  //go forward
  if (Y< -ch/2) {
    Y = height-ch/2;
    L++;
    move.trigger();
    println("Current LeveL: "+L);    
    println("Current Fear: "+fear);
  }

  //range
  if (Y>height-ch/2) {
    Y = height-ch/2;
    words = "No need to go back. Grandma's waiting.";
  }
  if (X>width-cw) {
    X = width-cw;
  }
  if (X<0) {
    X = 0;
  }  
  if (X<0) {
    X = 0;
  }

  if (fear<1) {
    fear=0;
  }
  if (fear>1000) {
    fear=1000;
  }
  if (hunger>49) {
    hunger=50;
  }
  if (hunger<1) {
    hunger=0;
    GameOver(2);
  }
  if (Food(bread, food)<0) {
    food=0;
  }
  if (health>49) {
    health=50;
  }

  //character
  image(character, X, Y, cw, ch);
  S=5;

  //fear
  if (mode==3) {
    if (X<ww-20 || X>width-ww-cw+20) {
      fear++;
      words = "Mom says grey wolfs always live in woods...*tremble*";
      if (X<ww) {
        wtl=200;
      }
      else {
        wtr=200;
      }
    }
    if (fear<50) {
      Fear="Normal";
      fr=0;
      fg=150;
      fb=10;
    }
    if (fear>50 && fear<200) {
      Fear = "Scared";
      fr=255;
      fg=150;
      fb=0;
    }
    if (fear>200 && fear<500) {
      Fear = "Terrified";
      words = "*Cry* Grandma! Where are you! I'm scared!";
      fr=255;
      fg=230;
      fb=0;
      S = 2;
    }
    if (fear>500 && fear<1000) {
      Fear = "Horrible";
      words = "Anyone here? I'm nearly too scared to move!";
      fr=255;
      fg=0;
      fb=0;
      S = 1;
    }
  }

  //health
  if (she % 500 == 0 && health<50) {
    health++;
  }
  if (health <= 10) {
    words="cold...";
    S=1;
  }
  if (health>10 && health<=20) {
    words="I don't feel good...";
  }

  //hunger
  if (hunger>0 && hunger<11) {
    S=1;
    words = "I'm straving. I need to eat something.";
  }
  if (hunger>10 && hunger<21) {
    S=2;
    words = "I'm a little hungery.";
  }

  //grandma's house
  if (L==11) {
    image(house, 0, 0);
  }

  //woods
  alpha(wtl);
  image(wl1, 0, 0, ww, height);
  alpha(wtr);
  image(wr1, width-ww, 0, ww, height);

  //cover layer
  ct = 1000/(health+6)-20;
  fill(cr, cg, cb, ct);
  rect(0, 0, width, height);

  //texts
  textSize(17);
  fill(200, 255, 0, 150);
  rect(15, 15, 145, 130, 40, 0, 40, 0);
  fill(0);
  text("Health: "+health+"/50", 30, 45);
  text("Hunger: "+hunger+"/50", 30, 70);
  text("Food: "+Food(bread, food)+"/10", 30, 95);

  fill(fr, fg, fb);
  text(Fear, 30, 120);

  fill(200, 255, 0, 150);
  rect(170, 15, 225, 100, 0, 40, 0, 40);
  fill(0);
  textSize(16);
  text(words, 188, 33, 180, 90);

  image(ic, cx, cy);//cover
  image(logo, logox, logoy);
  if (logox<55 && logoi<200) {
    logox = lerp(-290, 55, 0.007 * logoi);    
    logoi++;
  }
  image(ps, sx, sy);
  if (sx>35 && psi<200) {
    sx = lerp(400, 35, 0.007 * psi);
    psi++;
  }
  if (psi==144) {
    mode=1;
    psi=145;
  }

  //medals
  if (end==0) {
    if ((AOB<2 && AOB>=0) && S==5) {
      medal="ATHLETIC GIRL";
    }
    else if (hunger<20 && AOFO<5) {
      medal="RESIST TEMPTION";
    }  
    else if (AOFO>10) {
      medal="GREEDY STOMACH";
    }  
    else  if (AOF>3) {
      medal="FLOWER PICKER";
    }  
    else  if (AOM>=10) {
      medal="SUPER MARIO";
    }  
    else if (health<10 && S<=2) {
      medal="BLEEDING SNAIL";
    }
    else if (AOB>10 && health<20) {
      medal="INJURED STABBER";
    }
    else if (fear>500) {
      medal="BRAVE SHEEP";
    }
    else {
      medal="GOOD GIRL";
    }
  }

  //game over
  if (hunger<1) {
    hunger=0;
    GameOver(2);
  }
  if (health<1) {
    health=0;
    GameOver(1);
  }
  if (L==11) {
    if (health<20) {
      GameOver(4);
    }
    else {
      GameOver(3);
    }
  }
  if (mode==6) {
    image(ibk, 0, 0);
    fill(0, 200);
    rect(70, 130, 260, 340, 40, 0, 40, 0);
    fill(255);
    text("Health: "+health+"/50", 100, 190);   
    text("Hunger: "+hunger+"/50", 100, 210);      
    text("Fear: "+fear+"/1000", 100, 230);       
    text("Food remains: "+Food(food, bread)+"/10", 100, 250);       
    text("Food you eat: "+AOFO, 100, 270);   
    text("Times you touch brambers: "+AOB, 100, 290);      
    text("Flowers you collect: "+AOF+"/5", 100, 310);      
    text("Mushrooms you collect: "+AOM+"/15", 100, 330);  
    score=health*10+hunger*10-AOB*5-AOFO*2+AOM+AOF;  
    if (end==0) {
      score=score+500;
    }  
    text("Your score: "+score, 100, 360);    
    textSize(20);  
    float mtw=textWidth(medal);
    fill(0, 150, 10);
    text(medal, (width-mtw)/2, 420);
  }
  println(medal);
}


