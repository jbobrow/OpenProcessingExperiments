
int gameState;
PImage wMain;
PImage wOver;
World world;
float woopX, woopY, climbSpeed, gravity;
int woopElecs;
int woopAlphas;    
int pt, multi;
PFont score;
PImage e;    
PImage a;
PImage wJump;
PImage wFall; 

void setup() {  
  size(640, 700);  
  frameRate(30);
  gameState=0;
  wMain = loadImage("woop_main_menu.jpg");  
  wOver = loadImage("woop_gameover.jpg"); 
  world=new World();
  woopX=width/2;
  woopY=100;
  climbSpeed=0;
  gravity=2;
  woopElecs=0;
  woopAlphas=0;
  pt=0;
  multi=1;
  score=loadFont("EurostileRegular-36.vlw");
  textFont(score);
  e = loadImage("electron.gif");
  a = loadImage("alpha_particle.gif");    
  wJump = loadImage("woop_jumped.gif");  
  wFall = loadImage("woop_jumping.gif");
}

void draw() { 
  if (gameState==0) {
    startGame();
  }
  if (gameState==1) {
    playGame();
  }  
  if (gameState==2) {
    restartGame();
  }
}

void startGame() {  
  imageMode(CORNER);
  image(wMain, 0, 0);    
  if (mouseX>360||mouseX<610) {
    if (mouseY>590||mouseX<670) {
      if (mousePressed) {  
        gameState=1;
      }
    }
  }
}

void playGame() {
  world.render();     
  woopControl();
  woopDisplay();  
  if (woopY>height) {
    gameState=2;
  }
  fill(255);
  String p="Score: "+pt;  
  String m="Multiplier: X"+multi;
  text(p, 20, 20, width, 80);  
  text(m, 20, 80, width, 140);
}

void restartGame() {
  imageMode(CORNER);
  image(wOver, 0, 0);  
  String p=""+pt;  
  String m=""+multi;  
  String t=""+(pt*multi); 
  text(p, 240, 274, width, height);  
  text(m, 240, 322, width, height);
  text(t, 240, 368, width, height);  
  if (mouseX>300||mouseX<610) {
    if (mouseY>460||mouseX<630) {
      if (mousePressed) { 
        setup();
        gameState=1;
      }
    }
  }
}

void woopControl() {  
  if (keyPressed) { 
    if (key=='a'||key=='A') {
      woopX-=5;
    }   
    if (key=='d'||key=='D') {
      woopX+=5;
    }
    if (woopX>width) {
      woopX-=width;
    }  
    if (woopX<0) {
      woopX+=width;
    }
  }
}

void woopDisplay() {    
  imageMode(CENTER);
  for (int i=0;i<woopElecs;i++) {
    image(e, woopX+random(-15, 15), woopY+random(-15, 15));
  }  
  for (int j=0;j<woopAlphas;j++) {    
    image(a, woopX+random(-5, 5), woopY+random(-5, 5));
  }
  woopY+=climbSpeed;
  climbSpeed+=gravity;
  if (climbSpeed<0) {
    image(wJump, woopX, woopY);
  } 
  else {    
    image(wFall, woopX, woopY);
  }
}

class Atom {
  float x, y;
  float r;
  float atomSpeed;

  Atom() {
    x=width/2;
    y=600;
    atomSpeed=0;
  }

  Atom(float newx, float newy) {
    x=newx;
    y=newy;    
    r=random(-PI+PI/6, -PI/6);
    atomSpeed=24;
  }

  void display() {
    fill(100); 
    PImage e = loadImage("electron.gif");  
    imageMode(CENTER); 
    image(e, x+random(-15, 15), y+random(-15, 15));    
    image(e, x+random(-15, 15), y+random(-15, 15));
    image(e, x+random(-15, 15), y+random(-15, 15));
    image(e, x+random(-15, 15), y+random(-15, 15));
    image(e, x+random(-15, 15), y+random(-15, 15));
  }

