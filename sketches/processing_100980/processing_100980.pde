
//I nudged all of the colleges that were too near to other colleges to neaten the graph
//(and because, for example, UCLA and Berkeley and MIT and Harvard are in the same city
//so would show up as one dot)

//Even though I know the geographic limits of the map
//(N: 49.8° N, S: 24.2° N W: 125.5° W, E: 66.5° W),
//and I was able to scale the coordinates of the colleges to the map,
//the dots weren't in the exact right position, so I moved the dots up by 
//PALUPA_CONSTANT

//UChicago's in Indiana, for some reason

final int PALUPA_CONSTANT=-8;
int titleHeight = 110;
int hovered;
int circleRadius=10;
int textOffset=-5; 
int i;
PImage usa;
long[][] collegeloc = new long[10][2];
String[] college= new String[10];
String[] website= new String[10];
int major;
void setup() {
  size(640, 443);
  usa = loadImage("USA_location_map.svg.png");
  //usa = loadImage("http://upload.wikimedia.org/wikipedia/commons/thumb/3/33/USA_location_map.svg/640px-USA_location_map.svg.png");
  smooth();
  //compsci();
}
void draw() {
  background(255);
  image(usa, 0, titleHeight);
  i=0;
  switch (major) {
  case 1:
    compsci();
    break;
  case 2:
    cheme();
    break;
  case 3:
    biology();
    break;
  case 4:
    physics();
    break;
  }
  text("Brendan Lawler",550,15);
  text("The Best Colleges in the Country, By Major",200,15);
  text("Source: http://www.usnews.com/education/worlds-best-universities-rankings",100,41);
  text("Map Source:",280,53);
  text("upload.wikimedia.org/wikipedia/commons/thumb/3/33/USA_location_map.svg/640px-USA_location_map.svg.png",10,65);
  if (major>0) {
    hovered = isInCircle();
    if (hovered>=0) {
      fill(0);
      text(college[hovered], collegeloc[hovered][0]+circleRadius+1, collegeloc[hovered][1]+circleRadius+textOffset+titleHeight);
    }
  }
  fill(255, 227, 116);
  rect(0, 70, 640, 40);
  fill(219,91,0);
  rect(160*(major-1),70,160,40);
  line(160, 70, 160, 110);
  line(320, 70, 320, 110);
  line(480, 70, 480, 110);
  fill(0);
  text("Computer\n  Science", 55, 87);
  text("  Chemical\nEngineering", 210, 87);
  text("Biology", 380, 96);
  text("Physics", 540, 96);
}
void compsci() {
  //MIT (moved slightly right for Harvard)
  college[0]=("MIT");
  website[0]="mit.edu";
  drawpoint(42+22/60+25/3600, 70.0);
  //Stanford
  college[1]=("Stanford");
  website[1]="stanford.edu";
  drawpoint(37+25/60+21/3600, 123);
  //CMU
  college[2]=("Carnegie Mellon");
  website[2]="cmu.edu";
  drawpoint(40+26/60+30/3600, 80);
  //Berkeley (close enough, it interferes with Stanford)
  college[3]=("Berkeley");
  website[3]="berkeley.edu";
  drawpoint(37+52/60+18/3600, 121.2);
  //Harvard (moved slightly left for MIT)
  college[4]=("Harvard");
  website[4]="harvard.edu";
  drawpoint(42+22/60+25/3600, 71.8);
  //Princeton
  college[5]=("Princeton");
  website[5]="princeton.edu";
  drawpoint(40.350461, 74.659371);
  //UCLA
  college[6]=("UCLA");
  website[6]="ucla.edu";
  drawpoint(34+03/60, 118+15/60);
  //Cornell
  college[7]=("Cornell");
  website[7]="cornell.edu";
  drawpoint(42+26/60+36/3600, 76+30/60);
  //Columbia
  college[8]=("Columbia");
  website[8]="columbia.edu";
  drawpoint(40+43/60+42/3600, 73+59/60+39/3600);
  //University of Washington
  college[9]=("U. of Washington");
  website[9]="washington.edu";
  drawpoint(47+36/60+35/3600, 122+19/60+59/3600);
}


void biology() {
  //Harvard (moved slightly left for MIT)
  college[0]=("Harvard");
  website[0]="harvard.edu";
  drawpoint(42+22/60+25/3600, 71.8);
  //MIT (moved slightly right for Harvard)
  college[1]=("MIT");
  website[1]="mit.edu";
  drawpoint(42+22/60+25/3600, 70.0);
  //Stanford
  college[2]=("Stanford");
  website[2]="stanford.edu";
  drawpoint(37+25/60+21/3600, 123);
  //Berkeley (close enough, it interferes with Stanford)
  college[3]=("Berkeley");
  website[3]="berkeley.edu";
  drawpoint(37+52/60+18/3600, 121.2);
  college[4]="Yale";
  website[4]="yale.edu";
  drawpoint(41+18/60+36/3600, 72+55/60+25/3600);
  //UCLA
  college[5]=("UCLA");
  website[5]="ucla.edu";
  drawpoint(34+03/60, 118+15/60);
  //UCSD
  college[6]="UCSD";
  website[6]="ucsd.edu";
  drawpoint(32+50/60+24/3600, 117+16/60+37/3600);
  //Caltech (adjusted for UCLA
  college[7]="Caltech";
  website[7]="caltech.edu";
  drawpoint(34+9/60+22/3600, 116.5);
  //Cornell
  college[8]=("Cornell");
  website[8]="cornell.edu";
  drawpoint(42+26/60+36/3600, 76+30/60);
  //Princeton
  college[9]=("Princeton");
  website[9]="princeton.edu";
  drawpoint(40.350461, 74.659371);
}

