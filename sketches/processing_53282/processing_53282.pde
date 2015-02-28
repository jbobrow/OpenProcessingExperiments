
float[] cubes = new float[16];
String[] words = {"nothing happens.","top.","very","the","to","way","the","all","it","make","you","when","happens","what","wonders","square"};
boolean[] steppedOn = new boolean[16];

void setup() {
  size(400,400);
  background(0); 
  frameRate(30);
  for(int i=0;i<16;i++) {
    cubes[i] = random(0,380);
    steppedOn[i] = false;
  }
  textFont(loadFont("CourierNewPS-BoldMT-18.vlw"));
}

int w=30, h=30, xPos=(400/2-w/2), yPos=(400-h), fall=1, jump=20;
int LMomentum=0,RMomentum=0, deathCount=0;
float cubeVel=1;
boolean jumping=false, L=false, R=false;
int ease=250, base=2;

void draw() {
  background(0);
  fill(255);
  rect(xPos,yPos,w,h);
  cubeVel=base+(400-float(yPos))/ease;
  fill(0);
  text(deathCount,xPos+2,yPos+29);
  for(int i=0;i<16;i++) {
    if(!steppedOn[0]){
    fill(255-int(float(abs(16-i))/16*255),int(float(abs(16-i))/16*255),255-int(float(abs(8-i))/8*255),255-int(abs(200-cubes[i])/200*255));
    }
    else {fill(255-int(float(abs(16-i))/16*255),int(float(abs(16-i))/16*255),255-int(float(abs(8-i))/8*255),255);}
    rect(int(cubes[i]),(i*20)+50,20,20);
    if(steppedOn[i]) {text(words[i],int(cubes[i])+20,(i*20)+70);}
    if(!(!isGoodJump(yPos+1)&&yPos+30==(i*20)+50)) {
      if(cubes[i]>0) {
        cubes[i]-=cubeVel*random(1,3);
        if(yPos<(i*20)+70&&yPos>(i*20)+20&&cubes[i]<xPos+30&&cubes[i]>xPos) {
          xPos=int(cubes[i])-32;
          if(int(cubes[i])-32<0) {xPos=(400/2-w/2);yPos=(400-h);deathCount+=1;}
        }
      }
      else if (!steppedOn[0]) {cubes[i]=400;}
      else {steppedOn[i]=true;if(cubes[i]<0){cubes[i]=0;}}
    }
    else{steppedOn[i]=true;}
  }
  if(L&&!R&&LMomentum==0) {LMomentum=1;}
  if(R&&!L&&RMomentum==0) {RMomentum=1;}
  if((!R||L)&&RMomentum>0) {RMomentum--;if(RMomentum>0){RMomentum--;}}
  if((!L||R)&&LMomentum>0) {LMomentum--;if(LMomentum>0){LMomentum--;}}
  walk();
  if(jumping&&!isGoodJump(yPos+1)) {jump(yPos-jump);}
  else if (fall>1&&jumping) {jump(yPos-jump);}
  fall(yPos+fall);
}

void keyPressed() {
  if (key=='w') {jumping=true;}
  if (key=='a') {L=true;}
  if (key=='d') {R=true;}
  if (key=='p') {
    switch(ease) {
     case 250: ease=400;base=0;break;
     case 400: ease=50;base=20;break;
     case 50: ease=150;base=2;break;
     default: ease=250;
    }
  }
}

void keyReleased() {
  if (key=='w') {jumping=false;}
  if (key=='a') {L=false;}
  if (key=='d') {R=false;}
}

public boolean isGoodJump(int Y) {
 if(Y<=(400-h)&&Y>0) {
   for(int i=0;i<16;i++) {
     if(Y<(i*20)+70&&Y>(i*20)+20) {
       if(xPos>cubes[i]-30&&xPos<=cubes[i]+20) {return false;}
     }
   }
   return true;
 }
 else {return false;}
}

public boolean isGoodMove(int X) {
 if(X>0&&X<400-w) {
   for(int i=0;i<16;i++) {
     if(yPos<(i*20)+70&&yPos>(i*20)+20) {
       if(X>cubes[i]-30&&X<=cubes[i]+20) {return false;}
     }
   }
   return true;
 }
 else {return false;}
}

public void fall(int Y) {
    if(!isGoodJump(yPos+1)) {fall=1;jump=20;return;}
    if(isGoodJump(Y)) {yPos=Y;fall++;}
    else {fall--; fall(yPos+fall);}
}

public void jump(int Y) {
    if(!isGoodJump(yPos-1)) {jump=20;return;}
    if(jump>0) {
      if(isGoodJump(Y)) {yPos=Y;jump--;}
      else {jump--; jump(yPos-jump);}
    }
}

public void walk() {
  if(LMomentum>RMomentum) {
    if(!isGoodMove(xPos-1)) {LMomentum=0;RMomentum=0;return;}
    if(isGoodMove(xPos-LMomentum)) {
      xPos-=LMomentum;
      LMomentum++;
    }
    else if(LMomentum>0){
      LMomentum--;
      walk();
    }
  }
  else if(RMomentum>LMomentum) {
    if(!isGoodMove(xPos+1)) {RMomentum=0;LMomentum=0;return;}
    if(isGoodMove(xPos+RMomentum)) {
      xPos+=RMomentum;
      RMomentum++;
    }
    else if(RMomentum>0){
      RMomentum--;
      walk();
    }
  }
}

