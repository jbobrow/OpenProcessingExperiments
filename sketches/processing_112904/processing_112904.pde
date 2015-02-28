
/* @pjs preload="1.png, 2.png, 21.gif, 21.png, 22.png, 3.png, END.png, M22_1.png, M22_2.png, battery0.png, battery1.png, box_far.png, box_far_laz.png, box_kil1.png, box_med.png, box_med_laz.png, bullet.png, bullet0.png, canemp.png, canful.png, close.png, fire.png, g.png, g2.png, gun1.png, gun2.png, interface.png, lazer1.png, lazer2.png, mirror_far.png, mirror_far_laz.png, mirror_kil1.png, mirror_kil2.png, mirror_med.png, mirror_med_laz.png, normal_far.png, normal_kil1.png, normal_med.png"; 
 */

import ddf.minim.*;
Minim minim;
AudioSample sload;
AudioSample smeg;
AudioSample sbullet;
AudioSample sflame;
AudioSample slazer;
AudioSample skill;
  
PImage f;
PImage m;
PImage c;//dont change
PImage k1;
PImage k2;//dont change
PImage G1;
PImage G2;
PImage bullet0;
PImage bullet;


PImage FT1;
PImage FT2;
PImage can0;
PImage can1;

PImage P451;
PImage P452;
PImage bul0;
PImage bul1;

PImage LAZ1;
PImage LAZ2;
PImage cha0;
PImage cha1;

PImage normal_far;
PImage normal_med;
PImage normal_k1;


PImage mirror_far;
PImage mirror_med;
PImage mirror_k1;

PImage box_far;
PImage box_med;
PImage box_k1;

PImage end;

PImage fire;

PImage intf;

PFont font;



void setup() {
  size(1366, 768);
  
  minim=new Minim(this);
 sload=minim.loadSample("load.wav",512);
 smeg=minim.loadSample("meg.wav",512);
 sbullet=minim.loadSample("shoot_bullet.wav",512);
 sflame=minim.loadSample("shoot_fire.wav",512);
 slazer=minim.loadSample("shoot_lazer.wav",512);
 skill=minim.loadSample("zombie_die_02.wav",512);



P451=loadImage("gun1.png");
  P452=loadImage("gun2.png");
  bul0=loadImage("bullet0.png");
  bul1=loadImage("bullet.png");  

FT1=loadImage("M22_1.png");
  FT2=loadImage("M22_2.png");
  can0=loadImage("canemp.png");
  can1=loadImage("canful.png");  

LAZ1=loadImage("lazer1.png");
  LAZ2=loadImage("lazer2.png");
  cha0=loadImage("battery0.png");
  cha1=loadImage("battery1.png");  
  
  
mirror_far=loadImage("mirror_far.png");
  mirror_med=loadImage("mirror_med.png");
  mirror_k1=loadImage("mirror_kil1.png");
  
  
normal_far=loadImage("normal_far.png");
  normal_med=loadImage("normal_med.png");
  normal_k1=loadImage("normal_kil1.png");
  
  
box_far=loadImage("box_far.png");
  box_med=loadImage("box_med.png");
  box_k1=loadImage("box_kil1.png");
  
end=loadImage("END.png");


  c=loadImage("close.png");
  k2=loadImage("mirror_kil2.png");
  
  fire=loadImage("fire.png");
  
intf=loadImage("interface.png");
  
  font =loadFont("UNIK2-72.vlw");
}

//String lo="";

//int zoom=5;

boolean load1 = false;
boolean load2 = false;
boolean shoot = false;
boolean sniper = false;
boolean remove = false;
boolean change = false;

boolean damage = false;
boolean die = false;
boolean win = false;
boolean kill=false;
boolean hit=false;
boolean load=false;
boolean shoot_ani=false;


int type;
int gun;
int count;
int count2;
int count3;

int hp=9;
int bullets=0;
int bulletnum;

int gx=1;
int bdis;
int score;



