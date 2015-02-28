
int score=0; 
int timer=10; 
float enemyX=0;
float enemyY=0; 
float enemy2X;
float enemy2Y;
int give = 100;
int timeLast = 0; 
 
void setup() {
  size(1000, 600); 
  smooth(); 
  timeLast=second(); 
  enemyX=random(1000); 
  enemyY=random(600); 
  enemy2X=random(600);
  enemy2Y=random(300);
  
}

boolean on=true; 
void draw() 
{ 
 
  
  if (timer>0) { 
    game(); 
  }
}
 
void game() { 
  if (second()!=timeLast) { 
    timeLast=second(); 
    timer-=1; 
  }
 if(frameCount% 10== 0) {
    if(on)
  background(224,0,0);
    else
  background(255,0,0);
    on = !on;
  }
  fill(255,175,0);
  rect(0,0,1000,60);
  fill(0);
  text("Score: "+score, 320, 50); 
  text("Timer: "+timer, 520, 50); 
  noStroke();
  fill(255,0,0); 
  rect(enemy2X, enemy2Y, give, give);
  ellipse(enemyX, enemyY, give, give); 
}
 
void mouseClicked() { 
  if (mouseX<enemyX+give && mouseX>enemyX-give) { 
    if (mouseY<enemyY+give && mouseY>enemyY-give) { 
      score+=1; 
      enemyX=random(1000); 
      enemyY=random(600);
    }
  }
if (mouseX<enemy2X+give && mouseX>enemy2X-give) { 
    if (mouseY<enemy2Y+give && mouseY>enemy2Y-give) { 
      score-=1; 
      enemy2X=random(1000); 
      enemy2Y=random(600); 
}
}

}
