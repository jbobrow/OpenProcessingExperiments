
PImage cover;
PImage dsotm;
PImage loser;
PImage pf;
PImage pfa;
PImage pfb;
PImage pfc;
PImage pfd;
PImage pfe;
PImage pff;
PImage pfg;
PImage pfh;
PImage pfi;
PImage pfj;
PImage pfk;
PImage pfl;
PImage pfm;
PImage pfn;
PImage pfo;
PImage pfp;
PImage pfq;
PImage pfr;
PImage pfs;
PImage pft;
PImage pfu;
PImage pfv;
PImage pfw;
PImage pfx;
PImage pfy;
int count=0;
boolean start=true;
boolean button = false;


void setup() {
  PFont font;
  font = loadFont("Cambria-Bold-100.vlw");
  textSize(50);
  cover = loadImage("cover.png");
  dsotm = loadImage("dsotm.png");
  loser = loadImage("loser.png");
  pf = loadImage("pf.png");
  pfa = loadImage("pfa.png");
  pfb = loadImage("pfb.png");
  pfc = loadImage("pfc.png");
  pfd = loadImage("pfd.png");
  pfe = loadImage("pfe.png");
  pff = loadImage("pff.png");
  pfg = loadImage("pfg.png");
  pfh = loadImage("pfh.png");
  pfi = loadImage("pfi.png");
  pfj = loadImage("pfj.png");
  pfk = loadImage("pfk.png");
  pfl = loadImage("pfl.png");
  pfm = loadImage("pfm.png");
  pfn = loadImage("pfn.png");
  pfo = loadImage("pfo.png");
  pfp = loadImage("pfp.png");
  pfq = loadImage("pfq.png");
  pfr = loadImage("pfr.png");
  pfs = loadImage("pfs.png");
  pft = loadImage("pft.png");
  pfu = loadImage("pfu.png");
  pfv = loadImage("pfv.png");
  pfw = loadImage("pfw.png");
  pfx = loadImage("pfx.png");
  pfy = loadImage("pfy.png");
  size(600, 600);
  fill(255, 0, 0);
  background(0);
  imageMode(CENTER);
  for (int i=0;i<p.length;i++) {
    p[i] = new Particle(mouseX, mouseY);
  }
}

float a=0;
float c=400;
float d=400;

void draw() {
  if (start==true) {
    textSize(27);
    tint(255, 20);
    image(cover, width/2, height/2);
    noTint();
    fill (random(100), random(100), random(100));
    text("Group 5 - Pink Floyd Album Cover Game", 10, 80);
    textSize(20);
    fill (255, 0, 0);
    text("RULES:-", 10, 180);
    text("* Hold down any key from a-z to reveal an album cover", 10, 220);
    text("* Let go to see if it's by Pink Floyd", 10, 260);
    text("* Beware though, one album cover doesnt belong!!", 10, 300);
    text("* Find this and it's game over", 10, 340);
    text("* Press RETURN at any point to move the cursor image", 10, 380);
    text("* Right arrow increases speed, Left arrow changes direction", 10, 420);
    text("PRESS ANY KEY TO START", 150, 500);
    fill(255, 50);
    rect(0, 0, width, height);
    stroke(0);
    if (keyPressed == true) {
      start = false;
    }
  }
  dsotm(); 
  covers(count);
}

void dsotm() {
  pushMatrix();
  translate(mouseX, mouseY);
  scale(0.1);
  if (keyCode==RIGHT) {
    rotate(a+=0.0501);
    if (keyPressed == false) {
      rotate(a-=0.08);
    }
  }
  if (keyCode==LEFT) {
    rotate(a-=0.1);
    if (keyPressed == false) {
      rotate(a+=0.07);
    }
  }
  rotate(a+=0.05);

  image(dsotm, mouseX, mouseY);

  popMatrix();
}

Particle[] p = new Particle[100];


void mouseClicked() {
  fill(255);
  textSize(20);
  text("CLICK HERE", 380, 555);
  if (dist(545, 550, mouseX, mouseY)< 40) {
    fill(0, 255, 0);
    button=true;
  }
  else {
    fill(255, 0, 0);
  }
  ellipse(545, 550, 80, 80);
  if (button==true) {
    end();
  }
}




void end() {
  float x=width/2;
  float y=height/2;
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  if (mousePressed) {
    point(mouseX, mouseY);
    for (int i=0;i<p.length;i++) {
      p[i] = new Particle(x, y);
    }
  }

  for (int i=0;i<p.length;i++) {
    p[i].render();
  }
}

class Particle {

  float xPos=width/2;
  float yPos=height/2;
  float a=0;
  float g=0;
  float m=0;


  int counter=0;

  public Particle(float x, float y) {
    xPos = width/2;
    yPos = y;
    a = random(360);
    m=random(100);
    counter=0;
  }

  public void render() {
    counter++;

    if (counter > 1) {
      xPos += m*cos(radians(a));
      yPos += m*sin(radians(a));
      yPos += g;
      g+=0.04;
    }
    fill(0, 0, 0, 0);
    rect(0, 0, width, height-100);
    fill(random(255), 0, 0);
    ellipse(xPos, yPos, random(50, 10), random(50, 10));
    textSize(35);
    fill(0, 0, random(255));
    text("PRESS SPACE BAR TO START AGAIN", 5, 280);
  }
}

void covers(int count) {
  textSize(20);

  String s = "Press any key to continue";
  if (key=='a') {
    count++;
    image(pf, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pf, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(+count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }


  if (key=='b') {
    count++;
    image(pfa, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfa, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='c') {
    count++;
    image(pfb, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfb, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='d') {
    count++;
    image(pfc, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfc, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='e') {
    count++;
    image(pfd, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfd, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='f') {
    count++;
    image(pfe, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfe, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='g') {
    count++;
    image(pff, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pff, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='h') {
    count++;
    image(pfg, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfg, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='i') {
    count++;
    image(pfh, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfh, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='j') {
    count++;
    image(pfi, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfi, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='k') {
    count++;
    image(pfj, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfj, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='l') {
    count++;
    image(pfk, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfk, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='m') {
    count++;
    image(pfl, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfl, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='n') {
    count++;
    image(pfm, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfm, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='o') {
    count++;
    image(pfn, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfn, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='p') {
    count++;
    image(pfo, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfo, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='q') {
    count++;
    image(pfp, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfp, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='r') {
    count++;
    image(pfq, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfq, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='s') {
    count++;
    image(pfr, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfr, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='t') {
    count++;
    image(pfs, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfs, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='u') {
    count++;
    image(pft, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pft, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='v') {
    count++;
    image(pfu, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfu, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='w') {
    count++;
    image(pfv, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfv, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='x') {
    count++;
    image(pfx, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfx, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
  if (key=='y') {
    image(pfy, width/2, height/2);
    if (keyPressed == false) {
      fill(0);

      rect(0, 0, width, height); 

      image(loser, width/2, height/2);
      mouseClicked();
    }
  }
  if (key=='z') {
    count++;
    image(pfw, width/2, height/2);
    if (keyPressed == false) {
      fill(0);
      rect(0, 0, width, height); 
      scale(0.5);
      image(pfw, width, height);
      scale(2);
      fill (random(255), random(255), random(255));
      text("WELL DONE!", 230, 150);
      fill(0, 255, 0);
      text("Score : ", 500, 590); 
      text(count, 570, 590);
      fill(180, 65, 80);
      text (s, 170, 430, 600, 600);
    }
  }
}


