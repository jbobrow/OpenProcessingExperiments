
//text

PFont bam;
String[]words = {"GOOD", "EVIL"};

//heads
PImage[] head = new PImage[(16)];

PImage head_00;
PImage head_01;
PImage head_02;
PImage head_03;
PImage head_04;
PImage head_05;
PImage head_06;
PImage head_07;
PImage head_08;
PImage head_09;
PImage head_10;
PImage head_11;
PImage head_12;
PImage head_13;
PImage head_14;
PImage head_15;

//staches
PImage[] stache = new PImage[(8)];

PImage stache_00;
PImage stache_01;
PImage stache_02;
PImage stache_03;
PImage stache_04;
PImage stache_05;
PImage stache_06;
PImage stache_07;


void setup(){
  size(640,480);
  background(255);
  smooth();
  
  //load heads
  head[0] = loadImage ("head_00.gif");
  head[1] = loadImage("head_01.gif");
  head[2] = loadImage("head_02.gif");
  head[3] = loadImage("head_03.gif");
  head[4] = loadImage("head_04.gif");
  head[5] = loadImage("head_05.gif");
  head[6] = loadImage("head_06.gif");
  head[7] = loadImage("head_07.gif");
  head[8] = loadImage("head_08.gif");
  head[9] = loadImage("head_09.gif");
  head[10] = loadImage("head_10.gif");
  head[11] = loadImage("head_11.gif");
  head[12] = loadImage("head_12.gif");
  head[13] = loadImage("head_13.gif");
  head[14] = loadImage("head_14.gif");
  head[15] = loadImage("head_15.gif");


  //load staches
  stache[0] = loadImage ("stache_00.png");
  stache[1] = loadImage ("stache_01.png");
  stache[2] = loadImage("stache_02.png");
  stache[3] = loadImage("stache_03.png");
  stache[4] = loadImage("stache_04.png");
  stache[5] = loadImage("stache_05.png");
  stache[6] = loadImage("stache_06.png");
  stache[7] = loadImage("stache_07.png");
  
  bam = loadFont ("bam.vlw");
  textFont(bam);
  textAlign(CENTER);
  fill(229,37,37);
}


void draw() {
  noLoop();
  background(255);
    
   image(head[int(random(0,16))],0,0,width,height);
   image(stache[int(random(0,8))],0,0,width,height);

   String a = words[int(random(0,2))];   
   text(a, 320, 240); 
  
}


void mousePressed() {
  redraw();
  
}

