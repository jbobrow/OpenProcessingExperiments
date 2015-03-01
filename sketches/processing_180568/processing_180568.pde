

import ddf.minim.*;
Minim minim;
AudioSample yum;
AudioSample hit;
AudioSample bite;
boolean[] eaten = new boolean[58];
PImage sea;
PImage fish1;
PImage fish2;
PImage shark;
PImage turtle;
PImage lobster;
PImage dolphin;
boolean eatanimal;
void setup(){
  size(1000,559);
   minim = new Minim(this);
    noCursor();
    hit = minim.loadSample( "bubble.mp3", 128);
    yum = minim.loadSample( "dolphin.mp3", 128);
    bite = minim.loadSample( "sharkbite.wav", 128);
  smooth();
   sea = loadImage("sea.png");
   fish1 = loadImage("fish1.png");
   fish2 = loadImage("fish2.png");
   shark= loadImage("shark.png");
    turtle= loadImage("turtle.png"); 
    lobster= loadImage("lobster.png"); 
     dolphin= loadImage("dolphin.png"); 
}
 
 
void draw(){
 imageMode(CORNER);
  image(sea, 0, 0);
  imageMode(CENTER);
   image(shark,mouseX,mouseY);
   
  // fish 1
  for (int i = 0; i < 20; i ++){
    float bx; float by;
    bx=map(i,0,20,0,width);
    by=noise(i+frameCount/1000.0)*900;
    if (eaten[i]==false){
     image(fish1,bx,by);
     if (dist(bx,by,mouseX,mouseY) < 20 && mousePressed==true){
       eaten[i]=true;
       bite.trigger();
      eatanimal = true;
     }
  }
  }
  
  //turtle
    for (int i = 0; i < 1; i ++){
    float bx; float by;
    by=map(i,0,30,100,width);
    bx=noise(i+frameCount/1000.0)*700;
    if (eaten[i]==false){
     image(turtle,bx,by);
     if (dist(bx,by,mouseX,mouseY) < 15 && mousePressed==true){
       eaten[i]=true;
       hit.trigger();
      eatanimal = true;
     }
  }
  }
  //fish2
   for (int i = 0; i < 10; i ++){
    float bx; float by;
    by=map(i,0,70,200,width);
    bx=noise(i+frameCount/1000.0)*700;
    if (eaten[i]==false){
     image(fish2,bx,by);
     if (dist(bx,by,mouseX,mouseY) < 15 && mousePressed==true){
       eaten[i]=true;
       hit.trigger();
      eatanimal = true;
     }
  }
  }
  //dolphin
     for (int i = 0; i < 1; i ++){
    float bx; float by;
    bx=map(i,0,50,500,width);
    by=noise(i+frameCount/1000.0)*700;
    if (eaten[i]==false){
     image(dolphin,bx,by);
     if (dist(bx,by,mouseX,mouseY) < 15 && mousePressed==true){
       eaten[i]=true;
       yum.trigger();
      eatanimal = true;
     }
  }
  }
  
       for (int i = 0; i < 1; i ++){
    float bx; float by;
    by=map(i,0,50,500,width);
    bx=noise(i+frameCount/900.0)*1000;
    if (eaten[i]==false){
     image(lobster,bx,by);
     if (dist(bx,by,mouseX,mouseY) < 15 && mousePressed==true){
       eaten[i]=true;
       hit.trigger();
      eatanimal = true;
     }
  }
  }
  
  
}


