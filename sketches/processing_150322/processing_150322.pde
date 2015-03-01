
PFont f;
PFont deadF;
PFont beginning;
PFont name;
PFont scoreF;
PFont creator;
PFont helvetica;

float cx;
float cy;
float speed;
int lives;

float transparent;

float px;
float py;

float n;
float add;
int score;
int blah;
int wave;
int side;
int side2;
int type;

boolean rightKeyPressed;
boolean leftKeyPressed;
boolean upKeyPressed;
boolean downKeyPressed;
boolean right;
boolean left;
boolean movement;

boolean swing;
float swordLength;
float hitRad;

boolean pause;
boolean gameStart;

boolean waveChange;

boolean dead1;

boolean spawned;
boolean taken;

float[] ex = new float[1000];
float[] ey = new float[1000];

boolean[] slain = new boolean[1000];
boolean[] type1 = new boolean[1000];
boolean[] type2 = new boolean[1000];
boolean[] type3 = new boolean[1000];

void setup(){
  size(750,750);
  smooth();
  background(255);
  f = loadFont("ArnoldBoecklinStd-100.vlw");
  deadF = loadFont("BiometricJoe-100.vlw");
  beginning = loadFont("Bullpen3D-50.vlw");
  helvetica = loadFont("Helvetica-BoldOblique-50.vlw");
  name = loadFont("Borg9-50.vlw");
  scoreF = loadFont("Cracked-50.vlw");
  creator = loadFont("GoudyTextMTStd-50.vlw");
  cx = width/2;
  cy =  height/2;
  rightKeyPressed = false;
  leftKeyPressed = false;
  upKeyPressed = false;
  downKeyPressed = false;
  right = false;
  left = true;
  movement = true;
  n = 1;
  blah = 0;
  wave = 1;
  add = 0.0625;
  for(int i = 0; i < 1000; i++){
    slain[i] = false;
  }
  pause = true;
  spawned = false;
  taken = false;
  speed = 2;
  lives = 3;
  dead1 = false;
  swordLength = 0;
  hitRad = 0;
  gameStart = false;
  score = 0;
  type = 0;
  for(int i = 0; i < 1000; i++){
    type1[i] = true;
    type2[i] = false;
    type3[i] = false;
    transparent = 0;
  }
}

void draw(){
  smooth();
  background(165,157,157);
  
  if(!dead1){
    
    backgroundDesign();
  
  if(!pause){
    
    score++;
  
  characterDraw();
  
  keysPressed();
  
  enemyDraw();
  enemyMovement();
  
  powerUps();
  
  }else{
    
    if(gameStart){
      
    pausedText();
    
    }
    
    if(!gameStart){
      
      background(0);
      noFill();
      strokeWeight(5);
      stroke(255);
      rectMode(CENTER);
      
      rect(width/2,height/2 + 20,700,700);
      
      fill(255);
      textFont(helvetica);
      textSize(20);
      
      text("MOVE WITH WASD/ARROW KEYS",50,100);
      text("LEFT CLICK TO ATTACK",50,150);
      
      fill(0);
      stroke(255,10,10);
    
      ellipse(40,190,10,10);
      rect(55,205,10,10);
      ellipse(80,195,20,20);
      
      fill(255);
      
      text("ENEMIES COME IN WAVES",100,200);
      
      ellipseMode(CENTER);
      fill(0,255,0);
      stroke(0);
      strokeWeight(0.5);
      
      ellipse(50,245,10,10);
      
      ellipseMode(CENTER);
      fill(0,0,255);
      stroke(0);
      strokeWeight(0.5);
      
      ellipse(50,295,10,10);
      
      ellipseMode(CENTER);
      fill(0,200,200);
      stroke(0);
      strokeWeight(0.5);
      
      ellipse(50,345,10,10);
      
      fill(255);
      
      text("GREEN POWER-UPS MAKE YOU FASTER",100,250);
      text("BLUE POWER-UPS GIVE YOU MORE LIVES",100,300);
      text("TURQUOISE POWER-UPS MAKE YOU HIT HARDER",100,350);
      text("ATTACK POWER-UPS TO GAIN THE EFFECTS",50,400);
      text("YOU GAIN 1 LIFE AFTER EVERY WAVE",50,450);
      
      textSize(30);
      
      text("LEFT CLICK TO BEGIN WAVE 1",width/2 - 250,700);
      
      textSize(20);
      
      text("PRESS P TO PAUSE AND DISPLAY YOUR CURRENT SCORE",50,500);
      text("THE SCREEN GETS DARKER THE CLOSER YOU ARE TO DEATH",50,550);
      
      fill(225,10,10);
      textFont(name);
      textSize(50);
      
      text("N E C R O S I S",width/2 - 180, 40);
      
      textFont(creator);
      textSize(25);
      
      text("CREATED BY: LOADING GAMES",width/2 - 90,730);
    }
    
  }
  
  }else{
    
    dead();
    
  }
  
}