void draw() {
  background(255);


  
if (hp==0){
  background(255);
  image(end,0,0);
  textFont(font,72);
fill(0);
text(" your score:"+score,500,350);
  if (shoot== true){
   hp=9;
   score=0;
  }
}
else{

if (type==0){
  f=mirror_far;
  m=mirror_med;
  k1=mirror_k1;
}
else if(type==1){
    f=normal_far;
  m=normal_med;
  k1=normal_k1;
}
else if (type==2){
  
    f=box_far;
  m=box_med;
  k1=box_k1;
}
  
  
  
  
if (gun==0){
  G1=P451;
  G2=P452;
  bullet0=bul0;
  bullet=bul1;  
//45 gun
bulletnum=7;
bdis=30;
load=load1;
//if (lo.equals("zzz")  ||lo.equals("zzzz")||lo.equals("zzzzz")) {
//  load1=true;
//}
}
else if (gun==2){
    G1=FT1;
  G2=FT2;
  bullet0=can0;
  bullet=can1;  
//flamethrower
bulletnum=1;
bdis=0;
load=load1;


//if (lo.equals("zzz")  ||lo.equals("zzzz")||lo.equals("zzzzz")) {
//  load1=true;
//}
}
else if (gun==1){
    G1=LAZ1;
  G2=LAZ2;
  bullet0=cha0;
  bullet=cha1;  
//lazer
bulletnum=2;
bdis=53;
load=load2;
//if (lo.equals("xxx") ||lo.equals("xxxx") ||lo.equals("xxxx") ) {
//  load2=true;
//}
}

//if (shoot==true){
//  lo="";
//
//}
//shoot
  if (load==true && bullets>0 && shoot==true) {
        
if (type==gun){
    skill.trigger();
    background(255);
    image(k1, 0, 0);

    if (count2>=21) {
      background(255);
      image(k2, 0, 0);

     
    }
    
    if(count2>=31){ 
      shoot=false;
      load=false;
      load1=false;
      load2=false;

      bullets--;
      count=0;
      count2=0;
//      lo="";
      gx=0;
      type=int(random(0,2.9));
          score++;

      }
    else {
      count2++;
    }
}
else{shoot_ani=true;


    shoot=false;
      load=false;
      load1=false;
      load2=false;
      bullets--;
//      lo="";
      gx=0;
  }
  }



//shoot

  else {

    if (count>=240 ) {
      
      count=0;
      type=int(random(0,2.9));
      
      if (hp>0){
        hp--;}
        
    }
    else {
      count++;
    }


    if (count<=84) {
      image(f, 0, 0);
    }


    else if (count>84 &&count<=168) {

      image(m, 0, 0);
    }

    else {
    image(c, 0, 0);
    }
}


if(shoot_ani==true){
      if (gun==2){
        count3++;
        if (count3<24 && count3>0){
 image(fire,0,0); 
 count3++;
        }
        else{count3=0; 
shoot_ani=false;
  }
}

else if (gun==1){
if (type==0){
    count3++;
   if (count3<24 && count3>0){
if(count<=84){
noFill();
stroke(255,0,0);
beginShape();
vertex(375,768);
vertex(855, 345);
vertex(587,0);
endShape();}
else if(count>84 &&count<=168){
  noFill();
stroke(255,0,0);
beginShape();
vertex(375,768);
vertex(733,451);
vertex(349,0);
endShape();
}
  count3++;
        }
        else{count3=0;
    shoot_ani=false;

  }
}
else if (type==2){
     count3++;
   if (count3<24 && count3>0){
if(count<=84){
noFill();
stroke(255,0,0);
line(375,768,1366,275);
}
else if(count>84 &&count<=168){
  noFill();
stroke(255,0,0);
line(375,768,467,0);

}
    count3++;
        }
        else{count3=0;
      shoot_ani=false;

  }
}

}
}

//bullets

image(bullet0,0,0);

 for (int i=0;i<bullets;i++){
  image( bullet,0+bdis*i,0);
}



//bullets












noStroke();
fill(160, 0, 0);
rect(275, 40, (1030)*hp/9, 38);



if (load1==true  || load2==true) {
  if (gx<21&&gx>0){
    gx+=4;
  }
  else{
  gx=0;
}
}

image(G1, 0, 0);
image(G2, -gx, 0);

textFont(font,50);
fill(0);
text("score:"+score,1160,120);

image(intf,0,0);
//
//println(lo);
//println(load1); 
//println(load2);
//println(load);
//
//println(shoot);

//println(damage);
//println(count);
//println(count2);
//
//println(type);
//println(gun);
//println(G1);
println(count3);
println(shoot_ani);

}
}


void keyPressed() {
  if (key=='z' ||key=='x') {

   if ((gun==0 || gun==2) && key=='z'){
   load1=true;
gx=1;
     sload.trigger();
     
   }
   else if (gun==1 &&key=='x'){
load2=true;
    sload.trigger();
gx=1;

   }
  } 
  else if (key=='s') {
    if(((load1==true  ||  load2==true)&&bullets>0) || hp==0 ){
    shoot=true;
      if (gun==0){sbullet.trigger();}
  else if (gun==1){slazer.trigger();}
  else if (gun==2){sflame.trigger();}
  }
  

  }
  
//    else if (key=='0' ||key=='1' ||key=='2' ||key=='3'  ||key=='4' ||key=='5' ||key=='6' ||key=='7'||key=='8'||key=='9') {

//
//    }
    else if (key=='u' ||key=='d') {
      smeg.trigger();
      if (key=='u') {
gun++;
bullets=0;
      }
      else if (key=='d') {
gun--;
bullets=0;

        }
if (gun==3){gun=0;}
else if(gun==-1){gun=2;}



      }
  //
  //    else if (key=='t') {
  //      sniper=true;
  //    }




//  else if (key=='q' ||key=='h') {
//    if (key=='q') {
//      bullets=0;
//      remove=true;
//      shoot=false;
//    }
//    else if (key=='h') {
//      if (remove==true){
//    bullets=bulletnum;
//    remove=false;
//      }
//   }
//  }
//}
  else if (key=='h') {
 smeg.trigger();
shoot=false;
    bullets=bulletnum;
      
   
  }
}



void stop()
{
  // always close Minim audio classes when you are done with them
   sload.close();
 smeg.close();
 sbullet.close();
 sflame.close();
 slazer.close();
 skill.close();
 
  minim.stop();

  super.stop();
}


