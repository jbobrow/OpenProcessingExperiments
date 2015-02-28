
int frame=1;
PImage paper;
PFont vivaldi;
PFont circusFont;
PImage mouse;
PImage mouseSniff;
//frame 1 images
PImage mill;
PImage plainCat;
PImage goat;
PImage frame1;
boolean drillFlag=true;
//frame 2
PImage frame2;
//frame 3
PImage frame3;
PImage flamcat;
PImage suavecat;
PImage modcat;
//frame4
PImage swirl;
//frame5 
PImage frame5;
//frame 6
PImage frame6;
PImage arm;
//frame 7
PImage frame7;
//frame8
PImage frame8;
PImage markoff;
int choiceFader=0;
boolean rich=false;
boolean powerful=false;
boolean victimized=false;
//frame 9
PImage frame9;
//frame 10
PImage frame10;
//frame11
PImage frame11;
//fraem12 love your cat
PImage frame12;
PImage yellowCat;
//frame13 morals
PImage frame13;
float catPos=0;



void setup(){
 noCursor();
 size(640,480);
 smooth();
 background(0);
 
 mouse=loadImage("mouse.png");
 mouseSniff=loadImage("mouseSniff.png");
 paper=loadImage("paper.jpg");
 vivaldi=loadFont("vivaldi.vlw");
 circusFont=loadFont("circusFont.vlw");
 mill=loadImage("mill.png");
 plainCat=loadImage("plain cat.png");
 goat=loadImage("goat.png");
 frame1=loadImage("frame1.jpg");
 frame2=loadImage("frame2.jpg");
 frame3=loadImage("frame3.jpg");
 flamcat=loadImage("flamcat.png");
 suavecat=loadImage("suavecat.png");
 modcat=loadImage("modcat.png");
 frame5=loadImage("frame5.jpg");
 swirl=loadImage("swirl.jpg");
 frame6=loadImage("frame6.jpg");
 arm=loadImage("arm.png");
 frame7=loadImage("frame7.jpg");
 frame8=loadImage("frame8.jpg");
 markoff=loadImage("markoff.png");
 frame9=loadImage("frame9.jpg");
 frame10=loadImage("frame10.jpg");
 frame11=loadImage("frame11.jpg");
 frame12=loadImage("frame12.jpg");
 yellowCat=loadImage("yellowCat.png");
 frame13=loadImage("frame13.jpg");
 
}

void draw(){
  if (frame==1){
    frame1();}
  else if(frame==2){
    frame2();}
  else if(frame==3){
    frame3();}
  else if(frame==4){
    frame4();}
  else if(frame==5){
    frame5();}
  else if(frame==6){
    frame6();}
  else if(frame==7){
    frame7();}
  else if(frame==8){
    frame8();}
  else if(frame==9){
    frame9();
  }
  else if(frame==10){
    frame10();
  }
  else if(frame==11){
    frame11();}
  else if(frame==12){
    frame12();
  }
  else if(frame==13){
    frame13();}
    
    noTint();
    if(mousePressed){image(mouseSniff,mouseX,mouseY);}
    else{image(mouse,mouseX,mouseY);}
}
void turnPage(){
  for(int i=width;i>0;i-=30){
    line(i,0,i,height);
  }
}
void frame1(){
  //background(255);
  image(frame1,0,0);

  float millDist=dist(width/4,200,mouseX,300);
  float millWidth=constrain(400-millDist,0,500);
  float millHeight=constrain(400-millDist,0,500);
  float millX=width/4-constrain(millWidth/2,30,500);
  float millY=350-constrain(millHeight/2,30,500);

  image(mill,millX,millY,millWidth,millHeight);

  
  float catDist=dist(width/2,200,mouseX,300);
  float catWidth=constrain(380-catDist,0,500);
  float catHeight=constrain(380-catDist,0,500);
  float catX=width/2-constrain(catWidth/2,30,500);
  float catY=350-constrain(catHeight/2,30,500);

  image(plainCat,catX,catY,catWidth,catHeight);
  
  float goatDist=dist(width/4*3,200,mouseX,300);
  float goatWidth=constrain(400-goatDist,0,500);
  float goatHeight=constrain(400-goatDist,0,500);
  float goatX=width/4*3-constrain(goatWidth/2,30,500);
  float goatY=350-constrain(goatHeight/2,30,500);

  image(goat,goatX,goatY,goatWidth,goatHeight);
  
  if(mousePressed==true){
    drillFlag=false;
    if(goatDist<105||millDist<105){
      
    frame=2;
    }
    else if(catDist<105){
    frame=3;
    }
  }
  
  



}

void frame2(){
 image(frame2,0,0);
 drillFlag=false;
  }