void backgroundDesign(){
    
  background(165,157,157);
  
  stroke(2,70,17);
  strokeWeight(5);
  
  line(512,367,515,375);
  line(515,375,518,370);
  line(518,370,521,375);
  line(521,375,524,370);
  line(524,367,527,375);
  line(527,375,530,370);
  
  line(376,25,380,20);
  line(380,20,383,26);
  line(383,26,388,21);
  line(388,21,390,27);
  line(390,27,393,23);
  line(393,23,396,25);
  
  line(20,412,20,416);
  line(24,416,28,412);
  line(28,412,31,417);
  line(31,417,35,413);
  line(35,413,39,417);
  line(39,417,42,412);
  
  line(216,690,215,694);
  line(219,694,223,690);
  line(223,690,230,695);
  line(230,695,233,691);
  line(233,691,237,694);
  line(237,694,240,690);
  
  rectMode(CORNER);
  noStroke();
  fill(0,transparent);
  
  rect(0,0,750,750);
  
}


void characterDraw(){
  
  if(!swing){
    
  //setup for character
  stroke(0);
  strokeWeight(5);
  ellipseMode(CENTER);
  fill(255);
  
  //torso
  line(cx, cy - 10, cx, cy + 20);
  
  //legs
  line(cx, cy + 20, cx - 10, cy + 40);
  line(cx, cy + 20, cx + 10, cy + 40);
  
  //arms
  line(cx, cy, cx + 20, cy + 7);
  line(cx, cy, cx - 20, cy + 7);
  
  //head
  ellipse(cx, cy - 25, 30, 30);
  
  //eyes setup
  fill(150,10,10);
  strokeWeight(2);
  stroke(0);
  
  //eyes
  ellipse(cx + 5, cy - 27, 7, 7);
  ellipse(cx - 5, cy - 27, 7, 7);
  
  //sword setup
  stroke(100,100,100);
  strokeWeight(3);
  noFill();
  
  //sword
  if(right){
    
    line(cx + 20, cy + 7, cx + 35 + swordLength, cy - 37 - swordLength);
    line(cx + 18, cy - 9, cx + 28, cy + 3);
    
  }else if(left){
    
    line(cx - 20, cy + 7, cx - 35 - swordLength, cy - 37 - swordLength);
    line(cx - 18, cy - 9, cx - 28, cy + 3);
  }
  
  }else if(swing){
    
  //setup for character
  stroke(0);
  strokeWeight(5);
  ellipseMode(CENTER);
  fill(255);
  
  //torso
  line(cx, cy - 10, cx, cy + 20);
  
  //legs
  line(cx, cy + 20, cx - 10, cy + 40);
  line(cx, cy + 20, cx + 10, cy + 40);
  
  //arms
  line(cx, cy, cx + 20, cy + 7);
  line(cx, cy, cx - 20, cy + 7);
  
  //head
  ellipse(cx, cy - 25, 30, 30);
  
  //eyes setup
  fill(150,10,10);
  strokeWeight(2);
  stroke(0);
  
  //eyes
  ellipse(cx + 5, cy - 27, 7, 7);
  ellipse(cx - 5, cy - 27, 7, 7);
  
  //sword setup
  stroke(100,100,100);
  strokeWeight(3);
  noFill();
  
  //sword
  if(right){
    
    line(cx + 20, cy + 7, cx + 65 + (swordLength * 2), cy);
    line(cx + 27, cy, cx + 28, cy + 12);
    
  }else if(left){
    
    line(cx - 20, cy + 7, cx - 65 - (swordLength * 2), cy);
    line(cx - 27, cy, cx - 28, cy + 12);
    
  }
  }
  
  for(int i = 0; i < n; i++){
    if(dist(cx,cy,ex[i],ey[i]) < 30 || dist(cx,cy - 25,ex[i],ey[i]) < 30){
      lives -= 1;
      slain[i] = true;
      n -= 0.2;
    }
  }
  
  if(lives >= 3){
    transparent = 0;
  }else if(lives == 2){
    transparent = 75;
  }else if(lives == 1){
    transparent = 150;
  }else if(lives == 0){
    transparent = 200;
  }
  
  if(lives < 0){
    dead1 = true;
  }
  
  textFont(f);
  textSize(20);
  fill(0);
  
  text("LIVES: " + lives, 650, 740);
    
}


