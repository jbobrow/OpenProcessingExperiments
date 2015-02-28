
// Computing for the Arts with Processing Homework 8
// Background image originally from NASA and hubblesite.org and is public domain.
// All other code is copyright 2013 Stephanie Cheung and the whispering forest
 
// Your solar fusion powered spaceship is floating in space with dangerous alien ships! Control your ship with the mouse to avoid collisions.
// Speed up the projectiles to increase your score with the "w" key, or slow them down with the "d" key.
// Five collisions and it's game over! But if you hit anything going too fast it will be an instant kill. Good luck!
 
PImage space;
 
float x1,y1,sz1,dx1,dy1;
float x2,y2,sz2,dx2,dy2;
float x3,y3,sz3,dx3,dy3;
float xp,yp,szp,dxp,dyp;
float easing = .02;
float d;
float score;
float dscore;
int collisions;
int playercolor;
 
 
float x1a,x2a,x3a,xpa, y1a,y2a,y3a,ypa;
 
void setup() {
  size(600,600);
  space = loadImage("http://i1209.photobucket.com/albums/cc387/chirubian/NGC_3603b.jpg");
 
   
  xp = 0;
   yp = 0;
   szp = 40;
   dxp = 0;
   dyp = 0;
   xpa = dxp;
   ypa = dyp;
   
  x1 = 100;
   y1 = 100;
   sz1 = 20;
   dx1 = 5;
   dy1 = 2;
  
   x2 = 200;
   y2 = 100;
   sz2 = 40;
   dx2 = 2;
   dy2 = 5;
  
   x3 = 100;
   y3 = 50;
   sz3 = 20;
   dx3 = 3;
   dy3 = 3;
   d = width*.5;
    
   score = 0;
   dscore = .02;
   collisions = 0;
   playercolor = 0;
    
   rectMode(CENTER);
}
 
void draw() {
 prepscreen() ;
 checkCollision();
  
 player();
 movePlayer();
  
 fig1() ;
 moveFig1() ;
  
 moveFig2() ;
 fig2() ;
  
 moveFig3() ;
 fig3() ;
  
  
 keepScore();
 gameover() ;
}
 
void prepscreen() {
 image (space,0,0);
 fill(255);
 textSize(20);
 text ( "Collisions: " + collisions, width*.15, height*.9);
  textSize(20);
 text ( "Score:" + int(score) , width*.15, height*.1) ;
 }
 
 
void checkCollision(){
  if (dist(x3,y3, x2,y2) < 30) {
   x3a = dx3;
   x2a = dx2;
   dx3 = x2a;
   dx2 = x3a;
   fill(0,0,255);
   ellipse (x3,y3, 50,50);
   ellipse (x2,y2, 30,30);
 }
  
  if (dist(xp,yp, x1,y1) < 31){
   dx1 = dxp*.06;
   dy1 = dyp*.06;
   x1 = xp + 34*(dx1)/abs(dx1);
   y1 = yp + 34*(dy1)/abs(dy1);
   fill(255,0,0);
   ellipse(xp,yp, 100,100);
   ellipse(x1,y1, 30,30);
   collisions += 1;
   playercolor += 50;
  }
  if (dist(xp,yp, x2,y2) < 50 ) {
   dx2 = dxp*.04;
   dy2 = dyp*.04;
   x2 = xp + 34*(dx2)/abs(dx2);
   y2 = yp + 34*(dy2)/abs(dy2);
   fill(255,0,0);
   ellipse(xp,yp, 100,100);
   ellipse(x2,y2, 50,50);
   collisions += 1;
   playercolor += 50;
  }
  if (dist(xp,yp, x3,y3) < 31) {
   dx3 = dxp*.06;
   dy3 = dyp*.06;
   x3 = xp + 34*(dx3)/abs(dx3);
   y3 = yp + 34*(dy3)/abs(dy3);
   fill(255,0,0);
   ellipse(xp,yp, 100,100);
   ellipse(x3,y3, 30,30);
   collisions += 1;
   playercolor += 50;
  }
  if (dist(x1,y1, x2,y2) < 30) {
   x1a = dx1;
   x2a = dx2;
   dx1 = x2a;
   dx2 = x1a;
   fill(0,0,255);
   ellipse(x1,y1, 30,30);
   ellipse(x2,y2, 50,50);
 }
  
 if (dist(x1,y1, x3,y3) < 24) {
   x1a = dx1;
   x3a = dx3;
   dx1 = x3a;
   dx3 = x1a;
   fill(0,0,255);
   ellipse(x1,y1, 30,30);
   ellipse(x3,y3, 30,30);
 }
}
 
void player() {
  fill(247-(.5*playercolor), 213-(playercolor),40);
  ellipse(xp,yp,random(60),random(60));
  fill(247-playercolor,213,40+playercolor);
  ellipse(xp,yp, szp,szp);
  
 
}
 
void movePlayer() {
  dxp = mouseX-xp;
  if (abs(dxp)>1) {
   xp += dxp*easing;
  }
  dyp = mouseY-yp;
  if (abs(dyp)>1) {
   yp += dyp*easing;
  }
}
 
 
 
