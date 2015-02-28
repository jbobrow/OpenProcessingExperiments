
int w=0;
int h =0;
float bx = 0.;
float by=0.;
float vx = 0.;
float vy=0.;
float br=0.;
float bv=0.0;
float camx=0; 
float camy=0;
float camxv=0; 
float camyv=0;
float keyed=0;
int bHurt=0;
int health=100;
int lives=0;
int frame=0;
float kernPos = 0.0;
boolean gameover = true;
int gameoverCount=0;
int score=0;
int credits=2;
int level=1;
int levelCount=15;
int levelKills=0;
int levelBugs=0;
GameKeyboard kb;
GameSynth synth;
baum[] baums = new baum[99];
baum tbaum;
millipede mill;
int currbaum =0;
int maxBugs = 99;
nmeBug[] bugs = new nmeBug[99];
nmeBug tbug;
int currbug =0;
nmeBug2[] bigbugs = new nmeBug2[44];
nmeBug2 tbigbug;
int currbigbug =0;
leaf[] leaves = new leaf[99];

terrain terra;
boolean mouseControl=true;
int mouseControlMessage=60;
boolean autofire = true;
float hv = 0.0;
int clickcounter = 0;
beetle2 beetleShape;
int buglegs=0;
boolean pause = false;
PImage pauseImg;
int pauseCounter=0;
void setup(){
  size(450,500,P3D);  
  kb = new GameKeyboard();
  synth = new GameSynth(this);
  terra = new terrain();
  w= width/2;
  h=height/2;
  frameRate(30);

  for(int i=0;i<baums.length;i++)baums[i]=new baum(0,0,0,0,0);

  for(int i=0;i<bugs.length;i++)bugs[i]=new nmeBug(0,0,0,0,0);
  for(int i=0;i<bigbugs.length;i++)bigbugs[i]=new nmeBug2(0,0,0,0,0);
  for(int i=0;i<leaves.length;i++)leaves[i]=new leaf(random(3200)-1500,random(3200)-1700);
  
  beetleShape = new beetle2(0,0,0,1500.0);
mill = new millipede(-3900,-3900,0.0,0.3);
  level=3;
}//setup

void draw(){
  if(pauseCounter==0){
  frame++;
  synth.update();
  if(frame==20){
    gameover=true;
    credits=1;
 //   levelCount=20;
 mouseControlMessage=90;
  }
  background(0);

  stroke(128,128,0);
  translate(w,h,0);

  drawScore();
  scale(0.75,0.8,1);
  {
    pushMatrix();

    scale(0.6,0.75);
    translate(-camx,-camy);

    terra.draw();
    beetle();
if(level>5 && level/3%2==0 &&levelCount==3){
  mill.newPos(0,-3000,-PI);
 mill.moveToward(bx,by); 
   mill.drawSprite();
   levelBugs++;
   mill.shoot();
}
if(mill.alive){
  mill.moveToward(bx,by); 
   mill.drawSprite(); 
}
if(mill.finalexplode){
 mill.drawSprite(); 
}
    for(int i=0;i<baums.length;i++){
      if(baums[i].alive){
        baums[i].draw();

        baums[i].collide();
      }
    }
    for(int i=0;i<bugs.length;i++){
      bugs[i].draw();
      //  bigbugs[i].collide(bx,by,25,false);
    }
    for(int i=0;i<bigbugs.length;i++){
      bigbugs[i].draw();
      //    bigbugs[i].collide(bx,by,35,false);
    }
    for(int i=0;i<abs(31-level)%leaves.length;i++){
      leaves[i].draw();
      leaves[i].collide(bx,by,30);
      if(levelCount>0 && levelCount<2){
        leaves[i].life=999; 
        if(level>3){
          if(random(100)<(1+level))newBigBug();
          if(random(100)<(1+level))newBigBug();

        }
        if(level>3){
          if(frame%150==30){
            newBigBug(); 
            if(random(100)<(1+level))newBigBug();
            if(random(100)<(1+level))newBigBug();
          } 
        }
      }
    }
    popMatrix();
  }

  bx=bx+vx;
  by=by+vy;

  if(abs(bv)>3.5 ||levelCount>0){
    camy = (camy*4+(by- 120*sin(radians((br+90.)%360.0))))/5;
    camx = (camx*4+(bx-120*cos(radians((br+90.)%360.0))))/5;
  }
  else{
    camy = (camy*40+(by- 120*sin(radians((br+90.)%360.0))))/41;
    camx = (camx*40+(bx-120*cos(radians((br+90.)%360.0))))/41;

  }
  if(abs(camx)<0.1)camx=0.0;
  if(abs(camy)<0.1)camy=0.0;
  if(!gameover){

    if(kb.up || kb.w){
      bv-=10;
    }
    else{
      bv/=1.1;
    }
    if(kb.down || kb.s){
      bv+=10;
    }
    else{
      bv/=1.1;
    }
    if(kb.right || kb.d)br+=15;
    if(kb.left || kb.a)br-=15;
    if(kb.space){
     // if(frame%2==0){
      tbaum = new baum(bx,by,br,vx,vy);
      baums[currbaum]=tbaum;
      baums[currbaum].shoot();
            baums[currbaum].life +=5;
            currbaum++;
      if(currbaum>baums.length-1)currbaum=0; 
    //  }
      if(frame%2==0){
        synth.zap(1);
      }


    }
  }
  if(autofire && !gameover){
         tbaum = new baum(bx,by,br,vx,vy);
      baums[currbaum]=tbaum;
      baums[currbaum].shoot();
      if(-bv>11){baums[currbaum].life +=10;}
            currbaum++;
      if(currbaum>baums.length-1)currbaum=0; 
    //  }
      if(frame%2==0){
        synth.zap(1);
      } 
    
    
  }
    if(mouseControl && !gameover){
hv = (hv*6 +(-1*dist(mouseX-w+camx,mouseY-h+camy,   bx,  by)/4))/7;  

 hv = constrain(hv,-50,0);
 //if(-hv<6.3)bv/=4.;

 bv = hv* (hv-0.1)/(hv-5);
    if(-hv<10.3)bv/=2.;


 // br = angle between two points... ?
 br = getAngleDegrees(mouseX-w,mouseY-h,   camx-bx,  camy-by);
 if(clickcounter>0)clickcounter--;
 if(mousePressed && clickcounter<1){
   {
     autofire = !autofire;
     clickcounter=10;
   }
  }
  /*
    if(key==CODED){
   if(keyCode==UP)bv -= 4;
   if(keyCode==DOWN)bv += 4;
   if(frame%3==0){
   if(keyCode==RIGHT)br += 5;
   if(keyCode==LEFT)br -= 5;
   }
   }
   */

  if(abs(bv)<0.1)bv=0.;
    }
    
    if(pause && pauseCounter==0){
     pauseImg=get();
    pauseCounter=1; 
    }
}else{
  if(pauseImg != null){
 image(pauseImg,0,0);
  }
 stroke(255,255,0);
 pushMatrix();
 translate(width/2,height/2);
 rotateZ(radians(-30+pauseCounter)/3.);
vecText("PAUSED\nhit p to resume",-width/2.5,0,50); 
popMatrix();
synth.update();
pauseCounter++;
}
}//draw

