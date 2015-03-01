
int one = 1;
int two = 2;
int three = 3;
int four = 4;
int five = 5;


frog[] frog1 = new frog[1];      // frogger
car[] bscars = new car[4];       // bottom slowcars
car[] bfcars = new car[3];       // bottom fast cars
car[] tscars = new car[5];       // topslow cars
car[] tfcars = new car[2];       // topfast cars
logs[] logs260 = new logs[four];//4];    // logs at 260
logs[] logs235 = new logs[two];//2];    // logs at 235
logs[] logs185 = new logs[three];//3];    // logs at 185
logs[] logs110 = new logs[two];//2];    // logs at 110
logs[] logs60 = new logs[three];//3];     // logs at 60
lilly[] lilly285 = new lilly[5]; // lillypad
lilly[] lilly210 = new lilly[2]; // lillypad
lilly[] lilly160 = new lilly[1]; // lillypad
lilly[] lilly135 = new lilly[2]; // lillypad
lilly[] lilly85 = new lilly[2];  //lillypad

fly [] scorefly = new fly[6];

//colors and midpoint of map for spawning
int blue;
int deepblue;
int gray;
int yellow;
int grass;
int frogC;
int brown;
int brownl;
int red;
int lilly;
float mp;
float startfrogx;

float cfy = 585;
float fy = cfy;
float fr = 10;
float fspeed = 25;
float cfx = startfrogx;
//float fx = cfx;
float lfx = cfx;
//float lfy;

int lives = 3;
int score = 4;



void setup() {
  size(700, 600); 
  mp = width/2;


  //setting up arrays for frog, cars, lillypads and logs
  for (int i = 0; i < frog1.length; i += 1) {
    frog1[i] = new frog(i+mp, 585, 10);
    startfrogx = i+mp;
  }
  for (int j = 0; j < bscars.length; j +=1) {
    bscars[j] = new car(j*220, 525, 50, 1.2);
  }
  for (int a = 0; a < bfcars.length; a +=1) {
    bfcars[a] = new car(a*200, 475, 50, 2.2);
  }
  for (int s = 0; s < tscars.length; s +=1) {
    tscars[s] = new car(s*150, 375, 50, 1.3);
  }
  for (int d = 0; d < tfcars.length; d +=1) {
    tfcars[d] = new car(d*400, 425, 80, 2.0);
  }
  for (int j = 0; j < logs260.length; j +=1) {
    logs260[j] = new logs(j*200, 260, .8, 2);
  }
  for (int j = 0; j < logs235.length; j +=1) {
    logs235[j] = new logs(j*300, 235, .4, 3);
  }
  for (int j = 0; j < logs185.length; j +=1) {
    logs185[j] = new logs(j*200, 185, 1.5, 3);
  }
  for (int j = 0; j < logs110.length; j +=1) {
    logs110[j] = new logs(j*300, 110, 1.3, 4);
  }
  for (int j = 0; j < logs60.length; j +=1) {
    logs60[j] = new logs(j*180, 60, .6, 2);
  }
  for (int j = 0; j < lilly285.length; j +=1) {
    lilly285[j] = new lilly(j*150, 285, -.5, 2);
  }
  for (int j = 0; j < lilly210.length; j +=1) {
    lilly210[j] = new lilly(j*375, 210, -1, 4);
  }
  for (int j = 0; j < lilly160.length; j +=1) {
    lilly160[j] = new lilly(j*375, 160, -1.1, 8);
  }
  for (int j = 0; j < lilly135.length; j +=1) {
    lilly135[j] = new lilly(j*400, 135, -.8, 3);
  }
  for (int j = 0; j < lilly85.length; j +=1) {
    lilly85[j] = new lilly(j*600, 85, -1.6, 5);
  }
  for (int f = 0; f < scorefly.length; f += 1) {
    scorefly[f] = new fly(f*(.1667*width), 30);
  }
  //scorefly = new fly(250,30);

  //defining colors
  blue = #66CCFF;
  deepblue = #0099CC;
  gray = #666666;
  yellow = #FFCC00;
  grass = #92CD00;
  frogC = #006400;
  brown = #663300;
  brownl= #E49135;
  lilly = #AAF200;
  red = #FF0000;
  smooth();
}


