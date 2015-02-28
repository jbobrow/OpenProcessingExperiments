
PShape board;
PFont font, font2;
PShape ramp;
PShape cone;
int y = 0;
int tl = 220;
int v = 250;
int bl = 280;
int mode = 0;

int centerX = 60;

float x = 0;
color c;
float timer;
float speed = 3;
int lives;
boolean gameover;
boolean crossfinish;
float angle = 0;

void startover () {
  y = 0;
  tl = 220;
  v = 250;
  bl = 280;
  mode = 0;
  x = 0; 
  timer=0;
  speed = 3;
  lives=0;
  gameover = false;
  crossfinish = false;
  angle =0;
}




void setup () {
  size (800, 480);
 // shapeMode(CENTER);
  smooth ();
  angle = 0;
  board = loadShape ("gameboard.svg");
  ramp = loadShape ("ramp.svg");
  cone = loadShape ("cone.svg");
  font = loadFont ("ArnoPro-BoldItalic-48.vlw");
  font2 = loadFont ("ArnoPro-Bold-48.vlw");
  timer = 0;
  lives = 0;
  gameover = false;
  crossfinish = false;
}

void intro () {
  background (130, 200, 245);
  textFont (font);
  textSize (50);
  fill (0);
  text ("PRESS ANY KEY TO START", 120, 125);
  shape (cone, 100, 220); 
  shape (ramp, 80, 250);
  textFont (font2);
  textSize (22);
  text ("USE UP AND DOWN ARROW KEYS TO STEER BOAT THROUGH COURSE", 50, 200);
  text ("Penalty Points. Reach 100 and GAME OVER", 300, 275);
  text ("Speed Boost", 350, 370);
  gameover = false;
  if (keyPressed) {
    mode = 1;
    game ();
  }
}

void game () {
  shape (board, x, 0);

  //color mc = get(mouseX, mouseY);
  //println(red(mc) + " " + green(mc) + " " + blue(mc));

  move ();
  x = x-speed;
  //c = get (140, v); 
  //c = get (100, tl);
  //c = get (100, bl);
  strokeWeight (3.5);
  stroke (185, 16,10);
  fill (255);
  int centerY = (tl+bl)/2;
  // Boat Stuff
  pushMatrix();
  beginShape ();
  translate(centerX,centerY);
  rotate(angle);
  vertex (20-centerX, tl-centerY);
  vertex (100-centerX, tl-centerY);
  vertex (140-centerX, v-centerY);
  vertex (100-centerX, bl-centerY);
  vertex (20-centerX, bl-centerY);
  vertex (20-centerX, tl-centerY);
  endShape ();
  popMatrix();
  
  //println("angle is: " + angle);
  
  
  timer++;
  fill (0);
  textSize (34);
  float realtime = timer/60;
  if(crossfinish == true)
    textSize(90);
  text (realtime, 50, 450);
  textSize(34);
  text (lives, 750, 450);
  if (lives >= 100) {
    x = 0;
    timer--;
    fill (0);
    textSize (60);
    text ("GAME OVER", 200, 100);
    textSize (40);
    text ("CLICK TO START OVER", 170, 300);
    gameover = true;
  } 
  if (gameover && mousePressed) {
    startover (); 
    mode = 0;
    intro ();
  }
}


void draw () {
  if (mode==0) {
    intro ();
  }
  if (mode ==1) {
    game ();

    //println (frameCount + " "+ speed);
  }
}

void mousePressed () {
  if (mode==0) {
    mode = 1;
  }
}

void move () {
  if (keyPressed){
    if (key == CODED) {
      if (keyCode == UP) {
        
        angle-=0.01;
        if(angle<-0.4)
          angle+=0.01;
          
          
        if(tl>-20){  
        tl = tl -1;
        bl = bl -1;
        v = v-1;
        }
      } 
      else if (keyCode == DOWN) {
        angle+=0.01;
        if(angle>0.4)
          angle-=0.01;
          
        if(bl<480){
        tl = tl +1;
        bl = bl +1;
        v = v + 1;}
      }
    }}
    else{
      if(angle>0)
        angle-=0.01;
      if(angle<0)
        angle+=0.01;
    }
  checkhitramp ();
  checkhitbouy ();
  checkhitfinish ();
}

void checkhitramp () {
 c = get (140, v); 
  if (red (c) ==37 && green (c)==33 && blue (c)==90) {
    speed = speed+2;
  }
  else { 
    if(speed > 3)
      speed -= 0.4;
    if (speed < 3)
      speed = 3;
  }
  c = get (100, tl);
  if (red (c) ==37 && green (c)==33 && blue (c)==90) {
    speed = speed+2;
  }
  else { 
    if(speed > 3)
      speed -= 0.4;
    if (speed < 3)
      speed = 3;
  }
  c = get (100, bl);
  if (red (c) ==37 && green (c)==33 && blue (c)==90) {
    speed = speed+2;
  }
  else { 
    if(speed > 3)
      speed -= 0.4;
    if (speed < 3)
      speed = 3;
  }
}


void checkhitbouy () {
  c = get (140, v); 
  if (red (c) ==247 && green (c)==151 && blue (c)==32) {
    lives+=4;
  }
  c = get (100, tl); 
  if (red (c) ==247 && green (c)==151 && blue (c)==32) {
    lives+=4;
  }
  c = get (100, bl);
  if (red (c) ==247 && green (c)==151 && blue (c)==32) {
    lives+=4;
  }
  c = get (20, tl);
  if (red (c) ==247 && green (c)==151 && blue (c)==32) {
    lives+=3;
  }
  c = get (20, bl);
   if (red (c) ==247 && green (c)==151 && blue (c)==32) {
    lives+=3;
   }
}

void checkhitfinish () {
  c = get (140, v); 
  if (red (c) == 35 && green (c) == 31 && blue (c) == 32) {
    crossfinish = true;
    
  } 
  if (crossfinish)
 {
    text ("YOU WON!", 400, 200);
    text ("CLICK TO PLAY AGAIN", 400, 300);
    timer--;

    x = x+speed;
    if(mousePressed){
      startover (); 
      mode = 0;
      intro ();
    }
}}


