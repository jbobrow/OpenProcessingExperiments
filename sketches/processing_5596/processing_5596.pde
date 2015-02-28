
///times
int startTime = 0;


///umbrella things
float umbY = 270;
float cloudX=-400;
float cloudX2=400;
float tricksY=0;
////rain floats
float rain_random = 0;
float dropX = random(20,620);
float dropY1=-20;
float dropX2= random(20,620);
float dropY2=-20;
float dropX3= random(20,620);
float dropY3=-20;
float dropX4= random(20,620);
float dropY4=-20;
float dropX5= random(20,620);
float dropY5=-20;
float dropX6= random(20,620);
float dropY6=-20;
float dropX7= random(20,620);
float dropY7=-20;
float dropX8= random(20,620);
float dropY8=-20;
float dropX9= random(20,620);
float dropY9=-20;
float dropX10= random(20,620);
float dropY10=-20;
float dropX11= random(20,620);
float dropY11=-20;
float dropX12= random(20,620);
float dropY12=-20;
float dropX13= random(20,620);
float dropY13=-20;
float dropX14= random(20,620);
float dropY14=-20;
float dropX15= random(20,620);
float dropY15=-20;

///umbrella
PShape u1;
PShape u2;
PShape u3;
PShape u4;
PShape u5;
PShape u6;
PShape u7;
PShape u8;
PShape u9;
PShape u10;
PShape u11;
PShape u12;
PShape u13;

/////Moon things
PShape suit;
PImage moon;
PShape njet;
float backX;
float backY;
float tricksX = 0;
float omarY=0;
float omarX=0;

///////morph things

PShape b;
PShape h;
PShape lf;
PShape rf;
PShape Ll;
PShape Rl;

PShape tricks1;
PShape tricks2;
PShape tricks3;




PFont halv;
int page=1;
int trickTime =0;
float x = 100;
float easing = 0.005;
float foot_y = 270;
boolean right_step = true;
float foot_easing = .005;
float dropY=-20;
float shellX=0;



PShape one;
PShape two;
PShape three;
PShape eight;
PShape talk;
PShape tricks;
PShape thought;
PShape rain;
PShape d1;
PShape d2;
PShape d3;


PImage back;
PImage back2;

PImage brkn;
PImage shell;
PImage mach;
/////confetti
PShape con1;
PShape con2;
PShape con3;
float conX=0;
float conY=0;
float conY2=0;
float conY3=0;


/////Omar
PImage Ih;
PImage Ib;
PImage Ilf;
PImage Irf;
PImage ILl;
PImage IRl;
PImage Ibl;

PShape m;
PShape Le;
PShape Re;
PShape Lp;
PShape Rp;

////clouds////
PShape lc;
PShape rc;




void setup(){
  smooth();
  size(640,480);
  halv = loadFont("ComicBookNormal-16.vlw");
  textFont(halv);
  textAlign(CENTER);
  fill(255);

  one=loadShape("1.svg");
  two=loadShape("2.svg");
  three=loadShape("3.svg");
  eight=loadShape("8.svg");
  talk=loadShape("talk.svg");
  tricks=loadShape("tricks.svg");
  thought=loadShape("thought.svg");
  rain=loadShape("rain drop.svg");



  back=loadImage("back.png");
  back2=loadImage("2.png");
  /////confetti
   con1=loadShape("con1.svg");
   con2=loadShape("con2.svg");
   con3=loadShape("con3.svg");
  


  ///omar
  Ib=loadImage("egg.png");
  Ih=loadImage("hair.png");
  Ilf=loadImage("Lfoot.png");
  Irf=loadImage("Rfoot.png");

  brkn=loadImage("body2.png");
  shell=loadImage("shell.png");
  mach=loadImage("machine.png");


  Ibl=loadImage("blink.png");

  m=loadShape("mouth.svg");
  Le=loadShape("Leye.svg");
  Re=loadShape("Reye.svg");
  Lp=loadShape("Lpupil.svg");
  Rp=loadShape("Rpupil.svg");

  d1=loadShape("d1.svg");
  d2=loadShape("d2.svg");
  d3=loadShape("d3.svg");
  startTime = millis();
  
  //////morph
  b=loadShape("body.svg");
  h=loadShape("hair.svg");
  lf=loadShape("Lfoot.svg");
  rf=loadShape("Rfoot.svg");
  Ll=loadShape("Llid.svg");
  Rl=loadShape("Rlid.svg");
  
  tricks1=loadShape("tricks1.svg");
  tricks2=loadShape("tricks2.svg");
  tricks3=loadShape("tricks3.svg");

  /////clouds
  lc=loadShape("lCloud.svg");
  rc=loadShape("rCloud.svg");
  /////umbrella
  u1=loadShape("umbrella.svg");
  u2=loadShape("umbrella2.svg");
  u3=loadShape("umbrella3.svg");
  u4=loadShape("umbrella4.svg");
  u5=loadShape("umbrella5.svg");
  u6=loadShape("umbrella6.svg");
  u7=loadShape("umbrella7.svg");
  u8=loadShape("umbrella8.svg");
  u9=loadShape("umbrella9.svg");
  u10=loadShape("umbrella10.svg");
  u11=loadShape("umbrella11.svg");
  u12=loadShape("umbrella12.svg");
  u13=loadShape("umbrella13.svg");

  /////Moon things
  suit=loadShape("space.svg");
  moon=loadImage("moon.jpg");
  njet=loadShape("nojet.svg");


}

