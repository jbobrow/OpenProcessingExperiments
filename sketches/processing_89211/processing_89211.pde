
/* @pjs font="Futura-Medium-16.vlw"; */
/* @pjs start="Raleway-Bold.ttf"; */

ArrayList fires;
ArrayList bigfires;
ArrayList leftflyers;
ArrayList rightflyers;
ArrayList leftbigflyers;
ArrayList rightbigflyers;
ArrayList sparks;
PFont font;
PFont start;

int bigfirealive; //0 = no BigFire alive
int bigfireage;
boolean bg; //false = no background, true = background
int browage; //eyebrow age
int browmove;
int level;
int levelopac; //opacity of "level start" text
int levelage;
int enemy = 0;
int past = 0;
int highscore = 0;

//LEFT EYE
int lixpos = 400; //left eye (white,iris,pupil) x position
int liypos = 200; //left eye y position
float lix = 50; //left eye (white) width
float liy = 50; //left eye (white) height
float lixdif = 0.2; //left eye (white) x difference variable
float liydif = 0.2; //left eye (white) y difference variable
float lixpup = 15; //left eye (iris,pupil) width
float liypup = 15; //left eye (iris,pupil) height
float lixpupdif = 0.1; //left eye (iris,pupil) x difference variable
float liypupdif = 0.1; //left eye (iris,pupil) y difference variable

//RIGHT EYE
int rixpos = 600; //right eye (white,iris,pupil) x position
int riypos = 200; //right eye y position
float rix = 150; //right eye (white) width
float riy = 150; //right eye (white) height
float rixdif = 0.1; //right eye (white) x difference variable
float riydif = 0.1; //right eye (white) y difference variable
float rixpup = 40; //right eye (iris,pupil) width
float riypup = 40; //right eye (iris,pupil) height
float rixpupdif = 0.2; //right eye (iris,pupil) x difference variable
float riypupdif = 0.2; //right eye (iris,pupil) y difference variable

//JAW
float topjawy = 280;
float topjawydif = .1;
float botjawy = 350;
float botjawydif = .1;
float chin = 370;

//ANGRY EYEBROWS
int bro1x1 = 0;
int bro1y1 = 0;
int bro1x2 = 0;
int bro1y2 = 0;
int bro2x1 = 0;
int bro2y1 = 0;
int bro2x2 = 0;
int bro2y2 = 0;

//NECK
int neckx = 550;
float necky;

//BODY
float bodyypos;

//RIGHT ARM
//Upper right arm
float urax1;
float uray1;
float urax2;
float uray2;
float urax3;
float uray3;
float urax4;
float uray4;

//Upper right arm
float lrax1;
float lray1;
float lrax2;
float lray2;
float lrax3;
float lray3;

//Right hand
float rhx;
float rhy;

//LEFT ARM
//Upper left arm
float ulax1;
float ulay1;
float ulax2;
float ulay2;
float ulax3;
float ulay3;
float ulax4;
float ulay4;

//Upper left arm
float llax1;
float llay1;
float llax2;
float llay2;
float llax3;
float llay3;

//Left hand
float lhx;
float lhy;


void setup() {
  size(960,551);
  smooth();
  strokeWeight(2);
  fires = new ArrayList();
  bigfires = new ArrayList();
  leftflyers = new ArrayList();
  rightflyers= new ArrayList();
  leftbigflyers = new ArrayList();
  rightbigflyers = new ArrayList();
  sparks = new ArrayList();
  bg = true;
  font = createFont("Futura-Medium-16.vlw", 16);
  start = createFont("Raleway-Bold.ttf", 40);
  browage = 0;
  browmove = 0;
  bigfireage = 400;
  level = 0;
  levelopac = 255;

}

