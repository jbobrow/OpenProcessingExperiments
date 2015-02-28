
color fons=color(0, 175, 50);
color verd=color(200, 250, 0);
color verdfosc=color(100, 150, 0);
color varia=color(0, 90, 25);
int e=2;
int v=5;
int total=10;
int x;
int y;
int w=5;
int [] posiciox= new int[total];
int [] posicioy= new int[total];


void setup() {
  size(700, 700);
  for (int i=0; i<total; i++) { 
    posiciox[i] = (width/2)+(int)random(-30, 30); 
    posicioy[i] = (height/2)+(int)random(-30, 30);
   
  }
}
void draw() {
  //noCursor();
  fons();
  dibuix();
  //velocitat();
  velocitatrandom();
  //limits();
  nolimits();
}

void dibuix() {
  for (int i=0; i<total; i++) {
    noStroke();
    if (mousePressed) {
      //cos
      fill(verdfosc);
      rectMode(CENTER);
      rect(posiciox[i], posicioy[i], 150/e, 150/e, 0, 0, 20/e, 20/e);
      //potes
      rectMode(CORNER);
      rect(posiciox[i]+5/e, posicioy[i]+25/e, 40/e, 75/e, 40/e, 40/e, 40/e, 40/e);
      rect(posiciox[i]-45/e, posicioy[i]+25/e, 40/e, 75/e, 40/e, 40/e, 40/e, 40/e);
      //braços
      rect(posiciox[i]+75/e, posicioy[i]-90/e, 40/e, 125/e, 60/e, 60/e, 60/e, 60/e);
      rect(posiciox[i]-115/e, posicioy[i]-90/e, 40/e, 125/e, 60/e, 60/e, 60/e, 60/e);
      //cap
      ellipse(posiciox[i], posicioy[i]-65/e, 150/e, 150/e);
      //antenes
      stroke(verdfosc);
      strokeWeight(5);
      line(posiciox[i]+60/e, posicioy[i]-165/e, posiciox[i], posicioy[i]-80/e);
      line(posiciox[i]-60/e, posicioy[i]-165/e, posiciox[i], posicioy[i]-80/e);
    } 
    else {
      //cos
      fill(verd);
      rectMode(CENTER);
      rect(posiciox[i], posicioy[i], 150/e, 150/e, 0, 0, 20/e, 20/e);
      //potes
      rectMode(CORNER);
      rect(posiciox[i]+5/e, posicioy[i]+45/e, 40/e, 75/e, 40/e, 40/e, 40/e, 40/e);
      rect(posiciox[i]-45/e, posicioy[i]+45/e, 40/e, 75/e, 40/e, 40/e, 40/e, 40/e);
      //braços
      rect(posiciox[i]+85/e, posicioy[i]-90/e, 40/e, 125/e, 60/e, 60/e, 60/e, 60/e);
      rect(posiciox[i]-125/e, posicioy[i]-90/e, 40/e, 125/e, 60/e, 60/e, 60/e, 60/e);
      //cap
      ellipse(posiciox[i], posicioy[i]-75/e, 150/e, 150/e);
      fill(fons);
      rectMode(CENTER);
      rect(posiciox[i], posicioy[i]-70/e, 150/e, 5/e);
      ellipse(posiciox[i]+35/e, posicioy[i]-110/e, 15/e, 15/e);
      ellipse(posiciox[i]-35/e, posicioy[i]-110/e, 15/e, 15/e);
      //antenes
      stroke(verd);
      strokeWeight(5);
      line(posiciox[i]+60/e, posicioy[i]-175/e, posiciox[i], posicioy[i]-80/e);
      line(posiciox[i]-60/e, posicioy[i]-175/e, posiciox[i], posicioy[i]-80/e);
    }
  }
}

void fons() {
  if (mousePressed) {
    background(varia);
  }
  else {
    background(fons);
    for (int i=0; i<height; i=i+20) {
      strokeWeight(1);
      stroke(i/3, 100, 0);
      line(0, i, width, i);
    }
    noFill();
    stroke(0);
    ellipse(width/2, height/2, 400, 400);
    stroke(verdfosc);
    rectMode(CENTER);
    fill(200, 200, 0);
    rect(width/2, height/2-5, 260, 50);
    fill(0);
    textSize(20);
    text("Click & turn off the lights!", width/2-122, height/2);
  }
}

void nolimits() {
  for (int i=0; i<total;i++) {
    if (posiciox[i]>width) {
      posiciox[i]=0;
    }
    if (posiciox[i]<0) {
      posiciox[i]=width;
    }
    if (posicioy[i]>height) {
      posicioy[i]=0;
    }
    if (posicioy[i]<0) {
      posicioy[i]=height;
    }
  }
}


void velocitat() {
  for (int i=0;i<total;i++) {
    posiciox[i]=posiciox[i]+v;
    posicioy[i]=posicioy[i]+w;
  }
}


void velocitatrandom() {
  for (int i=0;i<total;i++){
  float r=random(100);
  if (r<25) {
    //dreta
    posiciox[i]=posiciox[i]+v;
  } 
  else if (r<50) {
    //esquerra
    posiciox[i]=posiciox[i]-v;
  } 
  else if (r<75) {
    //amunt
    posicioy[i]=posicioy[i]+w;
  } 
  else {
    //aball
    posicioy[i]=posicioy[i]-w;
  }
}
}
  void limits() {
    for (int i=0;i<total;i++) {
      if (posiciox[i]+125/e>width||posiciox[i]-125/e<0) {
        v=-v;
      }
      if (posicioy[i]+115/e>height||posicioy[i]-175/e<0) {
        w=-w;
      }
    }
  }

  void mousePressed() {
    for (int i=0; i<total; i++) {
      posiciox[i]=mouseX;
      posicioy[i]=mouseY;
    }
  }



