
float randImg;

int numbg = 9;
int numbody = 7;
int numhead = 7;
int nummaskl = 6;
int nummaskr = 6;

PImage[] picbg = new PImage[numbg];
PImage[] picbody = new PImage[numbody];
PImage[] pichead = new PImage[numhead];
PImage[] picmaskl= new PImage[nummaskl];
PImage[] picmaskr = new PImage[nummaskr];

void setup(){
  size(500,500);
  frameRate(1);
  smooth();
  //bg
  picbg[0] = loadImage("bg01.jpg");
  picbg[1] = loadImage("bg02.jpg");
  picbg[2] = loadImage("bg03.jpg");
  picbg[3] = loadImage("bg04.png");
  picbg[4] = loadImage("bg05.png");
  picbg[5] = loadImage("bg06.png");
  picbg[6] = loadImage("bg07.png");
  picbg[7] = loadImage("bg08.png");
  picbg[8] = loadImage("bg09.png");
  //body
  picbody[0] = loadImage("bd01.png");
  picbody[1] = loadImage("bd02.png");
  picbody[2] = loadImage("bd03.png");
  picbody[3] = loadImage("bd04.png");
  picbody[4] = loadImage("bd05.png");
  picbody[5] = loadImage("bd06.png");
  picbody[6] = loadImage("bd07.png");

  //head
  pichead[0] = loadImage("hd01.png");
  pichead[1] = loadImage("hd02.png");
  pichead[2] = loadImage("hd03.png");
  pichead[3] = loadImage("hd04.png");
  pichead[4] = loadImage("hd05.png");
  pichead[5] = loadImage("hd06.png");
  pichead[6] = loadImage("hd07.png");
  //left mask
  picmaskl[0] = loadImage("ms01.png");
  picmaskl[1] = loadImage("ms02.png");
  picmaskl[2] = loadImage("ms03.png");
  picmaskl[3] = loadImage("ms04.png");
  picmaskl[4] = loadImage("ms05.png");
  picmaskl[5] = loadImage("ms06.png"); 
  //right mask
  picmaskr[0] = loadImage("msb01.png");
  picmaskr[1] = loadImage("msb02.png");  
  picmaskr[2] = loadImage("msb03.png");
  picmaskr[3] = loadImage("msb04.png");
  picmaskr[4] = loadImage("msb05.png");
  picmaskr[5] = loadImage("msb06.png");
    
}

void draw(){
 background(50);
 //rect(random(10,20),20,30,30);
 drawbg();
 drawbody();
 drawhead();
 drawmasklf();
 drawmaskrt();
}

//draw bg
void drawbg(){
  randImg = round(random(0,numbg-1));
  image(picbg[(int)randImg], 0, 0);
}

//draw body
void drawbody(){
  randImg = round(random(0,numbody-1)); 
  image(picbody[(int)randImg], 0, 0); 
}

//draw head
void drawhead(){
  randImg = round(random(0,numhead-1)); 
  image(pichead[(int)randImg], 0, 0);  
}

//draw left mask
void drawmasklf(){
  randImg = round(random(0,nummaskl-1)); 
  image(picmaskl[(int)randImg], 0, 0); 
}

//draw right mask
void drawmaskrt(){
  randImg = round(random(0,nummaskr-1)); 
  image(picmaskr[(int)randImg], 0, 0); 
}


