
//Noah Ruede - Calli Higgins - Midterm


//FROG
int frogwid=75;
int froglen=75;
int frogx;
int frogy;
//CAR BOT
int carwid=150;
int carlen=75;
int acarbotx=-50;
int bcarbotx=350;
int ccarbotx=650;
int dcarbotx=950;
int ecarbotx=1250;
int carboty=600;
//CAR MID
int acarmidx=0;
int bcarmidx=300;
int ccarmidx=600;
int dcarmidx=900;
int ecarmidx=1200;
int carmidy=525;
//CARTOP
int acartopx=1350;
int bcartopx=1050;
int ccartopx=750;
int dcartopx=450;
int ecartopx=150;
int cartopy=450;
//LOG BOT
int logwid=150;
int loglen=75;
int alogbotx=-50;
int blogbotx=350;
int clogbotx=650;
int dlogbotx=950;
int elogbotx=1250;
int logboty=300;
//LOG MID
int alogtopx=0;
int blogtopx=300;
int clogtopx=600;
int dlogtopx=900;
int elogtopx=1200;
int logtopy=225;
//IMAGES
PImage gameLose;
PImage gameWin;
//OTHER
int state;
int botcarspeed=5;
int midcarspeed=7;
int topcarspeed=4;
int botlogspeed=4;
int toplogspeed=5;
boolean freeze;
boolean overImage;
boolean up;
boolean down;
boolean left;
boolean right;

void setup() {
  size(900, 750);
  frogx=413;
  frogy=675;
  gameLose=loadImage("gameover.jpg");
  gameWin=loadImage("win.jpg");
  frogger=loadImage("froggerback.jpg");
  frog=loadImage("frog.gif");
  car=loadImage("car.png");
  log=loadImage("log.gif");
  freeze=false;
  overImage=false;
}

