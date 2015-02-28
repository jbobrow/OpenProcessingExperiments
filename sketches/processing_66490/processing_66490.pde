
//import processing.opengl.*;

//Color Palette
color c01 = #52656b;
color c02 = #ff3b77;
color c03 = #cdff00;
color c04 = #b8b89f;
color c05 = #3bcbff;
color c06 = #ffb53b;
color c07 = #f900ff;
color bone = #FFFFDB;
color charcoal = #3B3B3B;


int mode;
int axisO = -1;
int paxisO = -1;


Conductor lines;
Conductor duran;
Conductor valderra;
Conductor menzies;
Conductor goetz;
Conductor kieu;
Conductor ilkin;

GraphDrawer gd;


int [] months = new int[7];
int yearInterval = 10;
int lineMax = 1000000;
int commitMax = 300;
int lineMin = 0;
int commitMin = 0;

int count = 3;
  
  float lx, ly;
  
  boolean lpressed = false;
  boolean rpressed = false;

  boolean lreleased = false;
  
  float plx, ply;
  float camdist;
  
  float radius = 0;
  float inc = 0;
  
  
  //transform variables
  float rotx, roty, rotz, transx, transy, transz, ptransx, ptransy, ptransz, ppx, ppy, ppz;
  
  
  
  float tx, ty;//, vx, vy, llx, lly;
  //float pinchscale, vdist;
 //float radius;
  float plotX1, plotY1;
  float plotX2, plotY2;
  PFont plotFont;
  
  float goalTx, goalTy, goalPtx, goalPty, goalPtz, goalRoty, goalRotx, goalRotz, goalTransy, goalTransz, goalTransx;
  
  
//UI Variables
  UIelement ui;
  //PFont font;
  boolean button1;
  boolean button2;
  
  String radRad = "CONSTANT VALUE";

void setup() {
  size(1280, 720, P3D);
  stroke(bone);
  
  
  months[0] = 1;
  months[1] = 2;
  months[2] = 3;
  months[3] = 4;
  months[4] = 5;
  months[5] = 6;
  months[6] = 7;


  
  plotX1 = 50;
  plotX2 = width - plotX1;
  plotY1 = 60;
  plotY2 = height - plotY1;
  
  plotFont = createFont("SansSerif", 11);
  textFont(plotFont);
  smooth();
  strokeWeight(2);
  
  ui = new UIelement(45, 100, 255);

}


void draw() {
 
  lx = mouseX;
  ly = mouseY;
  background(charcoal);

 
  pushMatrix();
  gd = new GraphDrawer();
  camera();
  translate(ptransx, ptransy, ptransz);
  rotateY(roty);
  rotateZ(rotz);
  rotateX(rotx);
  translate(transx, transy, transz);
  
  gd.renderGraph3d(mode);


  if (axisO == 0) {
   
    goalTx = 0;
  
    goalTy = 0;

    goalPty = 0;

    goalPtz = 0;

    goalPtx = 0;
    //rotate

    goalRotz = 0;
    goalRoty = 0;
    goalRotx = 0;
    //translate

    goalTransy = 0;
    goalTransz = -500;
    goalTransx = 0;

  }
  
  else if (axisO==1) {
    //camera
    goalTx = 0;
    goalTy = 0;
    goalPty = 0;
    goalPtz = 0;
    goalPtx = 0;
    goalRotz = 0;
    goalRotx = -PI/2;
    goalRoty = 0;
    goalTransy = 300;
    goalTransz = 350;
    goalTransx = 0;
  }
 
  else if (axisO==2) {
    //camera
    goalTx = 0;
  
    goalTy = 0;
    //pre transform
    goalPty = 0;

    goalPtz = 0;

    goalPtx = 0;;
    //roatate
    goalRotz = 0;
    goalRoty = PI/2;
    goalRotx = 0;
    //translate
    goalTransy = 0;
    goalTransz = 500;
    goalTransx = 100;
  }
  
  tx = lerp(tx, goalTx, 0.2);
  ty = lerp(ty, goalTy, 0.2);
  ptransy = lerp(ptransy, goalPty, 0.2);
  ptransx = lerp(ptransx, goalPtx, 0.2);
  ptransz = lerp(ptransz, goalPtz, 0.2);
  transy = lerp(transy, goalTransy, 0.2);
  transx = lerp(transx, goalTransx, 0.2);
  transz = lerp(transz, goalTransz, 0.2);
  rotx = lerp(rotx, goalRotx, 0.2);
  roty = lerp(roty, goalRoty, 0.2);
  rotz = lerp(rotz, goalRotz, 0.2);
  
  pushStyle();
  textSize(30);
  fill(bone);
  if (paxisO == 0) {
    pushMatrix();
    translate(0,0, 100);
    text("COMMITS", 60, height/2);
    pushMatrix();
    translate(20, height/2 - 60);
    rotate(3 * PI/2);
    text("LINES", 0, 0);
    popMatrix();
    popMatrix();
    radRad = "CONSTANT VALUE";
  }
  
  if (paxisO == 1 ) {
    pushMatrix();
    rotateX(PI/2);
    pushMatrix();
    rotate(3 * PI/2);
    translate(-10, 10, -50);
    text("MONTH", 0, 0);
    popMatrix();
    translate(150, 120, -50);
    text("COMMITS", 0, 0);
    popMatrix();
    radRad = "PERCENT OF LINES";
  }
  
  if (paxisO == 2) {
    pushMatrix();
    rotateY(-PI/2);
    translate(-300, height/2, -80);
    text("MONTH", 0, 0);
    pushMatrix();
    rotate(3 * PI/2);
    translate(120, -100);
    text("LINES", 0, 0);
    popMatrix();
    popMatrix();
    radRad = "PERCENT OF COMMITS";
  }
  
  popStyle();
   
  popMatrix();

  gd.renderKey();

  axisO = paxisO;
  //ui.makeSlider(width/2 -150, 50, 300, 12, map(camdist, 3000, 50, 0, 300));
  ui.makeButton(1, width-80, 0, 80, height);
  button1 = ui.bpressed();
  ui.makeButton(2, 0, 0, 80, height);
  button2 = ui.bpressed();
  if (button1 != false || button2 !=false) {
    axisO++;
    if (axisO > 2) {
      axisO = 0;
    }
    paxisO = axisO;
  }

  else {
    axisO = -1;
  }
 
  fill(0);
  strokeWeight(2);
  
  if (lpressed == true) {
    lpressed = false;
  }
}