void dead(){
  if(dead1){
    
    fill(200,0,50);
    textFont(deadF);
    textSize(100);
    
    background(0);
    
    text("YOU DIED...",width/2 - 200, height/2);
    
    textFont(scoreF);
    textSize(50);
      
    text("SCORE: " + score,width/2 - 150, height/2 + 100);
    
    textFont(beginning);
    fill(255);
    textSize(30);
    
    text("LEFT CLICK TO RESTART",width/2 - 200,730);
    
    textFont(creator);
    textSize(25);
    fill(175,10,10);
      
    text("CREATED BY: LOADING GAMES",width/2 - 90,20);
  }
}


void enemyDraw(){
  
  for(int i = 0; i < n; i++){
  
    if(slain[i] || waveChange){
    
      side = int(random(0,4));
    
    if(side == 0){
      ex[i] = random(-250,0);
      ey[i] = random(-250,750);
    }else if(side == 1){
      ex[i] = random(0,1000);
      ey[i] = random(-250,0);
    }else if(side == 2){
      ex[i] = random(750,1000);
      ey[i] = random(0,1000);
    }else if(side == 3){
      ex[i] = random(-250,750);
      ey[i] = random(750,1000);
    }
    
    if(wave > 3){
    type = int(random(0,12));
    }
    
    fill(0);
    stroke(255,10,10);
    ellipseMode(CENTER);
    rectMode(CENTER);
    
    if(type < 9){
    
      type1[i] = true;
      type2[i] = false;
      type3[i] = false;
    ellipse(ex[i],ey[i],10,10);
    
    }else if(type < 11){
      
      type2[i] = true;
      type1[i] = false;
      type3[i] = false;
      rect(ex[i],ey[i],10,10);
      
    }else if(type < 12){
      
      type3[i] = true;
      type2[i] = false;
      type1[i] = false;
      ellipse(ex[i],ey[i],20,20);
      
    }
      
    score += 10;
    
    if(waveChange){
      score += 1000;
    }
    
    if(slain[i]){
    n += 0.2;
    }
    
    println(n);
    println(swordLength);
    
    if(n > wave * 3 + add && n < wave * 3 + add + 0.2){
      pause = true;
      waveChange = true;
      wave++;
      add *= 2;
      lives++;
    }
    
    slain[i] = false;
    }
    
    fill(0);
    stroke(255,10,10);
    ellipseMode(CENTER);
    rectMode(CENTER);
    
    if(type1[i]){
      ellipse(ex[i],ey[i],10,10);
    }else if(type2[i]){
      rect(ex[i],ey[i],10,10);
    }else if(type3[i]){
      ellipse(ex[i],ey[i],20,20);
    }
  }
}


