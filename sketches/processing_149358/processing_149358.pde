
void setup() {
  size(500, 500);
  background(0);
  noStroke();
  fill(255);
  ellipseMode(RADIUS);
  frameRate(24);
  smooth();
}

//Origo
int ox = 250;
int oy = 250;
//Distances
int d1 = 50;
int d2 = 100;
int d3 = 150;
int d4 = 200;
//Radius
int rds = 15;
//Coordinates
int px0,py0,px1,py1,px2,py2,px3,py3,px4,py4;
//Rotation angle
int rot = 90;

//Compute coordinates
void fivepoint(float deg) {
  px0 = ox; py0 = oy; 
  px1 = int(ox + d1 * cos(radians(deg))); py1 = int(oy - d1 * sin(radians(deg)));
  px2 = int(ox + d2 * cos(radians(deg))); py2 = int(oy - d2 * sin(radians(deg)));
  px3 = int(ox + d3 * cos(radians(deg))); py3 = int(oy - d3 * sin(radians(deg)));
  px4 = int(ox + d4 * cos(radians(deg))); py4 = int(oy - d4 * sin(radians(deg)));
}

void draw() {
  //Act one (90 degree)
  if (frameCount<=24) {
    fivepoint(90);

    noStroke();
    fill(255);
    ellipse(px0,py0,rds,rds);
    ellipse(px1,py1,rds,rds);
    ellipse(px2,py2,rds,rds);
    ellipse(px3,py3,rds,rds);
    ellipse(px4,py4,rds,rds);
  }

  //Act two (90->45 dgree)
  if ((frameCount>24) && (frameCount<=69)) {
     background(0);
     fivepoint(float(rot));
     
     noStroke();
     fill(255);
     ellipse(px0,py0,rds,rds);
     ellipse(px1,py1,rds,rds);
     ellipse(px2,py2,rds,rds);
     ellipse(px3,py3,rds,rds);
     ellipse(px4,py4,rds,rds);
     rot--;
  }
  
  //Act three (45->135 dgree)
  if ((frameCount>69) && (frameCount<=159)) {
     background(0);
     fivepoint(float(rot));
     
     noStroke();
     fill(255);
     ellipse(px0,py0,rds,rds);
     noFill();
     stroke(255);
     strokeWeight(2*rds);
     arc (px0,py0,d1,d1,radians(359-rot),radians(315));
     noStroke();
     fill(255);
     ellipse(px2,py2,rds,rds);
     ellipse(px3,py3,rds,rds);
     ellipse(px4,py4,rds,rds);
     rot++;
  }

  //Act four (135->45 dgree)
  if ((frameCount>159) && (frameCount<=249)) {
     background(0);
     fivepoint(float(rot));
     
     noStroke();
     fill(255);
     ellipse(px0,py0,rds,rds);
     noFill();
     stroke(255);
     strokeWeight(2*rds);
     arc (px0,py0,d1,d1,radians(225),radians(315));
     arc (px0,py0,d2,d2,radians(225),radians(361-rot));
     noStroke();
     fill(255);
     ellipse(px3,py3,rds,rds);
     ellipse(px4,py4,rds,rds);
     rot--;
  }

  //Act five (45->135 dgree)
  if ((frameCount>249) && (frameCount<=339)) {
     background(0);
     fivepoint(float(rot));
     
     noStroke();
     fill(255);
     ellipse(px0,py0,rds,rds);
     noFill();
     stroke(255);
     strokeWeight(2*rds);
     arc (px0,py0,d1,d1,radians(225),radians(315));
     arc (px0,py0,d2,d2,radians(225),radians(315));
     arc (px0,py0,d3,d3,radians(359-rot),radians(315));
     noStroke();
     fill(255);
     ellipse(px4,py4,rds,rds);
     rot++;
  }

  //Act six (45->135 dgree)
  if ((frameCount>339) && (frameCount<=429)) {
     background(0);
     fivepoint(float(rot));
     
     noStroke();
     fill(255);
     ellipse(px0,py0,rds,rds);
     noFill();
     stroke(255);
     strokeWeight(2*rds);
     arc (px0,py0,d1,d1,radians(225),radians(315));
     arc (px0,py0,d2,d2,radians(225),radians(315));
     arc (px0,py0,d3,d3,radians(225),radians(315));
     arc (px0,py0,d4,d4,radians(225),radians(361-rot));
     noStroke();
     fill(255);
     rot--;
  }
}

