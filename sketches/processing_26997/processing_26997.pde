
int sizex=900;
int sizey=420;
int counter=0;
int deathcounter = 0;
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
float oldX,oldY;
int x = sizex+10;
int life = 200;
int lives = 5;
int score = 0;
float eR = random(255);
float eG = random(255);
float eB = random(255);
float y = random(sizey);
float s1x= random(sizex);
float s1y= random(sizey);
float s2x= random(sizex);
float s2y= random(sizey);
float s3x= random(sizex);
float s3y= random(sizey);
float s4x= random(sizex);
float s4y= random(sizey);
float s5x= random(sizex);
float s5y= random(sizey);
float s6x= random(sizex);
float s6y= random(sizey);
float s7x= random(sizex);
float s7y= random(sizey);
float s8x= random(sizex);
float s8y= random(sizey);
float s9x= random(sizex);
float s9y= random(sizey);
float s10x= random(sizex);
float s10y= random(sizey);
float lazers = 15;
float lazern = lazers;
float lazerp = lazers*6.5;
float lazerb = lazerp;
float lazup = 0;
boolean lzrup = false;
int enemys = 20;
float enemyl=300;
int speed = 1;
int xplode = 0;
int bossplode = 0;
int uplode = 0;
PFont fontA;
void setup() {
  size (sizex,sizey);
  fontA = loadFont ("LucidaGrande-48.vlw");
  textFont (fontA,12);
  frameRate(30);
  smooth();
}
void draw () {
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
    fill(eR,eG,eB);
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
     if(counter<=10){
        strokeWeight(40);
        stroke(0,255,255);
        line (bossx-25,bossy,0,bossy);
        if (mouseY-10>=bossy-20 && mouseY+10<=bossy+20 && mouseX<bossx) {
          life-=bossP;
         counter++; 
        }
         if (counter>10) {
          bossfire = false;
          counter = 0;
        }
      }
    }
  }
  noCursor();
  //*********************STARS
  fill(255);
  noStroke();
  ellipse(s1x,s1y,random(2),2);
  s1x-=8;
  if(s1x<=0) {
    s1x = sizex+15;
    s1y = random(sizey);
  }
  ellipse(s2x,s2y,random(2),2);
  s2x-=9;
  if(s2x<=0) {
    s2x = sizex+15;
    s2y = random(sizey);
  }
  ellipse(s3x,s3y,random(2),2);
  s3x-=9;
  if(s3x<=0) {
    s3x = sizex+15;
    s3y = random(sizey);
  }
  ellipse(s4x,s4y,random(2),2);
  s4x-=8;
  if(s4x<=0) {
    s4x = sizex+15;
    s4y = random(sizey);
  }
  ellipse(s5x,s5y,random(2),2);
  s5x-=7;
  if(s5x<=0) {
    s5x = sizex+15;
    s5y = random(sizey);
  }
  ellipse(s6x,s6y,random(2),2);
  s6x-=8;
  if(s6x<=0) {
    s6x = sizex+15;
    s6y = random(sizey);
  }
  ellipse(s7x,s7y,random(2),2);
  s7x-=9;
  if(s7x<=0) {
    s7x = sizex+15;
    s7y = random(sizey);
  }
  ellipse(s8x,s8y,random(2),2);
  s8x-=10;
  if(s8x<=0) {
    s8x = sizex+15;
    s8y = random(sizey);
  }
  ellipse(s9x,s9y,random(2),2);
  s9x-=9;
  if(s9x<=0) {
    s9x = sizex+15;
    s9y = random(sizey);
  }
  ellipse(s10x,s10y,random(2),2);
  s10x-=10;
  if(s10x<=0) {
    s10x = sizex+15;
    s10y = random(sizey);
  }
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
  noStroke();
   }
  fill (eR,eG,eB);
  if (boss == false);
  triangle (x,y,x+20,y-15,x+20,y+15);
  stroke(255,255,0);
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
  text("LIVES:"+lives, 125,25);
  if (life<=0) {
    life = 0;
    deathseq = true;
    lives--;
    life=200;
  }
  if (enemyl<=0) {
    score++;
    speed = score;
    oldX = x;
    oldY = y;
    enemydeath = true;
    y = random(sizey);
    eR = random(255);
    eG = random(255);
    eB = random(255);
    x = sizex+30;
    enemyl = 300;
  }
   if (bossL<=0) {
    score+=5;
    Obossx = bossx;
    Obossy = bossy;
    bossdeath = true;
    bossy = sizey/2;
    eR = random(255);
    eG = random(255);
    eB = random(255);
    bossx = sizex+50;
    bossL = 1000;
    bossU = random(50) + score;
    bossO = round(bossU);
    boss = false;
  }  
  if (enemydeath == true) {
    stroke(0,100,255);
    strokeWeight(3);
    fill(255,100,0);
    ellipse(oldX,oldY,xplode,xplode);
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
  if (boss == false) {
    if (m>=51 && y<sizey && y<mouseY) {
      y+=5;
    } 
    if (m<=49 && y>=20 && y>mouseY) {
      y-=5;
    }
        if (speed <= 24 && mouseX+100<x){
        x-=speed;
      }
       if (speed >=25 && mouseX+100<x){
         x-= speed/5;
    }
    if (x<mouseX+100) {
      x=mouseX+100;
      } 
    if (m>49-score/10 && m<51) {
      stroke (0,255,255);
      strokeWeight (10);
      line (x,y,0,y);
      if (y+5>=mouseY-5 && y-5<=mouseY+5 && m>49 && m<51 && mouseX<x) {
        life-=10;
      }
    }
  }
  if (mousePressed && (mouseButton == LEFT) && fire == true) {
    stroke(255,0,0);
    strokeWeight(lazers);
    if (lazers > 1) {
      lazers-=lazers*.04;
    }
    line(mouseX+15,mouseY,sizex+10, mouseY);
    if (mouseY-(lazers/2)<=y+20 && mouseY+(lazers/2)>=y-20) {
      enemyl-=(lazers);
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
            life = 200;
            deathseq = false;
            deathcounter = 0;
          }
          if (lives <= 0){
          println("GAME OVER");
          exit();
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
  if (fireM == true) {
    noStroke();
    fill (255,100,0);
    triangle(missx-15,missy,missx,missy-2,missx,missy+2);
    ellipse(missx,missy,15,10);
    missx+=10;
    if (missx>sizex+30);
    {
      fireM = false;
    }
    //if (missx+7>x && missx<=x+20 && missy>=y-
  }
}

/*void mouseClicked(){
 if (mouseButton == RIGHT && missiles > 0) {
 missy = mouseY;
 missx = mouseX;
 fireM = true;
 missiles--;
 }
 }
 */