void mousePressed() {
  if (lpressed == true) {
    lpressed = false;
  }
  else {
    lpressed = true;
  }

}
void mouseReleased() {
  lreleased = true;
}



class Conductor {
  color conductorColor;
  int counter = 0;
  int commitInterval = 1;
  int monthsInterval = 1;
  float [] commits = new float [7];
  float [] lines = new float [7];
  float [] totalLines = new float[7];

  
  float [] totalCommits = new float[7];

  
  int [] months = new int[7];
  
  
  float [] percentLines = new float [7];
  float [] percentCommits = new float [7];
  float targetRadius;
  
  float esy, exy, epx, epy;
  
  String name; 
  
  
  
  int plotX1 = 50;
  int plotX2;
  int plotY1= 60;
  int plotY2;
  
  //float radius;
  float oldRadius;
  int radOne;
  int radTwo;
  int radThree;
  boolean incReset = false;
  //float inc = 0;
  
  int ppaxisO;
  //float pradius;



  Conductor() {};
  
  Conductor init() {
    
    totalLines [0] = 274000;
    totalLines [1] = 828000;
    totalLines [2] = 43000;
    totalLines [3] = 101000;
    totalLines [4] = 538000;
    totalLines [5] = 280000;
    totalLines [6] = 6040;
    totalCommits [0] = 45;
    totalCommits [1] = 83;
    totalCommits [2] = 28;
    totalCommits [3] = 70;
    totalCommits [4] = 129;
    totalCommits [5] = 284;
    totalCommits [6] = 46;
    months[0] = 1;
    months[1] = 2;
    months[2] = 3;
    months[3] = 4;
    months[4] = 5;
    months[5] = 6;
    months[6] = 7;

    return(this);
  }
  
  Conductor duran() {
    name = "Duran";
    commits [0] = 21;
    commits [1] = 30;
    commits [2] = 9;
    commits [3] = 15;
    commits [4] = 40;
    commits [5] = 56;
    commits [6] = 1;
    lines [0] = 270000;
    lines [1] = 560000;
    lines [2] = 20000;
    lines [3] = 30000;
    lines [4] = 500000;
    lines [5] = 90000;
    lines [6] = 5000;
    conductorColor = c01;

    return(this);
  }
  
  Conductor valderra() {
    name = "Valderra";
    commits [0] = 1;
    commits [1] = 1;
    commits [2] = 1;
    commits [3] = 12;
    commits [4] = 20;
    commits [5] = 130;
    commits [6] = 15;
    lines [0] = 0;
    lines [1] = 0;
    lines [2] = 0;
    lines [3] = 5000;
    lines [4] = 1000;
    lines [5] = 80000;
    lines [6] = 1000;
    conductorColor = c02;

    return(this);
  }
  
