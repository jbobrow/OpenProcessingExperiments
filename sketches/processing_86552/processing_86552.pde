
import ddf.minim.*;


Minim minim;
AudioSample bang;

String filenames[] = {
  "winxppro.png", "top.png", "mid.png", "bottom.png", "x.png", "ok.png", "stop.png", "sbottom.png", "sx.png", "smid.png","bubble.png"
};

PImage images[];
PImage bubble;

color palette[] = {
  color(#FFFFFF), color(#ece9d7), color(#0E8CE9), color(#004E98)
};

PFont verdana;

int NUM = 5;
String errorTexts[];

boolean ONCE = true;
Error LAST;

ArrayList errors;

float XX = 0;
float YY = 0;


void setup() {


 // size(images[0].width, images[0].height, P2D);
 size(800,600, P2D);


  minim = new Minim(this);
  // load BD.wav from the data folder, with a 512 sample buffer

  bang = minim.loadSample("error.wav");


  images = new PImage[filenames.length];

  for (int i = 0 ; i < images.length;i++)
    images[i] = loadImage(filenames[i]);

  verdana = loadFont("Tahoma-11.vlw");
  textFont(verdana);
  textMode(SCREEN);

  errors = new ArrayList();






  errorTexts = loadStrings("errors.txt");


  noSmooth();
}

void draw() {
  background(images[0]);


  for (int i = errors.size()-1 ; i >= 0;i--) {
    Error e = (Error)errors.get(i);
    e.check();
  }


int x = width-50,y = height-10;
 fill(0);
  text(hour()+":"+nf(minute(), 2), x, y);

  fill(255);
  text(hour()+":"+nf(minute(), 2), x-1, y-1);

  for (int i = 0 ; i < errors.size();i++) {
    Error e = (Error)errors.get(i);
    e.draw();
  }

  if (DRAGGING) {
    Error tmp = (Error)errors.get(errors.size()-1);
    tmp.pos.x = mouseX-OFFX;
    tmp.pos.y = mouseY-OFFY;
  }
  
  if(errors.size()==0)
  image(images[10],0,0);
}

float OFFX = 0, OFFY = 0;
boolean DRAGGING = false;

void mousePressed() {
  ONCE = true;

  if (errors.size()>0) {
    Error tmp = (Error)errors.get(errors.size()-1);

    OFFX = mouseX-tmp.pos.x;
    OFFY = mouseY-tmp.pos.y;
  }



  if (errors.size()==0) {
    errors.add(new Error(true));
    LAST = (Error)errors.get(errors.size()-1);
  }
}

void mouseDragged() {
  Error tmp = (Error)errors.get(errors.size()-1);
  if (tmp.overTop()) {
    DRAGGING = true;

    if (ONCE && tmp.overTop()) {
      OFFX = mouseX-tmp.pos.x;
      OFFY = mouseY-tmp.pos.y;
    }
  }
}


void mouseReleased() {
  DRAGGING = false;
}




class Error {
  PImage X, top, mid, bottom, ok;
  PImage SX, Stop, Smid, Sbottom;
  PVector pos;
  String text = "";
  int H = 180;
  boolean ontop = false;
  boolean DRAGGING = false;


  Error(boolean _ran) {
    top = images[1];
    mid = images[2];
    bottom = images[3];
    X = images[4];
    ok = images[5];
    Stop = images[6];
    Sbottom = images[7];
    SX = images[8];
    Smid = images[9];

    if (_ran) {
      pos = new PVector(random(width-top.width/2), random(height-H-34));


      border();
    }
    else {
      pos = new PVector(width/2+XX-top.width/2, height/2+YY-H/2);
    }

    XX+=7;
    YY+=7;

    if (XX>100||YY>100)
    {
      XX=0;
      YY=0;
    }

    getText();

    bang.trigger();
  }

  void getText() {

    int ran = (int)random(errorTexts.length-30);


    for (int i = ran ; i < errorTexts.length-10;i++) {
      String ln  = errorTexts[i];
      boolean mainline = ln.indexOf("ERROR_") > -1 ? true : false;

      if (mainline) {
        text += errorTexts[i]+"\n"; 
        int cnt = 1;
        while (errorTexts[i+cnt].indexOf ("ERROR_") > -1 ? false : true) {
          text += errorTexts[i+cnt]+"\n";
          cnt++;
        }
        break;
      }
    }
  }

  void draw() {

    border();

    pushMatrix();
    translate(pos.x, pos.y);

    if (selected()) {
      image(top, 0, 0, top.width/2, top.height/2);
      image(mid, 0, 22, top.width/2, H-20);
      image(bottom, 0, H, bottom.width/2, bottom.height/2);
      image(X, 12, 30, X.width/2, X.height/2);
    }
    else {
      image(Stop, 0, 0, top.width/2, top.height/2);
      image(Smid, 0, 22, top.width/2, H-20);
      image(Sbottom, 0, H, bottom.width/2, bottom.height/2);
      image(SX, 12, 30, X.width/2, X.height/2);
    }


    image(ok, bottom.width/2-74, H-30, ok.width/2, ok.height/2);
    fill(0);
    text(text, pos.x+50, pos.y+40, top.width/2-100, 200);



    popMatrix();
  }

  void check() {
    if (mousePressed && !DRAGGING) {

      if (ONCE && over()) {
        Error tmp = this;
        errors.remove(this);
        errors.add(tmp);
        ONCE = false;
      }

      if (over() && selected()) {

        if (overOk()) {
          errors.remove(this);
          errors.add(new Error(true));
          errors.add(new Error(true));
          mousePressed = false;
          ONCE = false;
        }
        if (overX()) {
          errors.remove(this);
          
          mousePressed = false;
          ONCE = false;
        }
      }
    }
  }

  boolean selected() {
    return errors.indexOf(this)==errors.size()-1;
  }

  boolean top() {
    boolean answer = true;
    for (int i = errors.indexOf(this) ; i < errors.size() ; i++) {
      Error other = (Error)errors.get(i);
      answer = !other.over();
      if (answer)
        break;
    }
    return answer;
  }



  void border() {
    pos.y = constrain(pos.y, 0, height-H-34); 
    pos.x = constrain(pos.x, 0, width-top.width/2);
  }

  boolean over() {
    if (mouseX>pos.x && mouseX < pos.x+top.width/2 && mouseY > pos.y && mouseY < pos.y+H) {
      return true;
    }
    else {
      return false;
    }
  }

  boolean overOk() {

    if (mouseX>pos.x+bottom.width/2-74 && mouseX < pos.x+bottom.width/2-74+ok.width/2 && mouseY > pos.y+H-30 && mouseY < pos.y+H-30+ok.height/2) {
      return true;
    }
    else {
      return false;
    }
  }

  boolean overTop() {

    if (mouseX>pos.x && mouseX < pos.x+bottom.width/2 && mouseY > pos.y && mouseY < pos.y+30) {
      return true;
    }
    else {
      return false;
    }
  }

  boolean overX() {
    if (mouseX>pos.x+top.width/2-30 && mouseX < pos.x+bottom.width/2 && mouseY > pos.y+2 && mouseY < pos.y+30) {
      return true;
    }
    else {
      return false;
    }
  }
}

void stop()
{
  // close the AudioSamples before we exit
  bang.close();
  super.stop();
}


