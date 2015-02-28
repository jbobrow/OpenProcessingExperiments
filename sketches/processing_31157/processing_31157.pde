
Bouncer dude;
PFont myFont;
ArrayList platformLst;
ArrayList debrisLst;
boolean movUp = false;
boolean mouth = false;
int count = 0;
int score = 0;
int hscore = 0;
int eyeht = 0;
boolean firstStart = true;
boolean ultra = false;
boolean hard = false;
boolean Harder = false;
int backCol = 255;
float crossY = 0;
float crossX = 0;
int changeScore = 0;
int colorFade = 70;
int shade = 0;

void setup() {
  background(240);
  size(800, 500);    
  ellipseMode(CENTER);
  dude = new Bouncer(400, 550, 20);
  platformLst = new ArrayList();  
  platformLst.add(new platform(350, 350, 0.5, color(0, 0, 0)));

  debrisLst = new ArrayList();  

  for (int i = 0; i < 20; i++) {                                         //draw platforms
    platformLst.add(new platform(random(-50, 850), random(0, 500), random(0.3, 2), color(0, 0, 0)));
  }

  for (int i = 0; i < 100; i++) {
    debrisLst.add(new Debris(random(0, 800), random(0, 500), random(2, 6), random(5, 30)));
  }

  smooth();
  noCursor();
}