  Conductor menzies() {
    name = "Menzies";
    commits [0] = 20;
    commits [1] = 25;
    commits [2] = 15;
    commits [3] = 12;
    commits [4] = 12;
    commits [5] = 22;
    commits [6] = 10;
    lines [0] = 1000;
    lines [1] = 35000;
    lines [2] = 20000;
    lines [3] = 40000;
    lines [4] = 1000;
    lines [5] = 40000;
    lines [6] = 10;
    conductorColor = c03;
    
    return(this);
  }
    
  Conductor goetz() {
    name = "Goetz";
    commits [0] = 1;
    commits [1] = 1;
    commits [2] = 1;
    commits [3] = 10;
    commits [4] = 32;
    commits [5] = 40;
    commits [6] = 18;
    lines [0] = 1000;
    lines [1] = 1000;
    lines [2] = 1000;
    lines [3] = 10000;
    lines [4] = 25000;
    lines [5] = 10000;
    lines [6] = 10;
    conductorColor = c04;
    
    return(this);
  }
  
  Conductor kieu() {
    name = "Kieu";
    commits [0] = 1;
    commits [1] = 1;
    commits [2] = 1;
    commits [3] = 1;
    commits [4] = 24;
    commits [5] = 35;
    commits [6] = 1;
    lines [0] = 1000;
    lines [1] = 2000;
    lines [2] = 1000;
    lines [3] = 1000;
    lines [4] = 10000;
    lines [5] = 30000;
    lines [6] = 10;
    conductorColor = c05;
    
    return(this);
  }
  
  Conductor ilkin() {
    name = "Ilkin";
    commits [0] = 1;
    commits [1] = 25;
    commits [2] = 1;
    commits [3] = 20;
    commits [4] = 1;
    commits [5] = 1;
    commits [6] = 1;
    lines [0] = 1000;
    lines [1] = 230000;
    lines [2] = 1000;
    lines [3] = 15000;
    lines [4] = 1000;
    lines [5] = 30000;
    lines [6] = 10;
    conductorColor = c06;
    
    return(this);
  }
  
  
  void drawLines() {
    plotY2 = height - plotY1;
    plotX2 = width - plotX1;
    counter = count;
    pushStyle();
    stroke(bone);
    strokeWeight(1);
    for (int row = 0; row < 7; row++) {
     if (months[row] % commitInterval == 0) {
       float x = map(months[row], 1, 7, plotX1, plotX2);
       line(x, plotY1, x, plotY2);
     }
   }
    popStyle();
    
  }
  
  void drawBackground() {
    plotY2 = height - plotY1;
    plotX2 = width - plotX1;
    counter = count;
    pushStyle();
    noStroke();
    fill(237, 235, 230);
    pushMatrix();
    translate(0, plotY2/2, -plotY2/2);
    rotateX(PI/2);
    drawLines();
    popMatrix();
    popStyle();
    
  }
  
  void render(int count, int mode) {
    pushStyle();
    noStroke();
    fill(conductorColor);
    plotY2 = height - plotY1;
    plotX2 = width - plotX1;
    counter = count;
    percentLines[counter] = lines[counter]/totalLines[counter];
    percentCommits[counter] = commits[counter]/totalCommits[counter];
    float xpos = map(commits[count], 1, 130, plotX1, plotX2);
    float ypos = map(lines[count], 0, 900000, plotY1, plotY2);
    pushMatrix();
    translate(xpos, ypos);
    radTwo = int(percentLines[counter] * 60 + 10);
    radThree = int(percentCommits[counter] * 60 + 10);

    if (paxisO == 0) {   
      radius = 25;
      targetRadius = 25;
    }
    else if (paxisO == 1) {

      radius = radTwo;
      targetRadius = radTwo;
    }
    else if (paxisO == 2) {


      radius = radThree;
      targetRadius = radThree;
    }

    ppaxisO = paxisO;

    sphere(radius);
    popMatrix();
    popStyle();
    
  }
  
  float getXpos() {
    float xpos = map(commits[count], 1, 130, plotX1, plotX2);
    return xpos;
    
  }
  
  float getYpos() {
    float ypos = map(lines[count], 0, 900000, plotY1, plotY2);
    return ypos;
  }
  



}
class GraphDrawer {
  
  int counter;
  int mode;

  GraphDrawer() {};
  
  void renderGraph2d(int count, int mode) {
    lines = new Conductor().init();
    duran = new Conductor().duran().init();
    valderra = new Conductor().valderra().init();
    menzies = new Conductor().menzies().init();
    goetz = new Conductor().goetz().init();
    kieu = new Conductor().kieu().init();
    ilkin = new Conductor().ilkin().init();
    
    
    lines.drawLines();


    duran.render(count, mode);
    valderra.render(count, mode);
    menzies.render(count, mode);
    goetz.render(count, mode);
    kieu.render(count, mode);
    ilkin.render(count, mode);
   

   }
   