void enemyMovement(){
  
  for(int i = 0; i < n; i++){
    
    if(ex[i] > cx){
      
      if(type1[i]){
        
      ex[i] -= 1;
      
      }else if(type2[i]){
        
        ex[i] -= 1.25;
        
      }else if(type3[i]){
        
        ex[i] -= 1.5;
        
      }
      
    }else if(ex[i] < cx){
      
      if(type1[i]){
        
      ex[i] += 1;
      
      }else if(type2[i]){
        
        ex[i] += 1.25;
        
      }else if(type3[i]){
        
        ex[i] += 1.5;
        
      }
    }
    
    if(ey[i] > cy){
      
      if(type1[i]){
        
      ey[i] -= 1;
      
      }else if(type2[i]){
        
        ey[i] -= 1.25;
        
      }else if(type3[i]){
        
        ey[i] -= 1.5;
        
      }
      
    }else if(ey[i] < cy){
      
     if(type1[i]){
       
      ey[i] += 1;
      
      }else if(type2[i]){
        
        ey[i] += 1.25;
        
      }else if(type3[i]){
        
        ey[i] += 1.5;
        
      }
    }
    
    if(swing){
      if(right){
        if(dist(cx + 42.5, cy + 3.5, ex[i], ey[i]) < 35 + hitRad){
          slain[i] = true;
        }
      }else if(left){
        if(dist(cx - 42.5, cy + 3.5, ex[i], ey[i]) < 35 + hitRad){
          slain[i] = true;
        }
      }
    }
  }
}


void keyPressed(){
  
  if(movement){
  
    if(key == CODED){
      if(keyCode == RIGHT){
      
        if(cx < 710){
        rightKeyPressed = true;
        leftKeyPressed = false;
        left = false;
        right = true;
        }
      
      }else if(keyCode == LEFT){
      
        if(cx > 40){
        rightKeyPressed = false;
        leftKeyPressed = true;
        right = false;
        left = true;
        }
      
      }else if(keyCode == UP){
        
        if(cy > 40){
          upKeyPressed = true;
          downKeyPressed = false;
        }
        
      }else if(keyCode == DOWN){
        
        if(cy < 710){
          upKeyPressed = false;
          downKeyPressed = true;
        }
        
      }
    }
    if(key == 'd' || key == 'D'){
      
        rightKeyPressed = true;
        leftKeyPressed = false;
        left = false;
        right = true;
      
      }else if(key == 'a' || key == 'A'){
      
        rightKeyPressed = false;
        leftKeyPressed = true;
        right = false;
        left = true;
      
      }else if(key == 'w' || key == 'W'){
        
          upKeyPressed = true;
          downKeyPressed = false;
        
      }else if(key == 's' || key == 'S'){
        
          upKeyPressed = false;
          downKeyPressed = true;
        
      }else if(key == 'p' || key == 'P'){
        if(pause){
          
          if(waveChange){
            waveChange = false;
          }
          
          if(!gameStart){
            gameStart = true;
          }
          
          pause = false;
        }else if(!pause){
          pause = true;
        }
      }
    }
  }
  
  
  void keyReleased(){
  if(key == CODED){
    
    if(keyCode == RIGHT){
      rightKeyPressed = false;
    }
    
    if(keyCode == LEFT){
      leftKeyPressed = false;
    }
    
    if(keyCode == UP){
      upKeyPressed = false;
    }
    
    if(keyCode == DOWN){
      downKeyPressed = false;
    }
    
  }
  
  if(key == 'd' || key == 'D'){
    rightKeyPressed = false;
  }
  
  if(key == 'a' || key == 'A'){
    leftKeyPressed = false;
  }
  
  if(key == 'w' || key == 'W'){
    upKeyPressed = false;
  }
  
  if(key == 's' || key == 'S'){
    downKeyPressed = false;
  }
  
}