  void move() {
    x+=cos(r)*atomSpeed;
    y+=sin(r)*atomSpeed;
    atomSpeed*=.9;
    if (x>width) {
      x-=width;
    }    
    if (x<0) {
      x+=width;
    }
  }
}

class Higgs {
  float x, y;
  float r;
  float atomSpeed;

  Higgs() {
    x=random(width);
    y=-random(4000);
    atomSpeed=0;
  }

  void display() {
    fill(100); 
    PImage h = loadImage("higgsphere.gif");  
    imageMode(CENTER); 
    image(h, x, y);
  }
}

class Power {
  float x, y;
  float r;
  float atomSpeed;

  Power() {
    x=random(width);
    y=-random(4000);
    atomSpeed=0;
  }

  void display() {
    fill(100);    
    PImage e = loadImage("electron.gif");  
    PImage a = loadImage("alpha_particle.gif");    
    imageMode(CENTER); 
    image(a, x+random(-10, 10), y+random(-10, 10));
  }
}

class World {
  PImage wallpaper;
  float wallY;
  Higgs[] higgs;
  Power[] power;
  float pSelect;
  ArrayList<Atom> atomList=new ArrayList<Atom>();

  World() {    
    wallpaper = loadImage("background.gif");
    wallY=0;
    pSelect=0;
    higgs=new Higgs[4]; 
    power=new Power[2];   
    for (int i=0;i<4;i++) {
      higgs[i]=new Higgs();
    }    
    for (int i=0;i<2;i++) {      
      power[i]=new Power();
    }
    for (int i=0;i<1;i++) {
      atomList.add(new Atom());
    }
  }

  void render() {      
    background(0); 
    imageMode(CORNER);
    image(wallpaper, 0, wallY);      
    image(wallpaper, 0, wallY-1132);    
    if (woopY<300) {         
      if (climbSpeed<0) {          
        wallY-=climbSpeed;
      }
    }        
    if (wallY>height) {
      wallY=0;
    }
    for (int i=0;i<4;i++) {    
      higgs[i].display();
      if (woopY<300) {
        if (climbSpeed<0) {          
          higgs[i].y-=climbSpeed;
        }
        if (dist(higgs[i].x, higgs[i].y, woopX, woopY)<140) {
          multi+=1;
          higgs[i].x*=0;
          higgs[i].x=random(width);
          higgs[i].y-=random(500, 1000);
        }
        if (higgs[i].y>1600) {
          higgs[i].x=random(width);
          higgs[i].y=-random(4000);
        }
      }
    }  
    for (int i=0;i<2;i++) {    
      power[i].display();
      if (woopY<300) {
        if (climbSpeed<0) {          
          power[i].y-=climbSpeed;
        }
      }  
      if (dist(power[i].x, power[i].y, woopX, woopY)<60) {
        pSelect=random(1, 2);
        powerSelector();
        power[i].x*=0;
        power[i].x=random(width);
        power[i].y-=random(500, 1000); 
        if (woopAlphas<5) {        
          woopAlphas+=1;
        }
      }
      if (power[i].y>1600) {
        power[i].x=random(width);
        power[i].y=-random(4000);
      }
    }
    for (int i=0;i<atomList.size();i++) {
      Atom atom=atomList.get(i);
      atom.display();
      atom.move();
      if (woopY<300) {
        if (climbSpeed<0) {
          atom.y-=climbSpeed;
        }
      }
      if (dist(atom.x, atom.y, woopX, woopY)<60) {
        if (climbSpeed>0) { 
          atomList.add(new Atom(atom.x, atom.y));          
          atomList.add(new Atom(atom.x, atom.y));
          atomList.add(new Atom(atom.x, atom.y));                   
          atomList.remove(i);
          climbSpeed*=0;
          gravity*=0;
          climbSpeed=-40;
          gravity=2;
          pt+=10;        
          if (woopElecs<20) {        
            woopElecs+=1;
          }
        }
      } 
      if (atom.y>1200) {
        atomList.remove(i);
      }
    }
  }
  void powerSelector() {
    if (pSelect<1.5) {
      pt+=1000;
    }
    if (pSelect>1.5) {
      multi+=5;
    }
  }
}



