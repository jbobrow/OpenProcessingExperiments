
// Samantha Ticknor
// andrew id: sticknor
// copyright 2013
// Fish images borrowed from Jen Skelley
// papercrave.com/jen-skelley-fish-screen-print/

int value = 0;

float fish1speed, fish2speed, fish3speed, fish4speed, bubblex,
      x1, y1, x2, y2, x3, y3, x4, y4, 
      speed1, speed2, speed3, speed4,
      bubx1, bubx2, bubx3,
      buby1, buby2, buby3, 
      bubspeed1, bubspeed2, bubspeed3;
      
boolean fish1left, fish2left, fish3left, fish4left, vertical,
        fish1up, fish2up, fish3up, fish4up;

PImage left1, right1, left2, right2, 
       left3, right3, left4, right4, bubble;

void setup( )
{
  size(400, 400);   
  left1 = loadImage("fish1left.png");
  right1 = loadImage("fish1right.png");
  left2 = loadImage("fish2left.png");
  right2 = loadImage("fish2right.png");
  left3 = loadImage("fish3left.png");
  right3 = loadImage("fish3right.png");
  left4 = loadImage("fish4left.png");
  right4 = loadImage("fish4right.png");
  bubble = loadImage("bubble.png");
  
  vertical = false;
  
  bubx1 = random(50);
  bubx2 = random(150, 300);
  bubx3 = random(300, 350);
  buby1 = 400;
  buby2 = 400;
  buby3 = 400;
  bubspeed1 = random(1, 3);
  bubspeed2 = random(1, 3);
  bubspeed3 = random(1, 3);
  
  fish1left = true;
  fish1speed = random(1, 4);
  x1 = random(width);
  y1 = random(75);
  
  fish2left = false;
  fish2speed = random(1, 4);
  x2 = random(width);
  y2 = random(75, 150);
  
  fish3left = true;
  fish3speed = random(1, 4);
  x3 = random(width);
  y3 = random(150, 250);
  
  fish4left = false;
  fish4speed = random(1, 4);
  x4 = random(width);
  y4 = random(250, 350); 
}

void draw( )
{
   drawBackground( );
   drawBubble(bubx1, buby1);
   drawBubble(bubx2, buby2);
   drawBubble(bubx3, buby3);
   moveBubbles();
   drawFish(1, fish1left, x1, y1);
   drawFish(2, fish2left, x2, y2);
   drawFish(3, fish3left, x3, y3);
   drawFish(4, fish4left, x4, y4);
   moveFishiesH();
   moveFishiesV();
}

void drawBackground( )
{
  fill(196, 231, 240);
  rect(0, 0, width, height);
}

void drawBubble(float x, float y)
{
  image(bubble, x, y);
}

void moveBubbles()
{
  if (buby1 < 0){
    buby1 = height;}
  else{
    buby1 = buby1-bubspeed1;}
   if (buby2 < 0){
    buby2 = height;}
  else{
    buby2 = buby2-bubspeed2;;}
   if (buby3 < 0){
    buby3 = height;}
  else{
    buby3 = buby3-bubspeed3;}
}

void drawFish(float fish, boolean dir, float x, float y)
{
  if (fish == 1){
    if (dir == true){
      image(left1, x, y);
    }
    else{ 
      image(right1, x, y);
    }
  }
  else if (fish == 2){
    if (dir == true){
       image(left2, x, y);
    }
    else{ 
       image(right2, x, y);
    }
  }
  else if (fish == 3){
    if (dir == true){
        image(left3, x, y);
    }
    else{ 
        image(right3, x, y);
    }
  }
  else {
    if (dir == true){
      image(left4, x, y);
    }
    else{ 
      image(right4, x, y);
    }
  }
}

void moveFishiesH(){
  if (fish1left == true){
    x1=x1-fish1speed;
    if (x1 < -75){fish1left = false;}
  }
  if (fish1left == false){
    x1 =x1+fish1speed;
    if (x1 > 375){fish1left = true;}
  }
  if (fish2left == true){
    x2=x2-fish2speed;
    if (x2 < -75){fish2left = false;}
  }
  if (fish2left == false){
    x2 =x2+fish2speed;
    if (x2 > 350){fish2left = true;}
  }
  if (fish3left == true){
    x3=x3-fish3speed;
    if (x3 < -75){fish3left = false;}
  }
  if (fish3left == false){
    x3 =x3+fish3speed;
    if (x3 > 350){fish3left = true;}
  }
  if (fish4left == true){
    x4=x4-fish4speed;
    if (x4 < -75){fish4left = false;}
  }
  if (fish4left == false){
    x4 =x4+fish4speed;
    if (x4 > 350){fish4left = true;}
  }
}

void moveFishiesV(){
  if (vertical == true){
    if (fish1up == true){
      y1=y1-fish1speed;
      if (y1 < -75){fish1up = false;}
    }
    if (fish1up == false){
      y1 =y1+fish1speed;
      if (y1 > 375){fish1up = true;}
    }
    if (fish2up == true){
      y2=y2-fish2speed;
      if (y2 < -75){fish2up = false;}
    }
    if (fish2up == false){
      y2 =y2+fish2speed;
      if (y2 > 350){fish2up = true;}
    }
    if (fish3up == true){
      y3=y3-fish3speed;
      if (y3 < -75){fish3up = false;}
    }
    if (fish3up == false){
      y3 =y3+fish3speed;
      if (y3 > 350){fish3up = true;}
    }
    if (fish4up == true){
      y4=y4-fish4speed;
      if (y4 < -75){fish4up = false;}
    }
    if (fish4up == false){
      y4 =y4+fish4speed;
      if (y4 > 350){fish4up = true;}
    }
  }
}


void keyPressed() {
  vertical = false;
  
  bubx1 = random(50);
  bubx2 = random(150, 300);
  bubx3 = random(300, 350);
  buby1 = 400;
  buby2 = 400;
  buby3 = 400;
  bubspeed1 = random(1, 3);
  bubspeed2 = random(1, 3);
  bubspeed3 = random(1, 3);
  
  fish1left = true;
  fish1speed = random(1, 4);
  x1 = random(width);
  y1 = random(75);
  
  fish2left = false;
  fish2speed = random(1, 4);
  x2 = random(width);
  y2 = random(75, 150);
  
  fish3left = true;
  fish3speed = random(1, 4);
  x3 = random(width);
  y3 = random(150, 250);
  
  fish4left = false;
  fish4speed = random(1, 4);
  x4 = random(width);
  y4 = random(250, 350); 
}

void mousePressed() {
  if (vertical == true){
    vertical = false;
  }
  else {vertical = true;}
}

