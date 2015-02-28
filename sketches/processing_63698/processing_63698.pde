
//variables
float x;
float y;
//int mouthHeight = 16;
//int noseWidth = 22;
//int irisLHeight = 100;
//int irisRHeight = 100;
//int cheekline_ypos = 330;
//int rimL = 58;
//int eye = 25;

void setup() {
  
size(600,600);
smooth();
background(200);
}

void draw() {
  x = width/2;
  y = height/2;
  float noseWidth = map(mouseX, 0, width, 0, 150);
  float irisLHeight = map(mouseX, 0, width, 10, 203);
  float cheekline_ypos = map(mouseX, 0, width, 650, 45);
  float irisRHeight = map(mouseX, 0, width, 10, 203);
  float rim = map(mouseX, 0, width, 10,90);
  float eye = map (mouseX, 0, width, 5, 20);
  float mouthHeight = map(mouseX, 0, width, -1,60);
  background(200);
  
  
//mouth
fill (0);
strokeJoin(ROUND);
strokeWeight(10);
stroke(255);
rectMode(CORNER);
rect (225, 375, 150, mouthHeight);

//nose
fill (0);
strokeJoin(ROUND);
strokeWeight(10);
stroke(255);
rectMode(CENTER);
rect (width/2, height/2, noseWidth, width/20);

//irisL
fill (255);
noStroke ();
ellipse (140, height/2.5, width/6, irisLHeight);
 
//irisR
fill (255);
noStroke ();
ellipse (460, height/2.5, width/6, irisRHeight);

//rimL
fill (0);
noStroke ();
ellipse (140, height/2.5, rim, rim);
 
//rimR
fill (0);
noStroke ();
ellipse (460, height/2.5, rim, rim);
 
//eyeballL
fill (255);
noStroke ();
ellipseMode (CENTER);
ellipse (140, height/2.5, eye, eye);
 
//eyeballR
fill (255);
noStroke ();
ellipseMode (CENTER);
ellipse (460, height/2.5, eye, eye);
 
//toothL
fill (255);
noStroke ();
ellipseMode (CENTER);
arc (275, 378, width/24, height/24, 0, PI);
 
 
//toothM
fill (255);
noStroke ();
ellipseMode (CENTER);
arc (300, 378, width/24, height/24, 0, PI);


//toothR
fill (255);
noStroke ();
ellipseMode (CENTER);
arc (325, 378, width/24, height/24, 0, PI);

//cheeklineR
stroke(0);
strokeWeight(10);
line(410, cheekline_ypos, 510, cheekline_ypos);

//cheeklineL
stroke(0);
strokeWeight(10);
line(90, cheekline_ypos, 190, cheekline_ypos);
}