void draw() {

  if (bg==true)
  {
    background(0);
  }



  //NECK
  necky = botjawy;
  strokeWeight(4);
  stroke(115,0,255);
  fill(153,0,153);
  ellipse(neckx,necky+20,30,30);

  //BODY
  strokeWeight(4);
  stroke(115,0,255);
  fill(153,0,153);
  ellipse(neckx,necky+180,150,300);

  //RIGHT ARM
  //Upper Right
  urax1 = neckx+34;
  uray1 = necky+44;
  urax2 = neckx+180;
  uray2 = necky+100;
  urax3 = neckx+200;
  uray3 = necky+125;
  urax4 = neckx+48;
  uray4 = necky+60;
  quad(urax1, uray1, urax2, uray2, urax3, uray3, urax4, uray4);

  //Lower Right
  lrax1 = neckx+275;
  lray1 = necky+44;
  lrax2 = urax3+5;
  lray2 = uray3;
  lrax3 = urax2+5;
  lray3 = uray2;
  triangle(lrax1, lray1, lrax2, lray2, lrax3, lray3);

  //Right Hand
  rhx=lrax1+4;
  rhy=lray1-10;
  ellipse(rhx,rhy,20,20);

  //Right Fingers
  //quad(rhx-12,rhy-3, rhx

  //LEFT ARM
  //Upper Left
  ulax1 = neckx-34;
  ulay1 = necky+44;
  ulax2 = neckx-180;
  ulay2 = necky+100;
  ulax3 = neckx-200;
  ulay3 = necky+125;
  ulax4 = neckx-48;
  ulay4 = necky+60;
  quad(ulax1, ulay1, ulax2, ulay2, ulax3, ulay3, ulax4, ulay4);

  //Lower Left
  llax1 = neckx-275;
  llay1 = necky+44;
  llax2 = ulax3-5;
  llay2 = ulay3;
  llax3 = ulax2-5;
  llay3 = ulay2;
  triangle(llax1, llay1, llax2, llay2, llax3, llay3);

  //Left Hand
  lhx=llax1-4;
  lhy=llay1-10;
  ellipse(lhx,lhy,20,20);
  


  //HEAD
  strokeWeight(4);
  stroke(115,0,255);
  fill(153,0,153);
  quad(lixpos-lix,liypos-liy,rixpos+rix-25,riypos-riy+25,690,topjawy,360,topjawy);
  quad(370,botjawy,690,botjawy,650,botjawy+20,410,botjawy+20);

  //TEETH
  //top teeth
  strokeWeight(2);
  stroke(0);
  fill(255);
  triangle(360,topjawy,380,topjawy,370,topjawy+30);
  triangle(380,topjawy,400,topjawy,390,topjawy+30);
  triangle(400,topjawy,420,topjawy,410,topjawy+30);
  triangle(420,topjawy,440,topjawy,430,topjawy+30);
  triangle(440,topjawy,460,topjawy,450,topjawy+30);
  triangle(460,topjawy,480,topjawy,470,topjawy+30);
  triangle(480,topjawy,500,topjawy,490,topjawy+30);
  triangle(500,topjawy,520,topjawy,510,topjawy+30);
  triangle(520,topjawy,540,topjawy,530,topjawy+30);
  triangle(540,topjawy,560,topjawy,550,topjawy+30);
  triangle(560,topjawy,580,topjawy,570,topjawy+30);
  triangle(580,topjawy,600,topjawy,590,topjawy+30);
  triangle(600,topjawy,620,topjawy,610,topjawy+30);
  triangle(620,topjawy,640,topjawy,630,topjawy+30);
  triangle(640,topjawy,660,topjawy,650,topjawy+30);
  triangle(660,topjawy,690,topjawy,675,topjawy+30);
  
  topjawy = topjawy - topjawydif;
  if (topjawy>295) {
    topjawydif=-topjawydif;
  }
  if (topjawy<280) {
    topjawydif=-topjawydif;
  }
  
  if (bigfirealive==1) {
    topjawy = random(293,295);
  }
 

  

  //bottom teeth
  triangle(370,botjawy,390,botjawy,380,botjawy-30);
  triangle(390,botjawy,410,botjawy,400,botjawy-30);
  triangle(410,botjawy,430,botjawy,420,botjawy-30);
  triangle(430,botjawy,450,botjawy,440,botjawy-30);
  triangle(450,botjawy,470,botjawy,460,botjawy-30);
  triangle(470,botjawy,490,botjawy,480,botjawy-30);
  triangle(490,botjawy,510,botjawy,500,botjawy-30);
  triangle(510,botjawy,530,botjawy,520,botjawy-30);
  triangle(530,botjawy,550,botjawy,540,botjawy-30);
  triangle(550,botjawy,570,botjawy,560,botjawy-30);
  triangle(570,botjawy,590,botjawy,580,botjawy-30);
  triangle(590,botjawy,610,botjawy,600,botjawy-30);
  triangle(610,botjawy,630,botjawy,620,botjawy-30);
  triangle(630,botjawy,650,botjawy,640,botjawy-30);
  triangle(650,botjawy,670,botjawy,660,botjawy-30);
  triangle(670,botjawy,690,botjawy,685,botjawy-30);


  botjawy = botjawy + botjawydif;
  if (botjawy>350) {
    botjawydif=-botjawydif;
  }
  if (botjawy<335) {
    botjawydif=-botjawydif;
  }
  
  if (bigfirealive==1) {
    botjawy = random(335,337);
  }

  //LEFT EYE
  //left white of eye
  stroke(0);
    if (bigfirealive==1) {
    fill(0,random(0,150),random(150,255));
  } else {
  fill(255);
  }
  ellipse(lixpos,liypos,lix,liy);
  lix = lix + lixdif;
  liy = liy + liydif;
  if (lix>55) {
    lixdif=-lixdif;
  }
  if (lix<45) {
    lixdif=-lixdif;
  }
  if (liy>55) {
    liydif=-liydif;
  }
  if (liy<45) {
    liydif=-liydif;
  }

  //left iris
  if (bigfirealive==1) {
    fill(random(255),random(0,150),random(150,255));
  } else {
  fill(255,0,0);
  }
  ellipse(lixpos,liypos,lixpup,liypup);
  lixpup = lixpup + lixpupdif;
  liypup = liypup + liypupdif;
  if (lixpup>20) {
    lixpupdif=-lixpupdif;
  }
  if (lixpup<10) {
    lixpupdif=-lixpupdif;
  }
  if (liypup>20) {
    liypupdif=-liypupdif;
  }
  if (liypup<10) {
    liypupdif=-liypupdif;
  }

  //left pupil
  fill(0);
  ellipse(lixpos,liypos,lixpup-9,liypup-9);

  //RIGHT EYE
  //right white of eye
    if (bigfirealive==1) {
    fill(0,random(0,150),random(150,255));
  } else {
  fill(255);
  }
  ellipse(rixpos,riypos,rix,riy);
  rix = rix + rixdif;
  riy = riy + riydif;
  if (rix>155) {
    rixdif=-rixdif;
  }
  if (rix<145) {
    rixdif=-rixdif;
  }
  if (riy>155) {
    riydif=-riydif;
  }
  if (riy<145) {
    riydif=-riydif;
  }

  //right iris
  if (bigfirealive==1) {
    fill(random(255),random(0,150),random(150,255));
  } else {
  fill(255,0,0);
  }
  ellipse(rixpos,riypos,rixpup,riypup);
  rixpup = rixpup + rixpupdif;
  riypup = riypup + riypupdif;
  if (rixpup>45) {
    rixpupdif=-rixpupdif;
  }
  if (rixpup<35) {
    rixpupdif=-rixpupdif;
  }
  if (riypup>45) {
    riypupdif=-riypupdif;
  }
  if (riypup<35) {
    riypupdif=-riypupdif;
  }
  //right pupil
  fill(0);
  ellipse(rixpos,riypos,rixpup-20,riypup-20);


  //ANGRY EYEBROWS

  strokeWeight(30-(browage/4));
  stroke(0,255-((browage/80)*255));
  line(bro1x1+browage/5, bro1y1+(browage/5), bro1x2, bro1y2-(browage/5));
  strokeWeight(60-(browage/2));
  line(bro2x1, bro2y1, bro2x2, bro2y2-(browage/2));


  for (int i=0 ; i < fires.size() ; i++) {
    Fire thisFire = (Fire) fires.get(i);
    thisFire.display();
  }

  for (int i=0 ; i < bigfires.size() ; i++) {
    BigFire thisBigFire = (BigFire) bigfires.get(i);
    thisBigFire.display();
  }

  for (int i=0 ; i < leftflyers.size() ; i++) {
    LeftFlyer thisLeftFlyer = (LeftFlyer) leftflyers.get(i);
    thisLeftFlyer.display();
    PVector tempLeftFlyer = new PVector(thisLeftFlyer.x,thisLeftFlyer.y);
    // iterate through all fires 
    // figure out distance between fire and flyer
    for (int j=0 ; j < fires.size() ; j++) {
      Fire thisFire = (Fire) fires.get(j); //how to get temp variable out of array lists

      float d = (tempLeftFlyer).dist(thisFire.position);
      if (d < thisFire.rad+10) {
        thisLeftFlyer.shot=true;
        thisFire.alive=false;
      }
    }
    for (int j=0;j<sparks.size();j++){
      Spark thisSpark = (Spark) sparks.get(j);
      float d = (tempLeftFlyer).dist(thisSpark.position);
      if (d<thisSpark.rad+5){
        thisLeftFlyer.shot=true;
        thisSpark.alive=false;
      }
    }
  }

  for (int i=0 ; i < rightflyers.size() ; i++) {
    RightFlyer thisRightFlyer = (RightFlyer) rightflyers.get(i);
    thisRightFlyer.display();
    PVector tempRightFlyer = new PVector(thisRightFlyer.x,thisRightFlyer.y);
    for (int j=0;j<fires.size();j++){
      Fire thisFire=(Fire) fires.get(j);
      float d = (tempRightFlyer).dist(thisFire.position);
      if (d<thisFire.rad+10){
        thisRightFlyer.shot=true;
        thisFire.alive=false;
      }
    }
    if (bigfirealive==1) {
      for (int j=0;j<sparks.size();j++){
        Spark thisSpark = (Spark) sparks.get(j);
        float d = (tempRightFlyer).dist(thisSpark.position);
        if (d<thisSpark.rad+5){
          thisRightFlyer.shot=true;
          thisSpark.alive=false;
        }
      }
    }
  }

  for (int i=0 ; i < leftbigflyers.size() ; i++) {
    LeftBigFlyer thisLeftBigFlyer = (LeftBigFlyer) leftbigflyers.get(i);
    thisLeftBigFlyer.display();
    PVector tempLeftBigFlyer = new PVector(thisLeftBigFlyer.x,thisLeftBigFlyer.y);
    for (int j=0;j<fires.size();j++){
      Fire thisFire=(Fire) fires.get(j);
      float d = (tempLeftBigFlyer).dist(thisFire.position);
      if (d<thisFire.rad+75){
        if (thisLeftBigFlyer.hitcount<15) {
          thisLeftBigFlyer.hitcount+=1;
          thisFire.alive=false;
      //    println(thisLeftBigFlyer.hitcount);
        }
      }
    }       

    for (int j=0;j<sparks.size();j++){
      Spark thisSpark = (Spark) sparks.get(j);
      float d = (tempLeftBigFlyer).dist(thisSpark.position);
      if (d<thisSpark.rad+5){
        if (thisLeftBigFlyer.hitcount<15){
          thisLeftBigFlyer.hitcount+=1;
          thisSpark.alive=false;
        //  println(thisLeftBigFlyer.hitcount);
        }
      }
    }  
    if (thisLeftBigFlyer.hitcount>14) thisLeftBigFlyer.shot=true;
  }



  for (int i=0 ; i < rightbigflyers.size() ; i++) {
    RightBigFlyer thisRightBigFlyer = (RightBigFlyer) rightbigflyers.get(i);
    thisRightBigFlyer.display();
    PVector tempRightBigFlyer = new PVector(thisRightBigFlyer.x,thisRightBigFlyer.y);
    for (int j=0;j<fires.size();j++){
      Fire thisFire=(Fire) fires.get(j);
      float d = (tempRightBigFlyer).dist(thisFire.position);
      if (d<thisFire.rad+75){
        thisRightBigFlyer.hitcount+=1;
        thisFire.alive=false;
       // println(thisRightBigFlyer.hitcount);
      }
    }         


    for (int j=0;j<sparks.size();j++){
      Spark thisSpark = (Spark) sparks.get(j);
      float d = (tempRightBigFlyer).dist(thisSpark.position);
      if (d<thisSpark.rad+5){
        if (thisRightBigFlyer.hitcount<15) {
          thisRightBigFlyer.hitcount+=1;
          thisSpark.alive=false;
         // println(thisRightBigFlyer.hitcount);
        }
      }
    }  
    if (thisRightBigFlyer.hitcount>14) thisRightBigFlyer.shot=true;
  }




  for (int i=0; i < fires.size() ; i++) {
    Fire thisFire = (Fire) fires.get(i);
    if (thisFire.alive == false) {
      fires.remove(i);
    }
  }

  if (bigfirealive==0){
    bigfireage++;
    for (int i=0; i < sparks.size() ; i++) {
      Spark thisSpark = (Spark) sparks.get(i);
      sparks.remove(i);
    }
  }

  if (bigfireage==2) bg=true;

  if (bigfirealive==1) {
    bigfireage=1;
    
  }

  for (int i=0; i < leftflyers.size() ; i++) {
    LeftFlyer thisLeftFlyer = (LeftFlyer) leftflyers.get(i);
    if (thisLeftFlyer.alive == false) {
      leftflyers.remove(i);
      enemy++;
    }
    if (thisLeftFlyer.win == true) {
      leftflyers.remove(i);
      past++;
    //  println("He made it past you!");
    }
  }

  for (int i=0; i < rightflyers.size() ; i++) {
    RightFlyer thisRightFlyer = (RightFlyer) rightflyers.get(i);
    if (thisRightFlyer.alive == false) {
      rightflyers.remove(i);
      enemy++;
    }
    if (thisRightFlyer.win == true) {
      rightflyers.remove(i);
      past++;
     // println("He made it past you!");
    }
  }

  for (int i=0; i < leftbigflyers.size() ; i++) {
    LeftBigFlyer thisLeftBigFlyer = (LeftBigFlyer) leftbigflyers.get(i);
    if (thisLeftBigFlyer.alive == false) {
      leftbigflyers.remove(i);
      enemy++;
    }
    if (thisLeftBigFlyer.win == true) {
      leftbigflyers.remove(i);
      past++;
     // println("He made it past you!");
    }
  }

  for (int i=0; i < rightbigflyers.size() ; i++) {
    RightBigFlyer thisRightBigFlyer = (RightBigFlyer) rightbigflyers.get(i);
    if (thisRightBigFlyer.alive == false) {
      rightbigflyers.remove(i);
      enemy++;
    }
    if (thisRightBigFlyer.win == true) {
      rightbigflyers.remove(i);
      past++;
     // println("He made it past you!");
    }
  }

  for (int i=0; i < bigfires.size() ; i++) {
    BigFire thisBigFire = (BigFire) bigfires.get(i);
    if (thisBigFire.alive == false) {
      bigfires.remove(i);
    }
    if (thisBigFire.done == true) {
      bigfirealive=0;
      topjawy = 280;
      botjawy = 350;
    }
  }
  

  if (browmove==1) {
    browage++;
  }

  if (browage==100) {
    browmove=0;
  }

  if (bigfireage>400) {
    bigfireage=400;
  }





levelage++;

if (level==0) {
  
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(150,250),random(150,250),random(150,250));
  text("To start, press the spacebar.", width/2, height-60);
  textFont(font);
  textAlign(LEFT);
  fill(random(155,255),random(0,105),random(0,105));
  text("To shoot a fireball, click your mouse.", 40,40);
  fill(random(0,105), random(0,105),random(155,255));
  text("To use your special, press Z.", 40, 75);
  fill(random(0,105),random(155,255),random(0,105));
  text("Objective: SHOOT DOWN THOSE DANG FLYERS!", 40, 110);
  
  
  textAlign(LEFT);
  textFont(font);
 /* text("Shoot Fireball = Mouse Click", 15,15);
  text("Shoot Super Fireball = Num Pad 7", 15,30);
  text("Create Left Flyer = Num Pad 8", 15,45);
  text("Create Right Flyer = Num Pad 9", 15,60);
  text("Create Left Big Flyer = Num Pad 5", 15,75);
  text("Create Right Big Flyer = Num Pad 6", 15,90);
  text("Background Toggle = Num Pad 4", 15,105);*/
}

  rectMode(CORNER);
  fill(180,240,240);
  strokeWeight(2);
  stroke(255,255);
  rect(width-55, 40, 20, 201);
  stroke(random(0,255),random(0,250),random(200,255));
  fill(0,random(0,150),random(150,255),255);
  rect(width-55, 40, 20, 1+bigfireage/2);

  textAlign(CENTER);
  textFont(font);
  fill(255,255,0);
  text("S", width-45,57);
  text("P", width-45,72);
  text("E", width-45,87);
  text("C", width-45,102);
  text("I", width-45,117);
  text("A", width-45,132);
  text("L", width-45,147);
  
  if (enemy>highscore) highscore=enemy;
  
  textAlign(LEFT);
  if (level>0) {
    if (level<10) {
      fill(50,255,50);
      text("Enemies Shot Down: "+enemy, 40, 60);
      fill(255,50,50);
      text("Enemies Missed: "+past, 40, 80);
      fill(10,210,255);
      text("High Score: "+highscore, 40, 40);
    }
  }