void draw(){







  image(moon,0 + backX,-1120 + backY);  
  pushMatrix();
  ///omar
  ///hands
  fill(145,53,148); 
  stroke(202,136,58);
  strokeWeight(10);
  line(x-40 + omarX,328 + omarY,x-74+ omarX,350+ omarY);
  line(x-74+ omarX,350+ omarY,x-95+ omarX,324+ omarY); 
  strokeWeight(10);
  line(x+70+ omarX,328+ omarY,x+110+ omarX,348+ omarY);
  line(x+108+ omarX,348+ omarY,x+132+ omarX,350+ omarY);
  image(mach,x-77+ omarX,240+ omarY);
  image(brkn,x-77+ omarX,240+ omarY);
  image(shell,x-77 + shellX+ omarX ,240+ omarY);
  image(Ih,x-40 + shellX + omarX,180+ omarY);
  image(Ilf,x-58+ omarX,705-foot_y+ omarY);
  image(Irf,x+10+ omarX,150 + foot_y+ omarY);
  shape(m,x-25+ omarX,382+ omarY);
  shape(Le,x-37+ omarX,300+ omarY);
  shape(Re,x-9+ omarX,298+ omarY); 
  shape(Lp,x-26+ omarX,322+ omarY);
  shape(Rp,x-3+ omarX,320+ omarY); 

  //////////Foot steps//////////

  if(right_step)
  {
    if(foot_y > 285)
    {
      right_step = false;
    }
    else{

      foot_y = foot_y + (abs(mouseX-x))*foot_easing;
    }
  }
  else{
    if(foot_y < 270)
    {
      right_step = true;
    }
    else{
      foot_y = foot_y - (abs(mouseX-x))*foot_easing;
    }
  }
  popMatrix();


  //////Page 1
  if(page==1){
    if(mouseX < 100)
    {
      x = x + (100-x)*easing;
    }
    else if(mouseX > 200)
    {
      x = x + (200-x)*easing;
    }
    else{
      x = x + (mouseX-x)*easing;
    }

    shape(talk,x+60,130);
    fill(0);
    String s ="Would you like to see a trick?";
    text(s,x+85, 180, 180, 160);
    shape(one,-145,-60);
    fill(0);
    text("Yes!!", 540,200);
    text("No...",550,327);
    if((mouseX>490) && (mouseX<590) && (mouseY>150) && (mouseY<240))
    {
      fill(255);
      text("Yes!!", 540,200); 
    }
     if((mouseX>490) && (mouseX<590) && (mouseY>280) && (mouseY<360)) 
    {
      fill(255);
      text("No...",550,327);
    }
    
  }

  else if(page==2){
    if(mouseX < 100)
    {
      x = x + (100-x)*easing;
    }
    else if(mouseX > 400)
    {
      x = x + (400-x)*easing;
    }
    else{
      x = x + (mouseX-x)*easing;
    }
    fill(255);
    shape(talk,x+60,130);

    text("restart",535,405);
    fill(0);
    String a="awwww....";
    text(a,x+85, 180, 180, 160);
    dropY = dropY + 1;
    shape(rain,x+17,350 + dropY);
    shape(rain, x+ 13, 375 + dropY);
    if((mouseX>460) && (mouseX<615) && (mouseY>340) && (mouseY<460))
    {
      fill(0);
      text("restart",535,405); 
    }
  }

  else if(page==3){
    fill(255);
    if(mouseX < 100)
    {
      x = x + (100-x)*easing;
    }
    else if(mouseX > 400)
    {
      x = x + (400-x)*easing;
    }
    else{
      x = x + (mouseX-x)*easing;
    }
    shape(tricks,-150,-80);
    shape(thought,x+65,170);
    
      if((mouseX>70) && (mouseX<190) && (mouseY>75) && (mouseY<155))
    {
      shape(tricks1,-150,-80);  
    }
    if((mouseX>260) && (mouseX<380) && (mouseY>75) && (mouseY<155)) 
    {
      shape(tricks2,-150,-80);
    }
    if((mouseX>470) && (mouseX<570) && (mouseY>75) && (mouseY<155)) 
    {
       shape(tricks3,-150,-80);
    }
    

  }
  ////umbrella animation
  else if(page==4){


    fill(0);

    if(mouseX < 100)
    {
      x = x + (100-x)*easing;
    }
    else if(mouseX > 400)
    {
      x = x + (400-x)*easing;
    }
    else{
      x = x + (mouseX-x)*easing;
    }

    if((millis()>startTime+100)&&(millis() <startTime +3000)){
      tricksY=tricksY-1;
    }
    if((millis()>startTime+20000)&&(millis() <startTime + 22900)){
      tricksY=tricksY+1;
    }
    shape(tricks,-150,-80+tricksY);

    /////////umbrellla////////
    if((millis()>startTime + 9500) && (millis() <=startTime + 12000))
    {
      umbY = umbY -.65;
      shape(u13,x-30,umbY);
    }
    if((millis() >startTime + 12000) && (millis() <= startTime + 12100))
    {
      shape(u13,x-30,umbY);
    }
    if((millis() >startTime + 12100) && (millis() <= startTime + 12200))
    {
      shape(u12,x-30,umbY);
    }
    if((millis() >startTime + 12200) && (millis() <= startTime + 12300))
    {
      shape(u11,x-30,umbY);
    }
    if((millis() >startTime + 12300) && (millis() <= startTime + 12400))
    {
      shape(u10,x-31,umbY);
    }
    if((millis() >startTime + 12400) && (millis() <= startTime + 12500))
    {
      shape(u9,x-31,umbY);
    }
    if((millis() >startTime + 12500) && (millis() <= startTime + 12600))
    {
      shape(u8,x-31,umbY);
    }
    if((millis() >startTime + 12600) && (millis() <= startTime + 12700))
    {
      shape(u7,x-31,umbY);
    }
    if((millis() >startTime + 12700) && (millis() <= startTime + 12800))
    {
      shape(u6,x-32,umbY);
    }
    if((millis() >startTime + 12800) && (millis() <= startTime + 12900))
    {
      shape(u5,x-35,umbY);
    }
    if((millis() >startTime + 12900) && (millis() <= startTime + 13000))
    {
      shape(u4,x-39,umbY);
    }
    if((millis() >startTime + 13000) && (millis() <= startTime + 13100))
    {
      shape(u3,x-48,umbY);
    }
    if((millis() >startTime + 13100) && (millis() <= startTime + 13200))
    {
      shape(u2,x-54,umbY);
    }
    if((millis() >startTime + 13200) &&(millis()<= startTime + 18000))
    {
      shape(u1,x-60,umbY);
    }
    /////////umbrellla close////////
    if((millis()>startTime + 19300) && (millis() <=startTime + 20000))
    {
      umbY = umbY +.65;
      shape(u13,x-30,umbY);
    }
    if((millis() >startTime + 19200) && (millis() <= startTime + 19300))
    {
      shape(u13,x-30,umbY);
    }
    if((millis() >startTime + 19100) && (millis() <= startTime + 19200))
    {
      shape(u12,x-30,umbY);
    }
    if((millis() >startTime + 19000) && (millis() <= startTime + 19100))
    {
      shape(u11,x-30,umbY);
    }
    if((millis() >startTime + 18900) && (millis() <= startTime + 19000))
    {
      shape(u10,x-31,umbY);
    }
    if((millis() >startTime + 18800) && (millis() <= startTime + 18900))
    {
      shape(u9,x-31,umbY);
    }
    if((millis() >startTime + 18700) && (millis() <= startTime + 18800))
    {
      shape(u8,x-31,umbY);
    }
    if((millis() >startTime + 18600) && (millis() <= startTime + 18700))
    {
      shape(u7,x-31,umbY);
    }
    if((millis() >startTime + 18500) && (millis() <= startTime + 18600))
    {
      shape(u6,x-32,umbY);
    }
    if((millis() >startTime + 18400) && (millis() <= startTime + 18500))
    {
      shape(u5,x-35,umbY);
    }
    if((millis() >startTime + 18300) && (millis() <= startTime + 18400))
    {
      shape(u4,x-39,umbY);
    }
    if((millis() >startTime + 18200) && (millis() <= startTime + 18300))
    {
      shape(u3,x-48,umbY);
    }
    if((millis() >startTime + 18100) && (millis() <= startTime + 18200))
    {
      shape(u2,x-54,umbY);
    }
    if((millis() >startTime + 18000)&& (millis() <= startTime + 18100))
    {
      shape(u1,x-60,umbY);
    }
    if(millis() > startTime + 9000){
      image(brkn,x-77,240);
      shape(m,x-25,382);
      shape(Le,x-37,300);
      shape(Re,x-9,298); 
      shape(Lp,x-26,322);
      shape(Rp,x-3,320);
    }
    if(millis()> startTime+23000){
      shape(tricks,-150,-80);
    if((mouseX>70) && (mouseX<190) && (mouseY>75) && (mouseY<155))
    {
      shape(tricks1,-150,-80);  
    }
    if((mouseX>260) && (mouseX<380) && (mouseY>75) && (mouseY<155)) 
    {
      shape(tricks2,-150,-80);
    }
    if((mouseX>470) && (mouseX<570) && (mouseY>75) && (mouseY<155)) 
    {
       shape(tricks3,-150,-80);
    }
    
    }


    /////////////rain//////////////
    pushMatrix();
    if((millis() > startTime + 5000)&&(millis() <startTime +17000))
    {
      dropY=dropY1+1;
      if(dropY > 480)
      {
        dropX = random(20,620);
        dropY1=-20;
      }
      shape(rain,dropX,dropY);

      dropY2=dropY2+1.25;
      if(dropY2==480)
      {
        dropX2=random(240,620);
        dropY2 = -100;
      }
      shape(rain,dropX2,dropY2);

      dropY3=dropY3+1.5;
      if(dropY3 > 480)
      {
        dropX3 = random(20,620);
        dropY3=-20;
      }
      shape(rain,dropX3,dropY3);

      dropY4=dropY4+1.5;
      if(dropY4 > 480)
      {
        dropX4 = random(20,620);
        dropY4=-20;
      }
      shape(rain,dropX4,dropY4);

      dropY5=dropY5+1.75;
      if(dropY5 > 480)
      {
        dropX5 = random(20,620);
        dropY5=-20;
      }
      shape(rain,dropX5,dropY5);

      dropY6=dropY6+2;
      if(dropY6 > 480)
      {
        dropX6 = random(20,620);
        dropY6=-20;
      }
      shape(rain,dropX6,dropY6);

      dropY7=dropY7+2.25;
      if(dropY7 > 480)
      {
        dropX7 = random(20,620);
        dropY7=-20;
      }
      shape(rain,dropX7,dropY7);

      dropY8=dropY8+2.5;
      if(dropY8 > 480)
      {
        dropX8 = random(20,620);
        dropY8=-20;
      }
      shape(rain,dropX8,dropY8);

      dropY9=dropY9+2.75;
      if(dropY9 > 480)
      {
        dropX9 = random(20,620);
        dropY9=-20;
      }
      shape(rain,dropX9,dropY9);

      dropY10=dropY10+3;
      if(dropY10 > 480)
      {
        dropX10 = random(20,620);
        dropY10=-20;
      }
      shape(rain,dropX10,dropY10);

      dropY11=dropY11+3.35;
      if(dropY11 > 480)
      {
        dropX11 = random(20,620);
        dropY11=-20;
      }
      shape(rain,dropX11,dropY11);

      dropY12=dropY12+3.5;
      if(dropY12 > 320)
      {
        dropX12 = random(20,620);
        dropY12=-20;
      }
      shape(rain,dropX12,dropY12);

      dropY13=dropY13+3.75;
      if(dropY13 > 480)
      {
        dropX13 = random(20,620);
        dropY13=-20;
      }
      shape(rain,dropX13,dropY13);

      dropY14=dropY14+4;
      if(dropY14 > 480)
      {
        dropX14 = random(20,620);
        dropY14=-20;
      }
      shape(rain,dropX14,dropY14);

      dropY15=dropY15+4.25;
      if(dropY15 > 480)
      {
        dropX15 = random(20,620);
        dropY15=-20;
      }
      shape(rain,dropX15,dropY15);
    }
    popMatrix();

    if((millis()> startTime + 550) && (millis()< startTime + 25100)){
      if(cloudX < 0)
      {
        cloudX = cloudX+ 1;  
        cloudX2 = cloudX2-1;
      }
      shape(lc,cloudX-90,-30);
      shape(rc,cloudX2+200,-30);
    }
    if(millis() > startTime + 18000){
      cloudX=cloudX-2;
      cloudX2=cloudX2+2;
    }


    if((millis() > startTime+9000)&&(millis()< startTime + 9900)){
      shellX=shellX+1;
    }
    if((millis() > startTime + 19500)&&(millis()< startTime+20400)){
      shellX=shellX-1;
    }





   
  }
  ////////////////////////////////MOON//////////////////////////////////
  else if(page==5){
    fill(0);


    if((millis() > startTime + 100)&&(millis() < startTime + 4000)){
      tricksX=tricksX+3;
    }
    if((millis() > startTime + 14000)&&(millis() < startTime + 17900)){
      tricksX=tricksX-3;
    }
    shape(tricks,-150 + tricksX,-80);
    
    if(millis()> startTime+17900){
    if((mouseX>70) && (mouseX<190) && (mouseY>75) && (mouseY<155))
    {
      shape(tricks1,-150,-80);  
    }
    if((mouseX>260) && (mouseX<380) && (mouseY>75) && (mouseY<155)) 
    {
      shape(tricks2,-150,-80);
    }
    if((mouseX>470) && (mouseX<570) && (mouseY>75) && (mouseY<155)) 
    {
       shape(tricks3,-150,-80);
    }
    }

    if((millis()>startTime + 750)&&(millis()<startTime+9000)){
      shape(suit,x-113+ omarX,170+ omarY);
    }
    if((millis()>startTime + 9000)&&(millis()<startTime+15500)){
      shape(njet,x-113+ omarX,170+ omarY);
    }


    if((millis()> startTime + 750) && (millis()< startTime + 1200)){

      shape(d1,x-160,100);
    }
    if((millis()> startTime + 250) && (millis() < startTime + 1200)){

      shape(d2,x-150,140);
    }
    if((millis()> startTime + 500)&& (millis() < startTime + 1200)){
      shape(d3,x-120,120);
    } 
    /////ground shake
    if((millis()>startTime+1500)&&(millis()<startTime + 1700)){
      backX=backX+3;
    }
    if((millis()>startTime+1700)&&(millis()<startTime+2100)){
      backX=backX-3;
    }
    if((millis()>startTime+2100)&&(millis()<startTime + 2300)){
      backX=backX+3;
    }
    //////take off
    if((millis()>startTime+2000)&&(millis()<startTime+3300)){
      omarY=omarY-2;
      omarX=omarX+1;
    }
    ///////////////flying//////////////////
    if((millis()>startTime+3250)&&(millis()<startTime+6300)){
      backY=backY+4;
      backX=backX-.5;
    }
    if((millis()>startTime+3000)&&(millis()<startTime+3750)){
      omarX=omarX+2;
    }
    if((millis()>startTime+3750)&&(millis()<startTime+4500)){
      omarX=omarX-2;
    }
    if((millis()>startTime+4500)&&(millis()<startTime+5250)){
      omarX=omarX+2;
    }
    if((millis()>startTime+5250)&&(millis()<startTime+6300)){
      omarX=omarX-2;
    }
    if((millis()>startTime+6300)&&(millis()<startTime+7000)){
      omarX=omarX+1;
      backY=backY+3;
    }
    if((millis()>startTime+7000)&&(millis()<startTime+7750)){
      omarX=omarX-1;
      backY=backY+2;
    }

    if((millis()>startTime+7750)&&(millis()<startTime+9000)){
      omarX=omarX+1;
      backY=backY+1.5;
    }
    if((millis()>startTime+9000)&&(millis()<startTime+9200)){
      omarX=omarX-1;
      backY=backY +.25;
    }
    if((millis()>startTime+9100)&&(millis()<startTime+10000)){
      omarY=omarY+1;
    }
    if((millis()>startTime+9900)&&(millis()<startTime+12000)){

      backY=backY-2;
    }
    if((millis()>startTime+12000)&&(millis()<startTime+15600)){

      backY=backY-4;
    }
    if((millis()>startTime+12000)&&(millis()<startTime+15500)){

      backX=backX+.5;

    }
    if(millis()>startTime+15700){
      omarX=0;
      omarY=0;
      backX=0;
      backY=0;
    }

    
  }
  else if(page==6){
    
    
    image(moon,0 + backX,-1120 + backY); 
    
    
    if(mouseX < 100)
    {
      x = x + (100-x)*easing;
    }
    else if(mouseX > 400)
    {
      x = x + (400-x)*easing;
    }
    else{
      x = x + (mouseX-x)*easing;
    }
   
    
    fill(145,39,143); 
  stroke(202,136,58);
  strokeWeight(10);
  line(x-40 + omarX,328 + omarY,x-74+ omarX,350+ omarY);
  line(x-74+ omarX,350+ omarY,x-95+ omarX,324+ omarY); 
  strokeWeight(10);
  line(x+70+ omarX,328+ omarY,x+110+ omarX,348+ omarY);
  line(x+108+ omarX,348+ omarY,x+132+ omarX,350+ omarY);
    fill(0);
    
    shape(tricks,-150,-80);
    shape(b,x-70,250);
    shape(h,x-55,203);
    shape(lf,x-67,440);
    shape(rf,x-1,440);
    shape(Le,x-47,300+ omarY);
    shape(Re,x-19,298+ omarY); 
    shape(Lp,x-36,322+ omarY);
    shape(Rp,x-13,320+ omarY); 
    shape(Ll,x-50,298);
    shape(Rl,x-16,295); 
    shape(m,x-35,382);
    if(millis()> startTime+1000){
    if((mouseX>70) && (mouseX<190) && (mouseY>75) && (mouseY<155))
    {
      shape(tricks1,-150,-80);  
    }
    if((mouseX>260) && (mouseX<380) && (mouseY>75) && (mouseY<155)) 
    {
      shape(tricks2,-150,-80);
    }
    if((mouseX>470) && (mouseX<570) && (mouseY>75) && (mouseY<155)) 
    {
       shape(tricks3,-150,-80);
    }
    }
    
    if((millis()> startTime ) && (millis()< startTime + 750)){

      shape(d1,x-160,100);
      shape(d2,x-150,140);
      shape(d3,x-120,120);
    }
    

    
  }
  else if(page==7){
    if(mouseX < 100)
    {
      x = x + (100-x)*easing;
    }
    else if(mouseX > 200)
    {
      x = x + (200-x)*easing;
    }
    else{
      x = x + (mouseX-x)*easing;
    }

    shape(talk,x+60,130);
    shape(one,-145,-60);
    fill(0);
    String k=("Did you like my tricks?");
    text(k,x+85, 180, 180, 160);
    text("Yes!!", 540,200);
    text("No...",550,327);
    if((mouseX>490) && (mouseX<590) && (mouseY>150) && (mouseY<240))
    {
      fill(255);
      text("Yes!!", 540,200); 
    }
     if((mouseX>490) && (mouseX<590) && (mouseY>280) && (mouseY<360)) 
    {
      fill(255);
      text("No...",550,327);
    }
  }
  else if(page==8){
    fill(255);
    text("restart",535,405);
    if(mouseX < 100)
    {
      x = x + (100-x)*easing;
    }
    else if(mouseX > 600)
    {
      x = x + (600-x)*easing;
    }
    else{
      x = x + (mouseX-x)*easing;
    }
    if((mouseX>460) && (mouseX<615) && (mouseY>340) && (mouseY<460))
    {
      fill(0);
      text("restart",535,405); 
    }
    
    shape(con1,conX,-700+conY);
    shape(con2,conX,-900+conY2);
    shape(con3,conX,-1000+conY3);
  }
  if(millis()>startTime){
    conY=conY+3;
    conY2=conY2+2;
    conY3=conY3+3;
    }
    if(conY>1600){
      conY=-500;
    }
}
     









