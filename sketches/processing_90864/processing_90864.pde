

float backr;
float backg;
float backb;

float groundr;
float groundg;
float groundb;
float groundstart;

//clouds (vacillate in function)
float cloudStart;
float cloudx;
float cloudy;
float cloudwidth;
float cloudheight;
float cloudcol;
float cloudtrans;
float cloudR;
float cloudRvar;
float cloudG;
float cloudGvar;
float cloudB;
float cloudBvar;

//landscape attributes (vacillate in function)
float numVerts;
float shapeR;
float shapeG;
float shapeB;
float shapeVertx;
float shapeVerty;

void setup(){
size(500, 500);

//setup background
backr = random(0, 255);
backg = random(0, 255);
backb = random(0, 255);

//setup ground
groundr = random(0, 150);
groundg = random(0, 150);
groundb = random(0, 150);
groundstart = random(300, 450);

//setup landscape
background(backr, backg, backb);
fill(groundr, groundg, groundb);
noStroke();
rect(0, groundstart, 500, (500-groundstart));

//constructing objects
noStroke();
for (int a = 0; a < 3; a++) {
  numVerts = random(3, 10);
  shapeR = random(0, 255);
  shapeG = random(0, 255);
  shapeB = random(0, 255);
  fill(shapeR, shapeG, shapeB);
  beginShape();
    for (int b = 0; b < numVerts; b++) {
      shapeVertx = random(0, 500);
      shapeVerty = random(500-groundstart, 500);
      vertex(shapeVertx, shapeVerty);
    }
  endShape();
}

}

void draw(){
smooth();

//creating clouds
cloudStart = random(0, groundstart-250);
cloudx = random(0, 500);
cloudy = random(0, cloudStart);
cloudwidth = random(0, 100);
cloudheight = random(0, 100);
cloudcol = random(150, 255);
cloudRvar = random(-10, 10);
cloudGvar = random(-10, 10);
cloudBvar = random(-10, 10);
cloudR = cloudcol + cloudRvar;
cloudG = cloudcol + cloudGvar;
cloudB = cloudcol + cloudBvar;
cloudtrans = random(0, 255);

fill(cloudR, cloudG, cloudB, cloudtrans);
ellipse(cloudx, cloudy, cloudwidth, cloudheight);

}