//LEVEL ONE TEXT
if (level==1) {
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255), levelopac);
  text("Level One", width/2, height-40);
  if (levelage>10) levelopac--;
  //println(levelopac);
}

//LEVEL ONE BAD GUYS
if (level==1) {
  if (levelage<10) {
    enemy = 0;
    past = 0;
  }  
  if (levelage==100) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==175) rightflyers.add(new RightFlyer(1.5));
  if (levelage==250) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==325) rightflyers.add(new RightFlyer(1.5));
  if (levelage==400) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==450) rightflyers.add(new RightFlyer(1.5));
  if (levelage==500) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==550) rightflyers.add(new RightFlyer(1.5));
  if (levelage==575) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==600) rightflyers.add(new RightFlyer(1.5));
}

//LEVEL ONE END
if (level==1){
  if (levelage>1000) {
    if (enemy>9-past) {
      level=2;
      levelage=0;
      levelopac=255;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
    }
  }
}


//LEVEL TWO TEXT
if (level==2) {
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255), levelopac);
  text("Level Two", width/2, height-40);
  if (levelage>10) levelopac--;
  //println(levelopac);
}
  
//LEVEL TWO BAD GUYS
if (level==2) {
  if (levelage==100) leftflyers.add(new LeftFlyer(level));
  if (levelage==155) rightflyers.add(new RightFlyer(level));
  if (levelage==250) leftflyers.add(new LeftFlyer(level));
  if (levelage==300) rightflyers.add(new RightFlyer(level));
  if (levelage==400) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==450) rightflyers.add(new RightFlyer(level));
  if (levelage==420) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==475) rightflyers.add(new RightFlyer(level));
  if (levelage==430) rightflyers.add(new RightFlyer(level));
  if (levelage==460) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==570) rightflyers.add(new RightFlyer(level));
  if (levelage==500) leftflyers.add(new LeftFlyer(level));
  if (levelage==550) rightflyers.add(new RightFlyer(1.5));
  if (levelage==575) leftflyers.add(new LeftFlyer(level));
  if (levelage==600) rightflyers.add(new RightFlyer(level));
}

//LEVEL TWO END
if (level==2){
  if (levelage>1000) {
    if (enemy>24-past) {
      level=3;
      levelage=0;
      levelopac=255;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
  }
 }
}

//LEVEL THREE TEXT
if (level==3) {
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255), levelopac);
  text("Level Three", width/2, height-40);
  if (levelage>10) levelopac--;
  //println(levelopac);
}
  
//LEVEL THREE BAD GUYS
if (level==3) {
  if (levelage==100) leftflyers.add(new LeftFlyer(level));
  if (levelage==155) rightflyers.add(new RightFlyer(level-1));
  if (levelage==250) leftflyers.add(new LeftFlyer(level));
  if (levelage==300) rightflyers.add(new RightFlyer(level));
  if (levelage==300) rightbigflyers.add(new RightBigFlyer(level));
  if (levelage==400) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==120) rightflyers.add(new RightFlyer(level));
  if (levelage==420) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==170) rightflyers.add(new RightFlyer(level));
  if (levelage==430) rightflyers.add(new RightFlyer(level-1));
  if (levelage==460) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==570) rightflyers.add(new RightFlyer(1.5));
  if (levelage==500) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==550) rightflyers.add(new RightFlyer(1.5));
  if (levelage==575) leftflyers.add(new LeftFlyer(level));
  if (levelage==600) rightflyers.add(new RightFlyer(level));
}

//LEVEL THREE END
if (level==3){
  if (levelage>1000) {
    if (enemy>40-past) {
      level=4;
      levelage=0;
      levelopac=255;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
  }
 }
}

//LEVEL FOUR TEXT
if (level==4) {
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255), levelopac);
  text("Level Four", width/2, height-40);
  if (levelage>10) levelopac--;
  //println(levelopac);
}
  
