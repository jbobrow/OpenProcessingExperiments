
PImage hairl;
PImage hairr;
PImage nose; 
PImage mouth;


void setup() {
  size(500, 500);
  smooth();
  hairl = loadImage("hairleft.png");
  hairr = loadImage("hairright.png");
  nose = loadImage("nose-01.png");
  mouth=loadImage("mouth-01.png");
}

void draw()
{
  background(255);

  //eyebrows 150,250
  noFill();
  int brwgo=120;
  float browstrkw=map(mouseX, brwgo, width, 3, 23);
  float brwleftx=map(mouseX, brwgo, width, 110, 45);
  float brwlefty=map(mouseX, brwgo, width, 170,25);
  float brwleftup=map(mouseX, brwgo, width,190,85);
  float brwleftxx=map(mouseX, brwgo, width,170,180);
  float brwleftyy=map(mouseX, brwgo, width, 180,105); 
  
  float brwrightx=map(mouseX, brwgo, width, 390, 455);
  float brwrightxx=map(mouseX, brwgo,width, 330, 320);

  if(mouseX<brwgo) {noStroke();}
 else{ strokeWeight(browstrkw); }
  
  bezier(brwleftx, brwlefty, 110, brwleftup-15, 150, brwleftup, brwleftxx, brwleftyy);
  bezier(brwrightx, brwlefty, 390, brwleftup-15, 350, brwleftup, brwrightxx, brwleftyy);
  
  //hair
  float hrx=map(mouseX, 0, width, -150, -225);
  float hlx=map(mouseX, 0, width, -175, -250);
  image(hairl, -170, hrx, 500, 500);
  image(hairr, 200, hlx, 500, 500);

  stroke(0);
  strokeWeight(5);
  fill(255);

  float sescale=map(mouseX, 0, width, 20, 70);
  float sestroke=map(mouseX, 0, width, 10, 17);
  float selx=map(mouseX, 0, width, 150, 90);
  float sely=map(mouseX, 0, width, 250, 160);
  float serx=map(mouseX, 0, width, 350, 420);

  float lashx=map(mouseX, 0, width, 120, 20);
  float lashy=map(mouseX, 0, width, 240, 140);
  float lash2x=map(mouseX, 0, width, 380, 485);


  //lashes
  line(selx, sely, lashx, lashy); 
  line(selx, sely, lashx+10, lashy-10); 
  line(selx, sely, lashx+20, lashy-20);
  line(serx, sely, lash2x, lashy); 
  line(serx, sely, lash2x-10, lashy-10); 
  line(serx, sely, lash2x-20, lashy-20);

  //eyes big
  float bescalex=map(mouseX, 0, width, 40, 150);
  float belx=map(mouseX, 0, width, 150, 110); 
  float bely=map(mouseX, 0, width, 250, 170);
  float berx=map(mouseX, 0, width, 350, 400);
  ellipse(belx, bely, bescalex, bescalex);
  ellipse(berx, bely, bescalex, bescalex);

  //eyes small
  strokeWeight(sestroke);
  ellipse(selx, sely, sescale, sescale);
  ellipse(serx, sely, sescale, sescale);

  //nose    
  image(nose, 0, hrx+180, 500, 500);
  //  strokeWeight(3);
  //  line(240,285, 242,290);
  //  line(260,285, 258,290);

  //mouth
  strokeWeight(5);
   
  beginShape();
  curveVertex(237,370);
  curveVertex(237,370);
  curveVertex(250,350);
  curveVertex(260,350);
  curveVertex(273,370);
  curveVertex(257,366);
  curveVertex(237,370);
  curveVertex(237,370);
  endShape();
  //  image(mouth, 0, 0, 500,500);
}


