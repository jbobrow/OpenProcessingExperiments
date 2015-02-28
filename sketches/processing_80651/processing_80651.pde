

//size 1000,600
//fonts Carima, & courier new bold anti-alised
// add save as jpg/png file
//use hue(R,G,B); for eye, skin & hair color
//use update pixels to swap between titles, aspects & genders
//use mouse x , mouse y for drag n drop items (horns & glasses)

//use voids to sepparate interactivity in: titles, aspects, color swap, drag n drop, credits & save image


//version beta 1.0, may only choose heir as title

// fonts, tier=carima & menus=courier when a title is selected it turns grey
PFont tier;
PFont menus;

//color swap items     defaults are light,black
PImage skin;
PImage skin2;
PImage skin3;
PImage skin4;
PImage hair;
PImage hair2;
PImage hair3;
PImage hair4;


//aspects1   may have to use img arrays to add other titles   heir of breath is default
PImage hb;
PImage hlg;
PImage ht;
PImage hs;
PImage hlf;
PImage hv;
PImage ho;
PImage he;
PImage hl;
PImage hd;
PImage hm;
PImage hr;

//aspects 2   click and aspect 1 swaps

PImage breath;
PImage light;
PImage time;
PImage space;
PImage life;
PImage voids;
PImage hope;
PImage heart;
PImage mind;
PImage blood;
PImage doom;
PImage rage;

//drag n drop items    default none
PImage horns1;
PImage horns2;
PImage glasses1;
PImage glasses2;
PImage glasses3;
PImage glasses4;

void setup(){
  
  size(1000,600);
  background(240);
  
  //load fonts
tier=loadFont("Carima-48.vlw");
menus=loadFont("CourierNewPS-BoldMT-48.vlw");
  
  //load tier images  
hb=loadImage("heir_breath.png");
hlg=loadImage("heir_light.png");
ht=loadImage("heir_time.png");
hs=loadImage("heir_space.png");
hlf=loadImage("heir_life.png");
hv=loadImage("heir_void.png");
ho=loadImage("heir_hope.png");
he=loadImage("heir_heart.png");
hl=loadImage("heir_blood.png");
hd=loadImage("heir_doom.png");
hm=loadImage("heir_mind.png");
hr=loadImage("heir_rage.png");

  //load aspects
breath=loadImage("crest_breath.png");
light=loadImage("crest_light.png");
time=loadImage("crest_time.png");
space=loadImage("crest_space.png");
life=loadImage("crest_life.png");
voids=loadImage("crest_void.png");
hope=loadImage("crest_hope.png");
heart=loadImage("crest_heart.png");
mind=loadImage("crest_mind.png");
blood=loadImage("crest_blood.png");
doom=loadImage("crest_doom.png");
rage=loadImage("crest_rage.png");

  //load color swaps
skin=loadImage("skin.png");
skin2=loadImage("skin2.png");
skin3=loadImage("skin3.png");
skin4=loadImage("skin4.png");
hair=loadImage("hair.png");
hair2=loadImage("hair2.png");
hair3=loadImage("hair3.png");
hair4=loadImage("hair4.png");

  //load drag n drop items
horns1=loadImage("horns1.png");
horns2=loadImage("horns2.png");
glasses1=loadImage("glasses1.png");
glasses2=loadImage("glasses2.png");
glasses3=loadImage("glasses3.png");
glasses4=loadImage("glasses4.png");
}