//LEVEL FOUR BAD GUYS
if (level==4) {
  if (levelage==100) leftflyers.add(new LeftFlyer(level));
  if (levelage==155) rightflyers.add(new RightFlyer(level-1));
  if (levelage==250) leftbigflyers.add(new LeftBigFlyer(level));
  if (levelage==650) rightflyers.add(new RightFlyer(level));
  if (levelage==300) rightbigflyers.add(new RightBigFlyer(level));
  if (levelage==400) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==120) rightflyers.add(new RightFlyer(level));
  if (levelage==420) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==170) rightflyers.add(new RightFlyer(level));
  if (levelage==430) rightflyers.add(new RightFlyer(level-1));
  if (levelage==750) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==570) rightflyers.add(new RightFlyer(1.5));
  if (levelage==500) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==600) rightflyers.add(new RightFlyer(1.5));
  if (levelage==705) leftflyers.add(new LeftFlyer(level));
  if (levelage==800) rightflyers.add(new RightFlyer(level));
}

//LEVEL FOUR END
if (level==4){
  if (levelage>1000) {
    if (enemy>56-past) {
      level=5;
      levelage=0;
      levelopac=255;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
  }
 }
}

//LEVEL FIVE TEXT
if (level==5) {
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255), levelopac);
  text("Level Five", width/2, height-40);
  if (levelage>10) levelopac--;
  //println(levelopac);
}
  
//LEVEL FIVE BAD GUYS
if (level==5) {
  if (levelage==100) leftbigflyers.add(new LeftBigFlyer(level));
  if (levelage==120) rightflyers.add(new RightFlyer(level));
  if (levelage==155) rightflyers.add(new RightFlyer(level-1));
  if (levelage==170) rightflyers.add(new RightFlyer(level));
  if (levelage==250) leftbigflyers.add(new LeftBigFlyer(4));
  if (levelage==300) rightbigflyers.add(new RightBigFlyer(4));
  if (levelage==400) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==420) leftbigflyers.add(new LeftBigFlyer(4));
  if (levelage==430) rightflyers.add(new RightFlyer(level-1));
  if (levelage==500) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==600) rightflyers.add(new RightFlyer(1.5));
  if (levelage==650) rightbigflyers.add(new RightBigFlyer(4));
  if (levelage==705) leftflyers.add(new LeftFlyer(level));
  if (levelage==750) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==750) leftflyers.add(new LeftFlyer(level));
  if (levelage==770) leftbigflyers.add(new LeftBigFlyer(4));
  if (levelage==850) leftflyers.add(new LeftFlyer(1.5));
  if (levelage==850) rightflyers.add(new RightFlyer(level));
  if (levelage==850) rightflyers.add(new RightFlyer(level));
  if (levelage==850) rightbigflyers.add(new RightBigFlyer(level));

}

//LEVEL FIVE END
if (level==5){
  if (levelage>1000) {
    if (enemy>76-past) {
      level=6;
      levelage=0;
      levelopac=255;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
  }
 }
}

//LEVEL SIX TEXT
if (level==6) {
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255), levelopac);
  text("Level Six", width/2, height-40);
  if (levelage>10) levelopac--;
  //println(levelopac);
}
  
//LEVEL SIX BAD GUYS
if (level==6) {
  if (levelage==100) leftbigflyers.add(new LeftBigFlyer(level-2));
  if (levelage==120) rightflyers.add(new RightFlyer(level));
  if (levelage==155) rightflyers.add(new RightFlyer(level-1));
  if (levelage==170) rightflyers.add(new RightFlyer(level));
  if (levelage==250) leftflyers.add(new LeftFlyer(level));
  if (levelage==300) rightbigflyers.add(new RightBigFlyer(4));
  if (levelage==400) leftflyers.add(new LeftFlyer(3));
  if (levelage==420) leftbigflyers.add(new LeftBigFlyer(4));
  if (levelage==430) rightflyers.add(new RightFlyer(level-1));
  if (levelage==500) leftflyers.add(new LeftFlyer(3));
  if (levelage==600) rightflyers.add(new RightFlyer(3));
  if (levelage==650) rightflyers.add(new RightFlyer(4));
  if (levelage==705) leftflyers.add(new LeftFlyer(level));
  if (levelage==750) leftflyers.add(new LeftFlyer(3));
  if (levelage==750) leftflyers.add(new LeftFlyer(level));
  if (levelage==770) leftbigflyers.add(new LeftBigFlyer(4));
  if (levelage==850) leftflyers.add(new LeftFlyer(3));
  if (levelage==850) rightflyers.add(new RightFlyer(level));
  if (levelage==850) rightflyers.add(new RightFlyer(level));
  if (levelage==850) rightbigflyers.add(new RightBigFlyer(level));

}

//LEVEL SIX END
if (level==6){
  if (levelage>1000) {
    if (enemy>96-past) {
      level=7;
      levelage=0;
      levelopac=255;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
  }
 }
}

//LEVEL SEVEN TEXT
if (level==7) {
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255), levelopac);
  text("Level Seven", width/2, height-40);
  if (levelage>10) levelopac--;
  //println(levelopac);
}
  
//LEVEL SEVEN BAD GUYS
if (level==7) {
  if (levelage==100) leftflyers.add(new LeftFlyer(level));
  if (levelage==120) rightflyers.add(new RightFlyer(level));
  if (levelage==155) rightflyers.add(new RightFlyer(level));
  if (levelage==170) rightflyers.add(new RightFlyer(level));
  if (levelage==250) leftflyers.add(new LeftFlyer(level));
  if (levelage==300) rightflyers.add(new RightFlyer(level));
  if (levelage==400) leftflyers.add(new LeftFlyer(level));
  if (levelage==420) leftflyers.add(new LeftFlyer(level));
  if (levelage==430) rightflyers.add(new RightFlyer(level));
  if (levelage==500) leftflyers.add(new LeftFlyer(level));
  if (levelage==600) rightflyers.add(new RightFlyer(level));
  if (levelage==650) rightbigflyers.add(new RightBigFlyer(level-2));
  if (levelage==705) leftflyers.add(new LeftFlyer(level));
  if (levelage==750) leftbigflyers.add(new LeftBigFlyer(level-2));
  if (levelage==750) leftflyers.add(new LeftFlyer(level));
  if (levelage==770) leftbigflyers.add(new LeftBigFlyer(level-1));
  if (levelage==850) leftflyers.add(new LeftFlyer(level));
  if (levelage==850) rightflyers.add(new RightFlyer(level));
  if (levelage==850) rightflyers.add(new RightFlyer(level));
  if (levelage==850) rightbigflyers.add(new RightBigFlyer(level));

}

//LEVEL SEVEN END
if (level==7){
  if (levelage>1000) {
    if (enemy>116-past) {
      level=8;
      levelage=0;
      levelopac=255;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
  }
 }
}

//LEVEL EIGHT TEXT
if (level==8) {
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255), levelopac);
  text("Level Eight", width/2, height-40);
  if (levelage>10) levelopac--;
  //println(levelopac);
}
  
//LEVEL EIGHT BAD GUYS
if (level==8) {
  if (levelage==100) leftbigflyers.add(new LeftBigFlyer(level));
  if (levelage==120) rightflyers.add(new RightFlyer(level));
  if (levelage==155) rightbigflyers.add(new RightBigFlyer(level-3));
  if (levelage==170) rightflyers.add(new RightFlyer(level));
  if (levelage==250) leftbigflyers.add(new LeftBigFlyer(level-3));
  if (levelage==300) rightbigflyers.add(new RightBigFlyer(level-3));
  if (levelage==400) leftflyers.add(new LeftFlyer(level-3));
  if (levelage==420) leftbigflyers.add(new LeftBigFlyer(level-3));
  if (levelage==430) rightflyers.add(new RightFlyer(level-1));
  if (levelage==500) leftflyers.add(new LeftFlyer(level));
  if (levelage==600) rightflyers.add(new RightFlyer(level));
  if (levelage==650) rightbigflyers.add(new RightBigFlyer(level-3));
  if (levelage==705) leftflyers.add(new LeftFlyer(level));
  if (levelage==750) leftbigflyers.add(new LeftBigFlyer(level-2));
  if (levelage==750) leftflyers.add(new LeftFlyer(level));
  if (levelage==770) leftbigflyers.add(new LeftBigFlyer(level-2));
  if (levelage==850) leftflyers.add(new LeftFlyer(level-2));
  if (levelage==850) rightflyers.add(new RightFlyer(level));
  if (levelage==850) rightflyers.add(new RightFlyer(level));
  if (levelage==850) rightbigflyers.add(new RightBigFlyer(level-1));

}

