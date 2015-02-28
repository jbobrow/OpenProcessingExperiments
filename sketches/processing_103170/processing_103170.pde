
float velAng = 0.1;
float angle = 0;
int radi = 200;
int qtat = 0;
So[] sons;


Maxim maxim;

void setup() {
  size(600,600);
  background(255);
  sons = new So[100];
  rectMode(CENTER);
  maxim = new Maxim(this);
}

void draw() {
  background(255);
  float novax = width/2+cos(angle)*radi;
  float novay = height/2+sin(angle)*radi;
  line(width/2,height/2,novax,novay);
  angle = (angle + velAng)% (2*PI);
  pintaCaixes(width/2,height/2,novax,novay);
}

void mouseDragged(){
  color c=get(mouseX,mouseY);
  line(pmouseX,pmouseY,mouseX,mouseY);
  if(pointLine(mouseX,mouseY,pmouseX,pmouseY,mouseX,mouseY)==true){
    background(255,0,0);    
    stroke(255,0,0);
    point(mouseX,mouseY);
    stroke(0,0,0);
  }
  if(c!=-1){
    stroke(random(0,255),random(0,255),random(0,255));
  }
   
  float tt = map(mouseY,0,600,0,0.2);
  velAng = tt;
  
}
void pintaCaixes(float ox, float oy, float dx, float dy){
  line(ox,oy,dx,dy);
  for(int i=0; i<qtat; i++){
    sons[i].draw();
    if(lineRectangleIntersect(ox,oy,dx,dy,sons[i].x,sons[i].y,20,20)){
      sons[i].sona();
    }
    
  }
}

void mousePressed(){
  float incrVel = (float) mouseY/height;
  sons[qtat] = new So(mouseX,mouseY);
  qtat++;
  //player1.play();

  
  
  
}

boolean pointLine(float px, float py, float lx1, float ly1, float lx2, float ly2) {
  
  // get the slope of the entire line
  float lineSlope = (ly2-ly1)/(lx2-lx1);
  
  // get slope from one end of the line to the point
  float pointSlope = (ly2-py)/(lx2-px);
  
  // if the slopes are the same, then the point is on the line!
  if (lineSlope == pointSlope) {
    return true;
  }
  else {
    return false;
  }
  
}

// Code from Seb Lee-Delisle:
// http://sebleedelisle.com/2009/05/super-fast-trianglerectangle-intersection-test/
 
boolean lineRectangleIntersect(float x1, float y1, float x2, float y2,
                               float rx, float ry, float rw, float rh) {
                                  
  float topIntersection;
  float bottomIntersection;
  float topPoint;
  float bottomPoint;
 
  // Calculate m and c for the equation for the line (y = mx+c)
  float m = (y2-y1) / (x2-x1);
  float c = y1 -(m*x1);
 
  // If the line is going up from right to left then the top intersect point is on the left
  if(m > 0) {
    topIntersection = (m*rx  + c);
    bottomIntersection = (m*(rx+rw)  + c);
  }
  // Otherwise it's on the right
  else {
    topIntersection = (m*(rx+rw)  + c);
    bottomIntersection = (m*rx  + c);
  }
 
  // Work out the top and bottom extents for the triangle
  if(y1 < y2) {
    topPoint = y1;
    bottomPoint = y2;
  } else {
    topPoint = y2;
    bottomPoint = y1;
  }
 
  float topOverlap;
  float botOverlap;
 
  // Calculate the overlap between those two bounds
  topOverlap = topIntersection > topPoint ? topIntersection : topPoint;
  botOverlap = bottomIntersection < bottomPoint ? bottomIntersection : bottomPoint;
 
  return (topOverlap<botOverlap) && (!((botOverlap<ry) || (topOverlap>ry+rh)));
 
}


class So {
  float x;
  float y;
  int r;
  int g;
  int b;
  int num;
  AudioPlayer player;
  
  // Contructor
  So(float xE, float yE){
    x = xE;
    y = yE;
    num =  (int) random(0,100) % 2;
    r = num * 255;
    g = 0;
    b = 0;
    //g = (int) random(0,255);
    //b = (int) random(0,255);
    this.draw();
    
    if(num == 1) {
      player = maxim.loadFile("bump2.wav");
    } else {
      player = maxim.loadFile("bump3.wav");
    }
    player.setLooping(false);
      
  }
  
  // Custom method for drawing the object
  void draw() {
    fill(r,g,b);
    rect(x,y,20,20);
    
  }
  
  void sona() {
    
    if(!player.isPlaying()) {
      player.stop();
      player.cue(0);
      player.play();
    } 
  }
}


