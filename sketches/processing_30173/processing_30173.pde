
int w = 1;
PFont f;
PFont g;
int[] yfarben = {
  150, 200, 250, 300, 350, 400, 450, 500, 550
};
color b = color(0, 0, 255);
color gr = color(0, 200, 0);
color r = color(255, 0, 0);
color ge = color(255, 255, 0);
color we = color(255, 255, 255);
color s = color(0);
color o = color(255, 150, 0);
color l = color(150, 0, 150);
int xr = 100;
int xg = 100;
int xb = 100;
color x = color(xr, xg, xb);
color[] farben = {
  b, gr, r, ge, we, s, o, l, x
};
color c = b;
boolean xselected=false;
PImage hflip;
PImage vflip;
PImage inv;

void setup() {
  g = createFont("Arial", 19);
  f = createFont("Arial", 32);
  size(800, 600);
  background(255);
  strokeWeight(1);
  hflip=loadImage("hflip.png");
  vflip=loadImage("vflip.png");
  inv=loadImage("invert.png");
  smooth();
}

void draw() {
  stroke(150);
  fill(150);
  rect(0, 0, 800, 70);
  rect(0, 0, 70, 600);
  stroke(0);
  line(0, 0, 800, 0);
  line(0, 0, 0, 600);
  line(800, 0, 800, 600);
  line(0, 600, 800, 600);
  line(70, 70, 800, 70);
  line(70, 70, 70, 600);
  fill(200);
  rect(150, 20, 30, 30);
  rect(200, 20, 30, 30);
  rect(250, 20, 30, 30);
  fill (0, 100, 0);
  rect(300, 20, 30, 30);
  fill(200);
  rect(350, 20, 30, 30);
  rect(400, 20, 30, 30);
  rect(450, 20, 30, 30);
  rect(500, 20, 284, 30);
  fill (0, 100, 0);
  rect(155, 25, 20, 20);
  ellipse(215, 35, 20, 20);
  ellipse(265, 35, 10, 10);
  image(hflip, 351, 21, 29, 29);
  image(vflip, 401, 21, 29, 29);
  image(inv, 451, 21, 29, 29);
  fill(0);
  textFont(f);
  text("r="+xr+" g="+xg+" b="+xb, 504, 48);
  fill(200);
  rect(5,5,60,60);
  fill(c);
  if(w==1){
    rect(25, 25, 20, 20);
  }
  if(w==2){
    ellipse(35, 35, 20, 20);
  }
  if(w==3){
    ellipse(35, 35, 10, 10);
  }
  for (int j=0;j<9;j++) {
    fill(200);
    rect(20, yfarben[j], 30, 30);
    fill (farben[j]);
    rect(25, yfarben[j]+5, 20, 20);
  }
  fill(x);
  rect(25, 555, 20, 20);
  if (keyPressed==true) {
    if (key=='1') {
      w=1;
    }
    if (key=='2') {
      w=2;
    }
    if (key=='3') {
      w=3;
    }
    if (key=='0') {
      stroke (c);
      fill (c);
      rect(71, 71, 729, 529);
    }
    if (key=='7') {
      xr=xr+1;
      if (xr>255) {
        xr=255;
      }
    }
    if (key=='4') {
      xr=xr-1;
      if (xr<0) {
        xr=0;
      }
    }
    if (key=='8') {
      xg=xg+1;
      if (xg>255) {
        xg=255;
      }
    }
    if (key=='5') {
      xg=xg-1;
      if (xg<0) {
        xg=0;
      }
    }
    if (key=='9') {
      xb=xb+1;
      if (xb>255) {
        xb=255;
      }
    }
    if (key=='6') {
      xb=xb-1;
      if (xb<0) {
        xb=0;
      }
    }
  }
  x=color(xr, xg, xb);
  if (mousePressed==true) {
    if (mouseX>=150 && mouseX<=180 && mouseY>=20 && mouseY<=50) {
      w=1;
    }
    if (mouseX>=200 && mouseX<=230 && mouseY>=20 && mouseY<=50) {
      w=2;
    }
    if (mouseX>=250 && mouseX<=280 && mouseY>=20 && mouseY<=50) {
      w=3;
    }
    if (mouseX>=300 && mouseX<=330 && mouseY>=20 && mouseY<=50) {
      stroke (c);
      fill (c);
      rect(71, 71, 729, 529);
    }
    if (mouseX>=350 && mouseX<=380 && mouseY>=20 && mouseY<=50) {
      cursor(WAIT);
      for (int x=70; x<=435; x++) {
        for (int y=70; y<=600; y++) {
          color links = get(x, y);
          color rechts = get(870-x, y);
          stroke(255);
          point(x, y);
          stroke(rechts,255);
          point(x, y);
          stroke(255);
          point(870-x, y);
          stroke(links,255);
          point(870-x, y);
        }
      }
      cursor(ARROW);
    }
    if (mouseX>=400 && mouseX<=430 && mouseY>=20 && mouseY<=50) {
      cursor(WAIT);
      for (int x=70; x<=800; x++) {
        for (int y=70; y<=335; y++) {
          color links = get(x, y);
          color rechts = get(x, 670-y);
          stroke(255);
          point(x, y);
          stroke(rechts,255);
          point(x, y);
          stroke(255);
          point(x, 670-y);
          stroke(links,255);
          point(x, 670-y);
        }
      }
      cursor(ARROW);
    }
    if (mouseX>=450 && mouseX<=480 && mouseY>=20 && mouseY<=50) {
      cursor(WAIT);
      for (int y=70; y<=600; y++) {
        for (int x=70; x<=800; x++) {
          color i = get(x, y);
          float ri=red(i);
          float gi=green(i);
          float bi=blue(i);
          float rj=255-ri;
          float gj=255-gi;
          float bj=255-bi;
          stroke(rj, bj, gj);
          point(x, y);
        }
      }
      cursor(ARROW);
    }
    if (mouseX>=440 && mouseX<=630 && mouseY>=20 && mouseY<=50) {
      //save("malen.jpg");
      //link("/malen.jpg","_new");
    }
    if (mouseX>=20 && mouseX<=50 && mouseY>=150 && mouseY<=180) {
      c=b;
      xselected=false;
    }
    if (mouseX>=20 && mouseX<=50 && mouseY>=200 && mouseY<=230) {
      c=gr;
      xselected=false;
    }
    if (mouseX>=20 && mouseX<=50 && mouseY>=250 && mouseY<=280) {
      c=r;
      xselected=false;
    }
    if (mouseX>=20 && mouseX<=50 && mouseY>=300 && mouseY<=330) {
      c=ge;
      xselected=false;
    }
    if (mouseX>=20 && mouseX<=50 && mouseY>=350 && mouseY<=380) {
      c=we;
      xselected=false;
    }
    if (mouseX>=20 && mouseX<=50 && mouseY>=400 && mouseY<=430) {
      c=s;
      xselected=false;
    }
    if (mouseX>=20 && mouseX<=50 && mouseY>=450 && mouseY<=480) {
      c=o;
      xselected=false;
    }
    if (mouseX>=20 && mouseX<=50 && mouseY>=500 && mouseY<=530) {
      c=l;
      xselected=false;
    }
    if (mouseX>=20 && mouseX<=50 && mouseY>=550 && mouseY<=580) {
      xselected=true;
    }
    if (w==1 && mouseX>=71 && mouseX<=799 && mouseY>=71 && mouseY<=599) {
      stroke (c);
      fill (c);
      rect(mouseX-10, mouseY-10, 20, 20);
    }
    if (w==2 && mouseX>=71 && mouseX<=799 && mouseY>=71 && mouseY<=599) {
      stroke (c);
      fill (c);
      ellipse(mouseX, mouseY, 20, 20);
    }
    if (w==3 && mouseX>=71 && mouseX<=799 && mouseY>=71 && mouseY<=599) {
      stroke (c);
      fill (c);
      ellipse(mouseX, mouseY, 10, 10);
    }
  }
  if (xselected==true) {
    c=x;
  }
}