void frame3(){
  image(frame3,0,0);
  
  if(mouseY>160){
  float fade=map(constrain(100-dist(-60+150,mouseY,mouseX,mouseY),0,100),0,100,0,255);
  tint(255,fade);
  image(modcat,-60,180,300,300);
  
  fade=map(constrain(100-dist(380+150,mouseY,mouseX,mouseY),0,100),0,100,0,255);
  tint(255,fade);
  image(flamcat,380,180,300,300);

  fade=map(constrain(100-dist(150+150,mouseY,mouseX,mouseY),0,100),0,100,0,255);
  tint(255,fade);
  image(suavecat,150,180,300,300);

  
  //hack...for some reason the last item has a weird fade.
  fade=100;
  tint(255,fade);
  image(frame3,0,0);
  }

}

void frame4(){
  pushMatrix();
  translate(width/2,height/2);
  pushMatrix();
  rotate(radians(frameCount));
  image(swirl,-swirl.width/2,-swirl.height/2);
  popMatrix();
  
  pushMatrix();
  rotate(-radians(frameCount*1.3));
  image(flamcat,-150,-150);

  popMatrix();
  popMatrix();
  textFont(circusFont);
  pushMatrix();
  translate(-frameCount*1.3%1500,0);
  text("        Not finding satisfaction in a normal life of toil and dissapointment, you forego this world and join the circus", 0,400);
  popMatrix();
  println(mouseX+"   "+mouseY);  
}

void frame5(){
  //frame=3;
  image(frame5,0,0);
  textFont(vivaldi);
  textSize(25);
  fill(0);
  if(mouseX>270&&mouseY>151&&mouseY<151+60){fill(255);}
  text("Accept your good fortune and indulge on the bounty",270,151,640-270,100);
  fill(0);
  if(mouseX>380&&mouseY>220&&mouseY<220+60){fill(255);}
  text("Give your surplus to to the king to win favor",380,220,640-380,100);
}

void frame6(){
  /*easing attempt/////////
  float mx=0;
  float my=0;
  float easing=.05;
  if (abs(mouseX  - mx) > 0.01) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }
  */
  //find angle b/w shoulder axis and mouse
  //atan2(mouseY-shoulderY,mouseX,shoulderX)// X/Y switched
  float r= atan2(mouseY-200,mouseX-50);//subtract 50 from X to correct for bend in arm
  r=constrain(r,.29,.7);
  image(frame6,0,0);
  pushMatrix();
  translate(0,195);
  rotate(r-PI/7);
  image(arm,0,0);  
  popMatrix();
  
}
void frame7(){
 image(frame7,0,0);
 textFont(vivaldi);
 textSize(30);
 fill(0);

 

if(mouseX>70&&mouseX<170&&mouseY>118&&mouseY<144){fill(255);}
text("deception", 70,120,163,40);
fill(0);

if(mouseX>70&&mouseX<190&&mouseY<70&&mouseY>43){fill(255);}
 text("please daddy",70,43,163,40);
 fill(0);
 
if(mouseX>70&&mouseX<170&&mouseY>78&&mouseY<105){;fill(255);}
text("humor", 70,80,163,40);
fill(0);

choiceFader=0;//going into frame 8 always fresh

}

void frame8(){
  image(frame7,0,0);
  tint(255,choiceFader);
  choiceFader+=2;
  image(frame8,0,0);
  fill(0);
  textFont(vivaldi);
  textSize(40);
  if(choiceFader>180){
    
   if(mouseX>325&&mouseX<525&&mouseY>84&&mouseY<118&&!rich){fill(255);}
   text("$$Rich$$",325,84,200,50) ;   
   if(rich){image(markoff,325,84);}
   
   fill(0);
   if(mouseX>325&&mouseX<525&&mouseY>125&&mouseY<154&&!powerful){fill(255);}
   text("Powerful",325,125,200,50) ;
   if(powerful){image(markoff,325,125);}
   
   fill(0);
   if(mouseX>325&&mouseX<525&&mouseY>160&&mouseY<210&&!victimized){fill(255);}
   text("Victimized",325,160,200,50) ;
   if(victimized){image(markoff,325,160);}
   
   fill(0);
   textSize(28);
   if(rich&&!powerful&&!victimized){
     text("I've already got money...",12,90);
   }
   else if(rich&&powerful&&!victimized){
     text("He seems pretty full of himself",12,90);
  }
  else if(!rich&&!powerful&&!victimized){
    text("Who the hell is this guy?",12,90);
  }
  else if(!rich&&!powerful&&victimized){
    text("What a naked wimp!",12,90);
  }
  else if(!rich&&powerful&&!victimized){
    text("What an ugly castle. He's not much to look at either",12,60,280,200);
  }
  else if(rich&&!powerful&&victimized){
    text("What a Mama's boy",12,60);
  }
  else if(!rich&&powerful&&victimized){
    text("I aint sayin Im a gold digger...",12,60,280,200);
  }
  else if(rich&&powerful&&victimized){
    frame=12;
  }

  }
  
}