//LEVEL EIGHT END
if (level==8){
  if (levelage>1000) {
    if (enemy>136-past) {
      level=9;
      levelage=0;
      levelopac=255;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
  }
 }
}

//LEVEL NINE TEXT
if (level==9) {
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255), levelopac);
  text("FINAL LEVEL", width/2, height-40);
  if (levelage>10) levelopac--;
  //println(levelopac);
}
  
//LEVEL NINE BAD GUYS
if (level==9) {
  if (levelage==100) leftbigflyers.add(new LeftBigFlyer(level));
  if (levelage==120) rightbigflyers.add(new RightBigFlyer(level-3));
  if (levelage==155) rightbigflyers.add(new RightBigFlyer(level-3));
  if (levelage==170) rightbigflyers.add(new RightBigFlyer(level-3));
  if (levelage==250) leftbigflyers.add(new LeftBigFlyer(level-2));
  if (levelage==300) rightbigflyers.add(new RightBigFlyer(level-2));
  if (levelage==400) leftbigflyers.add(new LeftBigFlyer(level-4));
  if (levelage==420) leftbigflyers.add(new LeftBigFlyer(level-3));
  if (levelage==430) rightflyers.add(new RightFlyer(level-1));
  if (levelage==500) leftflyers.add(new LeftFlyer(level));
  if (levelage==600) rightflyers.add(new RightFlyer(level));
  if (levelage==650) rightflyers.add(new RightFlyer(level-2));
  if (levelage==705) leftflyers.add(new LeftFlyer(level));
  if (levelage==750) rightflyers.add(new RightFlyer(level-2));
  if (levelage==750) leftbigflyers.add(new LeftBigFlyer(level));
  if (levelage==850) leftbigflyers.add(new LeftBigFlyer(level-1));
  if (levelage==850) leftbigflyers.add(new LeftBigFlyer(level-2));
  if (levelage==850) rightbigflyers.add(new RightBigFlyer(level));
  if (levelage==850) rightbigflyers.add(new RightBigFlyer(level));
  if (levelage==850) rightbigflyers.add(new RightBigFlyer(level));

}

//LEVEL NINE END
if (level==9){
  if (levelage>1000) {
    if (enemy>156-past) {
      level=10;
      levelage=0;
      levelopac=255;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
  }
 }
}

if (level==10){
  textFont(start);
  textAlign(CENTER,CENTER);
  fill(random(150,250),random(150,250),random(150,250));
  text("GAME OVER!", width/2, 35);
  textAlign(LEFT,CENTER);
  textFont(font);
  text("TO REPLAY, PRESS THE SPACEBAR.", 25, height/2);
      fill(10,210,255);
      text("High Score: "+highscore, 40, 40);
  fill(255,255,0);
  text("Your final score is:", 25, height-110);
  fill(50,255,50);
  text(enemy+" enemies shot down and", 25,height-80);
  fill(255,50,50);
  text(past+" enemies missed.", 25, height-60);
  
}
  


//println(enemy);

}


//FIREBREATHER!
void mousePressed() {
  if (bigfirealive==0){
    browage = 0;
    browmove = 0;
    bro1x1 = 350;
    bro1y1 = 150;
    bro1x2 = 450;
    bro1y2 = 200;
    bro2x1 = 635;
    bro2y1 = 120;
    bro2x2 = 520;
    bro2y2 = 190;
    topjawy=280;
    botjawy=380;
    topjawydif=0;
    botjawydif=0;
    lix=70;
    liy=70;
    lixdif=0;
    liydif=0;
    rix=160;
    riy=150;
    rixdif=0;
    riydif=0;
    fires.add(new Fire());
  }
}

void mouseReleased() {
  if (bigfirealive==0){
    browmove = 1;
    topjawy=280;
    botjawy=350;
    topjawydif=.1;
    botjawydif=.1;
    lix=50;
    liy=50;
    lixdif=0.2;
    liydif=0.2;
    rix=150;
    riy=150;
    rixdif=0.1;
    riydif=0.1;
  }
}

void keyPressed() {

  if (keyCode == ' ') {
    if (level == 0) {
      level = 1;
      levelage = 0;
        for (int i=0; i < bigfires.size() ; i++) {
          BigFire thisBigFire = (BigFire) bigfires.get(i);
          thisBigFire.alive = false;
          thisBigFire.done = true ;
        }
       bigfirealive=0;
       bigfireage=400;
       bg=true;
  //    println("This is the level: "+level);
    }
    if (level == 10) {
      level = 1;
      levelage = 0;
    }
  }
  
  if (keyCode == '.') {
    if (level>0) {
      level++;
      levelage = 0;
       //     println("This is the level: "+level);
    }
  }

  if (keyCode == 90) {
    if (bigfireage >= 400) {
      bigfires.add(new BigFire(530,325)); //this is how to pass parameters to objects
      bigfirealive=1;
      bg=false;
    }

  }

  if (keyCode == 104) {
    leftflyers.add(new LeftFlyer(3));
  //  println("New LeftFlyer made!");
  }

  if (keyCode == 100) {
    if (bg == true) {
      bg=false;
    } 
    else {
      bg=true;
    }
  }

  if (keyCode == 105) {
    rightflyers.add(new RightFlyer(3));
   // println("New RightFlyer made!");
  }

  if (keyCode == 102) {
    rightbigflyers.add(new RightBigFlyer(3));
   // println("New RightBigFlyer made!");
  }
  if (keyCode == 101) {
    leftbigflyers.add(new LeftBigFlyer(3));
   // println("New LeftBigFlyer made!");
  }
  
  
}

class BigFire {
  boolean done;
  boolean alive;
  float x;
  float y;
  float xPos;
  float yPos;
  float xVel;
  float yVel;
  float r;
  float g;
  float b;
  float gVel;
  float rad;
  float raddif;
  int age;
 

  BigFire(int myX, int myY) { //myX and myY aren't accessable variables. they're temperary parameters that pass through numbers when the object is instantiated.
    
    alive = true;
    done = false;
    xPos = mouseX;
    yPos = mouseY;
    x = myX ; //530;
    y = myY ; //325;
    xVel = 3;
    yVel = 3;
    r = 25;
    g = 25;
    b = 112;
    gVel = 10;
    rad = 0;
    raddif = 5;
    age = 0;
  }

  void display() {
    for (int i=0 ; i < sparks.size() ; i++) {
      Spark thisSpark = (Spark) sparks.get(i);
      thisSpark.display();
    }
    
    /* you can't display and remove sparks in the same for loop, because 
    the numbers of the sparks in the array list would change and confuse the
    computer.
    
    example: 100 sparks, by the time the loop runs to the 50th spark, 20
    may have been taken out. when it reaches 81, computer will try to
    access a spark that doesn't exist anymore.*/

    for (int i=0; i < sparks.size() ; i++) {
      Spark thisSpark = (Spark) sparks.get(i);
      if (thisSpark.alive == false) {
        sparks.remove(i);
      }
    }

    for (int i=0;i<16;i++) {
      if (alive==true) {sparks.add(new Spark());}
    }

    age++;
    strokeWeight(2);
    stroke(191,239,255);
    fill(r, g, b, 50);
    ellipse(x, y, rad, rad);
    rad = rad+raddif;
    if (rad>=25) {
      raddif = -raddif;
    }
    if (rad<=0) {
      raddif = -raddif;
    }
    b = g/2;
    g = g + gVel;

    if (g>128) {
      gVel = -gVel;
    }

    if (g<=2) {
      gVel = -gVel;
    }

    drive();

    if (age>300) {
      alive = false;
    }
    //println(age);
  }

  void drive() {
    if (age<300) {
      xPos = mouseX;
      yPos = mouseY;
    }
    if (age<250) {
      xVel = (xPos - x)/10;
      yVel = (yPos - y)/10;
    }
    x = x + xVel;
    y = y + yVel;
    r = 0+(rad-75)*5;
    g = 0+(rad-25)*3;
    b = 125+(rad-50)*2;

    if (age>250) {
      done = true;
    }
  }
}




class Fire {
  
