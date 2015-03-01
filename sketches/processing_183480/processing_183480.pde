
import org.puredata.processing.*;
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/23558*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int speed = 1; 
PureData pd;



Postava p;
ArrayList trail = new ArrayList();

void setup() {
  pd = new PureData(this, 44100, 0, 2);
  pd.openPatch("isocon2.pd");
  // pd.subscribe("foo");  // Uncomment if you want to receive messages sent to the receive symbol "foo" in Pd.
  pd.start();
  size(320, 207);
  p = new Postava();
  textFont(createFont("Verdana", 9, false));
  imageMode(CENTER);
  frameRate(60);
  smooth();
}

void draw() {


  background(255);
  //fill(255,100);
  //rect(0,0,width,height);


  pushStyle();

  noStroke();

  //strokeCap(PROJECT);
  //strokeWeight(20);
  // beginShape();
  float s = 19.5;

  for (int i = 0; i<trail.size (); i++) {    
    Point tmp = (Point)trail.get(i);
    //if(dist(lx,ly,tmp.x,tmp.y)<height)
    noFill();
    stroke(0, map(dist(tmp.x, tmp.y, p.x, p.y), 0, 60, 255, 0));
    beginShape();
    vertex(tmp.x-s, tmp.y+14);
    vertex(tmp.x, tmp.y-s*p.iso+14);
    vertex(tmp.x+s, tmp.y+14);
    vertex(tmp.x, tmp.y+s*p.iso+14);


    endShape(CLOSE);
  }
  // endShape();
  popStyle();

  p.show();
}


void keyPressed() {

  if (!p.moving) { 

    p.moving = true;

    if (keyCode==LEFT) {
      p.changeDir(0);
      pd.sendBang("left");
    }

    if (keyCode==UP) {
      p.changeDir(1);
      pd.sendBang("up");
    }

    if (keyCode==RIGHT) {
      p.changeDir(2);
      pd.sendBang("right");
    }

    if (keyCode==DOWN) {
      p.changeDir(3);
      pd.sendBang("down");
    }
  }
  keyPressed = false;
}


class Postava {
  ArrayList sprites = new ArrayList();
  Anim current;

  PGraphics shade;
  int curFaze = 0;
  float x, y;
  float moveSpeed = 1;
  int dir= 1;
  boolean moving = false;
  float iso = 0.64736;
  int w = 64;
  int h = 64;
  int timer = 0;

  color c;


  Postava() {
    c = color(0);

    sprites.add(new Anim("cubeLD.png", w, h, 10));
    sprites.add(new Anim("cubeLT.png", w, h, 10));
    sprites.add(new Anim("cubeRT.png", w, h, 10));
    sprites.add(new Anim("cubeRD.png", w, h, 10));

    x = width/2;
    y = height/2;

    shade = createGraphics(64, 64, JAVA2D);
    shade.beginDraw();
    shade.fill(0, 15);
    shade.noStroke();
    for (int i = 0; i<w/2; i+=3) {
      shade.ellipse(w/2, h/2, i*2, i);
    }
    shade.endDraw();


    current = (Anim)sprites.get(dir);
  }

  void show() {    


    //text("X: "+x+"\nY: "+y,x+w/2,y);
    image(shade, x, y+14);





    c = color(random(255), random(255), random(255));
    fill(0, 120);
    current.draw(curFaze, c, x, y);
    move();
  }

  void move() {

    if (moving) {



      if (timer%speed==0) {
        curFaze++;
      }


      timer ++;

      if (curFaze>=current.pocet) {
        moving = false;
        curFaze = 0;
        timer = 0;

        trail.add(new Point(x, y));
        pd.sendFloat("trailx", (float)x);
        pd.sendFloat("traily", (float)y);

        

        if (trail.size()>80) {
          trail.remove(0);
        }
      }

      if (dir==0) {
        x-=moveSpeed;
        y+=iso*moveSpeed;
      }

      if (dir == 1) {
        x-=moveSpeed;
        y-=iso*moveSpeed;
      }

      if (dir == 2) {
        x+=moveSpeed;
        y-=iso*moveSpeed;
      }

      if (dir == 3) {
        x+=moveSpeed;
        y+=iso*moveSpeed;
      }

      if (x>width+w/2) {
        x=-w/2;
      }
      if (x<-w/2) {
        x=width+w/2;
      }
      if (y>height+h/2) {
        y=-h/2;
      }
      if (y<-h/2) {
        y=height+h/2;
      }
    }
  }

  void changeDir(int _kam) {
    dir = _kam;
    current = (Anim)sprites.get(dir);
  }
}


class Anim {
  PImage src;
  ArrayList faze = new ArrayList();
  String filename;
  int pocet;
  int w, h;

  Anim(String _filename, int _w, int _h, int _pocet) {
    filename = _filename;
    src = loadImage(filename);

    w=_w;
    h=_h;
    pocet = _pocet;

    for (int i = 0; i<pocet; i++) {
      PGraphics tmp = createGraphics(w, h, JAVA2D);
      tmp.beginDraw();
      tmp.image(src, -i*w, 0);
      tmp.endDraw();
      faze.add(tmp);
    }
  }

  void draw(int f, color _c, float _x, float _y) {
    PGraphics current = (PGraphics)faze.get(f);
    tint(_c);
    image(current, _x, _y);
    noTint();
  }
}

class Point {
  float x, y;

  Point(float _x, float _y) {
    x=_x;
    y=_y;
  }
}


//void mouseMoved() {
// send 2 osc messages with address /mousex and /mousey 
// when the mouse is moved
//oscP5.send(new OscMessage("/mousex").add(mouseX), puredata);
//oscP5.send(new OscMessage("/mousey").add(mouseY), puredata);
//println("sending 2 osc messages while moving the mouse");
//}



