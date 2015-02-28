
/*
 Modified version of Subtractive Color Wheel by Ira Greenberg
 by Geoff Ellis. 
 integrated as a functional part of a drawing program by Thomas Wynne
 
 Color Wheel selects colors
 black/white squares select black/white
 Top left box is current color
 the circle on the left side indicates stroke size
 
 Large circle increases stroke size
 small circle decreases stroke size
 erase box erases all
 */

  float lx = random(1,800);
float ly = random(1,800);
float ox = random(1,800);
float oy = random(1,800);
int oldMouseX, oldMouseY;
int SHADE = 0;
int TINT = 1;
int segs = 12;  //no. segments around the wheel
int steps = 6;  //no. colour wheel rings
int backgroundWhite = 255;
String RGBString = "";
PFont fontA;
int[] v = {0,0,0};

void setup() {
  size(800, 800);
  smooth();
  background(255);
  ellipseMode(RADIUS);
  oldMouseX=0;
  oldMouseY=0;
}
int penWeight = 1;
void draw() {
  
  strokeWeight(penWeight);
  stroke(0);
  strokeWeight(1);
  fill (v[0], v[1], v[2]);
  rect(5, 5, 30, 30);
  stroke (v[0], v[1], v[2]);
  
  //calling Color Wheel and black/white squares
  
  createWheel(50, 100);
  drawBlackWhiteSquares();
  if (mousePressed && dist (50, 100, mouseX, mouseY) < 50 || mousePressed && mouseX > 5 && mouseX < 35 && mouseY  > 160 && mouseY < 175) {
    int c = get(mouseX, mouseY);
    int red = int(red(c));
    v[0] = red;
    int green = int(green(c));
    v[1] = green;
    int blue = int(blue(c));
    v[2] = blue;
   /* if (!(red == backgroundWhite && green == backgroundWhite && blue == backgroundWhite)) {  //not if on the white background colour
      fill(0);  //white
      //RGBString = str(red) + ',' + str(green) + ',' + str(blue); //For when I get the RGB color text working
      stroke(255);             //white outline
      fill(red, green, blue);  //show sample colour
      rect(5, 5, 30, 30);
      
    }
    else {
      fill (v1, v2, v3); 
      rect(5, 5, 30, 30);
    }*/
  }

  if (mousePressed) {
    strokeWeight(penWeight);

    if (oldMouseX != mouseX || oldMouseY != mouseY) {
      stroke (v[0], v[1], v[2]);
      line(mouseX, mouseY, oldMouseX, oldMouseY);
    }
  }
  oldMouseX= mouseX;
  oldMouseY= mouseY;
  autoline();
bkgd();

  //clear screen
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(1, 758, 40, 40);
  fill(0);
  text("Clear", 5, 783);
  if (mousePressed && mouseX > 1 && mouseX <41 && mouseY >758 && mouseY < 798) {
    background(255);
    stroke(0);
  }
  strokeWeight(1); 

  //Stroke button +
  stroke(255);
  fill(0);
  ellipse(10, 300, 10, 10);
  if (mousePressed && dist(10, 300, mouseX, mouseY)<10 && penWeight<100) {
    penWeight++;
  }

  //Stroke button -
  stroke(255);
  fill(0);
  ellipse(10, 330, 5, 5);
  if (mousePressed && dist(10, 330, mouseX, mouseY)<5 && penWeight >0) {
    penWeight--;
  }
  //Stroke Size indicator
  fill(255);
  stroke(1);
  ellipse(50, 230, 51, 51);
  stroke(0);
  fill(0);
  noStroke();
  ellipse(50, 230, 1, 1);
  ellipse(50, 230, penWeight/2, penWeight/2);
  
  //autoline button
  stroke(1);
  fill(255);
  rect(60,5,31,30);
  fill (0);
  text("Auto",61, 20);
  text("Line",61,30);
  
}
//creates color wheel
void createWheel(int x, int y) {
  float rotAdjust, segWidth, interval, nsteps, nsegs;
  float radius = 50.0;
  noStroke();
  nsteps = steps;
  nsegs = segs;
  rotAdjust = radians(360.0 / nsegs / 2.0);
  segWidth = radius / nsteps;
  interval = TWO_PI / nsegs;
  for (int j = 0; j < nsteps; j++) {
    color[] cols = {
      color(255-(255/nsteps)*j, 255-(255/nsteps)*j, 0), 
      color(255-(255/nsteps)*j, (255/1.5)-((255/1.5)/nsteps)*j, 0), 
      color(255-(255/nsteps)*j, (255/2)-((255/2)/nsteps)*j, 0), 
      color(255-(255/nsteps)*j, (255/2.5)-((255/2.5)/nsteps)*j, 0), 
      color(255-(255/nsteps)*j, 0, 0), 
      color(255-(255/nsteps)*j, 0, (255/2)-((255/2)/nsteps)*j), 
      color(255-(255/nsteps)*j, 0, 255-(255/nsteps)*j), 
      color((255/2)-((255/2)/nsteps)*j, 0, 255-(255/nsteps)*j), 
      color(0, 0, 255-(255/nsteps)*j), 
      color(0, 255-(255/nsteps)*j, (255/2.5)-((255/2.5)/nsteps)*j), 
      color(0, 255-(255/nsteps)*j, 0), 
      color((255/2)-((255/2)/nsteps)*j, 255-(255/nsteps)*j, 0)
    };
    for (int i = 0; i < nsegs; i++) {
      fill(cols[i]);
      arc(x, y, radius, radius, interval*i+rotAdjust, interval*(i+1)+rotAdjust);
    }
    radius -= segWidth;
  }
}

void   drawBlackWhiteSquares() {
  //draw black and white squares at the bottom left corner
  stroke(255);
  fill(0);
  rect(5, 160, 15, 15);
  fill(255);
  strokeWeight(1);
  stroke(1);
  rect(20, 160, 15, 15);
}

void autoline(){
  if(mouseX>=60&&mouseX<=91&&mouseY>=5&&mouseY<=35&&mousePressed){
    stroke (v[0], v[1], v[2]);
    strokeWeight(penWeight);
    line (lx,ly,ox,oy);
    lx=ox;
    ly=oy;
    ox=random(1,800);
    oy=random(1,800);
    
  }
}


void bkgd(){
  stroke(0);
  strokeWeight(1);
  fill(255);
  rect(40, 160, 40, 15);
  fill(0);
  text("bkgd",45, 173);
  if(mouseX>=40&&mouseX<=80&&mouseY>=160&&mouseY<=175&&mousePressed){
    background(v[0],v[1],v[2]);
  }
}

