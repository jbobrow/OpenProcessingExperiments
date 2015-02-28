
/* SPACE WARRIOR
© Kevin Keables
2011 */
import traer.physics.*;
import controlP5.*;
ControlP5 controlP5;
PImage title;
boolean play = false;
boolean pause = false;
int myColor = color(0,0,0);
int counterB = 0;
int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
int sizex=900;
int sizey=420;
int count=0;
int counterE=0;
int stars = 20;
int deathcounter = 0;
int spark=0;
boolean sparkle = false;
boolean sparkleB = false;
boolean enemydeath = false;
boolean deathseq = false;
boolean fire = true;
boolean fireM = false;
boolean boss = false;
boolean bossfire = false;
boolean bossdeath = false;
boolean deathpause = false;
float Obossx,Obossy;
float bossm = random(100);
int bossy = sizey/2;
int bossx = sizex+50;
int bossP = 5;
int bossL = 1000;
float bossU = random(50);
int bossO = round(bossU);
int missiles = 5;
float missx, missy;
boolean heal = false;
float healx,healy,lzrx,lzry;
int life = 200;
int lives = 0;
int enemies = 10;
boolean deathscreen = false;
int [] sx= new int[stars];
int [] sy= new int[stars];
int [] x = new int[enemies];
int [] y = new int[enemies];
int [] enemyl = new int[enemies];
int [] eR = new int[enemies];
int [] eG = new int[enemies];
int [] eB = new int[enemies];
int [] oldX = new int[enemies];
int [] oldY = new int[enemies];
int countscreen =0;
float lazers = 15;
float lazern = lazers;
float lazerp = lazers*6.5;
float lazerb = lazerp;
float lazup = 0;
boolean lzrup = false;
int enemys = 20;
int score = 0;
float speed = 15;
int xplode = 0;
int bossplode = 0;
int uplode = 0;
PFont fontA;
int counter = enemies;
void setup() {
  title = loadImage("SpaceWarriorTitle.png");
image(title,0,0,900,420);
  size (900,420);
  controlP5 = new ControlP5(this);
controlP5.addSlider("enemies",1,10,5,20,300,10,100);
  fontA = loadFont ("LucidaGrande-48.vlw");
  textFont (fontA,12);
  frameRate(40);
  smooth();
  for(int i=0; i<stars; i++){
    sx[i] = round(random(sizex));
    sy[i] = round(random(sizey));
  }
  for(int i=0; i<enemies; i++){
    x[i] = sizex+round(random(100));
    y[i] = round(random(sizey));
    enemyl[i] = 100;
    eR[i] = int(round(random(255)));
    eG[i] = int(round(random(255)));
    eB[i] = int(round(random(255)));
  }
  enemies = 5;
}

  
void draw () {
  if (play == false && pause == false && deathscreen == false){ 
    image(title,0,0,900,420);
    life = 200;
     lazers = 15;
  lazup = 0;
  life = 200;
  score = 0;
  boss = false;
    for(int i=0; i<stars; i++){
    sx[i] = round(random(sizex));
    sy[i] = round(random(sizey));
  }
  for(int i=0; i<enemies; i++){
    x[i] = sizex+round(random(100));
    y[i] = round(random(sizey));
    enemyl[i] = 100;
    eR[i] = int(round(random(255)));
    eG[i] = int(round(random(255)));
    eB[i] = int(round(random(255)));
  }
  countscreen++;
    if(mousePressed && countscreen>15) {
      play = true;
      countscreen = 0;
    }
  } else if (pause == true){
    background(0);
     fill(255);
  noStroke();
  for (int i=1; i<stars; i++){
  ellipse(sx[i],sy[i],random(2),2);
  sx[i]-=i;
  }
  if(sx[count]<=0) {
    sx[count] = sizex+15;
    sy[count] = round(random(sizey));
  }
  count++;
  if (count>=stars) count = 0;
  if (deathscreen == false){
text ("PAUSED",440,205);
text ("(CLICK TO RESUME)", 430,220);
  } else if (deathscreen == true){
    text ("BUMMER",440,205);
text ("(CLICK TO RETRY)", 430,220);
  }
if (mousePressed && deathscreen == false){
  pause = false;
} else if (mousePressed && deathscreen == true) {
  play = false;
  pause =  false;
  deathscreen = false;
}
}
  if (play == true && pause == false && deathscreen == false) {
background(0);
  lazerp = lazers*6.5;
  lazerb=lazerp;
  if (lazerb > 100) {
    lazerb = 100;
  }
  //***********************BOSS STUFF
  if (bossO == score) {
    boss = true;
  }
  if (boss == true) {
    noStroke();
    fill(eR[counterE],eG[counterE],eB[counterE]);
    triangle(bossx-20,bossy-20, bossx+20,bossy-30, bossx+20, bossy+10);
    triangle(bossx-20,bossy+20, bossx+20, bossy+30, bossx+20, bossy-10);
    if (bossx>=sizex-100) {
      bossx-=5;
    }
    bossm = random(100);
    if (bossm>=51 && bossy<sizey-20 && bossy<mouseY) {
      bossy+=5;
    } 
    else if (bossm<=49 && bossy>=20 && bossy>mouseY) {
      bossy-=5;
    }
    if (bossm>49.5 && bossm<50.5) {
   
          bossfire = true;
      }
   
    if (bossfire == true) {
      frameRate(30);
       if (counterB<=20){
        noStroke();
        fill(0,255,255);
        ellipse(random(bossx-40, bossx-20), random(bossy-15,bossy+15),5,5);
        ellipse(random(bossx-40, bossx-20), random(bossy-15,bossy+15),5,5);
        counterB++;
        }
     if(counterB>=20 && counter<=20){
        strokeWeight(40);
        stroke(0,255,255);
        line (bossx-25,bossy,0,bossy);
        if (mouseY-10>=bossy-20 && mouseY+10<=bossy+20 && mouseX<bossx) {
          life-=bossP; 
        }
         counter++;
         if (counter>=20) {
          bossfire = false;
          counter = 0;
          counterB = 0;
        }
      }
    }
  }
  noCursor();
  //*********************STARS
  fill(255);
  noStroke();
  for (int i=1; i<stars; i++){
  ellipse(sx[i],sy[i],random(2),2);
  sx[i]-=i;
  }
  if(sx[count]<=0) {
    sx[count] = sizex+15;
    sy[count] = round(random(sizey));
  }
  count++;
  if (count>=stars) count = 0;

  //***************Spaceships & HUD
  noStroke();
   if (deathpause == false){
   fill(200,100,0);
  triangle (mouseX-18, mouseY, mouseX, mouseY-5, mouseX, mouseY+5);
  noFill();
  strokeWeight(life/80);
  stroke(0,100,255);
  ellipse (mouseX-5,mouseY, 30, 30);
  noStroke();
   fill(255,255,0);
  triangle (mouseX-10,mouseY-10,mouseX-10,mouseY+10,mouseX+10,mouseY);
   }
   for (int i=0; i<enemies; i++){
     noStroke();
  fill (eR[i],eG[i],eB[i]);
  if (boss == false);
  triangle (x[i],y[i],x[i]+20,y[i]-15,x[i]+20,y[i]+15);
  stroke(255,255,0);
   }
 if (life>0){
  strokeWeight(11);
  line(20,20,(life/2)+13,20);
 }
 strokeWeight(11);
  stroke(255,0,0);
  line(20,40,lazerb+11,40);
  noStroke();
  //  fill(0);
  // rect(120,30,15,20);
  fill(255);
  text("SCORE:"+score, sizex-170, 10);
  //text("MISSILES:"+missiles, sizex-140,10);
  fill(0);
  text("SHIELD",42,25);
  text("LASER",45,45);
  fill(255);
  //text("LIVES:"+lives, 125,25);
  if (life<=0) {
    life = 0;
    deathseq = true;
    lives--;
  }
  if (enemyl[counterE]<=0) {
    score++;
    oldX[counterE] = x[counterE];
    oldY[counterE] = y[counterE];
    enemydeath = true;
    y[counterE] = round(random(sizey));
    eR[counterE] = round(random(255));
    eG[counterE] = round(random(255));
    eB[counterE] = round(random(255));
    x[counterE] = sizex+30;
    enemyl[counterE] = 100;
  }
   if (bossL<=0) {
    score+=5;
    Obossx = bossx;
    Obossy = bossy;
    bossdeath = true;
    bossy = sizey/2;
    eR[counterE] = round(random(255));
    eG[counterE] = round(random(255));
    eB[counterE] = round(random(255));
    bossx = sizex+50;
    bossL = (score*2)+1000;
    bossU = random(50) + score;
    bossO = round(bossU);
    boss = false;
  }  
  if (enemydeath == true) {
    stroke(0,100,255);
    strokeWeight(3);
    fill(255,100,0);
    ellipse(oldX[counterE],oldY[counterE],xplode,xplode);
    xplode+=10;
    if (xplode>=50) {
      xplode = 0;
      enemydeath = false;
    }
  }
  if (bossdeath == true) {
    stroke(0,100,255);
    strokeWeight(3);
    fill(255,100,0);
    ellipse(Obossx,Obossy,bossplode,bossplode);
    bossplode+=5;
    if (bossplode>=100) {
      bossplode = 0;
      bossdeath = false;
    }
  }
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(10,10,112,20);
  rect(10,30,112,20);
  float m = random(100);
    if (m>=51 && y[counterE]<sizey && y[counterE]<mouseY) {
      y[counterE]+=5;
    } 
    if (m<=49 && y[counterE]>=20 && y[counterE]>mouseY) {
      y[counterE]-=5;
    }
        if (speed <= 24 && mouseX+100<x[counterE]){
        x[counterE]-=speed;
      }
       //if (speed >=25 && mouseX+100<x[counterE]){
         //x[counterE]-= speed/5;
    //}
    if (x[counterE]<mouseX+100) {
      x[counterE]=mouseX+100;
      } 
    if (m>49-score/10 && m<51) {
      stroke (0,255,255);
      strokeWeight (10);
    line (x[counterE],y[counterE],0,y[counterE]);
      if (y[counterE]+5>=mouseY-5 && y[counterE]-5<=mouseY+5 && m>49 && m<51 && mouseX<x[counterE]) {
        life-=10;
      }
  }
  if (mousePressed && (mouseButton == LEFT) && fire == true && deathpause == false) {
    stroke(255,0,0);
    strokeWeight(lazers);
    play = true;
    if (lazers > 1) {
      lazers-=lazers*.04;
    }
    line(mouseX+15,mouseY,sizex+10, mouseY);
    if (mouseY-(lazers/2)<=y[counterE]+20 && mouseY+(lazers/2)>=y[counterE]-20) {
      enemyl[counterE]-=(lazers);
    }
     if (mouseY-(lazers/2)<=bossy+20 && mouseY+(lazers/2)>=bossy-20 && boss == true) {
      bossL-=(lazers);
    }
  } 
  else if (lazers <lazern) {
    lazers+=.5;
  }
  if (lazers <= 1) {
    fire = false;
  } 
  else {
    fire = true;
  }
  if (deathseq == true) {
    fill (255,100,0);
    stroke(255,255,0);
    strokeWeight(1);
    if (uplode<50) {
      stroke(255,100,0);
      strokeWeight(3);
      fill(255,100,0);
      ellipse(mouseX-5,mouseY,uplode,uplode);
      uplode+=3;
      if (uplode>15) {
        stroke(0,100,255);
        strokeWeight(3);
        fill(0);
        ellipse(mouseX-5,mouseY,uplode-10,uplode-10);
        if (uplode>=50) {
          deathpause = true;
          uplode = 0;
        }
          if (deathcounter<30) {
            deathcounter++;
          }
          if (deathcounter>=30){
            deathpause = false;
            deathscreen = true;
            pause = true;
            lives = 1;
            life = 200;
            deathseq = false;
            deathcounter = 0;
          }
          }
        }
      }
    }
  float health = random(1000);
  if (health>=420&&health<=422 && heal == false) {
    heal = true;
    healx=sizex+10;
    healy = random(410);
  }
  if (heal == true) {
    strokeWeight(1);
    fill (0,255,0);
    stroke(0,255,0);
    rect (healx,healy+5,15,5);
    rect (healx+5,healy,5,15);
    healx-=10;
    if (healx<=0) {
      heal = false;
      healx = sizex+10;
    }
  }
  if (mouseX>=healx && mouseX<=healx+15 && mouseY>=healy && mouseY<=healy+15 
    && heal == true) {
    life+=100;
    if (life>200) {
      life = 200;
    }
    heal = false;
    healx = sizex+10;
  }
  float lazup = random(1000);
  if (lazup>=420&&lazup<=422 && lzrup == false) {
    lzrup = true;
    lzrx=sizex+10;
    lzry = random(410);
  }
  if (lzrup == true) {
    fill (255,0,0);
    noStroke();
    rect (lzrx,lzry+10,15,5);
    rect (lzrx,lzry,5,15);
    lzrx-=10;
    if (lzrx<=0) {
      lzrup = false;
      lzrx = sizex+10;
    }
  }
  if (mouseX>=lzrx && mouseX<=lzrx+15 && mouseY>=lzry && mouseY<=lzry+15 
    && lzrup == true) {
    lazers++;
    lazern++;
    if (lazers>50) {
      lazers = 50;
    }
    lzrup = false;
    lzrx = sizex+10;
  }
  counterE++;
  if (counterE >= enemies) counterE =0;
  if (keyPressed && pause == false) {
    if (key == 'p' || key == 'P') {
      pause = true;
    }
  }
}