void draw() {
    background(0);
    image(frogger,0,0,900,750);
  stroke(255);
 for(int i=450;i<=675;i=i+75){
   line(0,i,900,i);
 }
    noStroke();
if(overImage){
      image(gameLose,250,175,400,400);}


  
  //BOT CARS
  fill(255);
   if(freeze){
   endGame();}
   else{
  acarbotx=acarbotx+botcarspeed;
  bcarbotx=bcarbotx+botcarspeed;
  ccarbotx=ccarbotx+botcarspeed;
  dcarbotx=dcarbotx+botcarspeed;
  ecarbotx=ecarbotx+botcarspeed;
   }
  image(car,acarbotx,carboty,carwid,carlen);
  image(car,bcarbotx,carboty,carwid,carlen);
  image(car,ccarbotx,carboty,carwid,carlen);
  image(car,dcarbotx,carboty,carwid,carlen);
  image(car,ecarbotx,carboty,carwid,carlen);
 if (acarbotx+carwid > width+150) {
    botcarspeed = botcarspeed * -1;
  }
  else if (acarbotx+carwid < -1300) {
    botcarspeed = botcarspeed * -1;
  }



//MID CARS
    if(freeze){
   endGame();}
   else{ 
  acarmidx=acarmidx+midcarspeed;
  bcarmidx=bcarmidx+midcarspeed;
  ccarmidx=ccarmidx+midcarspeed;
  dcarmidx=dcarmidx+midcarspeed;
  ecarmidx=ecarmidx+midcarspeed;}

  image(car,acarmidx,carmidy,carwid,carlen);
  image(car,bcarmidx,carmidy,carwid,carlen);
  image(car,ccarmidx,carmidy,carwid,carlen);
  image(car,dcarmidx,carmidy,carwid,carlen);
  image(car,ecarmidx,carmidy,carwid,carlen);
  if (acarmidx+carwid > width+150) {
    midcarspeed = midcarspeed * -1;
  }
  else if ( acarmidx < -1375) {
    midcarspeed = midcarspeed * -1;
  }

  
//TOP CARS

   if(freeze){
   endGame();}
   else{
  acartopx=acartopx-topcarspeed;
  bcartopx=bcartopx-topcarspeed;
  ccartopx=ccartopx-topcarspeed;
  dcartopx=dcartopx-topcarspeed;
  ecartopx=ecartopx-topcarspeed;}

  image(car,acartopx,cartopy,carwid,carlen);
  image(car,bcartopx,cartopy,carwid,carlen);
  image(car,ccartopx,cartopy,carwid,carlen);
  image(car,dcartopx,cartopy,carwid,carlen);
  image(car,ecartopx,cartopy,carwid,carlen);
  if (ecartopx+carwid > width+150) {
    topcarspeed = topcarspeed * -1;
  }
  else if ( ecartopx < -1375) {
    topcarspeed = topcarspeed * -1;
  }

//BOT LOGS

 if(freeze){
   endGame();}
   else{
alogbotx=alogbotx+botlogspeed;
blogbotx=blogbotx+botlogspeed;
clogbotx=clogbotx+botlogspeed;
dlogbotx=dlogbotx+botlogspeed;
elogbotx=elogbotx+botlogspeed;}

image(log,alogbotx,logboty,logwid,loglen);
image(log,blogbotx,logboty,logwid,loglen);
image(log,clogbotx,logboty,logwid,loglen);
image(log,dlogbotx,logboty,logwid,loglen);
image(log,elogbotx,logboty,logwid,loglen);
if (alogbotx+logwid > width+150) {
    botlogspeed = botlogspeed * -1;
  }
  else if ( alogbotx < -1375) {
    botlogspeed = botlogspeed * -1;
  }


if(frogy<225){
    image(gameWin,250,175,400,400);}

//TOP LOGS

 if(freeze){
   endGame();}
   else{
alogtopx=alogtopx+toplogspeed;
blogtopx=blogtopx+toplogspeed;
clogtopx=clogtopx+toplogspeed;
dlogtopx=dlogtopx+toplogspeed;
elogtopx=elogtopx+toplogspeed;}

image(log,alogtopx,logtopy,logwid,loglen);
image(log,blogtopx,logtopy,logwid,loglen);
image(log,clogtopx,logtopy,logwid,loglen);
image(log,dlogtopx,logtopy,logwid,loglen);
image(log,elogtopx,logtopy,logwid,loglen);
if (alogtopx+logwid > width+150) {
    toplogspeed = toplogspeed * -1;
  }
  else if ( alogtopx < -1375) {
    toplogspeed = toplogspeed * -1;
  }
  
  //FROG

  if(right){
    frogx+=75;
  }
    else if(left){
      frogx-=75;
    }
      else if(up){
        frogy-=75;
      }
        else if(down){
          frogy+=75;
  }
  image(frog,frogx, frogy, frogwid, froglen);
  right=false;
  left=false;
  up=false;
  down=false;
  gameOverCar(); 
  botLogRide();  
  topLogRide();
  if (overImage) {
   image(gameLose, 250, 175, 400, 400);
 }
  if (frogy<225) {
   image(gameWin, 250, 175, 400, 400);
 }

  
}

//LOG RIDE

void botLogRide(){
  if(frogx>alogbotx&&frogx<alogbotx+logwid&&frogy==logboty){
    frogx=frogx+botlogspeed;
  }
  else if(frogx>blogbotx&&frogx<blogbotx+logwid&&frogy==logboty){
    frogx=frogx+botlogspeed;
  }
  else if(frogx>clogbotx&&frogx<clogbotx+logwid&&frogy==logboty){
    frogx=frogx+botlogspeed;
  }
  else if(frogx>dlogbotx&&frogx<dlogbotx+logwid&&frogy==logboty){
    frogx=frogx+botlogspeed;
  }
  else if(frogx>elogbotx&&frogx<elogbotx+logwid&&frogy==logboty){
    frogx=frogx+botlogspeed;
  }
  else if(frogy==logboty){
    loseImg();}
}