  boolean alive;
  /*float x;
  float y;*/
  PVector position;
  PVector velocity;
  float xPos;
  float yPos;
/*  float xVel;
  float yVel;*/
  float r;
  float g;
  float b;
  float a;
  float gVel;
  float rad;
  int age;
  
  
  Fire() {
  alive = true;
  xPos = mouseX;
  yPos = mouseY;
//  x = 530;
//  y = 325;
  position = new PVector(530,325);
  velocity = new PVector(3,3);
//  xVel = 3;
//  yVel = 3;
  r = 255;
  g = 2;
  b = 1;
  a = 255;
  gVel = 10;
  rad = random(0,25);
  age = 0;
  
  }
  
  void display() {
    age++;
    strokeWeight(2);
    stroke(255,205,42,a);
    fill(r, g, b, a);
    ellipse(position.x, position.y, 5+rad, 5+rad);
    b = g/2;
    g = g + gVel;
    
    if (g>128) {
      gVel = -gVel;
    }
    
    if (g<=2) {
      gVel = -gVel;
    }
drive();

    if (age>65){
      alive = false;
  }
    if (age>55)
    a = 255 - (age-54)*25.5;
  //println(age);
  }
  
  void drive() {
    if (age<2){
    xPos = mouseX;
    yPos = mouseY;
    }
    velocity.x = (xPos - position.x)/10;
    velocity.y = (yPos - position.y)/10;
    //x += xVel;
    //y += yVel;
    position.add(velocity);
  }
  
    
    

    
  }

class LeftBigFlyer {
  
  boolean shot;
  boolean alive;
  boolean win;
  int age;
  float x;
  float y;
  float yvel;
  float xvel;
  float rwx1;
  float rwx2;
  float rwx3;
  float rwy1;
  float rwy2;
  float rwy3;
  float lwx1;
  float lwx2;
  float lwx3;
  float lwy1;
  float lwy2;
  float lwy3;
  float wy3vel;
  float topjaw;
  float botjaw;
  float topjawdif;
  float botjawdif;
  float r;
  float g;
  float b;
  int hitcount;
  
  LeftBigFlyer(float level) {
    shot = false;
    alive = true;
    win = false;
    x = -150;
    y = random(25,height-25);
    xvel = random((level/2)-1,level-1);
    yvel = 5;
    rwx1 = x+45;
    rwy1 = y+10;
    rwx2 = x+70;
    rwy2 = y-25;
    rwx3 = x+95;
    rwy3 = y+10;
    lwx1 = x-45;
    lwy1 = y+10;
    lwx2 = x-70;
    lwy2 = y-25;
    lwx3 = x-95;
    lwy3 = y+10;
    wy3vel = 7;
    topjaw=y+13;
    botjaw=y+42;
    topjawdif=1.5;
    botjawdif=1.5;
    r = random(0,255);
    g =  random(0,255);
    b = random(0,255);
    hitcount = 0;
  }
  
  void display() {
    if (shot==true) {
    rwx1 = x+45;
    rwy1 = y+10;
    rwx2 = x+70;
    rwy2 = y-25;
    rwx3 = x+95;
    rwy3 = y+10;
    lwx1 = x-45;
    lwy1 = y+10;
    lwx2 = x-70;
    lwy2 = y-25;
    lwx3 = x-95;
    lwy3 = y+10;
    age++;
    y += (yvel*age)/8;
    topjaw += (yvel*age)/8;
    botjaw += (yvel*age)/8;
    x += xvel;
    strokeWeight(2);
    fill(r+(hitcount*10),g+(hitcount*10),b+(hitcount*10));
    stroke(r+50,g+50,b+50);
    triangle(rwx1,rwy1,rwx2-hitcount,rwy2+(hitcount*2),rwx3-(hitcount*2.5),rwy3);
    triangle(lwx1,lwy1,lwx2+hitcount,lwy2+(hitcount*2),lwx3+(hitcount*2.5),lwy3);
    ellipse(x,y,100,100);
    noStroke();
    fill(0);
    ellipse(x-5,y,4,4);
    ellipse(x+5,y,4,4);
    stroke(0);
    strokeWeight(3);
    line(x-38,y-15,x-13,y+10);
    line(x-38,y+10,x-13,y-15);
    line(x+38,y-15,x+13,y+10);
    line(x+38,y+10,x+13,y-15);
    quad(x-18,topjaw,x+19,topjaw,x+19,botjaw,x-18,botjaw);

    strokeWeight(1);
    fill(255);
    triangle(x-18,topjaw-1,x-12,topjaw-1,x-15,topjaw+10);
    triangle(x-12,topjaw-1,x-6,topjaw-1,x-9,topjaw+10);
    triangle(x-6,topjaw-1,x,topjaw-1,x-3,topjaw+10);
    triangle(x,topjaw-1,x+6,topjaw-1,x+3,topjaw+10);
    triangle(x+6,topjaw-1,x+12,topjaw-1,x+9,topjaw+10);
    triangle(x+12,topjaw-1,x+18,topjaw-1,x+15,topjaw+10);
    
    triangle(x-18,botjaw+1,x-15,botjaw+1,x-18,botjaw-10);
    triangle(x-15,botjaw+1,x-9,botjaw+1,x-12,botjaw-10);
    triangle(x-9,botjaw+1,x-3,botjaw+1,x-6,botjaw-10);
    triangle(x-3,botjaw+1,x+3,botjaw+1,x,botjaw-10);
    triangle(x+3,botjaw+1,x+9,botjaw+1,x+6,botjaw-10);
    triangle(x+9,botjaw+1,x+15,botjaw+1,x+12,botjaw-10);
    triangle(x+15,botjaw+1,x+18,botjaw+1,x+18,botjaw-10);
    
    strokeWeight(6);


    if (y>height+50) alive=false;
      
    } else {
    x=x+xvel;
    rwx1 = x+45;
    rwx2 = x+70;
    rwx3 = x+95;
    lwx1 = x-45;
    lwx2 = x-70;
    lwx3 = x-95;
    strokeWeight(2);
    fill(r+(hitcount*10),g+(hitcount*10),b+(hitcount*10));
    stroke(r+50,g+50,b+50);
    triangle(rwx1,rwy1,rwx2-hitcount,rwy2+(hitcount*2),rwx3-(hitcount*2.5),rwy3);
    triangle(lwx1,lwy1,lwx2+hitcount,lwy2+(hitcount*2),lwx3+(hitcount*2.5),lwy3);
    ellipse(x,y,100,100);
    stroke(0);
    strokeWeight(1);
    fill(255);
    ellipse(x-25,y-2,25,25);
    ellipse(x+25,y-2,25,25);
    noStroke();
    fill(0);
    ellipse(x-5,y,4,4);
    ellipse(x+5,y,4,4);
    ellipse(x-25,y-2,7,22);
    ellipse(x+25,y-2,7,22);
    quad(x-18,topjaw,x+19,topjaw,x+19,botjaw,x-18,botjaw);
    topjaw=topjaw+topjawdif;
    if (topjaw<y+13) {
      topjawdif=-topjawdif;
    }
    if (topjaw>y+23) {
      topjawdif=-topjawdif;
    }
    botjaw=botjaw+botjawdif;
    if (botjaw<y+32) {
      botjawdif=-botjawdif;
    }
    if (botjaw>y+42) {
      botjawdif=-botjawdif;
    }
    stroke(0);
    strokeWeight(1);
    fill(255);
    triangle(x-18,topjaw-1,x-12,topjaw-1,x-15,topjaw+10);
    triangle(x-12,topjaw-1,x-6,topjaw-1,x-9,topjaw+10);
    triangle(x-6,topjaw-1,x,topjaw-1,x-3,topjaw+10);
    triangle(x,topjaw-1,x+6,topjaw-1,x+3,topjaw+10);
    triangle(x+6,topjaw-1,x+12,topjaw-1,x+9,topjaw+10);
    triangle(x+12,topjaw-1,x+18,topjaw-1,x+15,topjaw+10);
    
    triangle(x-18,botjaw+1,x-15,botjaw+1,x-18,botjaw-10);
    triangle(x-15,botjaw+1,x-9,botjaw+1,x-12,botjaw-10);
    triangle(x-9,botjaw+1,x-3,botjaw+1,x-6,botjaw-10);
    triangle(x-3,botjaw+1,x+3,botjaw+1,x,botjaw-10);
    triangle(x+3,botjaw+1,x+9,botjaw+1,x+6,botjaw-10);
    triangle(x+9,botjaw+1,x+15,botjaw+1,x+12,botjaw-10);
    triangle(x+15,botjaw+1,x+18,botjaw+1,x+18,botjaw-10);
    
    strokeWeight(6);
    line(x-36-(hitcount/5),y-19+(hitcount/2),x-10-(hitcount/2),y-9-(hitcount));
    line(x+36+(hitcount/5),y-19+(hitcount/2),x+10+(hitcount/2),y-9-(hitcount));

    rwy3=rwy3+wy3vel;
    if (rwy3>y+15) {
      wy3vel=-wy3vel;
    }
    if (rwy3<y-15) {
      wy3vel=-wy3vel;
    }
    lwy3=lwy3+wy3vel;
    
    if (x>width+75) win=true;
    
    }
  }
    
}
class LeftFlyer {
  
