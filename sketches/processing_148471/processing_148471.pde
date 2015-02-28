
PImage bg; 
Ship s;
asteroid a; 
PImage img;
float yrandom;
ArrayList<missile> m=new ArrayList<missile>();
ArrayList<asteroid> r = new ArrayList<asteroid>();
boolean gamestate=true;
int score = 0 ;
int lives =3;
void setup() {
  size(600, 300);
  smooth();
  bg = loadImage("g.jpg");
  img = loadImage("spaceship1.png");
  s = new Ship(50, 30);
  a= new asteroid();
  r.add(a);
}

void draw() {
  if (gamestate==true) {
    image(bg, 0, 0, width, height); 
    s.display();
    // a.display();
    if (keyPressed==true) {
      s.move();
    }
    for (missile d: m ) {       
      d.display(); 
      d.move();
    }
    for (asteroid j:r) {
      j.display();
      j.move();
    }
    if (r.size()<10) {
      r.add(new asteroid());
    }

    for (int i =r.size()-1;i>0;i--) {
      if (r.get(i).loc.x<0) {
        r.remove(i);
      }
    }
    for (int o=m.size()-1;o>=0;o--) {
      missile curMissle = m.get(o);
      boolean removeThisMissle = false;
      for (int l=r.size()-1;l>=0;l--) {
        asteroid curRock = r.get(l);
        if (dist(curMissle.loc.x, curMissle.loc.y, curRock.loc.x, curRock.loc.y)<=10) {
          //m.remove(o);
          r.remove(l);
          removeThisMissle = true;
          score++;
          break;
        }
      }
      if (removeThisMissle==true) {
        m.remove(o);
      }
    }
    for (int k = r.size()-1;k>0;k--) {
      asteroid curRock=r.get(k);
      if (dist(curRock.loc.x, curRock.loc.y, s.loc.x+70, s.loc.y+19)<=10) {
        lives--;gamestate=false;
      }
    }
    text("score:" +score, width/2-30,height/2-30);
  } else {
   background(0);
  fill(255);
 text("game over",width/2,height/2); 
noLoop();
  }
}

class Ship {
  PVector loc; 
  float xspeed;
  float yspeed;
  public Ship(float x, float y) {
    loc =new PVector(x, y);
  } 
  void move() {
    keyPressed();
    loc.x+=xspeed;
    loc.y+=yspeed;
  }
  void keyPressed() {
    if (key== CODED) {
      if (keyCode== UP) {
        //loc.y-=speed;
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
      m.add(new missile()); 
      xspeed=0;
      yspeed=0;
    } 
    else {
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
    fill(0);
    strokeWeight(5);
    ellipse(loc.x, loc.y, 20, 20);
    move();
  }

  void move() {   
    loc.x-=1;
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



