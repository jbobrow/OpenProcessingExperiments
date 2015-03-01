
float angle;
float jitter;
float lovelyrot = 1;
float s = 0.0;

void setup () {
  size(1200,1400);
  smooth();
  noStroke();
  fill (69,227,88);
  frameRate (30);
 
 }

void draw () {

 background(56,90,20);
  lovelyrot = lovelyrot + 0.01;
  s = cos(lovelyrot)*1;
 
 //small block

 rect (199,173,95,95);
 
 //big block
 rect (152,302,180,180);
 rect (152,520,180,180);
 
 //roof
 triangle (340, 142, 340,268, 592,268);
 triangle (90, 286, 340,288, 340,160);

//rectangle
 rect (364,287,176,100);
 rect (462,310,78,180);

 rect (352,520,180,180);

if (second() % 2 == 0) {  
    jitter = random(0.2, -0.1);
  }
  angle = angle + jitter;
  float c = cos (angle);
  translate(width/3.4, height/3);
  scale(s); 
  rotate(c);
  rect (0,0,95,95); 
  
 
}

void mousePressed() {
 println( "LOADING! ");
}

