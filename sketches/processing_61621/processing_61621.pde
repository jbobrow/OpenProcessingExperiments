
/*Calander that displays the date and the time graphically.
 *copyright Ben Corwin 2012
 *the date and time functions are new to me along with playing with how to manipulate the camera in 3D.
 *I would have inclueded an up and down with the W and S keys but I could not get them to function they way I wanted them to.
 *Going up and down would work but rotating while looking up would always cause it to end up looking down 180 degrees later.
*/

int txt;
float cx, cy, cz;
float px, py, pz;
float wid;
float s, m, h, d, mo, yea, sm, mm, hm;
PVector v1, v2;
String days[] = new String [8];

void setup() {
  txt = 20;
  wid = 200;
  size(500, 500, P3D);  //using P3D is okay but if you want to look inside of the shapes openGL is better.
  textSize(txt);
  textAlign(CENTER);
  strokeWeight(1);
}

void draw() {  
  s = second();  // Values from 0 - 59
  m = minute();  // Values from 0 - 59
  h = hour();    // Values from 0 - 23
  d = day();     // Values from 0 - 31
  mo= month();   // Values from 1 - 12
  yea = year();    // Values of the year
  sm = map(s, 0, 90060, 0, -height);
  mm = map(m*60, 0, 90060, 0, -height);
  hm = map(h*60*60, 0, 90060, 0, -height);

  background(255); 
  translate(width/2, height/2, 0);
  moveCamera();
  translate(0, 0, -570);

  barClock();
  pastDays();
  lables();
  cornerClock();
}

void barClock() {
  stroke(0);
  noFill();
  pushMatrix();//sec
  fill(255, 0, 0, 100);
  translate(0, sm/2+width/2);
  box(wid, sm, wid);
  popMatrix();
  pushMatrix();//min
  fill(0, 255, 0, 100);
  translate(0, (sm+mm)/2+width/2);
  box(wid, mm+sm, wid);
  popMatrix();
  pushMatrix();//hour
  fill(0, 0, 255, 100);
  translate(0, (hm+sm+mm)/2+width/2);
  box(wid, hm+mm+sm, wid);
  popMatrix();
}

void lables() {
  fill(0);
  for (int i = 1; i < d+1; i++) {          
    pushMatrix();
    translate(-d*wid+wid*i, height/2+txt, wid/2);
    text(i, 0, 0);
    popMatrix();
  }
}

void pastDays() {
  fill(0, 0, 255, 100);
  for (int i = 0; i < d; i++) {          
    pushMatrix();
    translate(-i*wid-wid, 0, 0);
    box(wid, -height, wid);
    popMatrix();
  }
}


void moveCamera() {
  camera(0, 0, 0, //eye location
  0, 0, -10, //center of the screen
  0, 1, 0); //up XYZ values of: -1,0,1
  rotateY(radians(cx));
  rotateX(radians(cy));
  rotateZ(radians(cz));
  translate(-px, 0, py);
  //println("degrees X: " + cx%360 + " degrees Y: " + cy%360 + " degrees Z: " + cz%360 + " pos X: " + px + " pos Z: " + py);
} 

void keyPressed() {

  if (keyCode == UP) {
    py = py + 7.5*float(nf(cos(radians(cx)), 2, 1));
    px = px + 7.5*float(nf(sin(radians(cx)), 2, 1));
  }
  if (keyCode == DOWN) {
    py = py - 7.5*float(nf(cos(radians(cx)), 2, 1));
    px = px - 7.5*float(nf(sin(radians(cx)), 2, 1));
  }
  if (keyCode == RIGHT) {
    py = py - 7.5*float(nf(sin(radians(cx)), 2, 1));
    px = px + 7.5*float(nf(cos(radians(cx)), 2, 1));
  }
  if (keyCode == LEFT) {
    py = py + 7.5*float(nf(sin(radians(cx)), 2, 1));
    px = px - 7.5*float(nf(cos(radians(cx)), 2, 1));
  }
  if (key == 'd'||key == 'D') {
    cx = cx + 5;
  }
  if (key == 'a'||key == 'A') {
    cx = cx - 5;
  }

  if (key == ' ') {
    cx = 0;
    cy = 0;
    cz = 0;
    px = 0;
    py = 0;
  }
}

void cornerClock() {
  textMode(SCREEN);
  fill(0);
  textAlign(LEFT, TOP);
  text("Press h for explanation",3,3); 
  textAlign(RIGHT, TOP);
  text(nf(mo, 2, 0) + "/" + nf(d, 2, 0) + "/" + nf(yea, 4, 0) + "  " + nf(h,2,0)+":"+nf(m, 2, 0)+"."+nf(s, 2, 0), width, 0); 
  if (key == 'h'||key == 'H') {
    background(0);
    textAlign(CENTER);
    fill(255);
    text("This is a clock that displays the time", width/2, height/2-8*txt);
    text("and the days in the month visually.", width/2, height/2-7*txt);
    text("This calander adds every second in a day together", width/2, height/2-5*txt);
    text("and then displays them as a colum of time that", width/2, height/2-4*txt);
    text("represents a days worth of seconds", width/2, height/2-3*txt);
    
    text("Use A & D to move the camera.",width/2,height*2/3-txt);
    text("Use Up, Down, Left, & Right,",width/2,height*2/3+0*txt);
    text("to move the position of the camera.",width/2,height*2/3+1*txt);
    text("press SPACE to view time", width/2, height-50);
  }
  textMode(MODEL);
  textAlign(CENTER);
}


