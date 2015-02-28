
int x = 0;
int y = 0;
int speed = 2;
int state = 0;
float grow =  0;
int xa = 0;
int ya = 0;
int speeda = 2;
int statea = 0;
float growa = 0;
int xb = 0;
int yb = 0;
int speedb = 2;
int stateb = 0;
float growb = 0;
int xc = 0;
int yc = 0;
int speedc = 2;
int statec = 0;
float growc =  0;
int xd = 0;
int yd = 0;
int speedd = 2;
int stated = 0;
float growd =  0;

void setup(){
  size (800,600);
}

void draw(){
  background(0);

  swag();
  gucci();
  bandana();
  chain();
  swaggy();
  
} 

 
void swag(){



noStroke();
  fill(255,100);
  ellipse(x,y,10+grow,10+grow);
  stroke(255);
  line(300,400,x,y);
  if (state == 0){
    x=x+speed;
    if (x > 100-10){
        x = 100-10;
        state=1;
      }
    }
    else if (state ==1){
      y=y+speed;
      grow=grow+3;
      if ( y > 150-10){
        y= 150 - 10;
        state = 2;
      }
    } else if (state == 2){
      x = x + speed +1;
      grow=grow-.5;
      if (x > 450){
        x=x+ speed;
        state=3;
      }
     
    } else if (state == 3) {
      y = y + speed;
      grow=grow+1;
      if (y > 500){
        y = y + speed;
        state = 4;
      }
    } else if (state == 4){
      x = x - speed;
      grow=grow-1;
      if ( x < 0){
        x = x +speed;
        state=5;
      }
    } else if (state == 5){
      y = y - speed;
      grow=grow-.5;
      if (y < 0){
        y = y + speed;
        state= 1;
      }
    } 
  
}

void gucci(){
  noStroke();
  fill(255,100);
  ellipse(xa,500-ya,10+growa,10+growa);
  stroke(255);
  line(300,400,xa,500-ya);
  if (statea == 0){
    xa=xa+speeda;
    if (xa > 100-10){
        xa = 100-10;
        statea=1;
      }
    }
    else if (statea ==1){
      ya=ya+speeda;
      growa=growa+1;
      if (ya > 150-10){
        ya= 150 - 10;
        statea = 2;
      }
    } else if (statea == 2){
      xa = xa + speeda +1;
      growa=growa-.5;
      if (xa > 450){
        xa=xa+ speeda;
        statea=3;
      }
     
    } else if (statea == 3){
      ya = ya + speeda;
      growa=growa-1;
      if (ya > 200){
        ya = 200;
        statea = 4;
        
       }
    }
      else if (statea == 4){
       xa = xa - speeda;
       growa=growa+1;
       if (xa < 0){
         xa = xa + speeda;
         statea = 5;
         
       }
      } else if(statea == 5){
         ya = ya - speeda;
         growa=growa-3;
         if (ya < 100){
           ya = ya - speeda;
           statea = 1;
     }}
     
}
 

void bandana(){
noStroke();
  fill(255,100);
  ellipse(xb,500-yb,10+growb,10+growb);
  stroke(255);
  line(300,400,xb,500-yb);
  if (stateb == 0){
    yb=yb+speedb;
    if (yb > 100-10){
        yb = 100-10;
        stateb=1;
      }
    }
    else if (stateb ==1){
      xb=xb+speedb;
      growb=growb+3;
      if ( xb > 150-10){
        xb= 150 - 10;
        stateb = 2;
      }
    } else if (stateb == 2){
      yb = yb + speedb;
      growb=growb-.5;
      if (yb > 450){
        yb=yb+ speedb;
        stateb=3;
      }
     
    } else if (stateb == 3){
      xb = xb + speedb;
      growb=growb +.5;
      if (xb > 500){
        xb = xb + speedb;
        stateb = 4;
      }
    } else if (stateb == 4){
      yb = yb - speedb;
      growb = growb - .5;
      if( 500-yb > 500){
        yb =yb + speedb;
        stateb =5;
        
       }
     } else  if (stateb == 5){
       xb = xb - speedb;
       growb = growb -.4;
       if (xb < 0){
         xb = xb + speedb;
         stateb=1;
       }}
       
}


void chain(){

noStroke();
  fill(255,100);
  ellipse(700-xc,500-yc,10+growc,10+growc);
  stroke(255);
  line(300,400,700-xc,500-yc);
  if (statec == 0){
    yc=yc+speedc;
    if (yc > 100-10){
        yc = 100-10;
        statec=1;
      }
    }
    else if (statec ==1){
      xc=xc+speedc;
      growc=growc+3;
      if ( xc > 120-10){
        xc= 120 - 10;
        statec = 2;
      }
    } else if (statec == 2){
      yc = yc + speedc+1;
      growc=growc-1.4;
      if (yc > 400){
        yc=yc+ speedc;
        statec=3;
      }
     
    } else if (statec == 3){
      xc = xc + speedc;
     growc = growc + 1;
    if (700-xc < 100){
      xc=xc+speedc;
    statec = 4;
    }
    
  } else if (statec == 4){
      yc = yc - speedc;
      growc = growc -.5;
      if ( 500-yc > 500){
        yc = yc - speedc;
        statec = 5;
      }
    } else if (statec == 5){
      xc = xc - speedc;
      growc= growc -.45;
      if (700-xc>700){
        xc = xc - speedc;
        statec =1;
      }}
}

  

void swaggy(){
  noStroke();
  fill(255,100);
  ellipse(300-xd,400-yd,10+growd,10+growd);
  stroke(255);
  line(300,400,300-xd,400-yd);
  if (stated == 0){
    xd=xd+speedd;
    if (xd > 50-10){
        xd = 50-10;
        stated=1;
      }
    }
    else if (stated ==1){
      yd=yd+speedd;
      growd=growd+1;
      if ( yd > 75-10){
        yd= 75 - 10;
        stated = 2;
      }
    } else if (stated == 2){
      xd = xd + speedd +1;
      growd=growd-.5;
      if (xd > 170){
        xd=xd+ speedd;
        stated=3;
      }
     
    } else if (stated == 3) {
      yd = yd + speedd;
      growd=growd+1;
      if (400-yd < 100){
        yd = yd + speedd;
        stated = 4;
      }
    } else if (stated == 4) {
      xd = xd - speedd;
      growd=growd-.5;
      if (300-xd > 300){
        xd = xd - speedd;
        stated = 5;
      }
    } else if (stated == 5) {
      yd = yd - speedd;
      growd=growd-.5;
      if (400-yd > 400){
        yd = yd + speedd;
        stated =1;
      }}
    
    }



