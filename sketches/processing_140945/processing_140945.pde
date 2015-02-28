
PolygoneSysteme ps;
int np = 10;
int ns = 20;

boolean pauseMain = false;
boolean showText  = false;
boolean demoMode  = true;

void setup() {
  size(400,400);
  smooth();
  ps = new PolygoneSysteme(np,ns);
  ps.pause = pauseMain;
  fill(255);
  textAlign(LEFT,TOP);
}

void reset() {
  ps = new PolygoneSysteme(np,ns);
  ps.pause = pauseMain;
}

void draw() {
  background(0);
  ps.update();
  ps.dessine();
  if(showText) {
    text("AreaSeekingPolygon0.01",10,10);
    text("('m':showInfo,'d':demoMode(akaBaloonFlowerMode))",10,30);
    text("(' ':reset,'p':pause,'up':TargetArea++,'down':TargetArea--)",10,50);
    int i=0;
    for(Ppolygone p : ps.polygones) {
      text("polygon"+i+",area="+round(p.aire)+"/targetArea="+round(p.aireCible),10,70+i*20);
      i++;
    }
    if(pauseMain) {
      text("pause('left':stepBack,'right':stepForward),stepCount="+ps.stepCount,10,70+i*20);
    }
  }
}

void keyPressed() {
  if(key=='m') {showText=!showText;}
  if(key==' ') {reset();}
  if(key=='p') {pauseMain=!pauseMain;ps.pause=pauseMain;}
  if(key=='d') {demoMode=!demoMode;ps.demoMode=demoMode;}
  if(key=='-') {ps.removePolygone();}
  if(key=='+') {ps.addPolygone(ns);}
  if(keyCode==RIGHT) {if(pauseMain){ps.step();}}
  if(keyCode==LEFT) {if(pauseMain){ps.stepBack();}}
  if(keyCode==UP) {ps.augmenteAireCible();}
  if(keyCode==DOWN) {ps.diminueAireCible();}
}

