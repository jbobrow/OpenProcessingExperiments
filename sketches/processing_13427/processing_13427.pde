
//based on bouncy balls code from keith peters

PFont font;

int numLetters = 26;
float spring = 0.025;
float gravity = 0.01;
float friction = -0.7;

Letter[] letters = new Letter [numLetters];
char[] letterarray  = {
  'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
};

int [] letterColor = {
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};

void setup () {
  size (400, 600);
  font = loadFont ("Batang-48.vlw");
  textFont (font, 48);
  for (int i = 0; i < numLetters; i++) {
    letters [i] = new Letter(letterarray[i],random(width), random(height), 48, i, letters);
  }
}

void draw () {
  background (0);

  for (int i = 0; i < numLetters; i++) {
    letters [i].collide ();
    letters [i].move ();
    letters [i].display (i);
  }
}

class Letter {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;

  Letter [] others;

  char character;

  Letter (char cin, float xin, float yin, float din, int idin, Letter [] oin) {
    character = cin;
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  }

  void collide() {
    for (int i = 0; i < others.length; i++) {
      // as long as the letter i'm looking at is not me, check for collisions
      if (i != id)
        {
      
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 

        // This is where we write code for when things collide
        // change the color
        // change the size

        if (character == 'd') {
          letterColor[3] = letterColor[3] + 1;
          //delay (25);
          //others[i].letterColor = color(255,0,0);
        }


        if (character == 'o') {
          letterColor[14] = letterColor[14] + 1;
          //delay (25);
          //others[i].letterColor = color(255,0,0);
        }

        if (character == 'r') {
          letterColor[17] = letterColor[17] + 1;
          //delay (25);
          //others[i].letterColor = color(255,0,0);
        }


        if (character == 'w') {
          letterColor[22] = letterColor[22] + 1;
          //delay (25);
          //others[i].letterColor = color(255,0,0);
        }


        // What this is doing below is changing the velocity
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }
    }
  }

  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }

  void display(int n) {
 /*   if(letterColor[n] == 1) {
      fill (255,0,0);
      text(character,x,y);
    }
    else {
      fill (255,255,255);
      text(character,x,y);
    }
    */
    
    fill (255, 255-letterColor[n], 255-letterColor[n]);
    text(character,x,y);
    
  }
}


