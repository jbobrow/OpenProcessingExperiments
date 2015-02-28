
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int mode = 1;
float angle1, y,mex,mey, h, h1, h2, l, l1, l2;


boolean startbutton = false;
boolean finishbutton1 = false;
boolean restartbutton = false;
boolean button1 = false; //pants
boolean button2 = false; //shorts
boolean button3 = false; //blue dress
boolean button4 = false; //blackshorts
boolean button5 = false; //gwarshirt
boolean button6 = false; //peacoat
boolean button7 = false; //shoes
boolean button8 = false; //shirt
boolean button9 = false; //socks
boolean button10 = false; //skirt
boolean button11 = false; //bun
boolean button12 = false; //bunz

PImage startpage;
PImage button;
PImage bg;
PImage acidwashshortsICON;
PImage blackshortsICON;
PImage bluedressICON;
PImage bunhead1ICON;
PImage bunsheadICON;
PImage gwarshirtICON;
PImage PantsICON;
PImage shoes1ICON;
PImage skirtICON;
PImage me;
PImage bluedress;
PImage peacoat;
PImage shirt;
PImage socks;
PImage peacoatICON;
PImage shirtICON;
PImage socksICON;
PImage bun;
PImage bunz;
PImage skirt;
PImage gwarshirt;
PImage pants;
PImage shoes;
PImage shorts;
PImage blackshorts;
PImage finish;
PImage finishbutton;
PImage restart;
PImage mebun1;
PImage mebunz;
PImage mehead;


Minim minim;
AudioPlayer player;



void setup(){
  size(1296,810);
  imageMode(CENTER);
  minim = new Minim(this);
  player = minim.loadFile("chimes.mp3",2048);



  mex = 244;
  mey = 400;
  startpage = loadImage("startpage.jpg");
  button = loadImage("button.png");
   bg = loadImage("finalbackground.jpg");
   me = loadImage("me.png");
   acidwashshortsICON = loadImage("acidwashshortsICON.png");
   blackshortsICON =loadImage("blackshortsICON.png");
   bluedressICON =loadImage("blue dressICON.png");
   bunhead1ICON =loadImage("bunhead1.png");
   bunsheadICON = loadImage("bunshead.png");
   gwarshirtICON =loadImage("gwarshirtICON.png");
   PantsICON =loadImage("PantsICON.png");
   shoes1ICON =loadImage("shoes1ICON.png");
   skirtICON =loadImage("skirtICON.png");
   
   bluedress = loadImage("bluedress.png");
   peacoat = loadImage("peacoat.png");
  socks = loadImage("socks.png");
  shirt  = loadImage("shirt.png");
    bun = loadImage("bun.png");
    bunz  = loadImage("bunz.png");
      peacoatICON = loadImage("peacoatICON.png"); 
      socksICON = loadImage("socksICON.png");
       shirtICON = loadImage("shirtICON.png");
       pants = loadImage("pants.png");
       gwarshirt = loadImage("gwarshirt.png");
       shoes = loadImage("shoes.png");
       skirt = loadImage("skirt.png");
       blackshorts = loadImage("blackshorts.png");
        shorts = loadImage("shorts.png");
         finish = loadImage("finish.png");
         finishbutton = loadImage("finishbutton.png");
         restart = loadImage("restart.png");
         mebun1 = loadImage("mebun1.png");
         mebunz = loadImage("mebunz.png");
        mehead = loadImage("mehead.png"); 
}

