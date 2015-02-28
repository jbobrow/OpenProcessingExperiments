
//thanks to Golan Levin for mutual repulsion and mouse seeking code

import java.util.*;

int red = 255;
String url = "http://i.imgur.com/rRA7HUC.png";
int numofnames = 174;
String[] names =
{
  "SOPHIA", "JACOB", "MASON", "ETHAN", "ISABEL", "OLIVIA", "AVA", "EMILY", "ABIGAIL", "NOAH", 
  "WILLIAM", "LIAM", "JAYDEN", "MICHAEL", "ALEX", "AIDEN", "RACHEL", "ESTHER", "RALPH", "MARYYANN", 
  "GOLAN", "ANDREW", "PAT", "PATRICK", "ANDY", "JOHN", "SONIA", "ANGELA", "ANGIE", "CHRISTINA", 
  "CHRISTINE", "JAMIE", "TIFFANY", "HEATHER", "GREG", "ASA", "TATE", "CHRIS", "PETER", "NIVETHA", 
  "SWETHA", "IVAN", "PAUL", "JOE", "JOB", "DANIEL", "DAN", "DEBORAH", "EILEEN", "MEGAN", 
  "MADISON", "ZEMING", "JENNY", "MATT", "LORRAINE", "BEN", "MICHELLE", "SID", "AMY", "STACY", 
  "TIMOTHY", "TIM", "MAGGY", "MAGGIE", "YASMEEN", "DAVE", "DAVID", "ASHISH", "RAQUEL", "HANNAH", 
  "GUANMEI", "HELEN", "KEITH", "SAM", "DONALD", "TAYLOR", "OMAR", "ANISH", "LUCIA", "SYLVIA", 
  "EUNICE", "MIHIR", "MILES", "MADELEINE", "ELAINE", "CAROL", "CAROLINA", "VICTOR", "NICOLE", "JESSICA", 
  "KWAN", "VISHNU", "ADRIENNE", "LINDSAY", "MARINA", "DIVY", "SONAL", "HIRA", "KARIN", "KAREN", 
  "GRACE", "SERENA", "TICHA", "JUN", "JULIA", "CHLOE", "NATHAN", "ODEN", "SEAN", "STEVE", 
  "STEVEN", "JOSE", "JAY", "QUINN", "GEORGE", "AARON", "DYLAN", "ERIC", "JAMES", "JEAN", 
  "SCOTT", "DEREK", "JORDAN", "LOUIS", "LINDA", "YURIANNA", "JOYCE", "WILL", "MARGARET", "ALICE", 
  "GLENNA", "CHICHI", "MARIA", "SARAH", "SNIGDHA", "JIM", "YANG", "SHANNON", "EVELINE", "EVE", 
  "ADAM", "MARISSA", "JASON", "REBECCA", "REBEKAH", "CINDY", "STEPHANIE", "GILLIE", "OWEN", "JACKIE", 
  "CEDRIC", "AMELIA", "WEINA", "NATALIE", "DAPHNE", "PATTHEW", "WENDY", "FRANK", "PALAK", 
  "DARWIN", "CHANTELLE", "BRAD", "CLINT", "ROBIN", "LIZZIE", "ELIZABETH", "OMEED", "SAKETH", 
  "DASITH", "ALLIE", "BILLY", "MAX", "ZACH", "BRYCE"
};

boolean[] taken = new boolean[numofnames];

int count = 0;
boolean explode;
PFont font;
int dunbarcount;
You you;
Others others;
int gradient = 255;
PImage smilie;

void setup() {
  size(700, 700);
  smooth();
  you = new You();
  others = new Others();
  font = createFont("CourierNewPSMT", 10);
  smilie = loadImage(url, "png");

  textAlign(CENTER);
}

void draw() {
  if (explode == true) {
    fill(255, 50);
    rect(0, 0, width, height);

    count++;
    if (count == 500){
      explode = false;
      count = 0;
    }
    
    red = 255;
    
    fill(0);
    textFont(font, 50);
    text("MONKEY NEEDS A BREAK", width/2,height/2);
  }

  if (explode == false) {


    if (dunbarcount == 151) {
      background(255);
      others.unfriend();
      dunbarcount = 0;
      explode = true;
    }
    else {

      if (mousePressed) {
        fill(0, 50);
        rect(0, 0, width, height);
        you.update();
        others.connections(you);
        others.follow(you);
      }
      else {
        background(255);
        if (dunbarcount == 150) {
          fill(200, 0, 0, red);
          textFont(font, 100);
          text("WARNING:", width/2+random(-1, 1), height/2-50+random(-1, 1));
          textFont(font, 50);
          text("TOO MANY FRIENDS", width/2+random(-1, 1), height/2+50+random(-1, 1));
          red-=5;
        }
        if (dunbarcount > 1) {
          others.addRepulsion();
        }

        you.update();

        others.update();
        others.connections(you);
      }  


      you.render(others);
      others.render();
    }
  }
}

void keyReleased()
{
  if (explode == false) {
    others.befriend(new Other()); 
    you.pick(dunbarcount);
    dunbarcount++;
  }
  println(dunbarcount);
}

class Other {
  float posx, posy;
  float originx, originy;
  float rx, ry;
  float theta;

  float vx, vy; 
  float damping;
  float mass;

  float off;
  int toss = int(random(0, 2));
  int nameindex;
  color c = color(random(80,255),random(80,255),random(80,255));