  boolean shot;
  boolean alive;
  boolean win;
  int age;
  float x;
  float y;
  float yvel;
  float xvel;
  float rwx1;
  float rwx2;
  float rwx3;
  float rwy1;
  float rwy2;
  float rwy3;
  float lwx1;
  float lwx2;
  float lwx3;
  float lwy1;
  float lwy2;
  float lwy3;
  float wy3vel;
  float r;
  float g;
  float b;
  
  LeftFlyer(float level) {
    win = false;
    shot = false;
    alive = true;
    x = -50;
    y = random(25,height-25);
    xvel = random((level/2),level);
    rwx1 = x+10;
    rwy1 = y+2;
    rwx2 = x+25;
    rwy2 = y-10;
    rwx3 = x+40;
    rwy3 = y+2;
    lwx1 = x-10;
    lwy1 = y+2;
    lwx2 = x-25;
    lwy2 = y-10;
    lwx3 = x-40;
    lwy3 = y+2;
    yvel = 5;
    wy3vel = 2;
    r = random(0,255);
    g =  random(0,255);
    b = random(0,255);
  }
  
  void display() {
    if (shot==true) {
    age++;
    y += (yvel*age)/8;
    x += xvel;
    rwx1 = x+10;
    rwy1 = y+2;
    rwx2 = x+15;
    rwy2 = y-10;
    rwx3 = x+10;
    rwy3 = y+10;
    lwx1 = x-10;
    lwy1 = y+2;
    lwx2 = x-15;
    lwy2 = y-10;
    lwx3 = x-10;
    lwy3 = y+10;
    strokeWeight(2);
    fill(r,g,b);
    stroke(r+50,g+50,b+50);
    triangle(rwx1,rwy1,rwx2,rwy2,rwx3,rwy3);
    triangle(lwx1,lwy1,lwx2,lwy2,lwx3,lwy3);
    ellipse(x,y,25,25);
    stroke(0);
    strokeWeight(2);
    fill(255);
    line(x-9,y-7,x-2,y);
    line(x-2,y-7,x-9,y);
    line(x+9,y-7,x+2,y);
    line(x+2,y-7,x+9,y);
    
    noStroke();
    fill(0);
    
    if (y>height+30) alive=false;
        
    }else{ 
    x=x+xvel;
    rwx1 = x+10;
    rwx2 = x+25;
    rwx3 = x+40;
    lwx1 = x-10;
    lwx2 = x-25;
    lwx3 = x-40;
    strokeWeight(2);
    fill(r,g,b);
    stroke(r+50,g+50,b+50);
    triangle(rwx1,rwy1,rwx2,rwy2,rwx3,rwy3);
    triangle(lwx1,lwy1,lwx2,lwy2,lwx3,lwy3);
    ellipse(x,y,25,25);
    stroke(0);
    strokeWeight(1);
    fill(255);
    ellipse(x-6,y-2,10,10);
    ellipse(x+6,y-2,10,10);
    noStroke();
    fill(0);
    ellipse(x-7,y-3,5,5);
    ellipse(x+7,y-3,5,5);
    rwy3=rwy3+wy3vel;
    if (rwy3>y+10) {
      wy3vel=-wy3vel;
    }
    if (rwy3<y-10) {
      wy3vel=-wy3vel;
    }
    lwy3=lwy3+wy3vel;
    if (x>width+30) {
      win=true;
    }
    
    
    //if (x>width+(width/4)) alive=false;
    //if (alive=false) println("LEFT FLYER IS DEAD");
    }
  }
    
}
class RightBigFlyer {
  
  boolean shot;
  boolean alive;
  boolean win;
  int age;
  float x;
  float y;
  float xvel;
  float yvel;
  float rwx1;
  float rwx2;
  float rwx3;
  float rwy1;
  float rwy2;
  float rwy3;
  float lwx1;
  float lwx2;
  float lwx3;
  float lwy1;
  float lwy2;
  float lwy3;
  float wy3vel;
  float topjaw;
  float botjaw;
  float topjawdif;
  float botjawdif;
  float r;
  float g;
  float b;
  int hitcount;
  
  RightBigFlyer(float level) {
    win = false;
    shot = false;
    alive = true;
    hitcount = 0;
    x = width+150;
    y = random(25,height-25);
    xvel = random(-level+1, -(level/2)+1);
    yvel = 5;
    rwx1 = x+45;
    rwy1 = y+10;
    rwx2 = x+70;
    rwy2 = y-25;
    rwx3 = x+95;
    rwy3 = y+10;
    lwx1 = x-45;
    lwy1 = y+10;
    lwx2 = x-70;
    lwy2 = y-25;
    lwx3 = x-95;
    lwy3 = y+10;
    wy3vel = 7;
    topjaw=y+13;
    botjaw=y+42;
    topjawdif=1.5;
    botjawdif=1.5;
    r = random(0,255);
    g =  random(0,255);
    b = random(0,255);
  }
  
