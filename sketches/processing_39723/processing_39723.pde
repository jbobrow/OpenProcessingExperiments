
import ddf.minim.*;
Minim minim;
AudioSample tounge;
AudioPlayer player;
AudioPlayer backgroundmusic;
PShape g;//gordo burger default
PShape g2;// gordo burger crying
PShape s;// fork default
PShape s2; // ford with burger chunk
PShape h; // heart
PImage r;
PFont f;// font for text

int pressedX = 10;
int pressedY = 10;

int num = 60;
int a[] = new int[num];
int b[] = new int[num];


void setup(){
  size(512,500);
  smooth();
  minim = new Minim(this);
  minim.loadFile("Fig Leaf Rag.mp3");
  backgroundmusic = minim.loadFile("Fig Leaf Rag.mp3", 2048);
  minim.loadSample("tongue_wag.wav");
  tounge = minim.loadSample("tongue_wag.wav", 2048);
  if ( tounge == null ) println("Wag it");
  backgroundmusic.play();
  g = loadShape("gordo_burger_monster.svg");
  g2 = loadShape("gordo_burger_monste_crying.svg");
  s = loadShape("Fork.svg");
  s2 = loadShape("Fork_food.svg");
  h = loadShape("heart.svg");
  r = loadImage("picnic_bg.jpg");
  f = loadFont("Andy-Bold-48.vlw");
  }
  void draw(){
  background(r);//red & white napkin BG
  fill(0);
  stroke(0);
   
  int xVal = mouseX*3-100;//for curve
  int yVal = mouseY*3-100;//for curve
  
  stroke(0);
  for (int i = 0; i < tounge.bufferSize() - 1; i++)//sound waves
  {
    float x1 = map(i, 0, tounge.bufferSize(), 0, width);
    float x2 = map(i+1, 0, tounge.bufferSize(), 0, width);
    line(x1, 260 - tounge.mix.get(i)*50, x2, 260 - tounge.mix.get(i+1)*50);
   }
    
  shapeMode(CENTER);
  strokeWeight(3);
   
  if (mousePressed == true){
    text("Waahh! you bit me!!", 200,120);
    shape(g2,250,250,200,250);//burger sad
    line(230,135,245,155);
    line(270,135,255,155);
    noCursor();
  shape(s2,mouseX,mouseY,100,100); //fork with burger chunk
  } else{
    text("Let Me Lick You", 200,120);
    shape(g,250,250,200,250);//burger
    line(225,140,245,145);
    line(275,140,255,145);
    noCursor();
    shape(s,mouseX,mouseY,100,100); //fork clean
  }
  
  strokeWeight(1);
  fill(255);
  ellipse(225,168,35,35);//left eye
  fill(0);
  ellipse(225,168,pressedX,pressedY);//left pupil
  fill(255);
  ellipse(275, 168,35,35);//right eye
  fill(0);
  ellipse(275,168,pressedX,pressedY);//right pupil
  text ("Press click & hold mouse on burger", 145, 360);
  text ("Press t", 230, 385);
  fill(250,126,174);
  curve(xVal,yVal,200,264,287,260,xVal,yVal);//moving tongue

  for (int i = a.length-1; i > 0; i--){
    a[i] = a[i-1];
    b[i] = b[i-1];
  }
  
  a[0] = mouseX;
  b[0] = mouseY;
  for (int i = 0; i < a.length; i++){
    shape(h,a[i],b[i],11,11); //little hearts
  }
 }
  
  void mouseDragged() {
    print("Ouch!");
}

void mousePressed() {//cause burger monster to blink
  
  if(pressedX == 10) {
    pressedX = 27;
   }
    if(pressedY == 10) {
      pressedY = 3;
  } else {
    pressedX = 10;
    pressedY = 10;
   }
}
void keyPressed(){
  if(key == 't') tounge.trigger();
}

void stop(){
player.close();
backgroundmusic.close();
tounge.close();
  minim.stop();
  super.stop();
}



