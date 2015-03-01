
PFont font;
String [] chou = {
  "て", "ふ", "て", "ふ", "が", "一", "匹", "韃", "靼", "海", "峡", "を", "渡", "っ", "て", "行", "っ", "た"
};
float[] sen = new float[18];
float[] x = new float[sen.length];
float[] y = new float[sen.length];
float[] xx = new float[sen.length];
float[] yy = new float[sen.length];
int yoko = 400;
float aki = (600-yoko)/2;
float pat = yoko / sen.length / 2;
float[] addX = new float[sen.length];
float[] addY = new float[sen.length];
float fs = 10;
float[] tx = new float[sen.length];
float[] ty = new float[sen.length];
int mode = 0;
boolean isLoop = true;
boolean isPressed = false;
float r;
float xxx = 0;
float yyy = 300;
boolean Loop = true;
float angle = 0;

void setup() {
  size(600, 600);
  background(255);
  for (int i=0; i<sen.length; i++) {
    x[i]=yoko/sen.length * i + aki + pat;
    y[i]=0;
    tx[i]=x[i];
    ty[i]=300;
    xx[i]=tx[i];
    yy[i]=ty[i];
    addX[i]=random(0.5);
    addY[i]=random(-0.3, 0.3);
  }
  font = createFont("IPAex明朝", 100);
  textFont(font);
}

void draw() {
  background(255);
  fill(0);
  stroke(0);
  if (mode == 0) {
    aki = (600-yoko)/2;
    pat = yoko / sen.length / 2;
    //ln(aki, pat);
    yoko=400;
    for (int i=0; i<sen.length; i++) {
      x[i]=yoko/sen.length * i + pat + aki;
      y[i]=0;
      tx[i]=x[i];
      ty[i]=300;
      //xx[i]=tx[i];
      //yy[i]=ty[i];
      addX[i]=0;
      addY[i]=0;
      line(xx[i], yy[i], x[i], y[i]);
      textSize(fs);
      text(chou[i], xx[i]-fs/2, yy[i]+fs*1.5);
      //int w = (int)textWidth(chou[i]); 
      if (mousePressed) {
        move();
      } else {
        undo();
      }
    }
  }
  if (mode == 1) {
    background(255);
    yoko=300;
    aki = (600-yoko)/2;
    pat = yoko / sen.length / 2;
    float cx, cy, r, angle, _angle;
    cx=width/2;
    cy=height/2+100;    
    r=140;
    angle=0;
    _angle=PI/17;
    for (int i=0; i<sen.length; i++) {
      //ln(angle,_angle);
      x[i]=yoko/sen.length * i + aki + pat;
      y[i]=0;
      tx[i]=cx+r*cos(angle);
      ty[i]=cy+r*sin(angle);
      angle+=_angle;


      line(xx[i], yy[i], x[i], y[i]);
      textSize(fs);

      text(chou[i], xx[i]-fs/2, yy[i]+fs*1.5);
      if (isLoop == true) {
        addX[i]=random(-1, 1);
        addY[i]=random(-1, 1);
      }
      if (isPressed == true) {
        moveA();
      } else {
        isLoop=true;
        undo();
      }
    }
  }
  if (mode == 2) {
    background(255);   
    
    for (int i=0; i<sen.length; i++) {
      if (i>=0&&i<5) {
        yoko = 100;
        x[i]=yoko/5 * i +50;
        y[i]=0;
        tx[i]=x[i];
        ty[i]=200;
        line(xx[i], yy[i], x[i], y[i]);
        textSize(fs);
        text(chou[i], xx[i]-fs/2, yy[i]+fs*1.5);
      } else if (i>=5&&i<7) {
        yoko=40;
        x[i] = yoko/2 * (i-5) + 100;
        y[i]=0;
        tx[i]=x[i];
        ty[i]=300;
        line(xx[i], yy[i], x[i], y[i]);
        textSize(fs);
        text(chou[i], xx[i]-fs/2, yy[i]+fs*1.5);
      } else if (i>=7&&i<12) {
        yoko=100;
        x[i] = yoko/5 * (i-7) + 150;
        y[i]=0;
        tx[i]=x[i];
        ty[i]=400;
        line(xx[i], yy[i], x[i], y[i]);
        textSize(fs);
        text(chou[i], xx[i]-fs/2, yy[i]+fs*1.5);
      } else if (i>=12) {
        yoko=200;
        x[i] = yoko/6 * (i-12) + 330;
        y[i]=0;
        tx[i]=x[i];
        ty[i]=300;
        line(xx[i], yy[i], x[i], y[i]);
        textSize(fs);
        text(chou[i], xx[i]-fs/2, yy[i]+fs*1.5);
      }

      if (isPressed == true) {
        moveC();
        
      } else {
        isLoop=true;
        undo();
        angle = 0;
        xxx = 0;
        yyy = 0;
      }
    }
  }
  if (mode==3) {
    background(255);
    yoko=400;
    aki = (600-yoko)/2;
    pat = yoko / sen.length / 2;
    for (int i=0; i<sen.length; i++) {
      x[i]=yoko/sen.length * i + pat + aki;
      y[i]=0;
      tx[i]=x[i];
      if (i%2==1) {
        ty[i]=205+10*i;
      } else {
        ty[i]=195+10*i;
      }
      //xx[i]=tx[i];
      //yy[i]=ty[i];
      addX[i]=0;
      addY[i]=0;
      line(xx[i], yy[i], x[i], y[i]);
      textSize(fs);
      text(chou[i], xx[i]-fs/2, yy[i]+fs*1.5);
      if (mousePressed) {
        moveB();
      } else {
        undo();
      }
    }
  }
}









