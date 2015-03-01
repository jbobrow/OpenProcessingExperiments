
//Arthur Luo//

//Toy Jam//

//Credit to Heisei and his Circular Motion processing sketch. link: http://www.openprocessing.org/sketch/106191

int stage=0; //Thanks to Spencer!
int invoke;
int constant = 50;
float angle = 0.05;
int scalar = 5;
float speed = 0.3;
int frames = 6;
int panel = 0;
PImage blackmage = new PImage[frames];
PImage earth, water, fire, spark;
PImage earth_s, water_s, fire_s, spark_s;
PImage magicroom;
PImage Quas, Wex, Exort, Reon;
PImage checkmark;
PImage tornado, earthquake , steam , life , meteor , volcano;

boolean qw = false; 
boolean qe = false; 
boolean qr = false;
boolean we = false;
boolean wr = false;
boolean er = false;

boolean q = false;
boolean w = false;
boolean e = false;
boolean r = false;

boolean reset = false;

String[] words = {"Tornado","Steam","Life","Meteor","Earthquake","Volcano"};
int index = int (random(words.length));

void setup(){
  background(255,255,255);
  size(800,600);
  println(words[index]);

  frameRate(14);
  for(int i=0; i<blackmage.length; i++){
    blackmage[i]=loadImage(i+".png");
  }
  
  checkmark = loadImage("check.png");
  
  tornado = loadImage("tornado.jpg");
  steam = loadImage("steam.jpg");
  life = loadImage("life.jpg");
  earthquake = loadImage("earthquake.jpg");
  meteor = loadImage("meteor.jpg");
  volcano = loadImage("volcano.jpg");
  
  Quas = loadImage("Quas.png");
  Wex = loadImage("Wex.png");
  Exort = loadImage("Exort.png");
  Reon = loadImage("Reon.png");
  
  magicroom = loadImage("magicroom.jpg");
  
  earth = loadImage("earth.png");
  water = loadImage("water.png");
  fire = loadImage("fire.png");
  spark = loadImage("lightning.png");
  
  earth_s = loadImage("earth_s.png");
  spark_s = loadImage("lightning_s.png");
  water_s = loadImage("water_s.png");
  fire_s = loadImage("fire_s.png");
  
}

void keyPressed(){
  switch (key) {
    case 'q':
    case 'Q':
      q = true;
      holder_x=water_s;
      break;
    case 'w':
    case 'W':
      w = true;
      break;
    case 'e':
    case 'E':
      e = true;
      break;
    case 'r':
    case 'R':
      r = true;
      break;
  }
}

void draw(){

  if(stage == 0){
    image(magicroom,0,0);
    fill(255);
    textSize(62);
    text("Magicka",280,150);
    textSize(20);
    String s = "There are four elements in this world, and YOU, as a Grand Magus, are destined to make new spells out of the four traditional elements. They are the Quas, Wex, Exort and the Reon. Quas is the water; Wex is the Lightning and spark; Exort is flame and fire and Reon is earth and soil. You will see an required spell at the top of your screen, and your goal is to invoke the spell by combine either two of the elements together. Press Q W E R to combine either two of the elements to make new spells. For example, if you want to create a new spell that is based on Quas and Exort, press Q and E and then press S to combine them. Press S to start game. Good luck!";
    fill(255);
    text(s,165,200,500,450);
    invoke = 0;
    if(keyPressed==true && key == 's'){
      stage = 1;
      invoke = 0;
    }
  } else if(stage == 1){
    
  float a_e, b_e;
  float a_f, b_f;
  float a_w, b_w;
  float a_a, b_a;
  
  //key press response
  if(q==true && w==true){
    qw=true;
  }
  if(q==true && e==true){
    qe=true;
  }
  if(q==true && r==true){
    qr=true;
  }
  if(w==true && e==true){
    we=true;
  }
  if(w==true && r==true){
    wr=true;
  }
  if(e==true && r==true){
    er=true;
  }
  
  //Time to invoke stuff.
  if(qw==true){
    invoke=1;
  }
  if(qe==true){
    invoke=2;
  }
  if(qr==true){
    invoke=3;
  }
  if(we==true){
    invoke=4;
  }
  if(wr==true){
    invoke=5;
  }
  if(er==true){
    invoke=6;
  }
  //background room. used Photoshop for that pixelization. 
  image(magicroom,0,0);
   
  //Theblackmage.gif <---no racism there. i swear to god.
  panel = (panel+1) % frames;
  image(blackmage[panel%frames],212,130);
  
  //How they spin around.
  float x = constant + sin(angle) * scalar;
  float y = constant + cos(angle) * scalar;
  angle = angle + speed;

  //Elements bulge.
  if (mouseX>=40 && mouseX<=120 && mouseY>=40 && mouseY<100){
    a_e=85;
    b_e=85;
    image(Reon,mouseX,mouseY);
  }
  if (mouseX>=650 && mouseX<=800 && mouseY>=40 && mouseY<=120){
    a_f=85;
    b_f=85;
    image(Exort,mouseX-400,mouseY);
  }
  if (mouseX>=40 && mouseX<=120 && mouseY>=470 && mouseY<=560){
    a_w=85;
    b_w=85;
    image(Quas,mouseX,mouseY-250);  
  }
  if (mouseX>=650 && mouseX<=800 && mouseY>=470 && mouseY<=560){
    a_a=85;
    b_a=85;
    image(Wex,mouseX-400,mouseY-250);  
  }
  if(mouseX>=302 && mouseX<=482 && mouseY >=540 && mouseY<=570){
    if(mousePressed==true){
      stage=0;
    }
  }
  //restart button
  if(mouseX>=302 && mouseX<=482 && mouseY >=540 && mouseY<=570){
    fill(237,225,225,240);
    rect(302,540,180,30);
    textSize(27);
    fill(0);
    text("Back to menu",310,565);
    }
 else {
    fill(100,100,100,240);
    rect(302,540,180,30);
    textSize(18);
    fill(255);
    text("Sorry didn't catch that",305,565);
  }

  fill(210,210,210,220);
  rect(245,20,300,50);
  fill(255);
  textSize(25);
  text("Required Spells:"+words[index],250,50);
  
  //instruction
  image(earth,y,x,a_e,b_e);
  image(fire,y+650,x,a_f,b_f);
  image(water,x,y+430,a_w,b_w);
  image(spark,x+650,y+430,a_a,b_a);  

  if(keyPressed==true && key == 's'){
    if(invoke==1 || invoke==2 || invoke==3 || invoke==4 || invoke==5 || invoke==6){
      stage=3;
    }
  }
  
} else if(stage==3){
  
  image(water_s,0,0);
  
    if(invoke==1);{
      image(tornado,0,0);
      textSize(30);
      fill(255);
      text("Tornado!",370,230);
    }
    if(invoke==2){
      image(steam,0,0);
      textSize(30);
      fill(0);
      text("Steam!",370,230);
    }
    if(invoke==3){
      image(life,0,0);
      textSize(30);
      fill(255);
      text("Life!",370,230);
    }
    if(invoke==4){
      image(meteor,0,0);
      textSize(30);
      fill(255);
      text("Meteor!",370,230);
    }
    if(invoke==4){
      image(meteor,0,0);
      textSize(30);
      fill(255);
      text("Meteor!",370,230);
    }  
    if(invoke==5){
      image(Earthquake,0,0);
      textSize(30);
      fill(255);
      text("Earthquake!",370,230);
    }  
    if(invoke==6){
      image(volcano,0,0);
      textSize(30);
      fill(255);
      text("Volcano!",370,230);
    }

    }
  }






