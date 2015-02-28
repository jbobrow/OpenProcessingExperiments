
// Clown Puppet
// Steve Tiffany, 2012

int x, y;

void setup() {
  size(400,400);
  smooth();
  noCursor();
}

void draw() {
  background(255);
  x = mouseX; y = mouseY; 
  // With no visible cursor it was too easy to jump the window
  // edges, so now only the center 200x200 pixels are used as the 
  // control zone.  
  if (y<100) {y = 100;}
  //if (y>300) {y = 300;} // let mouth open past original extreme
  if (x<100) {x = 100;}
  if (x>300) {x = 300;}
  strokeWeight(2); stroke(0);
  fill(39,149,242);
  
  // Made with Blend Morph Coder, modified for reduced 
  // area of control zone:
  beginShape(); // hair
  curveVertex(map(x,100,300,120,277), map(y,100,300,253,256));
  curveVertex(map(x,100,300,65,122), map(y,100,300,268,285));
  curveVertex(map(x,100,300,57,121), map(y,100,300,211,231));
  curveVertex(map(x,100,300,40,73), map(y,100,300,174,193));
  curveVertex(map(x,100,300,65,116), map(y,100,300,124,137));
  curveVertex(map(x,100,300,42,78), map(y,100,300,83,96));
  curveVertex(map(x,100,300,72,142), map(y,100,300,56,64));
  curveVertex(map(x,100,300,58,149), map(y,100,300,12,24));
  curveVertex(map(x,100,300,96,197), map(y,100,300,27,36));
  curveVertex(map(x,100,300,120,238), map(y,100,300,6,12));
  curveVertex(map(x,100,300,147,260), map(y,100,300,20,28));
  curveVertex(map(x,100,300,194,315), map(y,100,300,4,10));
  curveVertex(map(x,100,300,203,311), map(y,100,300,26,38));
  curveVertex(map(x,100,300,274,338), map(y,100,300,8,14));
  curveVertex(map(x,100,300,267,331), map(y,100,300,51,59));
  curveVertex(map(x,100,300,326,356), map(y,100,300,69,79));
  curveVertex(map(x,100,300,302,345), map(y,100,300,118,134));
  curveVertex(map(x,100,300,342,366), map(y,100,300,159,171));
  curveVertex(map(x,100,300,289,356), map(y,100,300,218,230));//
  curveVertex(map(x,100,300,298,351), map(y,100,300,266,282));
  curveVertex(map(x,100,300,120,277), map(y,100,300,253,256));
  curveVertex(map(x,100,300,65,122), map(y,100,300,268,285));
  curveVertex(map(x,100,300,57,121), map(y,100,300,211,231));
  endShape();

  fill(250,214,114);
  beginShape(); // neck
  curveVertex(map(x,100,300,146,180), map(y,100,300,276,297));
  curveVertex(map(x,100,300,143,197), map(y,100,300,189,193));
  curveVertex(map(x,100,300,211,265), map(y,100,300,190,197));
  curveVertex(map(x,100,300,229,258), map(y,100,300,307,292));
  curveVertex(map(x,100,300,237,253), map(y,100,300,319,335));
  curveVertex(map(x,100,300,157,184), map(y,100,300,322,334));
  curveVertex(map(x,100,300,146,180), map(y,100,300,276,297));
  curveVertex(map(x,100,300,143,197), map(y,100,300,189,193));
  curveVertex(map(x,100,300,211,265), map(y,100,300,190,197));
  endShape();

  fill(220,227,37);
  beginShape(); // shoulders
  curveVertex(map(x,100,300,114,112), map(y,100,300,436,451));
  curveVertex(map(x,100,300,73,89), map(y,100,300,292,299));
  curveVertex(map(x,100,300,220,224), map(y,100,300,331,339));
  curveVertex(map(x,100,300,310,324), map(y,100,300,295,310));
  curveVertex(map(x,100,300,297,285), map(y,100,300,425,447));
  curveVertex(map(x,100,300,114,112), map(y,100,300,436,451));
  curveVertex(map(x,100,300,73,89), map(y,100,300,292,299));
  curveVertex(map(x,100,300,220,182), map(y,100,300,331,339));
  endShape();

  fill(227,48,16);
  beginShape(); // bowtie
  curveVertex(map(x,100,300,122,174), map(y,100,300,284,303));
  curveVertex(map(x,100,300,251,286), map(y,100,300,358,371));
  curveVertex(map(x,100,300,246,294), map(y,100,300,283,298));
  curveVertex(map(x,100,300,128,161), map(y,100,300,363,375));
  curveVertex(map(x,100,300,122,174), map(y,100,300,284,303));
  curveVertex(map(x,100,300,251,286), map(y,100,300,358,371));
  curveVertex(map(x,100,300,246,294), map(y,100,300,283,298));
  endShape();

  fill(237,58,26);
  beginShape(); // bowtie knot
  curveVertex(map(x,100,300,170,224), map(y,100,300,308,327));
  curveVertex(map(x,100,300,208,255), map(y,100,300,309,324));
  curveVertex(map(x,100,300,211,256), map(y,100,300,332,352));
  curveVertex(map(x,100,300,175,220), map(y,100,300,336,352));
  curveVertex(map(x,100,300,170,224), map(y,100,300,308,327));
  curveVertex(map(x,100,300,208,255), map(y,100,300,309,324));
  curveVertex(map(x,100,300,211,256), map(y,100,300,332,352));
  endShape();

  fill(255,224,124);
  beginShape(); // face
  curveVertex(map(x,100,300,83,172), map(y,100,300,74,81));
  curveVertex(map(x,100,300,144,263), map(y,100,300,38,48));
  curveVertex(map(x,100,300,235,329), map(y,100,300,80,92));
  curveVertex(map(x,100,300,259,331), map(y,100,300,140,140));
  curveVertex(map(x,100,300,252,347), map(y,100,300,235,242));
  curveVertex(map(x,100,300,128,293), map(y,100,300,281,349));
  curveVertex(map(x,100,300,69,164), map(y,100,300,229,244));
  curveVertex(map(x,100,300,79,159), map(y,100,300,139,139));
  curveVertex(map(x,100,300,83,172), map(y,100,300,74,81));
  curveVertex(map(x,100,300,144,263), map(y,100,300,38,48));
  curveVertex(map(x,100,300,235,329), map(y,100,300,80,92));
  endShape();

  fill(240); strokeWeight(4); stroke(237,58,26);
  beginShape(); // left eye
  curveVertex(map(x,100,300,78,202), map(y,100,300,146,159));
  curveVertex(map(x,100,300,98,234), map(y,100,300,129,135));
  curveVertex(map(x,100,300,114,269), map(y,100,300,148,161));
  curveVertex(map(x,100,300,93,235), map(y,100,300,170,182));
  curveVertex(map(x,100,300,78,202), map(y,100,300,146,159));
  curveVertex(map(x,100,300,98,234), map(y,100,300,129,135));
  curveVertex(map(x,100,300,114,269), map(y,100,300,148,161));
  endShape();

  beginShape(); // right eye
  curveVertex(map(x,100,300,158,299), map(y,100,300,149,161));
  curveVertex(map(x,100,300,188,314), map(y,100,300,132,138));
  curveVertex(map(x,100,300,223,335), map(y,100,300,151,161));
  curveVertex(map(x,100,300,187,321), map(y,100,300,173,185));
  curveVertex(map(x,100,300,158,299), map(y,100,300,149,161));
  curveVertex(map(x,100,300,188,314), map(y,100,300,132,138));
  curveVertex(map(x,100,300,223,335), map(y,100,300,151,161));
  endShape();

  strokeWeight(2); stroke(0);
  fill(237,58,26);
  beginShape(); // nose
  curveVertex(map(x,100,300,83,278), map(y,100,300,198,205));
  curveVertex(map(x,100,300,126,295), map(y,100,300,166,178));
  curveVertex(map(x,100,300,150,338), map(y,100,300,198,205));
  curveVertex(map(x,100,300,134,298), map(y,100,300,206,218));
  curveVertex(map(x,100,300,83,278), map(y,100,300,198,205));
  curveVertex(map(x,100,300,126,295), map(y,100,300,166,178));
  curveVertex(map(x,100,300,150,338), map(y,100,300,198,205));
  endShape();

  beginShape(); // lips
  curveVertex(map(x,100,300,89,236), map(y,100,300,231,241));
  curveVertex(map(x,100,300,109,271), map(y,100,300,218,228));
  curveVertex(map(x,100,300,125,291), map(y,100,300,230,235));
  curveVertex(map(x,100,300,145,307), map(y,100,300,221,227));
  curveVertex(map(x,100,300,181,329), map(y,100,300,232,243));
  curveVertex(map(x,100,300,125,292), map(y,100,300,249,321));
  curveVertex(map(x,100,300,89,236), map(y,100,300,231,241));
  curveVertex(map(x,100,300,109,271), map(y,100,300,218,228));
  curveVertex(map(x,100,300,125,291), map(y,100,300,230,235));
  endShape();

  fill(108,41,30);
  beginShape(); // mouth
  curveVertex(map(x,100,300,94,243), map(y,100,300,231,243));
  curveVertex(map(x,100,300,123,290), map(y,100,300,235,244));
  curveVertex(map(x,100,300,176,324), map(y,100,300,233,243));
  curveVertex(map(x,100,300,122,292), map(y,100,300,235,303));
  curveVertex(map(x,100,300,94,243), map(y,100,300,231,243));
  curveVertex(map(x,100,300,123,290), map(y,100,300,235,244));
  curveVertex(map(x,100,300,176,324), map(y,100,300,233,243));
  endShape();

  fill(38,129,242);
  beginShape(); // left pupil
  curveVertex(map(x,100,300,94,223), map(y,100,300,148,157));
  curveVertex(map(x,100,300,102,237), map(y,100,300,138,147));
  curveVertex(map(x,100,300,111,250), map(y,100,300,149,157));
  curveVertex(map(x,100,300,103,238), map(y,100,300,158,171));
  curveVertex(map(x,100,300,94,223), map(y,100,300,148,157));
  curveVertex(map(x,100,300,102,237), map(y,100,300,138,147));
  curveVertex(map(x,100,300,111,250), map(y,100,300,149,157));
  endShape();

  beginShape(); // right pupil
  curveVertex(map(x,100,300,176,302), map(y,100,300,150,161));
  curveVertex(map(x,100,300,188,314), map(y,100,300,140,150));
  curveVertex(map(x,100,300,200,323), map(y,100,300,150,163));
  curveVertex(map(x,100,300,187,312), map(y,100,300,160,173));
  curveVertex(map(x,100,300,176,302), map(y,100,300,150,161));
  curveVertex(map(x,100,300,188,314), map(y,100,300,140,150));
  curveVertex(map(x,100,300,200,323), map(y,100,300,150,163));
  endShape();

  fill(39,149,242);
  beginShape(); // left eyebrow
  curveVertex(map(x,100,300,71,189), map(y,100,300,117,128));
  curveVertex(map(x,100,300,114,254), map(y,100,300,109,116));
  curveVertex(map(x,100,300,103,226), map(y,100,300,94,103));
  curveVertex(map(x,100,300,71,189), map(y,100,300,117,128));
  curveVertex(map(x,100,300,114,254), map(y,100,300,109,116));
  curveVertex(map(x,100,300,103,226), map(y,100,300,94,103));
  endShape();

  beginShape(); // right eyebrow
  curveVertex(map(x,100,300,162,291), map(y,100,300,111,118));
  curveVertex(map(x,100,300,186,310), map(y,100,300,95,105));
  curveVertex(map(x,100,300,241,341), map(y,100,300,117,130));
  curveVertex(map(x,100,300,162,291), map(y,100,300,111,118));
  curveVertex(map(x,100,300,186,310), map(y,100,300,95,105));
  curveVertex(map(x,100,300,241,341), map(y,100,300,117,130));
  endShape();
}