void keepScore(){
 score = score + dscore;
 if (dx1 == 0 || dy1 == 0 || dx2 == 0 || dy2 == 0 || dx3 == 0|| dy3 == 0) {
     dscore = 0;
    }
}
 
void keyPressed() {
  if (key == 'd'){
    d += 10;
  }
  if (key == 'a') {
   d -= 10;
  }
  if (key == 'w') {
    if (dx1 > 0) {
     dx1 += 1;
    }
    if (dx1 < 0) {
      dx1 -= 1;
    }
    if (dx1 == 0) {
     dx1 = 1;
    }
   if (dy1 > 0) {
     dy1 += 1;
      }
      if (dy1 < 0) {
      dy1 -= 1;
      }
      if (dy1 == 0) {
     dy1 = 1;
    }
    if (dx2 > 0) {
     dx2 += 1;
    }
    if (dx2 < 0) {
      dx2 -= 1;
    }
    if (dx2 == 0) {
     dx2 = 1;
    }
    if (dy2 > 0) {
     dy2 += 1;
    }
    if (dy2 < 0) {
      dy2 -= 1;
    }
    if (dy2 == 0) {
     dy2 = 1;
    }
    if (dx3 > 0) {
     dx3 += 1;
    }
    if (dx3 < 0) {
      dx3 -= 1;
    }
    if (dx3 == 0) {
     dx3 = 1;
    }
    if (dy3 > 0) {
     dy3 += 1;
    }
    if (dy3 < 0) {
      dy3 -= 1;
    }
    if (dy3 == 0) {
     dy3 = 1;
    }
   
     dscore += .1;
  }
  if (key == 's') {
   if (dx1 > 0) {
     dx1 -= 1;
    }
    if (dx1 < 0) {
      dx1 += 1;
    }
   if (dy1 > 0) {
     dy1 -= 1;
      }
      if (dy1 < 0) {
      dy1 += 1;
      }
    if (dx2 > 0) {
     dx2 -= 1;
    }
    if (dx2 < 0) {
      dx2 += 1;
    }
    if (dy2 > 0) {
     dy2 -= 1;
    }
    if (dy2 < 0) {
      dy2 += 1;
    }
    if (dx3 > 0) {
     dx3 -= 1;
    }
    if (dx3 < 0) {
      dx3 += 1;
    }
    if (dy3 > 0) {
     dy3 -= 1;
    }
    if (dy3 < 0) {
      dy3 += 1;
    }
     
    dscore -= .05;
  }
}
 
 
void moveFig1() {
 x1 += dx1;
  y1 += dy1;
 if (y1 > height || y1 < 0) {
  dy1 = -dy1;
 }
  
 if (x1 > width || x1 < 0) {
  dx1 = -dx1;
 }
}
 
void fig1() {
  fill(255);
  ellipse( x1,y1, sz1,sz1);
  fill(245,93,42);
  ellipse( x1, y1, sz1*.5, sz1*.5);
}
 
void moveFig2() {
 x2 += dx2;
  y2 += dy2;
 if (y2 > height) {
  y2 = 0;
 }
 if (y2 < 0) {
  y2 = height;
  x2 = width;
 }
 if (x2 > width) {
  x2 = 0;
 }
 if (x2 < 0) {
  x2 = width;
 }
}
 
void fig2() {
 fill(255);
rect(x2,y2,sz2,sz2);
fill(245,93,42);
  rect( x2, y2, sz2*.5, sz2*.5);
 
}
 
void moveFig3() {
 x3 += dx3;
  y3 += dy3;
 if (y3 > height || y3 < 0) {
  dy3 = -dy3;
 }
 
 if (x3 > width || x3 < 0) {
  dx3 = -dx3;
 }
 
}
 
void fig3() {
 fill(255);
  ellipse( x3,y3, sz3,sz3);
  fill(245,93,42);
  ellipse( x3, y3, sz3*.5, sz3*.5);
}
 
void gameover() {
 if (collisions >= 5) {
   dscore = 0;
   fill(0);
  rect(width*.5, height*.5, width, height);
  fill(255);
  textSize(34);
  text("Game Over! :(" , width*.35, height*.5);
  text("Score: " + int(score), width*.28, height*.4);
  rect(width*.5, height*.7, 200,75);
  fill(0);
  text("Restart?" , width* .4, height*.72);
  if (mousePressed && mouseX < (width*.5+100) && mouseX > (width*.5 -100) && mouseY < (height*.7+37) && mouseY > (height*.7 -37)) {
   collisions = 0;
   playercolor = 0;
   score = 0;
   dscore = .02;
   x1 = 100;
   y1 = 100;
   sz1 = 20;
   dx1 = 5;
   dy1 = 2;
  
   x2 = 200;
   y2 = 100;
   sz2 = 40;
   dx2 = 2;
   dy2 = 5;
  
   x3 = 100;
   y3 = 500;
   sz3 = 20;
   dx3 = 3;
   dy3 = 3;
   d = width*.5;
  }
 }
}
