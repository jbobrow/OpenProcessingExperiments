
/*int s = second() * 2;
int m = minute() * 2;
int h = hour() * 2; */
PImage errormessage;
PImage cmd;
PImage windows;
PImage bsod;

void setup() {
  size(640, 480);
  smooth();
  errormessage = loadImage("windows98.png");
  cmd = loadImage("cmd.gif"); 
  windows = loadImage("windows.gif");
  bsod = loadImage("bsod.jpeg");
  image(cmd, 0, 55);
  
}



void draw() {
  //image( cmd, 0, 0 );
  //translate(640/2.5, 480/2.5);
  int n = 5;
  image(errormessage, second() * n + 70, second() * n );
  int wtf = hour() * 15;
  image(windows, 5, wtf + 100);
  
  line( minute(), height, minute(), 0);
  stroke(126);
  
  if ( mousePressed == true ) {
    image(bsod, 0, 0);
  }
 
  
  //ellipse( second() * 2, second() * 2, hour()*2, minute()*2 );
  //println(m);
  
}

