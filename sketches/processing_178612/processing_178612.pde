
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
//boolean pause = false, mute=false; 
String enter="Press Any Key";
boolean dooropen=false;

void setup() {
  size(800, 450);  
  background(0);
  smooth();

  d1 = new door("Door1", 100, 100, 150, 250);
  d2 = new door("Door2", 325, 100, 150, 250);
  d3 = new door("Door3", 550, 100, 150, 250);

  volume = new Slider("Volume", 250, 350, 350, 20, -10, 10, color(255, 255, 255), color(255, 0, 0));

  pause = new Checkbox ("Pause", 400, 400, 20, color(255));
  mute = new Checkbox ("mute", 500, 400, 20, color(255));

  minim = new Minim(this);
  song = minim.loadFile("test.mp3");
  song.loop();

  fft = new FFT( song.bufferSize(), song.sampleRate() );

  d1.display();
  d2.display();
  d3.display();
}

void mousePressed() {

  d1.knock();
  d3.knock();
  d2.knock();

  pause.press();
  mute.press();
}

void mouseReleased() {
  d1.release();
  d2.release();
  d3.release();
}

void mouseMoved() {
  d1.over();
  d2.over();
  d3.over();
}


void draw() {
  if (d2.knocked) {
    d2.dooropen();
    d2.light();
    textSize(20);
    text(enter, 320, 400);
  }

  if (keyPressed) {
    room();
    dooropen = true;
  }
  if (dooropen==true) {  
    blood();

    if (pause.isChecked()) {
      song.pause();
    } else song.play();



    if (mute.isChecked()) {
      song.mute();
    } else song.unmute();

    pause.display();
    mute.display();
  }


  if (mouseX>210 && mouseX<400 && mouseY>113 && mouseY<315) {
    pushMatrix();
    noStroke();
    fill(0);
    ellipse(mouseX, mouseY, 20, 40);
    popMatrix();
  }
}

void mouseDragged() {
  volume.slide();
  song.setGain( song.getGain() +volume.pos() );
}

class door {

  String doorNum;
  int x, y;
  int dwidth, dheight;
  boolean over = false;
  boolean knocked = false;
  boolean isKnocked() {
    return knocked;
  }

  door (String d, int xp, int yp, int w, int h) {
    d=doorNum;
    x=xp;
    y=yp;
    dwidth=w;
    dheight=h;
  }

  void over() {
    if ((mouseX>=x) && (mouseX<= x+dwidth) && (mouseY >=y) && (mouseY<=y+dheight)) {
      over=true;
    } else {
      over=false;
    }
  }

  void knock() {
    if (over) {
      knocked = true;
      println(doorNum+ "knocked");
    }
  }

  void release() {
    knocked=false;
  }

  void display() {
    strokeWeight(10);
    stroke(#581C12);
    fill(#8B3323);
    beginShape();
    vertex(x, y);
    vertex(x, y+dheight);
    vertex(x+dwidth, y+dheight);
    vertex(x+dwidth, y);
    endShape(CLOSE);
    noStroke();
    fill(0);
    ellipse(x+dwidth-20, y+dheight-125, 10, 20);
  }

  void dooropen() {
    strokeWeight(10);
    stroke(#581C12);
    fill(#8B3323);
    beginShape();
    vertex(x, y);
    vertex(x, y+dheight);
    vertex(x+50, y+dheight);
    vertex(x+50, y);
    endShape(CLOSE);
    noStroke();
    fill(0);
    ellipse(x+40, y+dheight-125, 5, 10);
  }

  void light() {
    if (d2.knocked) {

      noStroke();
      fill(250, 255, 3, 100);
      rect(x, y-5, dwidth+20, dheight+10);
    } else { 
      fill(0);
    }
  }
}

door d1, d2, d3;

void room() {

  background(0);
  stroke(255);
  strokeWeight(1);
  fill(0);
  beginShape();
  vertex(200, 113);
  vertex(600, 113);
  vertex(600, 337);
  vertex(200, 337);
  endShape(CLOSE);

  line(0, 0, 200, 113);
  line(600, 113, 800, 0);
  line(0, 450, 200, 337);
  line(600, 337, 800, 450);
  pushMatrix();
  
   textSize(20);
    fill(255);
    text("BY LEEJUK", 250, 420);
 
  volume.display();
  pause.display();
  mute.display();
}

void blood() {
  pushMatrix();
  translate(200, 113);
  stroke(209, 0, 0);
  strokeWeight(5);
  fft.forward( song.mix ); 
  for (int i = 0; i < 400; i+=5) {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( i, 0, i, (fft.getBand(i)*2));
  }
  popMatrix();
}

class Checkbox {
  String name;
  int x, y;
  int size;
  color baseCol;
  boolean checked = false;
  boolean isChecked() {
    return checked;
  }

  Checkbox (String s, int xp, int yp, int sz, color b) {
    name=s;
    x=xp;
    y=yp;
    size=sz;
    baseCol=b;
  }

  void press() {
    if ((mouseX >=x) && (mouseY<= x+size) &&(mouseY>=y) && (mouseY<= y+size)) {
      checked = !checked;
      if (checked) println(name+"checked");
      else println(name+"unchecked");
    }
  }

  void display() {
    fill(baseCol);
    stroke(0);
    strokeWeight(1);
    rect(x, y, size, size);
    textSize(10);
    text(name, x+size+10, y+size);
    if (checked) {
      line(x, y, x+size, y+size);
      line(x+size, y, x, y+size);
    }
  }
}

Checkbox pause, mute;

class Slider {
  String name;
  int x, y; // position
  int w, h; // width and height float min, max;
  float min, max;
  float pos; // current value color baseCol;
  color baseCol;
  color highlightCol;
  float pos() { 
    return pos;
  }

  Slider(String s, int xp, int yp, int sw, int sh, float mi, float ma, color bc, color hc) { 
    name = s; // name
    x=xp; // x position
    y=yp; // y position
    w = sw; // slide width
    h = sh; // slide height
    min = mi; // min
    max = ma; // max
    baseCol = bc; // base color highlightCol = hc; // highlight color pos = (min+max)/2; // default position
  }

  void slide() {
    if ((mouseX >=x ) && (mouseX <= x+w) &&
      (mouseY >= y) && (mouseY <= y+h) ) { 
      pos = map(mouseX, x, x+w, min, max);
    }
  }

  void display() {
    fill(baseCol);
    stroke(255);
    rect(x, y, w, h);
    fill(highlightCol);
    rect(x, y, map(pos, min, max, 0, w), h);

    textSize(10);
    fill(255);
    text(name, x-50, y+15);
    text(nf(min, 0, 0), x-10, y+h+20);
    text(nf(max, 0, 0), x+w-10, y+h+20);
  }
}

Slider volume;