void draw(){
  smooth();

    fill(0);
  textFont(menus,36);
  text("TITLES",60,36);
  
  fill(180);
  textFont(menus,10);
  text("(THE ONLY TITLE AVAIABLE ON THIS VERSION IS HEIR)",5,180);
  
  
  fill(120);
  textFont(tier,24);
  text("HEIR",35,70);
  
  fill(0);

  text("PAGE",35,100);
  
  text("SEER",35,130);
  
  text("MAGE",35,160);
  
  text("SYPLH",105,70);
  
  text("WITCH",105,100);
  
  text("ROGUE",105,130);
  
  text("THIEF",105,160);
  
   text("MAID",185,70);
  
  text("PRINCE",185,100);
  
  text("KNIGHT",185,130);
  
  text("BARD",185,160);
    
     fill(0);
  textFont(menus,36);
  text("ASPECTS",55,237);
  
  image(breath,20,260);
textFont(menus,12);
fill(93,232,255);
  text("B",25,270);
   
  image(light,80,260);
fill(255,239,59);  
text("L",85,270);
  
  image(time,140,260);
fill(255,31,23); 
text("T",145,270);
  
  image(space,200,260);
  fill(255);
text("P",205,270);

  image(mind,20,325);
fill(10,235,216); 
text("M",25,335);

  image(heart,80,325);
fill(250,28,158); 
text("H",85,335);

  image(life,140,325);
fill(37,129,15); 
text("F",145,335);

  image(voids,200,325);
fill(14,150,255); 
text("V",205,335);

  image(hope,20,390);
fill(255); 
text("E",25,400);

  image(doom,80,390);
fill(110,205,80); 
text("D",85,400);

  image(blood,140,390);
fill(205,24,80); 
text("O",145,400);

  image(rage,200,390);
fill(214,24,240); 
text("R",205,400);
  

  noStroke();
  
  fill(0);
  textFont(menus,24);
  text("HAIR",885,30);
  
  textFont(menus,10);
  fill(0);
  rect(870,45,15,15);
  fill(255); 
text("K",875,55);
  
  fill(88,60,37);
  rect(895,45,15,15);
  fill(255);
  text("W",900,55);
  
  fill(255,141,70);
  rect(920,45,15,15);
  fill(0);
  text("N",925,55);
  
  stroke(237,163,2);
  strokeWeight(0.5);
  fill(255,243,106);
  rect(945,45,15,15);
  fill(0);
  text("Y",950,55);
  
  
  fill(0);
  textFont(menus,24);
  text("SKIN",885,105);
  
  textFont(menus,10);
  
  noStroke();
  fill(178);
  rect(870,120,15,15);
  fill(0);
  text("Q",875,130);
  
  stroke(247,211,162);
  strokeWeight(0.5);
  fill(255,235,191);
  rect(895,120,15,15);
   fill(0);
  text("C",900,130);
  
   noStroke();
  fill(232,176,103);
  rect(920,120,15,15);
  fill(255);
  text("J",925,130);

  fill(155,125,101);
  rect(945,120,15,15);
  fill(255);
  text("I",950,130);

textFont(menus,14);
  image(glasses1,778,201);
  fill(0);
  text("A",820,195);
  
  image(glasses2,885,198);
  text("G",930,195);
  
  image(glasses3,768,255);
  text("X",930,270);
  
  image(glasses4,885,275);
  text("Z",820,270);
  
  image(horns1,821,360);
  text("2",815,380);
  
  image(horns2,829,450);
  text("1",815,480);
  
  
  breath();
  light();
  time();
  space();
  mind();
  heart();
  life();
  voids();
  hope();
  doom();
  blood();
  rage();
  
 hair_black();
 hair_brown();
 hair_ginger();
 hair_blond();
  
  skin_troll();
  skin_fair();
  skin_medium();
  skin_dark();
  
  glasses_rect();
  glasses_round();
  glasses_cool();
  glasses_avia();
  
 hornsA();
 hornsB();

  saves();
  credits();

}

void breath(){
if(keyPressed) {
    if (key == 'b' || key =='B') {   //if 'm' or 'M' is pressed mousetache is drawn
    image(hb,363,36);
     fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF BREATH",460,580);
      }
  }
} 