void mousePressed(){
  ///page 1
  if (page == 1) {
    if((mouseX>490) && (mouseX<590) && (mouseY>150) && (mouseY<240))
    {
      page=3;  
    }
    if((mouseX>490) && (mouseX<590) && (mouseY>280) && (mouseY<360)) 
    {
      page=2;
    }
    startTime=millis();
  } 
  else if (page==2) {
    if((mouseX>460) && (mouseX<615) && (mouseY>340) && (mouseY<460))
    {
      trickTime=0;
      page=1;  
    }
    startTime=millis();



  }
  else if (page == 3) {

    ///page 3
    ////umbrella
    if((mouseX>70) && (mouseX<190) && (mouseY>75) && (mouseY<155))
    {
      page=4;  
    }
    ///to the moon
    if((mouseX>260) && (mouseX<380) && (mouseY>75) && (mouseY<155)) 
    {
      page=5;
    }
    //// morph to eggplant
    if((mouseX>470) && (mouseX<570) && (mouseY>75) && (mouseY<155)) 
    {
      page=6;
    }
    startTime=millis();
  }
  else if(page==4){
    startTime=millis();
    trickTime = trickTime + 1;
    if((mouseX>70) && (mouseX<190) && (mouseY>75) && (mouseY<155))
    {
      page=4;  
    }
    ///to the moon
    if((mouseX>260) && (mouseX<380) && (mouseY>75) && (mouseY<155)) 
    {
      page=5;
    }
    //// morph to eggplant
    if((mouseX>470) && (mouseX<570) && (mouseY>75) && (mouseY<155)) 
    {
      page=6;
    }

  }
  else if(page==5){
    trickTime = trickTime + 1;
    if((mouseX>70) && (mouseX<190) && (mouseY>75) && (mouseY<155))
    {
      page=4;  
    }
    ///to the moon
    if((mouseX>260) && (mouseX<380) && (mouseY>75) && (mouseY<155)) 
    {
      page=5;
    }
    //// morph to eggplant
    if((mouseX>470) && (mouseX<570) && (mouseY>75) && (mouseY<155)) 
    {
      page=6;
    }
    startTime=millis();
  }
  else if(page==6){
    trickTime = trickTime + 1;
    if((mouseX>70) && (mouseX<190) && (mouseY>75) && (mouseY<155))
    {
      page=4;  
    }
    ///to the moon
    if((mouseX>260) && (mouseX<380) && (mouseY>75) && (mouseY<155)) 
    {
      page=5;
    }
    //// morph to eggplant
    if((mouseX>470) && (mouseX<570) && (mouseY>75) && (mouseY<155)) 
    {
      page=6;
    }
    startTime=millis();
  }
  if(trickTime==3){
    page=7;
  }

  if(page==7){
    trickTime=0;
    if((mouseX>490) && (mouseX<590) && (mouseY>150) && (mouseY<240))
    {
      page=8;  
    }
    
    if((mouseX>490) && (mouseX<590) && (mouseY>280) && (mouseY<360)) 
    {

      page=2;
    }
    startTime=millis();
  }
  if(page==8){
    startTime=millis();
    trickTime=0;
    
    if((mouseX>460) && (mouseX<615) && (mouseY>340) && (mouseY<460))
    {
      
    
      page=1;  
    }
  }

}






