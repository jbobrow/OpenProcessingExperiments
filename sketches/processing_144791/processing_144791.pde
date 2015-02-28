
float a = 30;
float b = 30;
float c = 20;
float sx = 1;
float sy = 1;
float aa;
float bb;
float cc;
float d;
float e;
float f;
int score = 0;
int level = 0;
int time = 5000;
int lev = 1;

void setup(){
  size(800,500);
  background(0);
  fill(255);
    aa = random(width);
    bb = random(height);
    ellipse(aa,bb,30,30);
    cc = random(width);
    d = random(height);
    ellipse(cc,d,30,30);
    e = random(width);
    f = random(height);
    ellipse(e,f,30,30);
}

void draw(){
  fill(0);
  rect(0,0,70,40);
  fill(255);
  text("score",0,30);
  text("time", 0,40);
  text(score,40,30);
  text(time, 40,40);
  drawThing(a,b,c);
  a = movex(a,sx);
  b = movey(b,sy);
  if(a>width+c){
    a=-c;
  } else if(a<-c){
    a=width+c;
  }
  if(b>height+c){
    b=-c;
  } else if(b<-c){
    b=height+c;
  }
  score1(a,aa,b,bb);
  score2(a,cc,b,d);
  score3(a,e,b,f);
  if (level<3){
    time-= lev;
  } else if (level >= 3){
    setup();
    level=0;
    lev++;
  }
  if (time<0){
    textSize(72);
    fill(255,0,0);
    text("Game Over",width/3,height/2);
    noLoop();
  }
}

void drawThing(float g, float h, float r){
  ellipse(g,h,r,r);
}
float movey(float r,float t){
   if(keyCode == UP){
      t= -abs(t);
    }
     if (keyCode == DOWN){
        t= abs(t);
      }
  r+=t;
  return r;
}

float movex(float y,float x){
   if(keyCode == LEFT){
      x= -abs(x);
  }
     if (keyCode == RIGHT){
        x= abs(x);
      }
  y+=x;
  return y;
}

float score1(float x1,float x2, float y1, float y2){
    if (x1 < x2+20 && x1 > x2-20){
      if(y1 < y2+20 && y1 > y2-20){
        fill(#ffff00);
        ellipse(x2,y2,50,50);
        fill(255);
        score+=2000;
        aa+=1000;
        time+=1000;
        level++;
      }
    }
  return x2;
}
float score2(float x1,float x2, float y1, float y2){
  if (x1 < x2+20 && x1 > x2-20){
    if(y1 < y2+20 && y1 > y2-20){
        fill(#ffff00);
        ellipse(x2,y2,50,50);
        fill(255);
      score+=2000;
      cc=1000;
      level++;
      time+=1000;
    }
  }
  return x2;
}
float score3(float x1,float x2, float y1, float y2){
  if (x1 < x2+20 && x1 > x2-20){
    if(y1 < y2+20 && y1 > y2-20){
      fill(#ffff00);
      ellipse(x2,y2,50,50);
      fill(255);
      score+=2000;
      e=1000;
      level++;
      time+=1000;
    }
  }
  return x2;
}