void draw() {

  //creating background
  rectMode(CENTER);
  noStroke();
  fill(grass);
  rect(mp, 25, width, 50);
  rect(mp, 575, width, 50);
  rect(mp, 325, width, 50);


  //water
  fill(deepblue);
  rect(mp, 175, width, 250);

  for (int i = 1; i <= 5; i +=1) {
    fill(deepblue);
    rect(((.1667*i)*width), 30, 40, 40);
    noStroke();
    fill(lilly);
    ellipse(((.1667*i)*width), 30, 40, 40);
    fill(deepblue);
    triangle(((.1667*i)*width), 25, ((.1667*i)*width)+20, 40, ((.1667*i)*width)+ 15, 25+25);
  }

  //highway
  fill(gray);
  rect(mp, 450, width, 200);
  //highway double lines
  stroke(yellow);
  line(0, 448, width, 448);
  line(0, 452, width, 452);
  //highway seperating lanes
  for (int i = 0; i< width+20; i +=20) {
    noStroke();
    fill(255);
    rect(i, 400, 10, 1);
    rect(i, 500, 10, 1);
  }
  //highway side road lines
  stroke(255);
  line(0, 352, width, 352);
  line(0, 548, width, 548);

  //drawing cars
  for (int j = 0; j < bscars.length; j+=1) {
    bscars[j].drive();
  }
  for (int a = 0; a < bfcars.length; a+=1) {
    bfcars[a].drive();
  }
  for (int s = 0; s < tscars.length; s +=1) {
    tscars[s].drive();
  }
  for (int d = 0; d < tfcars.length; d +=1) {
    tfcars[d].drive();
  }
  for (int j = 0; j < logs260.length; j +=1) {
    logs260[j].lfloat();
  }
  for (int j = 0; j < logs235.length; j +=1) {
    logs235[j].lfloat();
  }
  for (int j = 0; j < logs185.length; j +=1) {
    logs185[j].lfloat();
  }
  for (int j = 0; j < logs110.length; j +=1) {
    logs110[j].lfloat();
  }
  for (int j = 0; j < logs60.length; j +=1) {
    logs60[j].lfloat();
  }
  for (int j = 0; j < lilly285.length; j +=1) {
    lilly285[j].pad();
  }
  for (int j = 0; j < lilly210.length; j +=1) {
    lilly210[j].pad();
  }
  for (int j = 0; j < lilly160.length; j +=1) {
    lilly160[j].pad();
  }
  for (int j = 0; j < lilly135.length; j +=1) {
    lilly135[j].pad();
  }
  for (int j = 0; j < lilly85.length; j +=1) {
    lilly85[j].pad();
  }
  for (int f = 0; f < scorefly.length; f += 1) {
    scorefly[f].fly();
  }
  for (int i = 0; i < frog1.length; i+=1) {
    frog1[i].frog();
  }
  fill(200);
  rect(0+6.25, height/2, 12.5, height);
  rect(width - 6.25, height/2, 12.5, height);
  //println(clx);
  //printArray(logs260);
  textAlign(LEFT);
  textSize(20);
  fill(255);
  text("Lives", 610, 45);
  text(lives, 660, 45);
  text("Score", 20, 20);
  text(score, 25, 45);

  if (lives <= 0) {
    background(0);
    textAlign(CENTER);
    textSize(40);
    text("GAME OVER", width/2, height/2);
    textSize(28);
    text("Press ENTER to Play", width/2, (height/2)+40);
    restart();
  }
  //attempt to make levels harder as it goes along. no luck yet try amend arraylist to change arrays.
  if (score >= 5) {
     one = 1;
     two = 1;
     three = 1;
     four = 1;
     five = 1;
  }
}

void restart() {
  if (keyPressed) {
    if (key == ENTER) {
      lives = 3;
      score = 0;
      cfx = startfrogx;
      cfy = 585;
      draw();
    }
  }
}
class car {
  //global variables
  float ccx;
  float cx = ccx;
  float cy = 0;
  float cw = 50;
  float ch = cw/2;
  float speed;
  float one = random(0, 255); // initial cars at random color
  float two = random(0, 255);
  float three = random(0, 255);





  //Constructor
  car(float _cx, float _cy, float _cw, float _speed) {
    ccx = _cx;
    cy = _cy;
    cw = _cw;
    speed = _speed;
  }

  //Functions
  void drive() {
    display();
    move();
    collision();
  }

  void display() {
    rectMode(CENTER);
    if ((ccx-cw)>width) {
      ccx = 0-cw;
      one = random(0, 255); // rerandomize car color once leaves screen
      two = random(0, 255);
      three = random(0, 255);
    }
    if ((ccx+cw)<0) {
      ccx = width+cw;
      one = random(0, 255); // rerandomize car color once leaves screen
      two = random(0, 255);
      three = random(0, 255);
    }
    //fill(random(0,255),random(0,255), random(0,255)); //constantly random car color
    noStroke();
    fill(one, two, three);
    rect(ccx, cy, cw, ch); //car body
    fill(0);
    ellipse((ccx-(.25*cw)), cy+(ch/2), (.20*cw), 2); // 4 car tires
    ellipse((ccx-(.25*cw)), cy-(ch/2), (.20*cw), 2);
    ellipse((ccx+(.25*cw)), cy+(ch/2), (.20*cw), 2);
    ellipse((ccx+(.25*cw)), cy-(ch/2), (.20*cw), 2);
  }