  Other() {
    theta = random(0, TWO_PI);
    originx = rx*cos(theta) + mouseX;
    originy = ry*sin(theta) + mouseY;
    rx=ry=random(80, 200);

    vx = vy = 0;
    damping = 0.96;
    mass = random(1, 5);
    nameindex = int(random(0,numofnames));
    while(taken[nameindex]==true)
      nameindex = int(random(0,numofnames));
    taken[nameindex] = true;
  } 

  void update() {
    vx *= damping;
    vy *= damping;

    float noised = noise(off);
    if (toss == 0) noised*=-1;
    posx = rx*(cos(theta)+vx+noised) + mouseX; //+ vx;
    posy = ry*(sin(theta)+vy+noised) + mouseY; //+ vy;
    theta+=0.01;

    off+=0.005;
  }

  void render(int dun) {
    if(!mousePressed){
      if(dun == dunbarcount - 1)
        fill(c);
      else
        fill(150);
      textFont(font,mass*4);
      text(names[nameindex],posx,posy);
    }
    else{
      image(smilie,posx,posy, mass*20, mass*20);
      
      
    }
  }

  void addForce(float fx, float fy) {
    float ax = fx / mass;
    float ay = fy / mass;
    vx += ax;
    vy += ay;
  }

  void connectionwith(You you) {
    if (!mousePressed) {// stroke(255);
      stroke(200);
      line(you.posx, you.posy, posx, posy);
    }
  }

  void follows(You you) {
    float A = 0.999;
    float B = 1.0-A;

    posx = A*posx + B*mouseX;
    posy = A*posy + B*mouseY;
  }
}

class Others {

  ArrayList<Other> others;
  Others() {
    others = new ArrayList<Other>();
  }
  void befriend(Other o) {
    others.add(o);
  } 

  void unfriend() {
    others.clear();
  }
  
  Other getfriend(int index){
    return others.get(index);
  }

  void addRepulsion() {
    float gravityForcex = 0;
    float gravityForcey = 0.02;
    float mutualRepulsionAmount = 5.0;
    for (int i = 0; i <others.size(); i++) {
      Other itho = others.get(i);
      float posx = itho.posx;
      float posy = itho.posy;

      for (int j = 0; j<i; j++) {
        Other jtho = others.get(j);
        float qosx = jtho.posx;
        float qosy = jtho.posy;

        float dx = posx - qosx;
        float dy = posy - qosy;
        float dh = sqrt(dx*dx + dy*dy);
        if (dh>1.0) {
          float componentInX = dx/dh;
          float componentInY = dy/dh;
          float proportionToDistanceSquared = 1.0/(dh*dh);

          float repulsionForcex = mutualRepulsionAmount * componentInX * proportionToDistanceSquared;
          float repulsionForcey = mutualRepulsionAmount * componentInY * proportionToDistanceSquared;

          itho.addForce( repulsionForcex, repulsionForcey); // add in forces
          jtho.addForce(-repulsionForcex, -repulsionForcey); // add in forces
        }
      }
    }
  }

  void follow(You you) {

      for (int i = 0; i <others.size(); i++) {
        others.get(i).follows(you);
      }

  }

  void update() {
    for (int i = 0; i < others.size(); i++) {
      others.get(i).update();
    }
  }


  void render() {
    for (int i = 0; i < others.size(); i++) {
      others.get(i).render(i);
    }
  }

  void connections(You you) {
    for (int i = 0; i < others.size(); i++) {
      others.get(i).connectionwith(you);
    }
  }
}

class You {
  float posx;
  float posy;
  float size;
  int picked;
  You() {
    posx = width/2;
    posy = height/2;
    size = 50;
  } 
  void update() {
    //size = 40;
    posx = mouseX;
    posy = mouseY;
  }

  void pick(int p) {
    picked = p;
  }

  void render(Others oths) { 
    if (mousePressed) {
      float r1 = random(-1, 1);
      float r2 = random(-1, 1);
      noStroke();
      fill(random(50, 100), random(50, 100), random(50, 100));
      ellipse(posx+r1, posy+r2, size, size);
      fill(255);
      ellipse(posx+r1, posy+r2, size-20, size-20);
      fill(0);
      ellipse(posx+random(-3, 3), posy+random(-3, 3), 7, 7);
    }
    else {
      noStroke();
      fill(100);
      ellipse(posx, posy, size, size);
      fill(255);
      ellipse(posx, posy, size-21, size-21);
      if (dunbarcount < 1) {
        fill(0);
        ellipse(posx, posy, 7, 7);
      }
      else {
        fill(0);
        Other o = oths.getfriend(picked);
        pushMatrix();
        translate(posx, posy);
        float angle = atan2(o.posy-posy, o.posx-posx);
        rotate(angle);
        translate(6, 0);
        ellipse(0, 0, 7, 7);
        popMatrix();
      }
    }
    if (keyPressed) {
      //blink
      noStroke();
      fill(100);
      ellipse(posx, posy, size-20, size-20);
      stroke(255);
      /* curve(posx-(size-20), posy,
       posx-5, posy+5,
       posx+5, posy+5,
       posx+(size-20), posy);   
       */
      noFill();
      beginShape();
      curveVertex(posx-(size-20)/2.0, posy);
      curveVertex(posx-(size-20)/2.0, posy);
      curveVertex(posx, posy+5);
      curveVertex(posx+(size-20)/2.0, posy);
      curveVertex(posx+(size-20)/2.0, posy);
      endShape();
    }
  }
}



