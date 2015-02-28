
PImage bg; 
Ship s;
asteroid a; 
PImage img;
float yrandom;
ArrayList<missile> m=new ArrayList<missile>();
ArrayList<missile> storedmis=new ArrayList<missile>();
ArrayList<asteroid> r = new ArrayList<asteroid>();
boolean gamestate=true;
int score = 0 ;
int lives =3;
int missiles=storedmis.size();
int timer=2000;
int otherTime;
float xspeed;
float yspeed; 
float speed =.25;
int nextLvl =100;
int numAster=10;
void setup() {
  size(600, 300);
  smooth();
  bg = loadImage("g.jpg");
  img = loadImage("spaceship1.png");
  s = new Ship(50, 30);
  a= new asteroid();
  r.add(a);
  otherTime=millis();
  for (int i= 0 ;i<20;i++) {
    storedmis.add(new missile()); 
    missiles++;
  }
}


void keyPressed() {
  if (key== CODED) {
    if (keyCode== UP) { 
      yspeed=-3; 
      xspeed=0;
    }

    else if ( keyCode== DOWN) {
      yspeed=3;
      xspeed=0;
    }
    else if (keyCode==LEFT) {
      xspeed=-3;
      yspeed=0;
    }
    else if (keyCode==RIGHT) {
      xspeed=3;
      yspeed=0;
    }
  } 
  else if (key==' ') {
    if (missiles>0) {
      missiles--;
      m.add(new missile());
    }
  }
}

void keyReleased() {
  xspeed=0;
  yspeed=0;
}
void draw() {
  int seconds=second();
  if (gamestate==true) { 
    image(bg, 0, 0, width, height); 
    s.display();
    fill(255);
    fill(0);
    s.move();
    if (score>=nextLvl) {
      speed+=.2; 
      nextLvl+=100;
      numAster+=5; 
      timer/=2;
      println(speed);
    }
    for (missile d: m ) {       
      d.display(); 
      d.move();
    }
    int twoSecs=millis()-otherTime;
    if (twoSecs>timer) {
      if (missiles<20) {
        storedmis.add(new missile());
        missiles++;
        otherTime=millis();
      }
    }

    for (asteroid j:r) {
      j.display();
      j.move();
    }  
    if (r.size()<15) {
      r.add(new asteroid());
    }
    for (int i =r.size()-1;i>0;i--) {
      if (r.get(i).loc.x<0) {
        r.remove(i); 
        score-=5;
      }
    }
    if (score<0) {
      score=0;
    }
    for (int q=m.size()-1;q>=0;q--) {
      if (m.get(q).loc.x>width) {
        m.remove(q);
      }
    }

    for (int o=m.size()-1;o>=0;o--) {
      missile curMissle = m.get(o);
      boolean removeThisMissle = false;
      for (int l=r.size()-1;l>=0;l--) {
        asteroid curRock = r.get(l);
        if (dist(curMissle.loc.x, curMissle.loc.y, curRock.loc.x, curRock.loc.y)<=10) {
          r.remove(l);
          removeThisMissle = true;
          score+=5;
          break;
        }
      }
      if (removeThisMissle==true) {
        m.remove(o);
      }
    }
    for (int k = r.size()-1;k>0;k--) {
      asteroid curRock=r.get(k);
      if (curRock.loc.y>=s.loc.y && curRock.loc.y<=s.loc.y+30) {
        float abc = abs(curRock.loc.x-(s.loc.x+80));
        float xyz=abs(curRock.loc.x-s.loc.x);
        if (abc<=10) {
          r.remove(k);
          lives--;
        }
        else if (xyz<=10) {
          r.remove(k); 
          lives--;
        } 
        else {
        }
      } 
      else if (curRock.loc.x>=s.loc.x && curRock.loc.x<=s.loc.x+80) {
        float abc=abs(curRock.loc.y-s.loc.y); 
        float xyz=abs(curRock.loc.y-(s.loc.y+30));
        if (abc<=10) {
          r.remove(k); 
          lives--;
        } 
        else if (xyz<=10) {
          r.remove(k);
          lives--;
        } 
        else {
        }
      }
      if (lives==0) { 
        gamestate=false;
      }
    }
    fill(255, 0, 0);
    textSize(20);
    text("score:" +score, 20, height-50);
    text("Lives:" +lives, 20, height -10);
    text("Missiles:" +missiles, 20, height-30);
  }

  else {
    background(0);
    fill(255);
    textSize(30);
    text("GAME OVER!", 220, 140); 
    text("Score:" +score, 220, 170);
    noLoop();
  }
}

class Ship {
  PVector loc; 

  public Ship(float x, float y) {
    loc =new PVector(x, y);
  } 
  void move() {
    
    if(xspeed>0 && s.loc.x+80<=width) {
    loc.x+=xspeed;
    }
    if(xspeed<0 && s.loc.x-3>=0) {
     loc.x+=xspeed; 
    }
    if(yspeed<0 && s.loc.y-3>=0) {
    loc.y+=yspeed;
    }
    if(yspeed>0 && s.loc.y+20<=height) {
    loc.y+=yspeed;
    }  
}

  void display() {
    image(img, loc.x, loc.y);
  }
}

class asteroid {
  PVector loc; 

  public asteroid() {
    loc=new PVector(random(width, 2000), random(300));
  }

  void display() {
    fill(0, 255, 0);
    strokeWeight(5);
    ellipse(loc.x, loc.y, 20, 20);
    move();
  }

  void move() {   
    loc.x-=speed;
  }
}  

class missile {
  PVector loc;
  public missile() {
    loc=new PVector(s.loc.x+80, s.loc.y+15);
  }
  void display() {
    fill(255, 165, 0);
    ellipse(loc.x, loc.y, 10, 10);
    move();
  }
  void move() {
    loc.x+=2;
  }
}