void light(){
if(keyPressed) {
    if (key == 'l' || key =='L') { 
    image(hlg,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF LIGHT",460,580);
      }
  }
} 

void time(){
if(keyPressed) {
    if (key == 't' || key =='T') { 
    image(ht,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF TIME",460,580);
      }
  }
} 

void space(){
if(keyPressed) {
    if (key == 'p' || key =='P') { 
    image(hs,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF SPACE",460,580);
      }
  }
} 

void mind(){
if(keyPressed) {
    if (key == 'm' || key =='M') { 
    image(hm,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF MIND",460,580);
      }
  }
} 

void heart(){
if(keyPressed) {
    if (key == 'h' || key =='H') { 
    image(he,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF HEART",460,580);
      }
  }
} 

void life(){
if(keyPressed) {
    if (key == 'f' || key =='F') { 
    image(hlf,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF LIFE",460,580);
      }
  }
} 

void voids(){
if(keyPressed) {
    if (key == 'v' || key =='V') { 
    image(hv,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF VOID",460,580);
      }
  }
} 

void hope(){
if(keyPressed) {
    if (key == 'e' || key =='E') { 
    image(ho,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF HOPE",460,580);
      }
  }
} 

void doom(){
if(keyPressed) {
    if (key == 'd' || key =='D') { 
    image(hd,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF DOOM",460,580);
      }
  }
} 

void blood(){
if(keyPressed) {
    if (key == 'o' || key =='O') { 
    image(hl,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF BLOOD",460,580);
      }
  }
} 

void rage(){
if(keyPressed) {
    if (key == 'r' || key =='R') { 
    image(hr,363,36);
    fill(240);
    rect(430,560,250,26);
    fill(80);
  textFont(tier,26);
  text("HEIR OF RAGE",460,580);
      }
  }
} 

void hair_black(){
if(keyPressed) {
    if (key == 'k' || key =='K') { 
    image(hair4,363,36);
      }
  }
} 

void hair_brown(){
if(keyPressed) {
    if (key == 'w' || key =='W') { 
    image(hair3,363,36);
      }
  }
} 

void hair_ginger(){
if(keyPressed) {
    if (key == 'n' || key =='N') { 
    image(hair2,363,36);
      }
  }
} 

void hair_blond(){
if(keyPressed) {
    if (key == 'y' || key =='Y') { 
    image(hair,363,36);
      }
  }
} 

void skin_troll(){
if(keyPressed) {
    if (key == 'q' || key =='Q') { 
    image(skin4,363,35);
      }
  }
} 

void skin_fair(){
if(keyPressed) {
    if (key == 'c' || key =='C') { 
    image(skin,363,35);
      }
  }
} 

void skin_medium(){
if(keyPressed) {
    if (key == 'j' || key =='J') { 
    image(skin2,363,35);
      }
  }
} 

void skin_dark(){
if(keyPressed) {
    if (key == 'i' || key =='I') { 
    image(skin3,363,35);
      }
  }
} 

void glasses_rect(){
if(keyPressed) {
    if (key == 'a' || key =='A') { 
    image(glasses1,483,92);
      }
  }
}

void glasses_round(){
if(keyPressed) {
    if (key == 'g' || key =='G') { 
    image(glasses2,488,92);
      }
  }
}

void glasses_cool(){
if(keyPressed) {
    if (key == 'z' || key =='Z') { 
    image(glasses3,484,76);
      }
  }
}

void glasses_avia(){
if(keyPressed) {
    if (key == 'x' || key =='X') { 
    image(glasses4,486,91);
      }
  }
}

void hornsA(){
if(keyPressed) {
    if (key == '2') { 
    image(horns1,462,25);
      }
  }
}

void hornsB(){
if(keyPressed) {
    if (key == '1') { 
    image(horns2,473,25);
      }
  }
}


void saves(){
    fill(0);
  textFont(menus,18);
  text("PRESS S TO SAVE",800,550);
  textFont(menus,18);
  text("PRESS U TO CLEAR",800,580);
    textFont(menus,12);
  text("PRESS THE REQUIRED KEY TO CHANGE YOUR CHARACTER",380,20);
  
  if(key=='s'){
  saveFrame("God_Tier.png");
  }
  
  if (key == 'u' || key =='U') {
     background(240); 
    smooth();

    fill(0);
  textFont(menus,36);
  text("TITLES",60,36);
  
  fill(180);
  textFont(menus,10);
  text("(THE ONLY TITLE AVAIABLE ON THIS VERSION IS HEIR)",5,180);
  
  
  fill(120);
  textFont(tier,24);
  text("HEIR",35,70);
  
  fill(0);

  text("PAGE",35,100);
  
  text("SEER",35,130);
  
  text("MAGE",35,160);
  
  text("SYPLH",105,70);
  
  text("WITCH",105,100);
  
  text("ROGUE",105,130);
  
  text("THIEF",105,160);
  
   text("MAID",185,70);
  
  text("PRINCE",185,100);
  
  text("KNIGHT",185,130);
  
  text("BARD",185,160);
    
     fill(0);
  textFont(menus,36);
  text("ASPECTS",55,237);
  
  image(breath,20,260);
textFont(menus,12);
fill(93,232,255);
  text("B",25,270);
   
  image(light,80,260);
fill(255,239,59);  
text("L",85,270);
  
  image(time,140,260);
fill(255,31,23); 
text("T",145,270);
  
  image(space,200,260);
  fill(255);
text("P",205,270);

  image(mind,20,325);
fill(10,235,216); 
text("M",25,335);

  image(heart,80,325);
fill(250,28,158); 
text("H",85,335);

  image(life,140,325);
fill(37,129,15); 
text("F",145,335);

  image(voids,200,325);
fill(14,150,255); 
text("V",205,335);

  image(hope,20,390);
fill(255); 
text("E",25,400);

  image(doom,80,390);
fill(110,205,80); 
text("D",85,400);

  image(blood,140,390);
fill(205,24,80); 
text("O",145,400);

  image(rage,200,390);
fill(214,24,240); 
text("R",205,400);
  

  noStroke();
  
  fill(0);
  textFont(menus,24);
  text("HAIR",885,30);
  
  textFont(menus,10);
  fill(0);
  rect(870,45,15,15);
  fill(255); 
text("K",875,55);
  
  fill(88,60,37);
  rect(895,45,15,15);
  fill(255);
  text("W",900,55);
  
  fill(255,141,70);
  rect(920,45,15,15);
  fill(0);
  text("N",925,55);
  
  stroke(237,163,2);
  strokeWeight(0.5);
  fill(255,243,106);
  rect(945,45,15,15);
  fill(0);
  text("Y",950,55);
  
  
  fill(0);
  textFont(menus,24);
  text("SKIN",885,105);
  
  textFont(menus,10);
  
  noStroke();
  fill(178);
  rect(870,120,15,15);
  fill(0);
  text("Q",875,130);
  
  stroke(247,211,162);
  strokeWeight(0.5);
  fill(255,235,191);
  rect(895,120,15,15);
   fill(0);
  text("C",900,130);
  
   noStroke();
  fill(232,176,103);
  rect(920,120,15,15);
  fill(255);
  text("J",925,130);

  fill(155,125,101);
  rect(945,120,15,15);
  fill(255);
  text("I",950,130);

textFont(menus,14);
  image(glasses1,778,201);
  fill(0);
  text("A",820,195);
  
  image(glasses2,885,198);
  text("G",930,195);
  
  image(glasses3,768,255);
  text("X",930,270);
  
  image(glasses4,885,275);
  text("Z",820,270);
  
  image(horns1,821,360);
  text("2",815,380);
  
  image(horns2,829,450);
  text("1",815,480);
  
   fill(0);
  textFont(menus,18);
  text("PRESS S TO SAVE",800,550);
  textFont(menus,18);
  text("PRESS U TO CLEAR",800,580);
    textFont(menus,12);
  text("PRESS THE REQUIRED KEY TO CHANGE YOUR CHARACTER",380,20);
  }

}

void credits(){
  
   fill(95);
   textFont(menus,12);
  text("CREDITS",20,480);
  
  fill(80);
   textFont(menus,11);
  text("Source code: PROCESSING & OPEN PROCESSING",20,500);
    
  text("God Tiers & Homestuck (C) Andrew Hussie",20,535);
  
  text("Programming & Illustrations Alejandra Altamirano",20,560);
  
  fill(105);
   textFont(menus,10);
   
     text("processing.com",20,510);
     text("openprocessing.com",20,520);
    
  text("mspaintadventures.com",20,545);
  
    text("UNIVERSIDAD ANÁHUAC MÉXICO NORTE",20,572);
    text("Programación Estructural y de Objetos",20,582);
  text("mirrorsofsilver.tumblr.com",20,592);



}


