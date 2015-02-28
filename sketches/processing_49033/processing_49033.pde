
// My approximation of Blend Morphs, 
// a feature from Anime Studio Pro.
// -- Steve Tiffany, 2012
int x, y, xspeed, yspeed;

void setup() {
  size(400,400);
  smooth();
  noCursor();
  x = 8; y = 393;
  xspeed = 3; yspeed = 0;
}

void draw() {
  background(250,153,8);
  strokeWeight(2);
  stroke(0);
  fill(31,61,42); 
  beginShape(); // hair
  curveVertex(map(x,0,width,233,225), map(y,0,height,25,28));
  curveVertex(map(x,0,width,285,272), map(y,0,height,50,47));
  curveVertex(map(x,0,width,306,300), map(y,0,height,101,97));
  curveVertex(map(x,0,width,336,311), map(y,0,height,209,191));
  curveVertex(map(x,0,width,323,309), map(y,0,height,286,288));
  curveVertex(map(x,0,width,332,318), map(y,0,height,304,311));
  curveVertex(map(x,0,width,294,288), map(y,0,height,325,304));
  curveVertex(map(x,0,width,147,137), map(y,0,height,335,311)); 
  curveVertex(map(x,0,width,112,88), map(y,0,height,300,307)); 
  curveVertex(map(x,0,width,90,74), map(y,0,height,166,196)); 
  curveVertex(map(x,0,width,109,109), map(y,0,height,82,74));
  curveVertex(map(x,0,width,149,149), map(y,0,height,32,29));
  curveVertex(map(x,0,width,187,187), map(y,0,height,25,34));
  // To make a closed curve, the last three lines
  // are always the same as the first three...
  curveVertex(map(x,0,width,233,225), map(y,0,height,25,28));
  curveVertex(map(x,0,width,285,272), map(y,0,height,50,47));
  curveVertex(map(x,0,width,306,300), map(y,0,height,101,97));
  endShape();

  fill(234,206,180); 
  beginShape(); // shoulders & neck
  curveVertex(map(x,0,width,167,173), map(y,0,height,239,259));
  curveVertex(map(x,0,width,231,234), map(y,0,height,242,253));
  curveVertex(map(x,0,width,242,247), map(y,0,height,330,340));
  curveVertex(map(x,0,width,355,355), map(y,0,height,403,403));
  curveVertex(map(x,0,width,33,33), map(y,0,height,403,403));
  curveVertex(map(x,0,width,154,160), map(y,0,height,329,345));
  curveVertex(map(x,0,width,167,173), map(y,0,height,239,259));
  curveVertex(map(x,0,width,231,234), map(y,0,height,242,253));
  curveVertex(map(x,0,width,242,247), map(y,0,height,330,340));
  endShape();
  
  fill(242,216,191);   
  beginShape(); // head
  curveVertex(map(x,0,width,156,215), map(y,0,height,79,139));
  curveVertex(map(x,0,width,191,247), map(y,0,height,77,137));
  curveVertex(map(x,0,width,200,251), map(y,0,height,74,130));
  curveVertex(map(x,0,width,200,246), map(y,0,height,55,83));
  curveVertex(map(x,0,width,213,260), map(y,0,height,64,104));
  curveVertex(map(x,0,width,215,266), map(y,0,height,79,128));
  curveVertex(map(x,0,width,219,270), map(y,0,height,83,132));
  curveVertex(map(x,0,width,253,276), map(y,0,height,93,128));
  curveVertex(map(x,0,width,262,285), map(y,0,height,110,137));
  curveVertex(map(x,0,width,265,282), map(y,0,height,216,229));
  curveVertex(map(x,0,width,161,238), map(y,0,height,278,300));
  curveVertex(map(x,0,width,113,137), map(y,0,height,224,242));
  curveVertex(map(x,0,width,109,130), map(y,0,height,122,148));
  curveVertex(map(x,0,width,114,140), map(y,0,height,95,134));
  curveVertex(map(x,0,width,156,215), map(y,0,height,79,139));
  curveVertex(map(x,0,width,191,247), map(y,0,height,77,137));
  curveVertex(map(x,0,width,200,251), map(y,0,height,74,130));
  endShape();

  fill(240);  
  beginShape(); // right eye
  curveVertex(map(x,0,width,181,241), map(y,0,height,137,167));
  curveVertex(map(x,0,width,206,265), map(y,0,height,116,168));
  curveVertex(map(x,0,width,237,284), map(y,0,height,141,163));
  curveVertex(map(x,0,width,211,264), map(y,0,height,133,184));
  curveVertex(map(x,0,width,181,241), map(y,0,height,137,167));
  curveVertex(map(x,0,width,206,265), map(y,0,height,116,168));
  curveVertex(map(x,0,width,237,284), map(y,0,height,141,163));
  endShape();

  beginShape(); // left eye
  curveVertex(map(x,0,width,111,160), map(y,0,height,141,164));
  curveVertex(map(x,0,width,134,187), map(y,0,height,114,168));
  curveVertex(map(x,0,width,156,212), map(y,0,height,137,167));
  curveVertex(map(x,0,width,132,185), map(y,0,height,132,185));
  curveVertex(map(x,0,width,111,160), map(y,0,height,141,164));
  curveVertex(map(x,0,width,134,187), map(y,0,height,114,168));
  curveVertex(map(x,0,width,156,212), map(y,0,height,137,167));
  endShape();
  
  fill(95,197,242); // irises
  ellipse(map(x,0,width,203,266), map(y,0,height,125,175), 14, 14);
  ellipse(map(x,0,width,132,190), map(y,0,height,123,176), 14, 14);
  
  fill(31,61,42); 
  beginShape(); // right eyebrow
  curveVertex(map(x,0,width,185,242), map(y,0,height,93,158));
  curveVertex(map(x,0,width,214,267), map(y,0,height,101,146));
  curveVertex(map(x,0,width,241,286), map(y,0,height,126,142));
  curveVertex(map(x,0,width,213,265), map(y,0,height,102,150));
  curveVertex(map(x,0,width,185,242), map(y,0,height,93,158));
  curveVertex(map(x,0,width,214,267), map(y,0,height,101,146));
  curveVertex(map(x,0,width,241,286), map(y,0,height,126,142));
  endShape();

  beginShape(); // left eyebrow
  curveVertex(map(x,0,width,110,157), map(y,0,height,118,146));
  curveVertex(map(x,0,width,134,185), map(y,0,height,99,146));
  curveVertex(map(x,0,width,155,207), map(y,0,height,93,157));
  curveVertex(map(x,0,width,135,182), map(y,0,height,101,149));
  curveVertex(map(x,0,width,110,157), map(y,0,height,118,146));
  curveVertex(map(x,0,width,134,185), map(y,0,height,99,146));
  curveVertex(map(x,0,width,155,207), map(y,0,height,93,157));
  endShape();

  fill(224,196,170); noStroke(); 
  beginShape(); // nose
  curveVertex(map(x,0,width,150,247), map(y,0,height,173,229)); 
  curveVertex(map(x,0,width,178,256), map(y,0,height,188,234));
  curveVertex(map(x,0,width,144,216), map(y,0,height,188,235));
  curveVertex(map(x,0,width,150,247), map(y,0,height,173,229));
  curveVertex(map(x,0,width,178,256), map(y,0,height,188,234));
  curveVertex(map(x,0,width,144,216), map(y,0,height,188,235));
  endShape();

//  fill(252,226,201);   
//  ellipse(map(x,0,width,150,247), map(y,0,height,164,220),16,16);
//  if (x<(width/2)) {
//    line(map(x,0,width,144,216), map(y,0,height,188,235),map(x,0,width,164,229), map(y,0,height,140,170)); 
//  } else {
//    line(map(x,0,width,178,256), map(y,0,height,188,234),map(x,0,width,164,235), map(y,0,height,140,170)); 
//  }

  fill(149,59,69); //strokeWeight(4); 
  //stroke(234,109,109);
  stroke(0);
  beginShape(); // mouth
  curveVertex(map(x,0,width,139,207), map(y,0,height,212,262));
  curveVertex(map(x,0,width,166,237), map(y,0,height,208,255));
  curveVertex(map(x,0,width,195,261), map(y,0,height,212,262));
  curveVertex(map(x,0,width,165,237), map(y,0,height,231,256));
  curveVertex(map(x,0,width,139,207), map(y,0,height,212,262));
  curveVertex(map(x,0,width,166,237), map(y,0,height,208,255));
  curveVertex(map(x,0,width,195,261), map(y,0,height,212,262));
  endShape();

  if (y<390) {stroke(255);} else {stroke(0);} // fluttery bug
  //strokeWeight(2);
  for (int j = 0; j < 6; j++) {
    int x1 = x + int(random(-15,15));
    int x2 = x + int(random(-15,15));
    int y1 = y + int(random(-15,15));
    int y2 = y + int(random(-15,15));
    line(x1,y1,x2,y2);
  }
  x = x + xspeed; y = y + yspeed;
  if (x >392) {
    if (y > 390) {
      xspeed = -2; yspeed = -3;
    } else {
      xspeed = -3;
    }
  }
  if (y < 7)  {yspeed = 2;}
  if (x < 7) {xspeed = 2;}
  if (y > 393) {
    y = 393; yspeed = 0;
    if (x<200) {
      xspeed = 4;
    } else {xspeed = -4;}
  }
  if (x < 7 && y> 390) {xspeed = 2; yspeed = -4;}
  if (int(random(6))<1 && y < 390) {
    xspeed = xspeed + int(random(-2,2));
    yspeed = yspeed + int(random(-2,2));
  }
}