  void move() {
    if (cy == 525) {
      ccx = ccx+speed; //movement of car based on array
      fill(yellow);
      ellipse(ccx+(.90*(cw/2)), cy - (.80*(ch/2)), 3, 6); //headlights for car
      ellipse(ccx+(.90*(cw/2)), cy + (.80*(ch/2)), 3, 6);
      fill(red);
      ellipse(ccx-(.98*(cw/2)), cy - (.80*(ch/2)), 3, 6); //taillights for car
      ellipse(ccx-(.98*(cw/2)), cy + (.80*(ch/2)), 3, 6);
    } else if (cy == 475) {
      ccx = ccx + speed;
      fill(yellow);
      ellipse(ccx+(.90*(cw/2)), cy - (.80*(ch/2)), 3, 6); //headlights
      ellipse(ccx+(.90*(cw/2)), cy + (.80*(ch/2)), 3, 6);
      fill(red);
      ellipse(ccx-((cw/2)), cy - (.80*(ch/2)), 3, 6); // taillights
      ellipse(ccx-((cw/2)), cy + (.80*(ch/2)), 3, 6);
    } else if (cy == 375) {
      ccx = ccx + (-1*speed);
      fill(red);
      ellipse(ccx+(.96*(cw/2)), cy - (.80*(ch/2)), 3, 6); //taillights
      ellipse(ccx+(.96*(cw/2)), cy + (.80*(ch/2)), 3, 6);
      fill(yellow);
      ellipse(ccx-(.95*(cw/2)), cy - (.80*(ch/2)), 3, 6); //headlights
      ellipse(ccx-(.95*(cw/2)), cy + (.80*(ch/2)), 3, 6);
    } else if (cy == 425) {
      ccx = ccx + (-1*speed);
      fill(red);
      ellipse(ccx+((cw/2)), cy - (.80*(ch/2)), 3, 6);//taillights
      ellipse(ccx+((cw/2)), cy + (.80*(ch/2)), 3, 6);
      fill(yellow);
      ellipse(ccx-(.95*(cw/2)), cy - (.80*(ch/2)), 3, 6); //headlights
      ellipse(ccx-(.95*(cw/2)), cy + (.80*(ch/2)), 3, 6);
    }
  }

  void collision() {
    if (dist(cfx, cfy-fr, ccx+(cw/2), cy) <= fr || dist(cfx, cfy-fr, ccx-(cw/2), cy) <= fr) {
      lives= lives - 1;
      cfx = startfrogx;
      cfy = 585;
    } else if (dist(cfx, cfy+fr, ccx+(cw/2), cy) <= fr || dist(cfx, cfy+fr, ccx-(cw/2), cy) <= fr || dist(cfx, cfy+fr, ccx, cy) <= ch) {
      lives= lives - 1;
      cfx = startfrogx;
      cfy = 585;
    }
  }
}
class fly {
  //global varibles
  float flyx;
  float flyy;
  float flyr = 10;
  float zerotofour = random(0, 4);


  //constructor
  fly(float _flyx, float _flyy) {
    flyx = _flyx;
    flyy = _flyy;
  }

  //functions
  void fly() {
    display();
    score();
  }

  void display() {
    fill(0);
    noStroke();
    ellipse(flyx, flyy, 2*flyr, 2*flyr);
  }

  void score() {
    if (dist(cfx, cfy, flyx, flyy) < (fr+flyr)) {
      score = score + 1;
      cfx = startfrogx;
      cfy = 585;
      //println("return");
    }
  }
}
class frog {
  //Global Variables
  //float fx;
//  float cfy = 585;
//  float fy = cfy;
//  float fr = 10;
//  float fspeed = 25;
//  float cfx = startfrogx;
  float fx = cfx;
  // float clx=logs260[1];





  //constructor
  frog(float _fx, float _fy, float _fr) {
    cfx = _fx;
    cfy = _fy;
    fr = _fr;
  }


  //Functions
  void frog() {
    display();
    move();
  }

  void display() {
    noStroke();
    fill(frogC);
    ellipse(cfx, cfy, (2*fr), (2*fr));
  }