   void renderGraph2dNL(int count, int mode) {
    duran = new Conductor().duran().init();
    valderra = new Conductor().valderra().init();
    menzies = new Conductor().menzies().init();
    goetz = new Conductor().goetz().init();
    kieu = new Conductor().kieu().init();
    ilkin = new Conductor().ilkin().init();   
    
    duran.render(count, mode);
    valderra.render(count, mode);
    menzies.render(count, mode);
    goetz.render(count, mode);
    kieu.render(count, mode);
    ilkin.render(count, mode);
     
   }
   
   void renderGraph3d(int mode) {
    lines = new Conductor().init();

    
    pushMatrix();


    translate(50,0,100);
    lines.drawLines();
    renderGraph2d(1, mode);
    lines.drawBackground();
    translate(0,0,-50);
    for (int counter = 2; counter < 7; counter ++) {
      translate(0,0,counter * (-18));
      renderGraph2dNL(counter, mode);
    }
    popMatrix();

     
     
   }
   
   
   void renderKey() {
    duran = new Conductor().duran().init();
    valderra = new Conductor().valderra().init();
    menzies = new Conductor().menzies().init();
    goetz = new Conductor().goetz().init();
    kieu = new Conductor().kieu().init();
    ilkin = new Conductor().ilkin().init();
    
    pushStyle();
    pushMatrix();
    textAlign(LEFT, TOP);
    noStroke();
    fill(duran.conductorColor);
    rect( 40, 40, 30, 30);
    fill(bone);
    text( "DURAN DURAN", 75, 50);
    translate(0, 50, 0);
    fill(valderra.conductorColor);
    rect ( 40, 40, 30, 30);
    fill(bone);
    text( "VALDERRA", 75, 50);
    translate(0, 50, 0);
    fill(menzies.conductorColor);
    rect ( 40, 40, 30, 30);
    fill(bone);
    text( "MENZIES", 75, 50);
    translate( 0, 50, 0);
    fill(goetz.conductorColor);
    rect ( 40, 40, 30, 30);
    fill(bone);
    text( "GOETZ", 75, 50);
    translate( 0, 50, 0);
    fill(kieu.conductorColor);
    rect ( 40, 40, 30, 30);
    fill(bone);
    text( "KIEU", 75, 50);
    translate( 0, 50, 0);
    fill(ilkin.conductorColor);
    rect ( 40, 40, 30, 30);
    fill(bone);
    text( "ILKIN", 75, 50);
    translate(0, height/2 - 40, 0);
    text("RADIUS: " + radRad , 75, 50);
    
    popStyle();
    popMatrix();
     
   }
   
 
    
    
  }
class UIelement {
  int a, b, c;
  boolean alreadyPressed = false;
  boolean buttonPressed = false;
  int bID;
  
  UIelement(int fgColor, int bgColor, int pColor) {
    a = fgColor;
    b = bgColor;
    c = pColor;   
  } 
  void makeSlider(int xpos, int ypos, int wsize, int hsize, float value) {
    pushStyle();
    noStroke();
    pushStyle();
    fill(bone);
    rect(xpos, ypos, wsize, hsize);
    popStyle();
    pushStyle();
    fill(c03);
    rect(xpos, ypos, value, hsize);
    popStyle(); 
    popStyle();
    pushStyle();
    fill(bone);
    textAlign(CENTER);
    text(round(value), xpos + wsize/2, ypos + hsize + 12);
    text("SCALE", xpos + wsize/2, ypos - hsize);
    popStyle();

  }
  
  void makeButton(int buttonID, int xpos, int ypos, int wsize, int hsize) {
    bID = buttonID;
    pushStyle();
    noStroke();
    fill(charcoal, 0);

    if ( rpressed == false && lx > xpos && lx < xpos + wsize && ly > ypos && ly < ypos + hsize){
      fill(c03);
      if (lpressed  == true) {
        fill(0);
        buttonPressed = true;
      }

    }
    else {
      buttonPressed = false;
    }
    rect(xpos, ypos, wsize, hsize);
    popStyle();
    pushStyle();
    pushMatrix();
    noStroke();
    fill(c03);
    if ( rpressed == false && lx > xpos && lx < xpos + wsize && ly > ypos && ly < ypos + hsize){
      fill(bone);
    }
    triangle(wsize/2 - 5 + xpos, hsize/2 + 5, wsize/2 + 5 + xpos, hsize/2, wsize/2 -5 +xpos, hsize/2 - 5 );
    popStyle();
    popMatrix();

  }
  
  boolean bpressed() {
    if (buttonPressed == true) {
      return true;
    }
    else
      return false;
  }
  

  
}