void scoreAdd(float tscore){
  score += tscore;

}

//void mouseClicked(){
// if(mouseControl){
//  autofire = !autofire;
//  
// } 
//  
//}

void keyPressed(){


  switch(key){
  case '1':
    synth.classicCoin(13);
    credits++;
    break;
  case ' ':
    if(gameover && credits==0){mouseControl=false;mouseControlMessage=40;}
    if(gameover &&credits>0){
      gameover=false;
      credits--; 
      health=100;
      score=0;
      lives=0;
      level=1;
      levelCount=20;
      levelBugs=0;
      levelKills=0;
      mill.alive=false;
      bx=0.;
      by=0;
      vx=0.;
      vy=0.;
      for(int i=0;i<bugs.length;i++)bugs[i].life=0;
            for(int i=0;i<bigbugs.length;i++)bigbugs[i].life=0;
    }
    break;
    
    case '7':
    if(gameover && credits==0){mouseControl=false;mouseControlMessage=40;}
    if(gameover &&credits>0){
      gameover=false;
      credits--; 
      health=600;
      score=0;
      lives=0;
      level=7;
      levelCount=20;
      levelBugs=0;
      levelKills=0;
      mill.alive=false;
      bx=0.;
      by=0;
      vx=0.;
      vy=0.;
      for(int i=0;i<bugs.length;i++)bugs[i].life=0;
            for(int i=0;i<bigbugs.length;i++)bigbugs[i].life=0;
    }
    break;
    case 'm':
    if(gameover){
     mouseControl = !mouseControl; 
     autofire = mouseControl;
      mouseControlMessage=30;
    }
  case 'N':
  case 'n':
    //  baums.add(new baum(bx,by,br));
    newBigBug();
    break;
    case 'r':
    health=-1;
    break;
    case'p':
    if(pause==false && !gameover){
    pause=true;
    }else{
     pause=false;
    pauseCounter=0; 
    }
    break;
    case '-':
    int i =0;
    synth.buzzing( i=round(random(10)));
    println(i);
    break;
  }//switch



}

void newBug(){
  if(levelBugs<maxBugs){
    tbug = new nmeBug(random(width*4)-width*2,random(height*4)-height*2,random(360),random(20)-10,random(20)-10);
    bugs[currbug]=tbug;
    bugs[currbug].shoot();
    currbug++;
    levelBugs++;
    if(currbug>bugs.length-1)currbug=0;
  }
}//newBug;
void newBigBug(){
  if(levelBugs<maxBugs){
    tbigbug = new nmeBug2(random(width*4)-width*2,random(height*4)-height*2,random(360),random(20)-10,random(20)-10);
    bigbugs[currbigbug]=tbigbug;
    bigbugs[currbigbug].shoot();
    currbigbug++;
    levelBugs++;
    if(currbigbug>bigbugs.length-1)currbigbug=0;
  }
}//newBug;
void stop(){
  synth.stop();
  super.stop(); 
}

void mouseMoved(){

}
void mouseClicked(){
  if(gameover && credits==0){mouseControl=true;mouseControlMessage=40;
   if(mouseX<w/2 && mouseY<h/4){
    credits++;
   synth.classicCoin(13); 
   }}
 
 if(gameover && mouseControl && credits>0){
   if(mouseX<w/2 && mouseY<h/4){
    credits++;
   synth.classicCoin(13); 
   }else{
      gameover=false;
      credits--; 
      health=100;
      score=0;
      lives=0;
      level=1;
      levelCount=20;
      levelBugs=0;
      levelKills=0;
      bx=0.;
      by=0;
      vx=0.;
      vy=0.;
      for(int i=0;i<bugs.length;i++)bugs[i].life=0;
            for(int i=0;i<bigbugs.length;i++)bigbugs[i].life=0;
   }
    }

  
}

float getAngleDegrees(float x1, float y1, float x2, float y2){
 float xl = x1-x2;
 float yl = y1-y2;
 float result = 0.0;

   result = degrees(    atan2(y1,x1)                   )+90; 
  return result;
}