void draw() { ////////////////////////////////////////////////////DRAW///////////////////////////////////////////////////////////////////
 
  if (ultra == true) {
    backCol = 180;
  }
  else if (hard == true) {
    backCol = (int) random(50, 200);
  }
  else if (Harder == true) {
    noStroke();
    fill(255, 40);
    ellipse(dude.Xpos, dude.Ypos, 400, 400);
    backCol = 0;
  }
  else {
    backCol = 220;
  }
  noStroke();
  fill(backCol, colorFade);
  rect(0, 0, 800, 500);


  fill(240, 0, 0);
  rect(0, 0, 800, 10); 

  fill(0);
  rect(0, 0, 5, 500);
  rect(795, 0, 5, 500);
  rect(0, 495, 800, 5);

  //  String[] fontList = PFont.list();
  //  println(fontList);

  for (int i = debrisLst.size()-1; i >= 0; i--) {
    Debris d = (Debris) debrisLst.get(i);
    if (ultra == true) {
      d.display();
      d.Walk();
    }
  }

  for (int i = platformLst.size()-1; i >= 0; i--) {             //move platforms to top if they fall out of sight
    platform p = (platform) platformLst.get(i);

    if (changeScore > 100) {
      Harder = false;
      hard = true;
      ultra = false;
    }
    if (changeScore > 200) {
      Harder = true;
      hard = false;
      ultra = false;
    }
    if (changeScore > 300) {
      Harder = false;
      hard = false;
      ultra = true;
    }
    if (changeScore > 400) {
      Harder = false;
      hard = false;
      ultra = false;
    }
    if (changeScore > 500) {
      changeScore = 100;
    }


    if (p.pYpos > 500 || p.pYpos < -5) {     //CHANGE PLATFORM DIRECTION + COLOR // DIFFICULTY
      p.bncecount = 0;
      if (ultra == true) {  
        p.pYpos = 0;
        p.speed = random(1, 6);
        p.col = color(255);
      }

      else if (hard == true) {
        if (p.pYpos < -5) {        
          p.pYpos = 495;
        }
        else if (p.pYpos > 500) {
          p.pYpos = 0;
        }
        p.col = color(random(0, 200));
      }

      else if (Harder == true) {                                         
        p.pYpos = 495;
        if (p.speed > 0) {
          float temps = random(-5, -0.5); 
          p.speed = temps;
        }
        p.col = color(0, 0, 0);
      }

      else { //easy
        p.pXpos = random(-50, 770);
        p.pYpos = 0;
        p.col = color(0, 0, 0);
      }
    }

    else {
      if (dude.on(p)) {                                  //bounce if touching a platform
        if (movUp == false) {
          dude.Ypos = p.pYpos - 25;
          dude.bounce();
          p.bncecount++; 

          int intsty = p.bncecount * 100; 
          if (intsty > 255) {
            intsty = 255;
          }
          //change color when bounced on
          if (ultra == true) {
            p.col = color(0, 0, 250);
          }
          else if (Harder == true) {
            p.col = color(0, 0, intsty);
          }
          else if (hard == true) {
            p.col = color(intsty, intsty/2, 0);
          }
          else {
            p.col = color(intsty, 0, 0);
          }

          score++;                                              //increment SCORE OMG
          changeScore++;
        }
      }
      p.display();
      p.move();

      fill(0, 50);
      rect(p.pXpos, p.pYpos, 100, 5);
    }
  }  

  noStroke();
  fill(180);

  dude.display();
  dude.move();

  if (dude.Ypos > 550) {
    fill(0, 50);
    stroke(0);
    ellipse(402, 252, 510, 200);
    fill(255, 240);
    ellipse(400, 250, 510, 200);

    if (score>hscore) {
      fill(200, 0, 0);
      myFont = createFont("A.C.M.E. Secret Agent Bold", 33, true);
      textFont(myFont);
      textAlign(CENTER);
      text("Highscore!!", 400, 220);
      text(score, 400, 260);
    }
    else if (score <= hscore && firstStart == false) {
      fill(0);
      myFont = createFont("A.C.M.E. Secret Agent Bold", 33, true);
      textFont(myFont);
      textAlign(CENTER);
      text("(> _ <)", 400, 220);
      myFont = createFont("A.C.M.E. Secret Agent Bold", 16, true);
      textFont(myFont);
      text("score: " + score, 400, 255);
    }

    if (firstStart == true) {
      fill(0);
      myFont = createFont("A.C.M.E. Secret Agent Bold", 33, true);
      textFont(myFont);
      textAlign(CENTER);
      text("Spacebar to start", 400, 250);
      myFont = createFont("A.C.M.E. Secret Agent Bold", 15, true);
      textFont(myFont);
      text("Left and right arrow keys control movement", 400, 280);
      myFont = createFont("A.C.M.E. Secret Agent Bold", 10, true);
      textFont(myFont);
      text("New stage every 100 points", 400, 300);
    }
    else {      
      fill(0);
      myFont = createFont("A.C.M.E. Secret Agent Bold", 33, true);
      textFont(myFont);
      textAlign(CENTER);
      text("You died", 400, 300);
      myFont = createFont("A.C.M.E. Secret Agent Bold", 15, true);
      textFont(myFont);
      text("(spacebar to restart)", 400, 480);
    }
  }

  if (firstStart == true) {
    fill(0);
    myFont = createFont("A.C.M.E. Secret Agent Bold", 10, true);
    textFont(myFont);    
    text("By C.Broad", 750, 480);
    if (shade > 150) {
      shade = 0;
    }

    fill(0);
    myFont = createFont("A.C.M.E. Secret Agent Bold", 62, true);
    textFont(myFont);    
    text("Tramp Man!", 400+random(-1, 1), 202+random(-1, 1));
    
    fill(240, 0, 0);
    myFont = createFont("A.C.M.E. Secret Agent Bold", 61, true);
    textFont(myFont);    
    text("Tramp Man!", 400, 202);

    fill(240, 0, 0);
    myFont = createFont("A.C.M.E. Secret Agent Bold", 60, true);
    textFont(myFont);    
    text("Tramp Man!", 400+random(-1, 1), 202+random(-1, 1));
  }
  else {
    fill(200);                                                        //               TEXT
    myFont = createFont("A.C.M.E. Secret Agent Bold", 33, true);
    textFont(myFont);
    textAlign(CENTER);
    text("Score: " + score, 400, 450); 
    fill(255);
    myFont = createFont("A.C.M.E. Secret Agent Bold", 32, true);
    textFont(myFont);
    text("Score: " + score, 400, 450); 
    fill(0); 
    myFont = createFont("A.C.M.E. Secret Agent Bold", 31, true);
    textFont(myFont);

    if (hscore > 0) {
      if (score > hscore) {
        fill(240, 0, 0);
      }
    }
    else {
      fill(0);
    }

    text("Score: " + score, 400, 450); 
    myFont = createFont("A.C.M.E. Secret Agent Bold", 15, true);
    textFont(myFont);
    text("Highscore: " + hscore, 400, 30);
  }
}


class Bouncer {                        //////////////////////////////BOUNCER CLASS//////////////////////////////
  float Xpos = 0;
  float Ypos = 0;
  float Yspeed = 0;
  float origYspeed = 0;
  float Xspeed = 0;
  boolean slowing = false;

