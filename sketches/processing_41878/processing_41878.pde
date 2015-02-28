
float tx = 100;
float ty = 0;
float speed = 15;
int oLight = 0;
int o = 0;

int time = 8000;
int time2 = 12000;
int time3 = 14000;

PFont freesia15;
PFont freesiaSMALL;



void setup() {
  size(600, 600);
  smooth();
}



void draw(){
  int currentTime = millis();
  rectMode(CORNER);
  fill(15);
  rect(0,0, width, height);
  oLight = 255;
  o=255;
  float randomFloat = 0;
  
  
  ty=300;
  //tx +=speed;
  oLight= int(random(50,255));
  
  if (currentTime > time){
    o= int(random(50,255));
  
  }
  if (currentTime > time2){
   o=0;
   oLight=o;
  } 
  
  //if ( tx > width){
  //  tx=0;
  //}
  if (currentTime > time3){
    
    tx=500;
    o=255;
    oLight=255;
    
  }
  tardis(tx, ty, oLight, o);
 
  
  
}

void tardis(float tx, float ty, int oLight, int o) {
  
  stroke(0,o);
  strokeWeight(3);
  rectMode(CENTER);
  
  //top LIGHT
  fill(255,255,255,oLight);
  rect(tx, ty-132, 15, 15);
  //top wood
  fill(#210E69, o);
  rect(tx, ty-113, 80, 20);
  rect(tx, ty-108, 95, 20);
  //bottom wood
  rect(tx, ty+110, 110, 15);
  //Box
  rect(tx, ty, 100, 220);
  //door line
  line(tx,ty-90,tx,ty+110);
  //Police sign
  fill(#132759, o);
  rect(tx, ty-95, 95, 20);
  
  
  
  //Windows, left to right
  fill(#E4D9E7, o);
  rect(tx-25, ty-60, 40, 40);
  line(tx-32, ty-80, tx-32, ty-40);
  line(tx-18, ty-80, tx-18, ty-40);
  line(tx-45, ty-60, tx-5, ty-60);

  fill(#E4D9E7, o);
  rect((tx-25)+50, ty-60, 40, 40);
  line((tx-32)+50, ty-80, (tx-32)+50, ty-40);
  line((tx-18)+50, ty-80, (tx-18)+50, ty-40);
  line((tx-45)+50, ty-60, (tx-5)+50, ty-60);

  //RECTS left to right, top to bottom
  fill(#210E69, o);
  rect((tx-25)+50, (ty-60)+45, 40, 40);
  rect(tx-25, (ty-60)+45, 40, 40);
  
  fill(#210E69, o);
  rect((tx-25)+50, (ty-60)+95, 40, 40);
  rect(tx-25, (ty-60)+95, 40, 40);
  
  fill(#210E69, o);
  rect((tx-25)+50, (ty-60)+145, 40, 40);
  rect(tx-25, (ty-60)+145, 40, 40);
  //note
  fill(#EBDEB2, o);
  rect(tx-25, (ty-60)+45, 20, 30);
  //TEXT :D
  freesia15 = loadFont("FreesiaUPCBold-15.vlw");
  textAlign(RIGHT);
  textFont(freesia15);
  fill(255, o);
  text("POLICE", tx-10, ty-90);
  textAlign(LEFT);
  text("BOX", tx+20, ty-90);
  freesiaSMALL = loadFont("FreesiaUPCBold-5.vlw");
  textFont(freesiaSMALL);
  textAlign(CENTER);
  text("PUBLIC CALL", tx+5, ty-90, 12, 20);
  fill(0, o);
  text("POLICE TELEPHONE FREE FOR USE OF PUBLIC",tx-25, (ty-62)+45, 20, 30);
  
  
}