void keysPressed(){
  
  if(movement){
  
  if(rightKeyPressed){
    
    if(cx < 710){
    cx += speed;
    }
    
  }
  
  if(leftKeyPressed){
    
    if(cx > 40){
    cx -= speed;
    }
    
  }
  
  if(upKeyPressed){
    
    if(cy > 40){
    cy -= speed;
    }
    
  }
  
  if(downKeyPressed){
    
    if(cy < 710){
    cy += speed;
    }
  }
  }
}


void mousePressed(){
  swing = true;
  
  movement = false;
  
  if(dead1){
    dead1 = false;
    
    restart();
  }
  
  if(!gameStart){
    gameStart = true;
    pause = false;
  }
  
  if(waveChange){
    waveChange = false;
    pause = false;
  }
  
}


void mouseReleased(){
  swing = false;
  
  movement = true;
}


void pausedText(){
  if(pause){
    if(waveChange){
      
      fill(10,200,200);
      stroke(250,200,50);
      strokeWeight(10);
      rectMode(CENTER);
      
      rect(width/2,height/2,500,250);
      
      fill(250,200,50);
      textFont(f);
      textSize(100);
      text("WAVE " + wave,width/2 - 200,height/2);
      
      for(int i = 0; i < n; i++){
    
      side = int(random(0,4));
    
    if(side == 0){
      ex[i] = random(-250,0);
      ey[i] = random(-250,750);
    }else if(side == 1){
      ex[i] = random(0,1000);
      ey[i] = random(-250,0);
    }else if(side == 2){
      ex[i] = random(750,1000);
      ey[i] = random(0,1000);
    }else if(side == 3){
      ex[i] = random(-250,750);
      ey[i] = random(750,1000);
    }
      }
      
      side2 = int(random(0,4));
    
    if(side2 == 0){
      px = random(-250,0);
      py = random(0,750);
    }else if(side2 == 1){
      px = random(0,750);
      py = random(-250,0);
    }else if(side2 == 2){
      px = random(750,1000);
      py = random(0,750);
    }else if(side2 == 3){
      px = random(0,750);
      py = random(750,1000);
    }
      
    }else{
      
      fill(0);
      textFont(f);
      textSize(100);
      
      text("PAUSED",width/2-200,height/2);
      
      textFont(scoreF);
      textSize(50);
      
      text("SCORE: " + score,width/2 - 150, height/2 + 100);
      
    }
  }
}