  // allows frogger to move
  void move() {
    if (keyPressed == true) {
      if (key == CODED) {
        if (keyCode == UP) {
          cfy = cfy-fspeed;
          keyCode = 0;
        } else if (keyCode == DOWN) {
          cfy = cfy+fspeed;
          keyCode = 0;
        } else if (keyCode == LEFT) {
          cfx = cfx-fspeed;
          lfx = lfx -fspeed;
          keyCode = 0;
        } else if (keyCode == RIGHT) {
          cfx = cfx+fspeed;
          keyCode = 0;
        }
      }
    }
    //sets map boundries for frog
    if ((cfy-fr) < 0) {
      cfy = cfy+fspeed;
    } else if ((cfy+fr) > height) {
      cfy = cfy-fspeed;
    } else if ((cfx-(fr)) < 0) {
      cfx = cfx+(fspeed);
    } else if ((cfx+fr) > width) {
      cfx = cfx-fspeed;
    }

    //println(cfx);
    //println(clx);
    //printArray(logs);
  }
}
class lilly {
  //global variables
  float cpx;
  float px = cpx;
  float py = 0;
  float pr = 12.5;
  float pspeed;
  float n = 0;
 // float cfx;// = startfrogx;
  float rectx;
  float rectw;


  //constructor
  lilly(float _px, float _py, float _pspeed, float _n) {
    cpx = _px;
    py = _py;
    pspeed = _pspeed;
    n = _n;
  }

  //functions
  //void pad### are the Y coordinate of the lilly pad lanes.
  void pad() {
    display();
    move();
    lillyfrog();
  }

  void display() {
    for (int i = 0; i<n; i +=1) {
      if (cpx+(((n*2)-1)*pr)<0) {
        cpx = width+pr;
      }
      //make invisible rectagle around the lillies going in same direction. set it up like the logs.
      //when the frog jumps on the rectangle that streches across all the lillies the frog gets the
      //lillypads speed. everything will be just like the logs setup.
      noStroke();
      fill(lilly);
      ellipse(cpx+(i*(2*pr)), py, 2*pr, 2*pr);
      fill(deepblue);
      triangle(cpx+(i*(2*pr)), py, cpx+(.75*pr)+(i*(2*pr)), py+pr, cpx+(.25*pr)+(i*(2*pr)), py+pr);
      noFill();
      //stroke(0);
      rect(rectx, py, rectw, 2*pr);
    }
    //println(cfx);
  }

  void move() {
    if (py > 0) {
      cpx = cpx+pspeed;
      rectx = (cpx+((n-1)*pr));
      rectw = ((n+1)*(2*pr)-(2*pr));
    }
  }

  void lillyfrog() {
    //if (cfy >=85 && cfy <= 285) {
      if (dist((cfx+fr), cfy, (rectx-(rectw/2)), py)<= (rectw) && dist((cfx-fr), cfy, (rectx+(rectw/2)), py) <= (rectw) && cfy == py) {
        cfx = cfx+pspeed;
      }
      //println(cfx);
    //}
  }
}
class logs {
  float clx;
  float lx = clx;
  float ly = 0;
  float lw = 50;
  float lh = 25;
  float lspeed;
  float n = 0;
  boolean froglog = true;
  boolean frogonlog;
  boolean froginwater;
  //float lfx = cfx;
  float lfy = cfy;
  float change;


  //constructor
  logs (float _lx, float _ly, float _lspeed, float _n) {
    clx = _lx;
    ly = _ly;
    lspeed = _lspeed;
    n = _n;
  }

  void lfloat() {
    display();
    move();
    //bringfrog();

    logfrog();
    inwater();
  }

  void display() {
    if ((clx-(n*(lw/2)))>= width) {
      clx = 0-(n*(lw/2));
    }

    noStroke();
    fill(brown);
    rect(clx, ly, lw*n, lh);
    stroke(brownl);
    line(clx-(n*(lw/2)), (ly+(lh/4)), clx+(n*(lw/2)), (ly+(lh/4)));
    line(clx-(n*(lw/2)), (ly-(lh/4)), clx+(n*(lw/2)), (ly-(lh/4)));
    ellipse(clx-(n*(lw/2)), ly, 3, lh);
    ellipse(clx+(n*(lw/2)), ly, 3, lh);
    ellipse(clx, ly, 3, lh);
    println(frogonlog);
  }


  void move() {
    if (ly > 0) {
      clx = clx+lspeed;
    }
  }

  //movement with log works if fall off log dead
  void logfrog() {
    //if (cfy >= 60 && cfy <= 260) {
    if (dist((cfx+fr), cfy, (clx-(n*(lw/2))), ly)<= (lw*n) && dist((cfx-fr), cfy, (clx+(n*(lw/2))), ly) <= (lw*n) && cfy == ly) {
      lfx = cfx;
      cfx = cfx+lspeed;
      frogonlog = true;
    }
    //println(lfx);
    // println(cfx);
//    println(frogonlog);
//    println(froginwater);
  }

  void inwater() {
    if (cfy>=60 && cfy <= 260) {
      if (frogonlog == true) {
        froginwater = false;
      }
    }
  }
}

