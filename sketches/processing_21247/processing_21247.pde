


float angle = 0.0;
float offset = 60;
float scalar = 40;
float speed = 0.05;
float speed2 = 2.5;
int diameter = 2;

float weight=1.0;
float x,y;//MUST do this in order to use the variables below
float easing=.001;
float x1,y1;
   float targetX = mouseX;
  float targetY= mouseY;
  
PImage steps;
PImage shoe1;
PImage shoe2;
PImage prince;
PImage C;
PImage step;
PImage pair;
PImage box2;
PImage evil;
PImage stool;
PImage C2;
PImage slipper;
PImage close2;
PImage happy;
PImage rope;
PImage gag;
PImage chain;
PImage clock;
PImage vacuum;
PImage horn;
PImage crown;
PImage wand;
PFont font;

void setup(){
   size(850,400);
   smooth();
   frameRate(100);
   steps = loadImage("Stair.jpg");
   pair= loadImage("steos.png");
     box2= loadImage("box.png");
      shoe1= loadImage("shoe1.png");
      step= loadImage("shoe2.png");
      prince= loadImage("prince.png");
       C= loadImage("cinderella.png");
       evil= loadImage("evil.png");
       stool= loadImage("stool.png");
       C2= loadImage("cinderella2.png");
       slipper= loadImage("slipper.png");
       close2= loadImage("close.png");
      happy= loadImage("happy.png");
      rope= loadImage("rope.png");
      chain= loadImage("chain.png");
     gag= loadImage("gag.png");
     clock= loadImage("clock.png");
     vacuum=loadImage("vacuum.png");
     horn= loadImage("horn.png");
     crown=loadImage("crown.png");
     wand=loadImage("wand.png");
   
}
    
void draw(){
 tint(random(200,220));
    image(steps, 0, 0);
  

  
  if((mouseX < 250) && (mouseX>80)&&(mouseY<400) && (mouseY>180)&& (mousePressed)){

     image(happy, 25,135,happy.width/3*2.5,happy.height/3*2.5);
  tint(180,240,255);
     image(clock, 255,125,clock.width/3*1.8,clock.height/3*1.8);
   image(C2, 25,145,C2.width/3*2.5,C2.height/3*2.5);
   /*
 font= loadFont("EdwardianScriptITC-48.vlw"); 
 textFont(font);
String s = "...there was a young maiden";
angle +=speed/3;
text(s, (340+sin(angle +0.4)*scalar),(100+sin(angle +.4)*scalar), 400, 85);
     
     font= loadFont("EdwardianScriptITC-48.vlw"); 
 textFont(font);
String st = "named Cinderella,";
angle +=speed/3;
text(st, (360+sin(angle +0.4)*scalar),(135+sin(angle +.4)*scalar), 400, 85); */
  }
 
 else{
   
   
     noTint();
   image(vacuum, 265,175,vacuum.width/3*2.3,vacuum.height/3*2.3);
   image(C, 25,145,C.width/3*2.5,C.height/3*2.5);
   image(slipper, 25,145,slipper.width/3*2.5,slipper.height/3*2.5);
   
 }
    
     
   tint(200,150,220);
    image(shoe1,550,180,shoe1.width/2,shoe1.height/2);
   
  
   noTint();

   image(pair,640,100,pair.width/1.4,pair.height/1.4);
    
   if((mouseX < 760) && (mouseX>650)){
     if((mouseY<240) && (mouseY>110)){
       if (mousePressed){
         tint(random(200));
           image(steps, 0, 0);
           noTint();
            image(C, 25,145,C.width/3*2.5,C.height/3*2.5);
            tint(255,200,200);
   image(rope, 25,145,rope.width/3*2.5,rope.height/3*2.5);
    image(gag, 25,145,gag.width/3*2.5,gag.height/3*2.5);
    image(chain, 25,145,chain.width/3*2.5,chain.height/3*2.5);
         
   tint(random(100,255),random(40,60),0);
   image(evil,663,60,evil.width/2,evil.height/2);
   
   tint(170,230,120);
   image(pair,640,100,pair.width/1.4,pair.height/1.4);
   
       }
     }
   }
     noTint();
    image(stool, 520,305,stool.width/1.3,stool.height/1.3);
   image(step,550,180,step.width/2,step.height/2); 
 
    if((mouseX < 610) && (mouseX>540)){
     if((mouseY<400) && (mouseY>200)){
       if (mousePressed){
        
         noTint();
    image(box2, 510,305);
    
    tint(150,random(250),150);
   image(step,550,180,step.width/2,step.height/2); 
   image(horn,497,180,horn.width/2,horn.height/2); 
   
       }
     }
    }
      if((mouseX < 750) && (mouseX>640)&&(mouseY<400) && (mouseY>220)&& (mousePressed)){

 tint(255,205,100);
   image(prince,550,180,prince.width/2,prince.height/2);
   noTint();
     image(close2,690,160,close2.width/2,close2.height/2);
      image(crown,550,180,crown.width/2,crown.height/2);
  }
 
 else{
   
  noTint();
   image(prince,550,180,prince.width/2,prince.height/2);
   
 }
 noTint();
 font= loadFont("EdwardianScriptITC-48.vlw"); 
 textFont(font);
String s = "Once upon a time...";
angle +=speed/3;
text(s, (40+sin(angle +0.4)*scalar),(40+sin(angle +.4)*scalar), 400, 85);
  
  float targetX = mouseX;
  float targetY= mouseY;
   easing= .01;
  x += (targetX-x)*easing;
  y += (targetY-y)*easing;
    image(wand,mouseX-124, mouseY-43, wand.width/2,wand.height/2);
    
      //small sparkling dots
fill(random( 200));
noStroke();
for(int c=height; c<=width; c+=10) {
  ellipse (random(c), random(c),random(1,3), random(1,4));
}
//small sparkling dots
fill(random(200));
noStroke();
for(int c=width; c<=height; c+=10) {
  ellipse (random(c), random(c), random(2,3), random(2,5));
}

noise (random(0,800));


 
}

