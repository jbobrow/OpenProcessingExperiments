
//import arb.soundcipher.*;
//SoundCipher sc = new SoundCipher(this);

   function player(note){
        sound = new Audio("http://teampixfx.com/downloads/processing_sketches/mines/soundz/"+note+".mp3"); sound.play();sound.volume= vol;} 
        //println(mouseX/1000);
       
boolean playAudio = true, loop = true; float vol = 1;

ArrayList<Path> paths;
ArrayList<Mine> mines;
ArrayList<Current> currents;
ArrayList<PVector> positionFromPathClass;

boolean startPath = true, startMine = true, dragged = false, pressed = false;
float maxMineRadius = 100, minMineRadius = 30, maxMineExpRadius = random(10, 50);

void setup() {
  //size(1300, 700);
   size(screen.width, (screen.height)-100);
  frameRate(20);
  //size(displayWidth, displayHeight);
  //if (frame != null) {
  //  frame.setResizable(true);
  //}
  smooth();
  noStroke();
  paths = new ArrayList<Path>();
  mines = new ArrayList<Mine>();
  currents = new ArrayList<Current>();
  positionFromPathClass = new ArrayList<PVector>();
}
void draw() {
  background(#2d2c2c);
  fill(#ffffff, 10);
  textSize(100);
  text("MY MUSIC BOX", (width/2)-352, (height/2)+35);
  textSize(30);
  text("Created by, JUBIN C JOSE :: Programmer / Visualizer", (width/2)-370, (height/2)+70);
  textSize(12);
  fill(#ffffff);
  text("HELP: key 'm' & 'p' for volume control. Press mouse to place a mine, Drag mouse to draw rail. Try to draw quick rails just by touching the edges of mines, to play short rings.., Go further inside core of mines or slow paths to play long rings. ", 10, height-20);
  text("Use your skill to play sounds, remember, as the number increases, the box may render slower based on ur sys. config.", 10, height-10);

  for (int i=0;i<paths.size();i++) {
    paths.get(i).displayPath();
    paths.get(i).displayCab();
    currents.get(i).putCurrent(paths.get(i).getCabPosition());
    // ellipse(hmm.x,hmm.y,100,100);
    // println(hmm.x+"  "+hmm.y);
  }

  for (int i=0;i<mines.size();i++) {
    mines.get(i).checkMine();
    mines.get(i).displayMine();
  }

  //if (pressed) println("1"); else println("0");
  //println(paths.size()+" "+mines.size()+" "+currents.size()+" "+positionFromPathClass.size());
  fill(0, 150);
  noStroke();
  rect(0, 0, vol*width, 12);
  textSize(12);
  fill(250);
  text("Volume "+(int)(vol*100)+"%", 0, 10);
}
void mouseDragged() {
  if (startPath) {
    paths.add(new Path());
    currents.add(new Current());
  }
  startPath = false;
  paths.get(paths.size()-1).update(mouseX, mouseY);
  dragged = true;
}
void mousePressed() {
  pressed = true;
}
void keyPressed() {
  if (key == 'p') {
    vol += .1;
    if(vol > 1) { vol = 1; }
  }
  if (key == 'm') {
    vol -= .1;
    if(vol < 0) { vol = 0; }
  }
    //println((vol*100000)/width);
}
/* void mouseMoved(){
    frameRate(mouseX/10);
} */
void mouseReleased() {
  if (dragged) {
    startPath = true;
    dragged = false;
    pressed = false;
  }
  else if (pressed) {
    if (startMine) {
      mines.add(new Mine(mouseX, mouseY, random(minMineRadius, maxMineRadius), random(200), random(100), random(100)));
    }
    startMine = true;
    pressed = false;
  }
}

class Current {
  PVector pv;
  void putCurrent(PVector pvec) {
    pv = pvec;
  }
  PVector getPosition() {
    //println(pv.x+"  "+pv.y);
    //fill(200,100,50,50);
   //ellipse(pv.x,pv.y,100,100);
    return pv;
  }
}

class Mine {
  int px, py;
  float rad, oldRad, r, g, b;
  boolean exp = false,frontIn = false, backIn = true;
  color colour;
  int note;

  Mine(int x, int y, float r, float red, float green, float blue) {
    px = x;
    py = y;
    rad = r;
    oldRad = r;
    r = red;
    g = green;
    b = blue;
    note = (int) random(1,45.9);
  }
  void checkMine() {
    strokeWeight(.1);
    for (int i=0;i<currents.size();i++) {
      float dis = dist(currents.get(i).getPosition().x, currents.get(i).getPosition().y, px, py);
     stroke(150,dis);
     line(currents.get(i).getPosition().x, currents.get(i).getPosition().y, px, py);
      if (dis <= rad/2) {
        frontIn = true;
        exp = true;
       
      }
      else {
       frontIn = false;
        exp  = false;
      }       
      
      if((frontIn && !backIn)){
        PlaySound ps = new PlaySound();
        ps.playAudio(note);
      }
      backIn = frontIn;
      
      if (rad < oldRad+maxMineExpRadius && exp) {
        rad +=5;
      }
      if (rad > oldRad && !exp) {
        rad -= .3;
      }
     // println(exp);
    }
  }
  void displayMine() {
    //colour = color(r+rad*3, g, b);
    fill(150+rad*3, rad*2);
   // fill(colour, rad*2);
    noStroke();
    ellipse(px, py, rad, rad);
  }
}

class Path {
  Point points;
  int counter;
  PVector cabPosition;
  
  Path() {
    points = new Point();
    counter = 0;
  }
  void update(int x, int y) {
    points.addPoint(x, y);
  }
  void displayPath() {
    stroke(#3a3a3a);
    strokeWeight(5);
    for (int i=0;i<points.px.length-1;i++) {
      line(points.px[i], points.py[i],points.px[i+1], points.py[i+1]);
    }
  }
  PVector getCabPosition(){
  // author: http://teampixfx.com or http://blog.teampixfx.com
    return cabPosition;
  }
  
  void displayCab(){
    cabPosition = new PVector(points.px[counter], points.py[counter]);
    fill(#ffffff);stroke(#ffffff);
    rect(cabPosition.x-5,cabPosition.y-5,10,10);
    counter++;
    if(counter >= points.px.length){
      counter = 0;
    }
  
  }
}

class PlaySound{
  void playAudio(int note){
  if(playAudio){
     player(note);
  }
  }
}
class Point{
  int[] px = {};
  int[] py = {};
  Point(){
  }
  void addPoint(int x,int y){
    try{
    int tx[] = append(px,x);
    int ty[] = append(py,y);
    px = tx;
    py = ty;
    }catch(Exception e){
      e.printStackTrace();
    }
  }
}