  void display() {
    if (shot==true) {
    rwx1 = x+45;
    rwy1 = y+10;
    rwx2 = x+70;
    rwy2 = y-25;
    rwx3 = x+95;
    rwy3 = y+10;
    lwx1 = x-45;
    lwy1 = y+10;
    lwx2 = x-70;
    lwy2 = y-25;
    lwx3 = x-95;
    lwy3 = y+10;
    age++;
    y += (yvel*age)/8;
    topjaw += (yvel*age)/8;
    botjaw += (yvel*age)/8;
    x += xvel;
    strokeWeight(2);
    fill(r+(hitcount*10),g+(hitcount*10),b+(hitcount*10));
    stroke(r+50,g+50,b+50);
    triangle(rwx1,rwy1,rwx2-hitcount,rwy2+(hitcount*2),rwx3-(hitcount*2.5),rwy3);
    triangle(lwx1,lwy1,lwx2+hitcount,lwy2+(hitcount*2),lwx3+(hitcount*2.5),lwy3);
    ellipse(x,y,100,100);
    noStroke();
    fill(0);
    ellipse(x-5,y,4,4);
    ellipse(x+5,y,4,4);
    stroke(0);
    strokeWeight(3);
    line(x-38,y-15,x-13,y+10);
    line(x-38,y+10,x-13,y-15);
    line(x+38,y-15,x+13,y+10);
    line(x+38,y+10,x+13,y-15);
    quad(x-18,topjaw,x+19,topjaw,x+19,botjaw,x-18,botjaw);

    stroke(0);
    strokeWeight(1);
    fill(255);
    triangle(x-18,topjaw-1,x-12,topjaw-1,x-15,topjaw+10);
    triangle(x-12,topjaw-1,x-6,topjaw-1,x-9,topjaw+10);
    triangle(x-6,topjaw-1,x,topjaw-1,x-3,topjaw+10);
    triangle(x,topjaw-1,x+6,topjaw-1,x+3,topjaw+10);
    triangle(x+6,topjaw-1,x+12,topjaw-1,x+9,topjaw+10);
    triangle(x+12,topjaw-1,x+18,topjaw-1,x+15,topjaw+10);
    
    triangle(x-18,botjaw+1,x-15,botjaw+1,x-18,botjaw-10);
    triangle(x-15,botjaw+1,x-9,botjaw+1,x-12,botjaw-10);
    triangle(x-9,botjaw+1,x-3,botjaw+1,x-6,botjaw-10);
    triangle(x-3,botjaw+1,x+3,botjaw+1,x,botjaw-10);
    triangle(x+3,botjaw+1,x+9,botjaw+1,x+6,botjaw-10);
    triangle(x+9,botjaw+1,x+15,botjaw+1,x+12,botjaw-10);
    triangle(x+15,botjaw+1,x+18,botjaw+1,x+18,botjaw-10);
    
    strokeWeight(6);
    line(x-36-(hitcount/5),y-19+(hitcount/2),x-10-(hitcount/2),y-9-(hitcount));
    line(x+36+(hitcount/5),y-19+(hitcount/2),x+10+(hitcount/2),y-9-(hitcount));


    if (y>height+50) alive=false;
      
    } else {
    x=x+xvel;
    rwx1 = x+45;
    rwx2 = x+70;
    rwx3 = x+95;
    lwx1 = x-45;
    lwx2 = x-70;
    lwx3 = x-95;
    strokeWeight(2);
    fill(r+(hitcount*10),g+(hitcount*10),b+(hitcount*10));
    stroke(r+50,g+50,b+50);
    triangle(rwx1,rwy1,rwx2-hitcount,rwy2+(hitcount*2),rwx3-(hitcount*2.5),rwy3);
    triangle(lwx1,lwy1,lwx2+hitcount,lwy2+(hitcount*2),lwx3+(hitcount*2.5),lwy3);
    ellipse(x,y,100,100);
    stroke(0);
    strokeWeight(1);
    fill(255);
    ellipse(x-25,y-2,25,25);
    ellipse(x+25,y-2,25,25);
    noStroke();
    fill(0);
    ellipse(x-5,y,4,4);
    ellipse(x+5,y,4,4);
    ellipse(x-25,y-2,7,22);
    ellipse(x+25,y-2,7,22);
    quad(x-18,topjaw,x+19,topjaw,x+19,botjaw,x-18,botjaw);
    topjaw=topjaw+topjawdif;
    if (topjaw<y+13) {
      topjawdif=-topjawdif;
    }
    if (topjaw>y+23) {
      topjawdif=-topjawdif;
    }
    botjaw=botjaw+botjawdif;
    if (botjaw<y+32) {
      botjawdif=-botjawdif;
    }
    if (botjaw>y+42) {
      botjawdif=-botjawdif;
    }
    stroke(0);
    strokeWeight(1);
    fill(255);
    triangle(x-18,topjaw-1,x-12,topjaw-1,x-15,topjaw+10);
    triangle(x-12,topjaw-1,x-6,topjaw-1,x-9,topjaw+10);
    triangle(x-6,topjaw-1,x,topjaw-1,x-3,topjaw+10);
    triangle(x,topjaw-1,x+6,topjaw-1,x+3,topjaw+10);
    triangle(x+6,topjaw-1,x+12,topjaw-1,x+9,topjaw+10);
    triangle(x+12,topjaw-1,x+18,topjaw-1,x+15,topjaw+10);
    
    triangle(x-18,botjaw+1,x-15,botjaw+1,x-18,botjaw-10);
    triangle(x-15,botjaw+1,x-9,botjaw+1,x-12,botjaw-10);
    triangle(x-9,botjaw+1,x-3,botjaw+1,x-6,botjaw-10);
    triangle(x-3,botjaw+1,x+3,botjaw+1,x,botjaw-10);
    triangle(x+3,botjaw+1,x+9,botjaw+1,x+6,botjaw-10);
    triangle(x+9,botjaw+1,x+15,botjaw+1,x+12,botjaw-10);
    triangle(x+15,botjaw+1,x+18,botjaw+1,x+18,botjaw-10);
    
    strokeWeight(6);
    line(x-36-(hitcount/5),y-19+(hitcount/2),x-10-(hitcount/2),y-9-(hitcount));
    line(x+36+(hitcount/5),y-19+(hitcount/2),x+10+(hitcount/2),y-9-(hitcount));


    rwy3=rwy3+wy3vel;
    if (rwy3>y+15) {
      wy3vel=-wy3vel;
    }
    if (rwy3<y-15) {
      wy3vel=-wy3vel;
    }
    lwy3=lwy3+wy3vel;
    
    if (x<-75) win=true;
  }
    
}
}
class RightFlyer {
  
  boolean shot;
  boolean alive;
  boolean win;
  int age;
  float x;
  float y;
  float xvel;
  float yvel;
  float rwx1;
  float rwx2;
  float rwx3;
  float rwy1;
  float rwy2;
  float rwy3;
  float lwx1;
  float lwx2;
  float lwx3;
  float lwy1;
  float lwy2;
  float lwy3;
  float wy3vel;
  float r;
  float g;
  float b;
  
  RightFlyer(float level) {
    win = false;
    shot = false;
    alive = true;
    x = width+50;
    y = random(25,height-25);
    xvel = random(-level, -(level/2));
    yvel = 5;
    rwx1 = x+10;
    rwy1 = y+2;
    rwx2 = x+25;
    rwy2 = y-10;
    rwx3 = x+40;
    rwy3 = y+2;
    lwx1 = x-10;
    lwy1 = y+2;
    lwx2 = x-25;
    lwy2 = y-10;
    lwx3 = x-40;
    lwy3 = y+2;
    wy3vel = 2;
    r = random(0,255);
    g =  random(0,255);
    b = random(0,255);
  }
  
  void display() {
   if (shot==true) {
    age++;
    y += (yvel*age)/8;
    x += xvel;
    rwx1 = x+10;
    rwy1 = y+2;
    rwx2 = x+15;
    rwy2 = y-10;
    rwx3 = x+10;
    rwy3 = y+10;
    lwx1 = x-10;
    lwy1 = y+2;
    lwx2 = x-15;
    lwy2 = y-10;
    lwx3 = x-10;
    lwy3 = y+10;
    strokeWeight(2);
    fill(r,g,b);
    stroke(r+50,g+50,b+50);
    triangle(rwx1,rwy1,rwx2,rwy2,rwx3,rwy3);
    triangle(lwx1,lwy1,lwx2,lwy2,lwx3,lwy3);
    ellipse(x,y,25,25);
    stroke(0);
    strokeWeight(2);
    fill(255);
    line(x-9,y-7,x-2,y);
    line(x-2,y-7,x-9,y);
    line(x+9,y-7,x+2,y);
    line(x+2,y-7,x+9,y);
    
    noStroke();
    fill(0);
    
    if (y>height+30) alive=false;
        
    }else{ 
    x=x+xvel;
    rwx1 = x+10;
    rwx2 = x+25;
    rwx3 = x+40;
    lwx1 = x-10;
    lwx2 = x-25;
    lwx3 = x-40;
    strokeWeight(2);
    fill(r,g,b);
    stroke(r+50,g+50,b+50);
    triangle(rwx1,rwy1,rwx2,rwy2,rwx3,rwy3);
    triangle(lwx1,lwy1,lwx2,lwy2,lwx3,lwy3);
    ellipse(x,y,25,25);
    stroke(0);
    strokeWeight(1);
    fill(255);
    ellipse(x-6,y-2,10,10);
    ellipse(x+6,y-2,10,10);
    noStroke();
    fill(0);
    ellipse(x-7,y-3,5,5);
    ellipse(x+7,y-3,5,5);
    rwy3=rwy3+wy3vel;
    if (rwy3>y+10) {
      wy3vel=-wy3vel;
    }
    if (rwy3<y-10) {
      wy3vel=-wy3vel;
    }
    lwy3=lwy3+wy3vel;
    if (x<-30) win=true;
    }
  }
}
    
class Spark {
  
  boolean alive;
  float orix = 0;
  float oriy = 0;
  //float x;
  //float y;
  PVector position;
  //float xVel;
  //float yVel;
  PVector velocity;
  float rad;
  float g;
  float b;
  float opac;
  int bVel;
  int age;
  
  Spark() {
    alive = true;
    orix = 0;
    oriy = 0;
    //x = 0;
    //y = 0;
    position = new PVector(0,0);
    //xVel = random(-5,5);
    //yVel = random(-5,5);
    velocity = new PVector(random(-5,5),random(-5,5));
    age = 0;
    g=255;
    b=255;
    bVel=10;
    opac=255;
    rad=random(1,15);
    

  }
  
  void display() {
    
    if (age<3) {
    for (int i=0; i < bigfires.size() ; i++) {
    BigFire thisBigFire = (BigFire) bigfires.get(i);
    position.x = thisBigFire.x;
    position.y = thisBigFire.y;
    }}
    
    age++;
    noStroke();
    fill(g,g,b,opac);
    ellipse(position.x,position.y,rad,rad);
    position.add(velocity);
    //x = x+xVel;
    //y = y+yVel;
    b = b - bVel;
    g = random(0,1)*255;
    opac = 255 - age*8.5;
    
    if (b<200) {
      bVel = -bVel;
    }
    
    if (bVel>=255) {
      bVel = -bVel;
    }
    
    if (age>30){
      alive=false;
    }
  }
  
    
}