void frame9(){
 image(frame9,0,0); 
 
}

void frame10(){
image(frame10,0,0);
}

void frame11(){
image(frame11,0,0);
}

void frame12(){
image(frame12,0,0);
pushMatrix();
scale(-1,1);
float bouncingY=250+10*(sin(frameCount/5.0));
image(yellowCat,-580,bouncingY,200,200);
popMatrix();

textFont(vivaldi);
fill(0);
textSize(30);
text("just another suitor, but",50,60);

textSize(55);

text("I   LOVE your cat!",130,190);

}

void frame13(){
 image(frame13,0,0); 
 println(mouseX+"    "+mouseY);
 fill(200,20,20);
 textSize(30);
 text("If all else fails,,,",61,304) ;
 image(yellowCat,30,470-catPos);
   if(mouseX>62&&mouseX<213&&mouseY>278&&mouseY<312){
     text("get something fuzzy and cute",35,330) ;
     fill(0);
     text("feed the cat to start over",60,height-30);
     if(catPos<140){
       catPos+=3;
     }
   }
   else if(catPos>0){
     catPos-=2;
     fill(0);
     text("feed the cat to start over",60,height-30);
   }
   else if(catPos<0){
     fill(0);
     text("feed the cat to start over",60,height-30);
   catPos=0;
   }
}
 void mousePressed(){
   if(frame==3){
    if(map(constrain(100-dist(-60+150,mouseY,mouseX,mouseY),0,100),0,100,0,255)>90&&mouseY>160){//modest
    frame=2;
    }
    else if(map(constrain(100-dist(380+150,mouseY,mouseX,mouseY),0,100),0,100,0,255)>90&&mouseY>160){//flam circus
      frame=4;
    }
    else if(map(constrain(100-dist(150+150,mouseY,mouseX,mouseY),0,100),0,100,0,255)>90&&drillFlag&&mouseY>160){//suave
     println("clicked3");
     frame=5;
    }
  }
 }
 void mouseClicked(){
  if(frame==2&&mouseX>168&&mouseY>147&&mouseX<458&&mouseY<278){
    frame=1;
  }

  else if(frame==5){
    if(mouseX>270&&mouseY>151&&mouseY<151+60){//indulge
    frame=2;
    }
    else if(mouseX>380&&mouseY>220&&mouseY<220+60){
    frame=6;
    }
  }
  else if(frame==4){
   if(mouseX>294&&mouseX<335&&mouseY>200&&mouseY<328){
   frame=1;}
  }
  else if(frame==6){
    if(mouseX>324&&mouseY>322&&mouseX<585&&mouseY<358){
    frame=4;}
    else if(mouseX>287&&mouseY>420&&mouseX<593&&mouseY<442){
      frame= 7;
    }
  }
  else if (frame==7){
    if(mouseX>70&&mouseX<170&&mouseY>118&&mouseY<144){frame=8;}//deception
    if(mouseX>70&&mouseX<190&&mouseY<70&&mouseY>43){frame=6;}//please dadddy
    if(mouseX>70&&mouseX<170&&mouseY>78&&mouseY<105){frame=4;}//deception
  
  }
  else if (frame==8){
   if(mouseX>325&&mouseX<525&&mouseY>84&&mouseY<118&&!rich){rich=true;frame=9;}
   if(mouseX>325&&mouseX<525&&mouseY>125&&mouseY<154&&!powerful){powerful=true;frame=10;}
   if(mouseX>325&&mouseX<525&&mouseY>160&&mouseY<210&&!victimized){victimized=true;frame=11;}

  }
  else if(frame==9){
    if(mouseX>158&&mouseX<435&&mouseY>390&&mouseY<467){
    frame=8;
    rich=true;}
  }
  else if(frame==10){
    if(mouseX>158&&mouseX<435&&mouseY>390&&mouseY<467){
    frame=8;
    powerful=true;}
  }
  else if(frame==11){
    if(mouseX>87&&mouseX<307&&mouseY>380&&mouseY<430){
    frame=8;
    victimized=true;}
  }
  else if(frame==12){
    if(mouseX>443&&mouseX<520&&mouseY>260&&mouseY<420){
    frame=13;
     }
  }
  else if (frame==13){
    if(mouseX>90&&mouseX<210&&mouseY>height-catPos-10){
      frame=1;
    }
  }
  }
  
  void mouseReleased(){
   if(drillFlag==false){
   drillFlag=true;
   } 
  }