void draw(){
  
  float ang1 = radians(angle1);
  
  if(mode == 1){
    background(startpage);
   image(button,648,y);
  }
  h = 460 +(sin(ang1)*50);
  h1 = 500 +(sin(ang1)*50);
  h2 = 600 +(sin(ang1)*50);
  l = 650 +(cos(ang1)*50);
  l1 = 996 +(cos(ang1)*50);
  l2 = 830 +(cos(ang1)*50);
  
  if(mode == 3){
image(finish,width/2,height/2);
image(restart,1227,741);
image(mehead,l,h);
image(mebun1,l1,h1);
image(mebunz,l2,h2);

}
if(mode == 4){
  mode = 1;
}
  

    println(mouseX);
  println(mouseY);
  
  y = 405 +(sin(ang1)* 50);
  angle1+=2;
  
  if(mode == 2){
  image(bg,width/2,height/2);
  image(me,mex,mey);
  
  //ICONS
  image(skirtICON,820,520);//1
   image(blackshortsICON,720,520);//2
  image(acidwashshortsICON,620,520);//3
  image(bluedressICON,620,285);//4
  image(bunhead1ICON,786,99);//5
  image(gwarshirtICON,868,275);//6
  image(PantsICON,1095,595);//7
  image(shoes1ICON,627,723);//8
  image(bunsheadICON,1010,99);//9
  image(peacoatICON,1150,275);
  image(shirtICON,1000,275);
  image(socksICON,750,723);
 //CLOTHES
 image(finishbutton,42,767);
 
   if(button11){
   image(bun,244,400);
   mex = 1400;
   mey = 1000;
 }
  if(button12){
   image(bunz,244,400);
    mex = 1400;
   mey = 1000;
 }
 if(button3){
   image(bluedress,244,400);
 }

  if(button5){
   image(gwarshirt,244,400);
 }

 
  if(button8){
   image(shirt,244,400);
 }

  if(button9){
   image(socks,244,400);
 }
     if(button1){
   image(pants,244,400);
 }
  if(button7){
   image(shoes,244,400);
 }
  if(button10){
   image(skirt,244,400);
 }
  if(button2){
   image(shorts,244,400);
 }
   if(button4){
   image(blackshorts,244,400);
 }
   if(button6){
   image(peacoat,244,400);
 }
 if(button11 == false && button12 == false){
   mex = 244;
   mey = 400;
 }
if(finishbutton1){
  image(finishbutton,42,767);
 
  }  


 
}
}
  void mouseReleased(){
      if(mode == 1 && mouseX > 508 && mouseX < 782  && mouseY > 382 && mouseY < 506 ){
        mode = 2;
        if(startbutton){
        startbutton = false;
      }
      }
       if(mode == 2 && mouseX > 8  && mouseX < 73 && mouseY > 736 && mouseY < 799){
         mode = 3;
         if(finishbutton1){
           finishbutton1 = false;
         }
       }
    if(mode == 3 && mouseX > 1200  && mouseX < 1250 && mouseY > 716 && mouseY < 769){
      mode = 4;
      if(restartbutton){
        restartbutton = false;
      }
    }
    
    
    
    if(mouseX > 538 && mouseX < 747 && mouseY > 145 && mouseY < 420){
      if(button3){
        button3 = false;
      }else{
        button3 = true;
      }
    }
     if(mouseX > 1038 && mouseX < 1150 && mouseY > 499 && mouseY < 751){
      if(button1){
        button1 = false;
      }else{
        button1 = true;
      }
       player.play();
        player.cue(0);
    }
     if(mouseX > 546 && mouseX < 696 && mouseY > 466 && mouseY < 587){
      if(button2){
        button2 = false;
      }else{
        button2 = true;
      }
       player.play();
        player.cue(0);
    }
     if(mouseX > 700 && mouseX < 800 && mouseY > 464 && mouseY < 590){
      if(button4){
        button4 = false;
      }else{
        button4 = true;
      }
       player.play();
        player.cue(0);
    }
     if(mouseX > 809 && mouseX < 923 && mouseY > 178 && mouseY < 380){
      if(button5){
        button5 = false;
      }else{
        button5 = true;
      }
       player.play();
        player.cue(0);
    }
     if(mouseX > 1078 && mouseX < 1222 && mouseY > 178 && mouseY < 372){
      if(button6){
        button6 = false;
      }else{
        button6 = true;
      }
       player.play();
        player.cue(0);
    }
     if(mouseX > 578 && mouseX < 676 && mouseY > 702 && mouseY < 748){
      if(button7){
        button7 = false;
      }else{
        button7 = true;
      }
       player.play();
        player.cue(0);
    }
     if(mouseX > 927 && mouseX < 1072 && mouseY > 177 && mouseY < 378){
      if(button8){
        button8 = false;
      }else{
        button8 = true;
      }
       player.play();
        player.cue(0);
    }
     if(mouseX > 712 && mouseX < 780 && mouseY > 648 && mouseY < 750){
      if(button9){
        button9 = false;
      }else{
        button9 = true;
      }
       player.play();
        player.cue(0);
    }
     if(mouseX > 800 && mouseX < 895 && mouseY > 450 && mouseY < 597){
      if(button10){
        button10 = false;
      }else{
        button10 = true;
      }
       player.play();
        player.cue(0);
    }
     if(mouseX > 747 && mouseX < 827 && mouseY > 61 && mouseY < 128){
      if(button11){
        button11 = false;
      }else{
        button11 = true;
      }
       player.play();
        player.cue(0);
    }
      if(mouseX > 970 && mouseX < 1049 && mouseY > 67 && mouseY < 114){
      if(button12){
        button12 = false;
      }else{
        button12 = true;
      }
       player.play();
        player.cue(0);
    }
    
  } 
    
    
    
    
 
      
      
      
      
      
      
      

