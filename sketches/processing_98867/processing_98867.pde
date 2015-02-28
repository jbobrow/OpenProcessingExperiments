
float xr;
float yr;
float yr1;
float xr1;
float y1;
float z1;
float x1;
float r;
int ma;
float rotx;
float a;
int thatthing;
boolean disp;
boolean pres;
spheree[] spherees;
lins lin;


void setup() {
  disp=true;
  lin=new lins();
  size(500, 500, P3D);
  ma=500;
  spherees= new spheree[ma];
  for (int i=0; i<ma;i++) {
    spherees[i]= new spheree(i);
  }
}

void draw() {

  background(90);
  fill(255, 0, 0);
  textSize(12);
  text("Y  =cos(X)", 60, 60);
  textSize(10);
  text("x",69,60.5);
  fill(0, 0, 255);
  textSize(12);
  text("Y  =sin(X)", 60, 70);
  textSize(10);
  text("y",69,70.5);
  textSize(12);
  // text((yr1-floor(yr1/(2*PI*90))*2*PI*90), 60, 60);
  yr=float(mouseY);
  xr=float(mouseX);
  r=30;
  //yr1=(yr-(height/2))*-1;
  // xr1=(xr-(width/2));
  translate(width/2, height/2, 0);
  rotateX(yr1/90);
  //radians(yr1));
  rotateY(xr1/90);

  if (disp==true) {
    stroke(255, 0, 0); //red
    fill(255);
    line(0, 0, 250, 0, 0, -250);//z
    pushMatrix();
    translate(10, 0, 250/2+30);
    rotateX(rotx);
    rotateY(0);
    text("Y", 0, 0, 0);
    textSize(9);
    text('x', 9, .5, 0);
    popMatrix();
    textSize(12);


    stroke(0, 255, 0);//green
    fill(255);
    line(250, 0, 0, -250, 0, 0);//x
    pushMatrix();
    translate(width/2-30, -10, 10);
    rotateX(rotx);
    rotateY(0);
    text('X', 0, 0, 0);
    popMatrix();

    stroke(0, 0, 255);//blue
    fill(255);
    line(0, 250, 0, 0, -250, 0);//y
    text('Y', 10, 30-(height/2), 0);
    textSize(9);
    text('y', 19, 30.5-(height/2), 0);
    textSize(12);
    stroke(255);

    for (int i=0; i<25;i++) {
      stroke(150, 150, 150, 150);
      for (int k=0; k<2; k++) {
        pushMatrix();
        rotateX(k*-PI/2);
        line(i*r-25*r/2-r/2, r*25/2, 0, i*r-25*r/2-r/2, -1*r*25/2-r/2, 0);
        line(r*25/2, i*r-r*25/2-r/2, 0, -1*r*25/2-r/2, i*r-r*25/2-r/2, 0);
        text(-(i-12), -20, i*30-30*24/2);
        popMatrix();
      }
      noStroke();
      pushMatrix();
      translate(i*30-30*24/2, 9, -10);
      rotateX(rotx);
      rotateY(0);
      text(i-12, 0, 0, 0);
      popMatrix();
    }
  }
  for (int i=0; i<ma;i++) {
    spherees[i].display(i);
  }

  lin.go();
  lin.display();

  if (keyPressed==true) {
    if (keyCode==UP) {
      yr1=0;
      xr1=0;
    } 
    else if (keyCode==DOWN) {
      yr1=PI/2*90;
      xr1=0;
    }

    if (key==ENTER && pres==false) {
      pres=true;
      if (disp==true) {
        disp=false;
      } 
      else {
        disp=true;
      }
      println("hi");
    }
  } 
  else {
    pres=false;
  }

  if (mousePressed==true) {
    if (mouseX<pmouseX) {
      xr1=xr1-3;
    } 
    else if (mouseX>pmouseX) {
      xr1=xr1+3;
    }

    if (mouseY<pmouseY) {
      yr1=yr1+3;
    }
    if (mouseY>pmouseY) {
      yr1=yr1-3;
    }
  }

  if ((yr1-floor(yr1/(2*PI*90))*2*PI*90)<(PI*3/4)*90 && (yr1-floor(yr1/(2*PI*90))*2*PI*90)>(PI/4)*90) {
    rotx=-PI/2;
  } 
  else {
    rotx=0;
  }
}






class lins {
  float xloc;
  float zlocs;
  float ylocs;
  lins() {
  }

  void display() {
    stroke(0, 0, 255);
    line(xloc, -ylocs, zlocs, xloc, 0, zlocs);//sin(x)/Yy
    stroke(255);
    line(xloc, -ylocs, zlocs, xloc, 0, 0);//hyp
    stroke(255, 0, 0);//red
    line(xloc, 0, zlocs, xloc, 0, 0);//cos(x)/Yx
    pushMatrix();
    translate(xloc, -ylocs, zlocs);
    fill(255, 0, 0);
    noStroke();
    sphere(3);
    popMatrix();
    pushMatrix();
    translate(xloc, 0, 0);
    rotateY(PI/2);
    noFill();
    stroke(0);
    strokeWeight(3);
    ellipse(0, 0, r*2, r*2);
    strokeWeight(1);
    arc(0,0,r/2,r/2,PI,PI+(xloc-floor(xloc/ (2*PI*30))*2*PI*30)/30);
    popMatrix();
  }

  void go() {
    if (keyPressed==true) {
      if (keyCode==LEFT) {
        xloc=xloc-1;
      } 
      else if (keyCode==RIGHT) {
        xloc=xloc+1;
      }
    }
    ylocs=r*(sin(xloc/r));
    zlocs=r*(cos(xloc/r));
  }
}
class spheree {
  float xloc;
  float yloc;
  float zloc;
  color g;
  float d;
  float time;
  float c;


  spheree(float that) {
    xloc=that;
    time=random(30, 120);
    d=random(0, 255);
    g=color(255, 100, 100);
  }

  void display(float that) {
    noStroke();
    fill(255);
    pushMatrix();
    xloc=that-ma/2;
    yloc=r*(sin(xloc/30));//*sin(radians(xloc*9*10));
    zloc=r*(cos(xloc/30));//sqrt(sq(r*sin(radians(xloc*9*10)))-sq(yloc))*(floor((xloc-floor(xloc/20)*20)/10)*10-5)/abs(floor((xloc-floor(xloc/20)*20)/10)*10-5);
    translate(xloc, -yloc, zloc);
    fill(255, 255, 255, 90);
    sphere(1.5);

    popMatrix();
  }
}