  boolean movingRight = false;
  boolean movingLeft = false;

  Bouncer(float x, float y, float Ys) {         
    Xpos = x;
    Ypos = y;
    Yspeed = Ys;
    origYspeed = Ys;
  }

  void bounce() {                                 //BOUNCE
    if (Yspeed < 0) {
    }                                             //move through a platform if moving upwards      
    else {
      Yspeed = origYspeed - 2;                    //Higher = bigger gravity effect. 2 = no bounce height change.
      Yspeed = Yspeed*-1;                         //reverse the velocity

      noStroke();
      fill(255, 50);
      ellipse(dude.Xpos, dude.Ypos, 50, 50);
    }
  }

  void move() {
    //speeding up in arrow direction
    if (keyPressed == true) {                    //Check to see if a key is pressed
      if (key == CODED) {
        if (keyCode == RIGHT) {                  //RIGHT ARROW KEY
          movingRight = true;

          if (dude.Xpos < 30) {
            dude.Xpos = 30;
          }
          if (dude.Xpos > 780) {
            dude.Xpos = 780;
          }

          dude.Xpos = dude.Xpos + dude.Xspeed;
          if (dude.Xspeed < 0) {                 //if bouncer is turning...
            dude.Xspeed = dude.Xspeed + 1.5;
          }
          else {
            dude.Xspeed = dude.Xspeed + 0.4;     //speed
          }
          if (dude.Xspeed > 10.5) {
            dude.Xspeed = 11;
          }
        }
        if (keyCode == LEFT) {                   //LEFT ARROW KEY
          movingLeft = true;

          if (dude.Xpos < 30) {
            dude.Xpos = 30;
          }
          if (dude.Xpos > 780) {
            dude.Xpos = 780;
          }
          strokeWeight(1);
          dude.Xpos = dude.Xpos + dude.Xspeed;
          if (dude.Xspeed > 0) {                 //if bouncer is turning...
            dude.Xspeed = dude.Xspeed - 1.5;
          }
          else {
            dude.Xspeed = dude.Xspeed - 0.4;     //speed
          }
          if (dude.Xspeed < -10.5) {
            dude.Xspeed = -11;
          }
        }
      }
    }  
    else {                                       //NO KEYS PRESSED
      //slowing
      movingRight = false;
      movingLeft = false;
      if (Xspeed > 0) {        
        Xspeed = Xspeed - 0.2;
      }
      else if (Xspeed < 0) {
        Xspeed = Xspeed + 0.2;
      }
      else {
        Xspeed = 0;
      }
    }

    if (Yspeed >= 0) {                           //MOVING DOWN
      movUp = false;
      Xpos = Xpos + Xspeed;            
      Ypos = Ypos + Yspeed;
      Yspeed = Yspeed + 1;     //increment the velocity by 1 for down movement
    }
    else {                                       //MOVING UP
      movUp = true;
      Xpos = Xpos + Xspeed;
      Ypos = Ypos + Yspeed;
      Yspeed++;
    }

    //FALLS BELOW FLOOR
    if (Ypos > 600) {                            
      Ypos = 600;
    }


    if (Xpos < 25) {                            //BOUNCE OFF THE SIDES
      Xspeed = Xspeed * -1;
    }
    if (Xpos > 785) {
      Xspeed = Xspeed * -1;
    }

    if (Ypos - 25 < 1) {          //If he hits the ceiling
      Ypos = 26;
      Xspeed = random(-10, 10);
      Yspeed = Yspeed*-1;         //reverse the velocity
    }
  }


