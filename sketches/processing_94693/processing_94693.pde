
// Motion Event Demo
// for Procoding by Michael Markert
//
// alpha, beta & gamma are only available for devices with gyroscope (iPad >=2, iPhone >=4)

int x,y,z;
int w = (int)(width/2);
int h = (int)(height/2);
int smax = width>height?width:height;
int s = (int)(smax/15);
int yincrease = (int)(height/20);

PFont font = createFont("HelveticaNeue-CondensedBlack", 20);

void setup() {
   frameRate(12);
   fill(200);
   stroke(40);
   strokeWeight(s/8);
   strokeJoin(ROUND);
   strokeCap(ROUND);
   textFont(font);
}

void draw() {
   background(0);
   drawOrientation();
   drawCubes();
   //info();
}


void drawOrientation() {
   textSize(width/3);
   textAlign(CENTER);
   fill(40);
   String o = "?";
   switch(window.orientation) {
      case   0: o="UP"; break;
      case  90: o="LEFT"; break;
      case -90: o="RIGHT"; break;
      case 180: o="DOWN"; break;
   }
   text(o,width/2,height/2);
}


void drawCubes() {
   // text style
   textAlign(LEFT);
   textSize(20);
   
   // alpha
   int rax = map(orientation.alpha, 0, 360, 0, width);
   int ray = s*2+yincrease;
   fill(#ff0000);
   rect(rax,ray,s,s);
   pushStyle();
   fill(#aa0000);
   textSize(smax/12);
   textAlign(CENTER);
   text("α",rax+s,ray+s);
   popStyle();
   fill(#ffffff);
   text(nfp(orientation.alpha,3)+"°", rax+2,ray+s-4);
   
   // beta
   int rbx = map(orientation.beta, -90, 90, 0, width);
   int rby = ray*1.5;
   fill(#00ff00);
   rect(rbx,rby,s,s);
   pushStyle();
   fill(#00aa00);
   textSize(smax/12);
   textAlign(CENTER);
   text("β",rbx+s,rby+s);
   popStyle();
   fill(#000000);
   text(nfp(orientation.beta,3)+"°", rbx+2,rby+s-4);
   
   // gamma
   int rgx = map(orientation.gamma, -180, 180, 0, width);
   int rgy = ray*2;
   fill(#0000ff);
   rect(rgx,rgy,s,s);
   pushStyle();
   fill(#0000aa);
   textSize(smax/12);
   textAlign(CENTER);
   text("γ",rgx+s,rgy+s);
   popStyle();
   fill(#ffffff);
   text(nfp(orientation.gamma,3)+"°", rgx+2,rgy+s-4);
   
   // accel.x
   int raxx = map(acceleration.x, -10, 10, 0, width);
   int raxy = ray*2.5;
   fill(#ff0000);
   rect(raxx,raxy,s,s);
   pushStyle();
   fill(#aa0000);
   textSize(smax/12);
   textAlign(CENTER);
   text("x",raxx+s,raxy+s);
   popStyle();
   fill(#ffffff);
   text(nfp(acceleration.x,2)+"'", raxx+2,raxy+s-4);
   
   // accel.y
   int rayx = map(acceleration.y, -10, 10, 0, width);
   int rayy = ray*3;
   fill(#00ff00);
   rect(rayx,rayy,s,s);
   pushStyle();
   fill(#00aa00);
   textSize(smax/12);
   textAlign(CENTER);
   text("y",rayx+s,rayy+s);
   popStyle();
   fill(#ffffff);
   text(nfp(acceleration.y,2)+"'", rayx+2,rayy+s-4);
   
   // accel.z
   int razx = map(acceleration.z, -10, 10, 0, width);
   int razy = ray*3.5;
   fill(#0000ff);
   rect(razx,razy,s,s);
   pushStyle();
   fill(#0000aa);
   textSize(smax/12);
   textAlign(CENTER);
   text("z",razx+s,razy+s);
   popStyle();
   fill(#ffffff);
   text(nfp(acceleration.z,2)+"'", razx+2,razy+s-4);
   
}

/*
+ deviceorientation event
alpha, beta, gamma
webkitCompassHeading 0° north, 180° south

+ devicemotion event
acceleration
accelerationIncludingGravity
rotationRate
interval
*/


int amin, bmin, cmin, gmin, axmin;
int amax, bmax, cmax, gmax, axmax;
void info() {
   float v = orientation.alpha;
   amin = min(amin,v);
   amax = max(amax,v);
   v = orientation.beta;
   bmin = min(bmin,v);
   bmax = max(bmax,v);
   v = orientation.gamma;
   cmin = min(cmin,v);
   cmax = max(cmax,v);
   v = acceleration.x;
   axmin = min(axmin,v);
   axmax = max(axmax,v);
   println("a:"+nfp(amin,3)+"…"+nfp(amax,3)+
      " b:"+nfp(bmin,3)+"…"+nfp(bmax,3)+
      " c:"+nfp(cmin,3)+"…"+nfp(cmax,3)+
      " x:"+nfp(axmin,3)+"…"+nfp(axmax,3)+
      " o:"+window.orientation+
	  " Compass:"+orientation.compassHeading+
      " ~:"+orientation.compassAccuracy
      );
}



