
// My approximation of Blend Morphs, a feature of  
// Anime Studio Pro.
// -- Steve Tiffany, 2012

void setup()
{
  size(400,400);
  smooth();
  strokeWeight(2);
  //stroke(100,0,0);
  stroke(0);
  ellipseMode(CENTER);
}

void draw() {
  // For how-to information, go down to where the nose is drawn.
  background(255);
  int x = mouseX; int y = mouseY;
  fill(234,206,180);   
  beginShape(); // body
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
  curveVertex(map(x,0,width,130,133), map(y,0,height,62,73));
  curveVertex(map(x,0,width,258,258), map(y,0,height,55,63));
  curveVertex(map(x,0,width,283,288), map(y,0,height,205,206));
  curveVertex(map(x,0,width,166,238), map(y,0,height,277,300));
  curveVertex(map(x,0,width,111,116), map(y,0,height,211,217));
  curveVertex(map(x,0,width,130,133), map(y,0,height,62,73));
  curveVertex(map(x,0,width,258,258), map(y,0,height,55,63));
  curveVertex(map(x,0,width,283,288), map(y,0,height,205,206));
  endShape();

  fill(240);  
  beginShape(); // right eye
  curveVertex(map(x,0,width,181,241), map(y,0,height,137,167));
  curveVertex(map(x,0,width,206,265), map(y,0,height,114,168));
  curveVertex(map(x,0,width,237,284), map(y,0,height,141,163));
  curveVertex(map(x,0,width,211,264), map(y,0,height,133,185));
  curveVertex(map(x,0,width,181,241), map(y,0,height,137,167));
  curveVertex(map(x,0,width,206,265), map(y,0,height,114,168));
  curveVertex(map(x,0,width,237,284), map(y,0,height,141,163));
  endShape();

  beginShape(); // left eye
  curveVertex(map(x,0,width,111,160), map(y,0,height,141,164));
  curveVertex(map(x,0,width,136,187), map(y,0,height,112,167));
  curveVertex(map(x,0,width,156,212), map(y,0,height,137,167));
  curveVertex(map(x,0,width,132,184), map(y,0,height,132,187));
  curveVertex(map(x,0,width,111,160), map(y,0,height,141,164));
  curveVertex(map(x,0,width,136,187), map(y,0,height,112,167));
  curveVertex(map(x,0,width,156,212), map(y,0,height,137,167));
  endShape();
  
  fill(115,217,252); // irises
  ellipse(map(x,0,width,203,266), map(y,0,height,125,175), 10, 10);
  ellipse(map(x,0,width,132,190), map(y,0,height,123,176), 10, 10);

// How to do it:  Make four drawings for each facial feature, one all the way left, 
// one all the way right, one all the way up, one all the way down.  Vertices must 
// be in the same relative position in each drawing.  These become a reference.
// Within the new curveVertex line, combine leftmost point, rightmost point in the 
// x side map(), and highest point, lowest point in the y side map(), as done below.

//  beginShape();  // nose all the way left 
//  curveVertex(165, 204); // use 165 for first vertex number in the x map()
//  curveVertex(178, 218); 
//  curveVertex(144, 217); 
//  curveVertex(165, 204); 
//  curveVertex(178, 218);
//  curveVertex(144, 217);
//  endShape();
//  beginShape(); // nose all the way right
//  curveVertex(237, 208); // use 237 for second vertex number in the x map()
//  curveVertex(256, 221);
//  curveVertex(216, 222);
//  curveVertex(237, 208);
//  curveVertex(256, 221);
//  curveVertex(216, 222);
//  endShape();
//  beginShape(); // nose up
//  curveVertex(200, 183); // use 183 for first vertex number in the y map()
//  curveVertex(220, 198);
//  curveVertex(181, 198);
//  curveVertex(200, 183);
//  curveVertex(220, 198);
//  curveVertex(181, 198);
//  endShape();
//  beginShape(); // nose down
//  curveVertex(203, 229); // use 229 for second vertex number in the y map()
//  curveVertex(221, 234); // Follow same pattern for next two lines.
//  curveVertex(184, 235); // Last three lines are identical to first three lines. 
//  curveVertex(203, 229);
//  curveVertex(221, 234);
//  curveVertex(184, 235);
//  endShape();

  fill(234,206,180); noStroke(); 
  beginShape(); // nose
  curveVertex(map(x,0,width,165,237), map(y,0,height,183,229)); // numbers go here
  curveVertex(map(x,0,width,178,256), map(y,0,height,198,234));
  curveVertex(map(x,0,width,144,216), map(y,0,height,198,235));
  // last three lines are always the same as the first three...
  curveVertex(map(x,0,width,165,237), map(y,0,height,183,229));
  curveVertex(map(x,0,width,178,256), map(y,0,height,198,234));
  curveVertex(map(x,0,width,144,216), map(y,0,height,198,235));
  endShape();

  fill(149,59,69); stroke(0);
  beginShape(); // mouth
  curveVertex(map(x,0,width,136,207), map(y,0,height,226,272));
  curveVertex(map(x,0,width,165,236), map(y,0,height,230,254));
  curveVertex(map(x,0,width,190,265), map(y,0,height,223,272));
  curveVertex(map(x,0,width,165,237), map(y,0,height,245,268));
  curveVertex(map(x,0,width,136,207), map(y,0,height,226,272));
  curveVertex(map(x,0,width,165,236), map(y,0,height,230,254));
  curveVertex(map(x,0,width,190,265), map(y,0,height,223,272));
  endShape();
}

