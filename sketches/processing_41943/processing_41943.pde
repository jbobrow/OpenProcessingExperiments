
float tx = 100;
float ty = 0;
float speed = 15;
int oLight = 0;
int o = 0;
float g = 0.5;
float cx = 700;
float cy = 0;
float w;
float h;
float shine = 100;
float[] sx = new float[10];
float[] sy = new float[10];
float[] so = new float[10];
int amountRain = 20;
float[] rx = new float[amountRain];
float[] ry = new float[amountRain];
float[] ro = new float[amountRain];
int time = 10000;
int time2 = 14000;
int time3 = 16000;

PFont freesia15;
PFont freesiaSMALL;



void setup() {
  size(600, 600);
  smooth();
  //Setting up arrays for the stars
  for(int i=0; i<10; i++){
    sx[i]=random(width);
    sy[i]=random(height-110);
    so[i]=random(100,255);
  }
  //Setting up arrays for the rain
  for(int i=0; i<amountRain; i++){
    rx[i]=random(width);
    //sy[i]=random(height-110);
    ry[i]=0;
    ro[i]=random(100,255);
  }
}



void draw(){
  
  
  //defining currentTime counted in milli-sec
  int currentTime = millis();
  //background
  rectMode(CORNER);
  fill(#000000, 200);
  rect(0,0, width, height);
  //Calling grassField
  grassField();
  //Calling the array for stars and setting a loop
  for(int i=0; i<10; i++){
  star(sx[i],sy[i],so[i]);
  }
  for(int i=0; i<10; i++){
    sx[i]+=0.2;
    if(sx[i]>width){
      sx[i]=0;
      sy[i]=random(height-110);
      so[i]=random(100,255);
    }
  }
  //Calling the function moon with input from a loop, making the the shining "aura" grow and shrink
  moon(shine);
  
  if (shine>140){
    g = -0.5;
    
  }
  if (shine <120) {
    g =0.5;
  }
  
  shine += g;

  //Calling the rain array and looping just like the stars but moving the ellipses vertically
  for(int i=0; i<amountRain; i++){
  rain(rx[i],ry[i],ro[i]);
  }
  for(int i=0; i<amountRain; i++){
    float rainSpeed = random(100);
    ry[i]+=rainSpeed;
    if(ry[i]>height-110){
      ry[i]=0;
     rx[i]=random(width);
      ro[i]=random(100,255);
    }
  }
  
  //Calling clouds, rendering a variation of the two cloud shapes with each loop
  cloud(cx, cy, w, h);
  cloud(cx+300, cy+100, w+10, h+45);
  cx= cx- 2;
  if (cx < (0-400)){
   cx = width+100;
   cy = cy+random(-10,10);
   w = random(-10,100);
   h = random(-10,100);
  }
  //Calling the tardis, setting loops for the different events to happen according to their length from currentTime
  oLight = 255;
  o=255;
  ty=400;
  //Flashing tardis top light
  oLight= int(random(50,255));
  //Whole tardis flashing in opacity change
  if (currentTime > time){
    o= int(random(50,255));
  
  }
  //tardis gone.
  if (currentTime > time2){
   o=0;
   oLight=o;
  } 
  
  //tardis in a new x
  if (currentTime > time3){
    
    tx=500;
    o=255;
    oLight=255;
    
  }
 
  tardis(tx, ty, oLight, o);
   
  
  
}
//tardis function, lots graphics
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
//grassfield function, simple rect
void grassField() {
  fill(#004800);
  noStroke();
  rect (0, 500, width, 100);
  
}
//cloud function, ellipses with different opacity and width/height/x/y
void cloud(float cx, float cy, float w, float h) {
 
  fill(#999B99, 100);
  noStroke();
  ellipse(cx, cy, w+150, h+100);
  ellipse(cx-10, cy+3, w+100, h+50);
  ellipse(cx-100, cy+11, w+150, h+50);
  ellipse(cx-105, cy+20, w+10, h+10);
  
}
//moon function, ellipses and different opacity
void moon(float shine) {
  
  fill(#E8E6A9,200);
  ellipse(100, 100, 80, 80);
  fill(#E8E6A9, 150);
  ellipse(100, 100, 90, 90);
  fill(#E8E6A9, 100);
  ellipse(100, 100, 100,100);
  fill(#E8E6A9, 25);
  ellipse(100, 100, shine, shine);
  
}
  
 //Star function, asking for xy pos and opacity
void star(float sx, float sy, float so){
  noStroke();
  fill(250,so);
  ellipse(sx,sy, 5,5);
  
 
  
}
//rain function, asking for xy pos and opacity
void rain(float rx, float ry, float ro){
  noStroke();
  fill(#001F79,ro);
  ellipse(rx,ry, 5,5);
  
 
  
}