void topLogRide(){
  if(frogx>alogtopx&&frogx<alogtopx+logwid&&frogy==logtopy){
    frogx=frogx+toplogspeed;
  }
  else if(frogx>blogtopx&&frogx<blogtopx+logwid&&frogy==logtopy){
    frogx=frogx+toplogspeed;
  }
  else if(frogx>clogtopx&&frogx<clogtopx+logwid&&frogy==logtopy){
    frogx=frogx+toplogspeed;
  }
  else if(frogx>dlogbotx&&frogx<dlogbotx+logwid&&frogy==logtopy){
    frogx=frogx+toplogspeed;
  }
  else if(frogx>elogtopx&&frogx<elogtopx+logwid&&frogy==logtopy){
    frogx=frogx+toplogspeed;
  }
   else if(frogy==logtopy){
    loseImg();}
}



//GAME OVERS

void gameOverCar(){
  //botcar
if (frogx>acarbotx&&frogx<acarbotx+carwid&&frogy==carboty){
  loseImg();}
else if (frogx>bcarbotx&&frogx<bcarbotx+carwid&&frogy==carboty){
  loseImg();}
else if (frogx>ccarbotx&&frogx<ccarbotx+carwid&&frogy==carboty){
  loseImg();}
else if (frogx>dcarbotx&&frogx<dcarbotx+carwid&&frogy==carboty){
  loseImg();}
else if (frogx>ecarbotx&&frogx<ecarbotx+carwid&&frogy==carboty){
  loseImg();}
//midcar
else if (frogx>acarmidx&&frogx<acarmidx+carwid&&frogy==carmidy){
  loseImg();}
else if (frogx>bcarmidx&&frogx<bcarmidx+carwid&&frogy==carmidy){
  loseImg();}
else if (frogx>ccarmidx&&frogx<ccarmidx+carwid&&frogy==carmidy){
  loseImg();}
else if (frogx>dcarmidx&&frogx<dcarmidx+carwid&&frogy==carmidy){
  loseImg();}
else if (frogx>ecarmidx&&frogx<ecarmidx+carwid&&frogy==carmidy){
  loseImg();}
//topcar
else if (frogx>acartopx&&frogx<acartopx+carwid&&frogy==cartopy){
  loseImg();}
else if (frogx>bcartopx&&frogx<bcartopx+carwid&&frogy==cartopy){
  loseImg();}
else if (frogx>ccartopx&&frogx<ccartopx+carwid&&frogy==cartopy){
  loseImg();}
else if (frogx>dcartopx&&frogx<dcartopx+carwid&&frogy==cartopy){
  loseImg();}
else if (frogx>ecartopx&&frogx<ecartopx+carwid&&frogy==cartopy){
  loseImg();}
  
}

void loseImg(){
  overImage=true;
  freeze=true;}
  

void endGame(){
acarbotx=acarbotx;
bcarbotx=bcarbotx;
ccarbotx=ccarbotx;
dcarbotx=dcarbotx;
ecarbotx=ecarbotx;
acarmidx=acarmidx;
bcarmidx=bcarmidx;
ccarmidx=ccarmidx;
dcarmidx=dcarmidx;
ecarmidx=ecarmidx;
acartopx=acartopx;
bcartopx=bcartopx;
ccartopx=ccartopx;
dcartopx=dcartopx;
ecartopx=ecartopx;
alogbotx=alogbotx;
blogbotx=blogbotx;
clogbotx=clogbotx;
dlogbotx=dlogbotx;
elogbotx=elogbotx;
alogtopx=alogtopx;
blogtopx=blogtopx;
clogtopx=clogtopx;
dlogtopx=dlogtopx;
elogtopx=elogtopx;
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode==RIGHT) {
      right=true;
    }
    else if (keyCode==LEFT) {
      left=true;
    }
    else if (keyCode==UP) {
      up=true;
    }
    else if (keyCode==DOWN) {
      down=true;
    }
    }
  }



