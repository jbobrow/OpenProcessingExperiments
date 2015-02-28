
// Robin Gower 2009
// app demonstrating retrograde motion

int i = 45;
int j = 225;
int n = 0;
float pos1 = 0; 
float pos2 = 0; 
float pos3 = 0; 
float pos4 = 0;
float angle = 0;
float skyx1;
float skyy1;
float skyx2;
float skyy2;
int is = 8;
int js = 12;
int ir = 40;
int jr = 60;
int armlength = 128;
int traillength = 200;
boolean flipi, flipj;
int maxloop=360;
color earthcol=color(255,0,0);
color marscol=color(0,0,255);
float[] trailx1 = new float[maxloop];
float[] traily1 = new float[maxloop];
float[] trailx2 = new float[maxloop];
float[] traily2 = new float[maxloop];

void setup() 
{
  colorMode(RGB, 100);
  size(400, 400);
  noStroke();
  smooth();
  //background(0);

}

void draw() 
{
  background(0);
  
  noFill();                      //orbits
  stroke(earthcol, 127);
  ellipse(200,200,ir*2,ir*2);
  stroke(marscol, 127);
  ellipse(200,200,jr*2,jr*2);

  noStroke();
  fill(255,191,47);
  ellipse(200, 200, 32, 32);      //centre planet

  stroke (100);
  angle= atan((pos3 - pos1)/(pos4-pos2)); // between two bodies
  skyx1 = pos3 + (armlength*sin(angle));
  skyy1 = pos4 + (armlength*cos(angle));
  skyx2 = pos3 - (armlength*sin(angle));
  skyy2 = pos4 - (armlength*cos(angle));
  line(skyx1, skyy1, skyx2, skyy2);
  
  trailx1[n] = skyx1;
  traily1[n] = skyy1;
  trailx2[n] = skyx2;
  traily2[n] = skyy2;

//  stroke (100);
//  line(pos1, pos2, 200, 200);    //small planet to centre planet

  noStroke();  
  fill(earthcol);
  ellipse(pos1, pos2, is, is);      //small planet
  fill(marscol);
  ellipse(pos3, pos4, js, js);    //big planet
  
  for (int  p=0; p<n; p++){
    stroke (map(p, n, 0, 255, 0));
    point(trailx1[p], traily1[p]);
    point(trailx2[p], traily2[p]);
//    print(p);
  }

  i += 2;      // move ellipses
  j += 1;

  n++; // cycle trail
  if(n>=maxloop){n=0;}

  if(i/360 > 1) {   // stop values getting too big
    i = i%360;
    flipi=true;
  }
  if(j/360 > 1) {
    j = j%360;
    flipj=true;
  }

  float ang1 = radians(i); // convert degrees to radians
  float ang2 = radians(j); // convert degrees to radians
  pos1 = width/2 + (ir * cos(ang1));
  pos2 = width/2 + (ir * sin(ang1));
  pos3 = width/2 + (jr * cos(ang2));
  pos4 = width/2 + (jr * sin(ang2));

}



