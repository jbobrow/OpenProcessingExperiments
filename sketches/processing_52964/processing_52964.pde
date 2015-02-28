


PFont dfont;
float x;
float y;
float y2;
int r = 50;
float ran;
float ran2;
float xpos;
float ypos;
float xper;
float yper;
void setup () {
  size (500, 500);
  smooth();
  dfont = loadFont("Dax-Black-80.vlw");
  textFont(dfont);
  x = width/2;
  y = height/2;
  y2 = height/2;
  xpos = width*0.2;
  ypos = height*0.2;
  yper = height*0.2;
  
  frameRate(24);
  //  ellipseMode(RADIUS);
}

void draw() {

  background(255);
  fill(255);
  stroke(150);
  quad(xpos, yper,xpos*4, yper, xpos*4, 600, xpos, 600);
  line(xpos-100, yper-100, xpos, yper);
  line(xpos*5,ypos-100, xpos*4, yper);
  quad(xpos,ypos*6,xpos*4,ypos*6,xpos*5,ypos*7, xpos*0,ypos*7);
  quad(xpos*0,ypos*7,xpos*5,ypos*7,xpos*5,ypos*8,xpos*0,ypos*8);



  textSize(40);
  fill(150);
  text ("fall", x-30, y2);

  float d = dist (mouseX, mouseY, x, y);
  println(r);

  if (d<r) {

    y2= y2-35;
//    xpos = xpos +20;
    ypos = ypos -7;
//    r=r-1+1/2;
yper = yper - 15;
  }
    
    if (ypos <= -5){
      
//      yper=yper;
      ypos = ypos+100;
//y2=y2+700;    
  }

}


