
//Arthur Luo//

//SpongeBob and Patrick//


    //Import image.//
int a=0;
int gif = 8;
int gif_frame = 0;
PImage spongebob, patrick, mrkrab;
PImage jellyfish;
PImage jellyfish_field, krusty_crab;
PImage spongebob_catching, patrick_catching;
PImage mrkrab_smiling, mrkrab_dreaming;
PImage[] mrkrabcry = new PImage [gif];


void setup(){
  frameRate(10);
    //Size of it is 800*600//
  size( 800, 600);
    //Load image.//
  spongebob = loadImage("spongebob.png");
  patrick = loadImage("patrick.png");
  mrkrab = loadImage("mrkrab.png");
  jellyfish = loadImage("jellyfish.png");
  jellyfish_field = loadImage("jellyfish_field.jpg");
  krusty_crab = loadImage("krusty_crab.jpg");
  spongebob_catching = loadImage("spongebob_catching.png");
  patrick_catching = loadImage("patrick_catching.png");
  mrkrab_smiling = loadImage("mrkrab_smiling.png");
  mrkrab_dreaming = loadImage("mrkrab_dreaming.png");
  for(int i=0; i<mrkrabcry.length; i++){
    mrkrabcry[i]=loadImage(i+".jpg");
  }
}

void draw(){
  a=a+1;
  println(a);
  
    //first scene at jellyfish field.//
  if(a<=40){
  randomSeed(0);
  image(jellyfish_field,0,0);
  image(spongebob,80,270);
  image(patrick,450,175);
  image(jellyfish,300,20);
  image(jellyfish,random(800),random(50));
  image(jellyfish,random(800),random(50));
  image(jellyfish,random(800),random(50));
  fill(229,159,16,200);
  rect(200,480,400,100);
  fill(0,0,0);
  String s = "It's another day in Bikini bottom; Spongebob and his friend Patrick are catching jellyfish.";
  text(s,230,510,340,50);
  }
  
    //first scene at jellyfish field.//
  if(a>40 && a<=80){
    image(jellyfish_field,0,0);    
    image(jellyfish,random(800),random(200));
    image(jellyfish,random(800),random(200));
    image(jellyfish,random(800),random(200));
    image(jellyfish,random(800),random(200)); 
    image(spongebob_catching,40,130);
    image(patrick_catching,540,175);
    fill(229,159,16,200);
    rect(200,480,400,100);
    fill(0,0,0);
    String s = "They are trying to catch a jellyfish this time for a reason. It's Mr.Krabs' birthday!";
    text(s,230,510,340,50);
  }
  
  if(a>80 && a<=120){ 
    image(krusty_crab,0,0);
    image(mrkrab,270,250);
    image(spongebob,10,320);
    image(patrick,550,220);
    fill(229,159,16,200);
    rect(200,480,400,100);
    fill(0,0,0);
    String s = "Hey MrKrab, I got you a birthday present!--says Spongebob all excited";
    text(s,230,510,340,50);
  }
  
  if(a>120 && a<=160){ 
    image(krusty_crab,0,0);
    image(mrkrab_smiling,340,275);
    image(spongebob,10,320);
    image(patrick,550,220);
    fill(229,159,16,200);
    rect(200,480,400,100);
    fill(0,0,0);
    String s = "Ohhhhh! Let me guess, is it Money? or perhaps, mOney? Or... Mo$Ne$Y!??";
    text(s,230,510,340,50);
  }
  
  if(a>160 && a<=200){ 
    image(krusty_crab,0,0);
    image(mrkrab,270,250);
    image(jellyfish,270,300);
    image(spongebob,10,320);
    image(patrick,550,220);
    fill(229,159,16,200);
    rect(200,480,400,100);
    fill(0,0,0);
    String s = "No sorry Mr.Krabs, we got you a jellyfish!";
    text(s,230,510,340,50);
  }
  
  if(a>200 && a<=250){ 
    image(krusty_crab,0,0);
    image(mrkrab,270,250);
    tint(255,3,7);
    image(jellyfish,270,300);
    noTint();
    image(spongebob,10,320);
    image(patrick,550,220);
    fill(229,159,16,200);
    rect(200,480,400,100);
    fill(0,0,0);
    String s = "Awoooooooooooo!!!! It just stung me!!!! --cries Mr.Krabs";
    text(s,230,510,340,50);
  }
  
  if(a>250){
    image(krusty_crab,0,0);
    tint(255,3,7);
    image(jellyfish,270,300);
    noTint();
    image(spongebob,10,320);
    image(patrick,550,220);
    fill(229,159,16,200);
    rect(200,480,400,100);
    fill(0,0,0);
    String s = "I think it was not happy hearing you say that--gigled Patrick and Spongebob";
    text(s,230,510,340,50);
    frameRate(10);
    image(mrkrabcry[gif_frame],150,200);
    gif_frame = (gif_frame + 1) % mrkrabcry.length;

  }
}