void powerUps(){
  if(wave > 2){
    
    if(!spawned){
    blah = int(random(0,500));
    
    side2 = int(random(0,4));
    
    if(side2 == 0){
      px = random(-250,0);
      py = random(0,750);
    }else if(side2 == 1){
      px = random(0,750);
      py = random(-250,0);
    }else if(side2 == 2){
      px = random(750,1000);
      py = random(0,750);
    }else if(side2 == 3){
      px = random(0,750);
      py = random(750,1000);
      
      taken = false;
    }
    }
    
    if(blah == 0){
      
      spawned = true;
      
      ellipseMode(CENTER);
      fill(0,255,0);
      stroke(0);
      strokeWeight(0.5);
      
      ellipse(px,py,10,10);
    
    if(side2 == 0){
      px += wave;
      if(px > 760 || taken){
        spawned = false;
      }
    }else if(side2 == 1){
      py += wave;
      if(py > 760 || taken){
        spawned = false;
      }
    }else if(side2 == 2){
      px -= wave;
      if(px < -10 || taken){
        spawned = false;
      }
    }else if(side2 == 3){
      py -= wave;
      if(py < -10 || taken){
       spawned = false;
      }
    }
    
    if(swing){
      if(right && !taken){
        if(dist(cx + 42.5, cy + 3.5, px, py) < 35 + hitRad){
          taken = true;
          speed += 0.25;
          if(taken){
            spawned = false;
          }
        }
      }else if(left && !taken){
        if(dist(cx - 42.5, cy + 3.5, px, py) < 35 + hitRad){
          taken = true;
          speed += 0.25;
          if(taken){
            spawned = false;
          }
        }
      }
    }
      
    }
    
    
    if(blah == 1){
      
      spawned = true;
      
      ellipseMode(CENTER);
      fill(0,0,255);
      stroke(0);
      strokeWeight(0.5);
      
      ellipse(px,py,10,10);
    
    if(side2 == 0){
      px += wave;
      if(px > 760 || taken){
        spawned = false;
      }
    }else if(side2 == 1){
      py += wave;
      if(py > 760 || taken){
        spawned = false;
      }
    }else if(side2 == 2){
      px -= wave;
      if(px < -10 || taken){
        spawned = false;
      }
    }else if(side2 == 3){
      py -= wave;
      if(py < -10 || taken){
       spawned = false;
      }
    }
    
    if(swing){
      if(right && !taken){
        if(dist(cx + 42.5, cy + 3.5, px, py) < 35 + hitRad){
          taken = true;
          lives++;
          if(taken){
            spawned = false;
          }
        }
      }else if(left && !taken){
        if(dist(cx - 42.5, cy + 3.5, px, py) < 35 + hitRad){
          taken = true;
          lives++;
          if(taken){
            spawned = false;
          }
        }
      }
    }
      
    }
    
    if(swordLength <= 8){
      
    if(blah == 2){
      spawned = true;
      
      ellipseMode(CENTER);
      fill(0,200,200);
      stroke(0);
      strokeWeight(0.5);
      
      ellipse(px,py,10,10);
    
    if(side2 == 0){
      px += wave;
      if(px > 760 || taken){
        spawned = false;
      }
    }else if(side2 == 1){
      py += wave;
      if(py > 760 || taken){
        spawned = false;
      }
    }else if(side2 == 2){
      px -= wave;
      if(px < -10 || taken){
        spawned = false;
      }
    }else if(side2 == 3){
      py -= wave;
      if(py < -10 || taken){
       spawned = false;
      }
    }
    
    if(swing){
      if(right && !taken){
        if(dist(cx + 42.5, cy + 3.5, px, py) < 35 + hitRad){
          taken = true;
          swordLength += 2;
          hitRad += 2.5;
          if(taken){
            spawned = false;
          }
        }
      }else if(left && !taken){
        if(dist(cx - 42.5, cy + 3.5, px, py) < 35 + hitRad){
          taken = true;
          swordLength += 2;
          hitRad += 2.5;
          if(taken){
            spawned = false;
          }
        }
      }
    }
    }
      
    }
  }
} 


void restart(){
  
  background(255);
  cx = width/2;
  cy =  height/2;
  rightKeyPressed = false;
  leftKeyPressed = false;
  upKeyPressed = false;
  downKeyPressed = false;
  right = false;
  left = true;
  movement = true;
  n = 1;
  blah = 0;
  wave = 1;
  add = 0.0625;
  for(int i = 0; i < 100; i++){
    slain[i] = false;
  }
  pause = false;
  spawned = false;
  taken = false;
  speed = 2;
  lives = 3;
  dead1 = false;
  swordLength = 0;
  hitRad = 0;
  score = 0;
  type = 1;
  for(int i = 0; i < 1000; i++){
    type1[i] = true;
    type2[i] = false;
    type3[i] = false;
    transparent = 255;
    
    side = int(random(0,4));
    
    if(side == 0){
      ex[i] = random(-250,0);
      ey[i] = random(-250,750);
    }else if(side == 1){
      ex[i] = random(0,1000);
      ey[i] = random(-250,0);
    }else if(side == 2){
      ex[i] = random(750,1000);
      ey[i] = random(0,1000);
    }else if(side == 3){
      ex[i] = random(-250,750);
      ey[i] = random(750,1000);
    }
  }
  
}
