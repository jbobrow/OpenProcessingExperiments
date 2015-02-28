
Ball BALL = new Ball(-12);
Bar RIGHTBAR = new Bar (620, 10, 70);
Bar LEFTBAR = new Bar (30, -10, 70);

float barspeed = 5;
int rightscore = 0;
int leftscore = 0;

void setup () {
  size(650, 400);
  background(0);
  fill(255,255,255);
  rectMode(CENTER);
}

void draw() {
  background(0);
  textSize(32);
  text(leftscore, 30, 30);
  text(rightscore, 610, 30);  
  textSize(18);
  text("Press R to restart", 250, 30);
  
  if (keyPressed) {
   if (key == CODED) {
     if(keyCode == UP) {
     RIGHTBAR.speed= -barspeed;
     }
     
     else if(keyCode == DOWN) {
     RIGHTBAR.speed= barspeed;
     }
   } 
   if(key == 'r') {
     barspeed=5;
     BALL = new Ball(-12);
     }
  }
    
  
  RIGHTBAR.update () ;
  RIGHTBAR.display () ;
  
  LEFTBAR.display () ;
  LEFTBAR.predict (BALL) ;
  LEFTBAR.update () ;
  
  BALL.checkcright(RIGHTBAR);
  BALL.checkcleft(LEFTBAR);  
  BALL.update () ;
  BALL.display () ;
}

void keyReleased () {
  RIGHTBAR.speed=0;
}


class Ball {
 float x;
 float y;
 float xspeed;
 float yspeed; 
 float r;
 
 
 float thisshit = width/2; 
 
Ball(float speedin) {
  x = 250;
  y = 250;
  xspeed = random((0.6*speedin), (0.75*speedin));
  yspeed = speedin-xspeed;
  r=10;
}

void update () {
  if ( ((x+r)<width) && ((x-r)>0) )
  x += xspeed;
  else {
  xspeed=0;
  yspeed=0;
  barspeed=0;
  RIGHTBAR.y=200;
  LEFTBAR.y=200;
    if (x>600) {
      leftscore ++;
      x=325;
      y=200;
    }
    else {
    rightscore++;
      x=325;
      y=200;    
    }
  }
  
  if ( ((y+r)<height) && ((y-r)>0) )
  y += yspeed;
  else {
  y -= yspeed;
  yspeed = -yspeed;
  }
  
}

void checkcright(Bar _bar) {
 if ( (x+xspeed+(r/2)>=_bar.x-(_bar.wideness/2)) && (y+yspeed>=_bar.y-(_bar.tallness/2)) && (y+yspeed<=_bar.y+(_bar.tallness/2)) ) {
  x -= xspeed;
  xspeed= -xspeed;
  yspeed= (((y-_bar.y)/(_bar.tallness/2))*barspeed)+(barspeed*0.75);
 }
}
 
void checkcleft(Bar _bar) {
 if ( (x+xspeed-(r/2)<=_bar.x+(_bar.wideness/2)) && (y+yspeed>=_bar.y-(_bar.tallness/2)) && (y+yspeed<=_bar.y+(_bar.tallness/2)) ) {
  x -= xspeed;
  xspeed= -xspeed;
  yspeed= (((y-_bar.y)/(_bar.tallness/2))*barspeed)+(barspeed/2);
} 
 
}


void display () {
  ellipse (x, y, r, r);
}

}
class Bar {
 float x;
 float y;
 float speed = 0;
 float wideness;
 float tallness;
 
Bar(float _x, float _wideness, float _tallness){
  x=_x;
  y= 200;
  wideness=_wideness;
  tallness=_tallness;
}

void update () {
  if ((y+speed-(tallness/2)<=0) || ((y+(tallness/2)+speed)>=height)) {
    speed=0;
  }
  y += speed;
}

void predict (Ball _ball) {
  
  if (_ball.y<y) {
   speed=-1*(y-_ball.y);
   }
  if (_ball.y>y) {
   speed=_ball.y-y;
   } 
  if (abs(speed)>barspeed) {
    if (speed>0) {
      speed=barspeed;
  }
    if (speed<0) {
      speed=-barspeed;
  }
  }
}

void display () {
  rect(x, y, wideness, tallness);
}

}


