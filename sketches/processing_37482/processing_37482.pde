
// Homework 5
// 51-757 Computing for the Arts with Processing
// September 15, 2011
// Copyright Molly Nix September 2011 Pittsburgh, PA 15232

size (400, 400);
int wd = 400;
int ht = 400;
float alphavalue = 255;
color white = color(255,255,255);
color topcolor = color(157,213,198);
color rightcolor = color(0,150,146);
color leftcolor = color(0,159,162);
float cubewidth = 50;
float cubesecht = 30;
float leftpt = 0;
float cubetop = 0-(cubesecht*1.5);
float rownumber = 1;

smooth();
background(white);

while (alphavalue > 0) {
  
  noStroke();
  fill(topcolor);
  quad(leftpt, cubetop+cubesecht*.5, leftpt+cubewidth*.5, cubetop, leftpt+cubewidth, cubetop+cubesecht*.5, leftpt+cubewidth*.5, cubetop+cubesecht);
  fill(leftcolor);
  quad(leftpt, cubetop+cubesecht*.5, leftpt+cubewidth*.5, cubetop+cubesecht, leftpt+cubewidth*.5, cubetop+cubesecht*2, leftpt, cubetop+cubesecht*.5+cubesecht);
  fill(rightcolor);
  quad(leftpt+cubewidth*.5, cubetop+cubesecht, leftpt+cubewidth, cubetop+cubesecht*.5, leftpt+cubewidth, cubetop+cubesecht*.5+cubesecht, leftpt+cubewidth*.5, cubetop+cubesecht*2);
  
  if (leftpt > wd) {
      if (rownumber % 2 == 1) {
        leftpt = 0-cubewidth*.5;
      }
      else {
        leftpt=0-cubewidth;
      }
      cubetop = cubetop+(cubesecht*1.5);
      alphavalue = alphavalue-2;
      rownumber = rownumber+1;
  }
  
  else {
    alphavalue = alphavalue-2;
    leftpt = leftpt+cubewidth;
    cubetop = cubetop;
  }
  
  topcolor = color(157,213,198,alphavalue);
  rightcolor = color(0,150,146,alphavalue);
  leftcolor = color(0,159,162,alphavalue);
  
}