  void display() {                                //CHARACTER DESIGN
    //body
    stroke(0);
    fill(150);
    ellipse(Xpos, Ypos, 50, 50);  

    //eyes + arms
    eyeht = 10;
    stroke(0);
    strokeWeight(2);

    //CHANGE EYE COLOR FOR DIFFICULTY?
    //    if(hard == true){fill(0, 255, 255);}
    //    //harder = green
    //    else if(Harder == true){fill(0, 255, 0);}
    //    //ultra = red
    //    else if(ultra == true){fill(255, 0, 0);}
    //else{
    fill(255);
    //}

    if (movingRight == true) {
      ellipse(Xpos + 20, Ypos - 10, eyeht, eyeht);
      ellipse(Xpos - 5, Ypos - 20, eyeht, eyeht); 

      //line(Xpos - 25, Ypos, Xpos - 30, Ypos + 15);
    }
    else if (movingLeft == true) {
      ellipse(Xpos - 20, Ypos - 10, eyeht, eyeht);
      ellipse(Xpos + 5, Ypos - 20, eyeht, eyeht);

      //line(Xpos + 25, Ypos, Xpos + 30, Ypos + 15);
    }
    else { //default
      ellipse(Xpos + 12, Ypos - 10, eyeht, eyeht);
      ellipse(Xpos - 12, Ypos - 10, eyeht, eyeht);

      //line(Xpos - 25, Ypos, Xpos - 25, Ypos + 20);
      //line(Xpos + 25, Ypos, Xpos + 25, Ypos + 20);
    }

    //mouth
    stroke(0);  
    line(Xpos - 5, Ypos - 3, Xpos + 5, Ypos - 3);
  }


  boolean on(platform p) {                      //CHECK TO SEE IF CHARACTER IS ON A PLATFORM
    if (Xpos > p.pXpos - 7 && Xpos < p.pXpos + 107 && Ypos + 25 < p.pYpos + 20 && Ypos + 25 > p.pYpos - 20) {
      return true;
    } 
    return false;
  }
}


class Debris { ////////////////////////////////////DEBRIS CLASS///////////////////////////////////////////////
  float Xposd;
  float Yposd;
  float Xspeedd;
  float sze;

  Debris(float Xp, float Yp, float Xspd, float sz) {
    Xposd = Xp;
    Yposd = Yp;
    Xspeedd = Xspd;
    sze = sz;
  }

  void display() {
    noStroke();
    fill(255);     
    ellipse(Xposd, Yposd, sze, sze);

    strokeWeight(1);
  }

  void Walk() {
    if (Xposd < -50) {
      Xposd = 850;
      Xspeedd = random(4, 7);
    }
    else if (Xposd > 850) {
      Xposd = 815;
      Xspeedd = random(4, 7);
    }

    float rand = random(1000);
    if (rand < 100) {
      Xspeedd = Xspeedd*-1;
    }
    Xposd = Xposd - Xspeedd;
  }
}


class platform {        /////////////////////////////////PLATFORM CLASS///////////////////////////////////////
  float pXpos = 0;
  float pYpos = 0;
  int wd = 100;
  int ht = 5;
  float speed = 0.5;
  color col = color(0, 0, 0);
  int bncecount = 0;

  platform(float x, float y, float s, color co) {
    pXpos = x;
    pYpos = y;
    speed = s;
    col = co;
  }

  void display() {
    fill(col);
    rect(pXpos, pYpos, wd, ht);
  }

  void move() {
    if (ultra == true) {
      col = color(255);
    }
    if (hard == true) {
      float rand = random(10000);
      if (rand < 100) {  
        if (speed > 4) {
          speed = 4;
        }
        else if (speed < -4) {
          speed = -4;
        }        
        speed = speed*-2;
      }
      col = color(random(0, 200));
    }
    if (Harder == true) {
      speed = -2;
    }
    pYpos = pYpos + speed;
  }
}

void keyPressed() { ///////////reset///////////

  if (key == ' ') {
    if (dude.Ypos > 550) { //if the character is actually dead...
      changeScore = 0;
      fill(0); //refresh
      rect(0, 0, 800, 500);
      ultra = false;
      hard = false;
      Harder = false;
      firstStart = false;
      dude.Xpos = 400;
      dude.Ypos = 200;
      dude.Yspeed = 0.1;

      if (score > hscore) {
        hscore = score;
      }
      score = 0;
      mouth = false;
      for (int i = platformLst.size()-1; i >= 0; i--) {
        platformLst.remove(i);
      }
      for (int i = debrisLst.size()-1; i >= 0; i--) {
        debrisLst.remove(i);
      }

      for (int i = 0; i < 200; i++) {
        debrisLst.add(new Debris(random(0, 800), random(0, 500), random(1, 8), random(10, 30)));
      }

      platformLst.add(new platform(350, 350, 0.5, color(0, 0, 0)));
      for (int i = 0; i < 18; i++) {                                         //draw platforms
        platformLst.add(new platform(random(-50, 850), random(0, 500), random(0.3, 2), color(0, 0, 0)));
      }
      dude.origYspeed = 20;
    }
  }
}


