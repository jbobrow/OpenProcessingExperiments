
//This is sketch was written by langT.

float x, y, vx, vy, frx, fry, grav, xw, yw, t, circ, cposx, cposy;
int mode = 0;
int tmode = 0;


void setup() {
  size(600, 600); 
  vx = 2;
  vy = 0;
  x = 10;
  y = 50;
  frx = .998;
  fry = -.5; 
  grav = .1;
  mode = 0;
  tmode = 0;
  textSize(40);
  xw = 500;
  yw = 500;
  fill(225, 255, 0);
  circ = 50;
  cposx = width/2;
  cposy = height/2;
  color(0);
  text("This is a game Bogart made!!!", 30, 30);
  noStroke();

}

void draw() {

  if (mode == 0) {
    startScreen();
  }
  else if (mode == 1) {
    fun();
  }

    if (mode >= 3){
    winScreen();
    }
}


//screen modes
void startScreen() {
  background(255, 255, 0);
}

void winScreen() {
  text("You have won!", width/2, height/2);
}

//controls
void mouseReleased() {
  vy -= 3;
}

void keyPressed()
{
  if (key == 'a') {
    vx -= 3;
  }
  else if (key == 'd') {
    vx += 3;
  }
  else if (key == 's') {
    vy += 3;
  }
  else if (key == 'w') {
    vy -= 3;
    //cycle through modes modes
  }
  else if (key == ' ') {
    mode += 1;
  }//use keys to control variables
}


//physics
void fun() {
  fill(0, 0, 0, 1);

  fill(225);
   background(#519595);

  vy += grav;
  vx *= frx; 
  x += vx;
  y += vy;
  if (y > height) {
    y = height;
    vy *= fry;
  }
  if (x > width || x < 0) {
    x = width;
    vx *= -1;
  }
  ellipse(x, y, 5, 5 );

  text("Start", width/2, 30);  
  
  cposx += 1; 
    if(cposx > 570){
       cposx-=3;
      }
        if(cposx < 10){
           cposx+=3;
          }

  if ( dist(x, y, cposx, cposy) < circ) {
    tmode += 1;
    circ -= 7;
    cposx = random(50,550);
    cposy = random(50,550);
  }
  if(tmode == 7){
    mode += 3;
  }
  /* points counter
  print(tmode,"points");
  */
    ellipse(cposx, cposy, circ, circ);

}