void cheme() {
  //MIT (moved slightly right for Harvard)
  college[0]=("MIT");
  website[0]="mit.edu";
  drawpoint(42+22/60+25/3600, 70.0);
  //Berkeley (close enough, it interferes with Stanford)
  college[1]=("Berkeley");
  website[1]="berkeley.edu";
  drawpoint(37+52/60+18/3600, 121.2);
  //Stanford
  college[2]=("Stanford");
  website[2]="stanford.edu";
  drawpoint(37+25/60+21/3600, 123);
  //Yale
  college[3]="Yale";
  website[3]="yale.edu";
  drawpoint(41+18/60+36/3600, 72+55/60+25/3600);
  //Princeton
  college[4]=("Princeton");
  website[4]="princeton.edu";
  drawpoint(40.350461, 74.659371);
  //UCLA
  college[5]=("UCLA");
  website[5]="ucla.edu";
  drawpoint(34+03/60, 118+15/60);
  //Caltech (adjusted for UCLA
  college[6]="Caltech";
  website[6]="caltech.edu";
  drawpoint(34+9/60+22/3600, 116.5);
  //Minnesota
  college[7]="U. of Minnesota";
  website[7]="umn.edu";
  drawpoint(44+59/60, 93+16/60);
  //Michigan
  college[8]="U. of Michigan";
  website[8]="umich.edu";
  drawpoint(42+16/60+53/3600, 83+44/60+54/3600);
  //UPenn
  college[9]="UPenn";
  website[9]="upenn.edu";
  drawpoint(39+57/60+12/3600, 75+10/60+12/3600);
}

void physics() {
  //MIT (moved slightly right for Harvard)
  college[0]=("MIT");
  website[0]="mit.edu";
  drawpoint(42+22/60+25/3600, 70.0);
  //Harvard (moved slightly left for MIT)
  college[1]=("Harvard");
  website[1]="harvard.edu";
  drawpoint(42+22/60+25/3600, 71.8);
  //Stanford
  college[2]=("Stanford");
  website[2]="stanford.edu";
  drawpoint(37+25/60+21/3600, 123);
  //Princeton
  college[3]=("Princeton");
  website[3]="princeton.edu";
  drawpoint(40.350461, 74.659371);
  //Berkeley (close enough, it interferes with Stanford)
  college[4]=("Berkeley");
  website[4]="berkeley.edu";
  drawpoint(37+52/60+18/3600, 121.2);
  //U. Chicago
  college[5]="UChicago";
  website[5]="uchicago.edu";
  drawpoint(41+52/60+55/3600, 87+37/60+40/3600);
  //Columbia
  college[6]=("Columbia");
  website[6]="columbia.edu";
  drawpoint(40+43/60+42/3600, 73+59/60+39/3600);
  //Cornell
  college[7]=("Cornell");
  website[7]="cornell.edu";
  drawpoint(42+26/60+36/3600, 76+30/60);
  //UCSB
  college[8]="UC Santa Barbara";
  website[8]="ucsb.edu";
  drawpoint(34+25/60+33/3600,119+42/60+51/3600);
  //Yale
  college[9]="Yale";
  website[9]="yale.edu";
  drawpoint(41+18/60+36/3600, 72+55/60+25/3600);
}




public void drawpoint(double y, double x) {
  long X = Math.round(640-(x-66.5)/(125.5-66.5)*640);
  long Y = Math.round(333-(y-24.2)/(49.8-24.2)*333)+PALUPA_CONSTANT;
  fill(255);
  ellipse(X, Y+titleHeight, 2*circleRadius, 2*circleRadius);
  fill(0);
  if (hovered==-1) {
    text(1+i, X-3-(i<9?0:3), Y+textOffset+circleRadius+titleHeight);
  }
  collegeloc[i][0]=X;
  collegeloc[i][1]=Y;
  i++;
}

public int isInCircle() {
  for (int i=0;i<10;i++) {
    if (Math.sqrt(Math.pow(collegeloc[i][0]-mouseX, 2)+Math.pow(collegeloc[i][1]-mouseY+titleHeight, 2))<=circleRadius) {
      return i;
    }
  }
  return -1;
}
void mouseReleased() {
  int hover = isInCircle();
  if (hover>=0) {
    link("http://"+website[hover]);
  }
  if (mouseX<160&&mouseY>70&&mouseY<110) {
    major=1;
  }
  if (mouseX>160&&mouseX<320&&mouseY>70&&mouseY<110) {
    major=2;
  }
  if (mouseX>320&&mouseX<480&&mouseY>70&&mouseY<110) {
    major=3;
  }
  if (mouseX>480&&mouseY>70&&mouseY<110) {
    major=4;
  }
}