void undo() {
  for (int i=0; i<sen.length; i++) {
    addX[i]=0;
    addY[i]=0;
    xx[i]=xx[i]+(tx[i]-xx[i])/80.0;
    yy[i]=yy[i]+(ty[i]-yy[i])/80.0;
  }
}

void move() {
  for (int i=0; i<sen.length; i++) {
    addX[i] = random(-1, 1);
    addY[i] = random(-1, 1);
    xx[i] = xx[i] + addX[i];
    yy[i] = yy[i] + addY[i];
  }
}

void moveA() {



  for (int i=0; i<sen.length; i++) {
    xx[0] = mouseX;
    yy[0] = mouseY;
    if (i!=0) {
      xx[i] = xx[i] + (xx[i-1] - xx[i]) / 200.0;
      yy[i] = yy[i] + (yy[i-1] - yy[i]) / 200.0;
    }
  }
}


void moveB() {
  for (int i=0; i<sen.length; i++) {
    boolean Loop = true;
    if (Loop == true) {
      addX[i] = 0;
      addY[i] = random(-1, 1);
      Loop = false;
    }
    xx[i] = xx[i] + addX[i];
    yy[i] = yy[i] + addY[i];
  }
}

void moveC() {
  r = 10;
  xxx = r * (angle+sin(angle));
  yyy = r * (1-cos(angle)) + 300;
  fill(255,255,255,0.1);
  noStroke();
  ellipse(xxx, yyy, r, r);
  stroke(0);
  fill(0);
  angle += 0.01;
  for (int i=0; i<sen.length; i++) {
    xx[0] = xx[0] + (xxx - xx[0]) / 200.0;
    yy[0] = yy[0] + (yyy - yy[0]) / 200.0;
    if (i!=0) {
      xx[i] = xx[i] + (xx[i-1] - xx[i]) / 200.0;
      yy[i] = yy[i] + (yy[i-1] - yy[i]) / 200.0;
    }
  }
}




void mouseClicked() {
  //mode += 1;
  if (mode>3) {
    mode=0;
  }
}

void mousePressed() {
  isPressed = true;
}

void mouseReleased() {
  isPressed = false;
}

void keyPressed() {
    if (key=='p') {
    saveFrame("bkground.png");
  } 
  if (key == CODED) {
    if (keyCode == RIGHT) {
      mode += 1;
      if (mode>3) {
        mode=0;
      }
    }
    if (keyCode == LEFT) {
      mode -= 1;
      if (mode<0) {
        mode=3;
      }
    }
  }
}



