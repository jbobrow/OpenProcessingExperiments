
// Xmas Tree Fractal
// -------------- //
// @paulsobrien

// vars
int r = 10;
int g =88;
int b = 30;
int _width = 400;
int _height = 400;
float theta = 0.018f;
float amplitude = 120.0f;
float treeTheta = 0.02f;
float ty;

// ----------------- //
//       SETUP
// ------------------//
void setup()
{
  size(_width, _height);
  background(r,g,b);
  frameRate(12);
  smooth(1);
  strokeWeight(1);
  stroke(0, 0, 0, 0);
  noStroke();
}

// ----------------- //
//       DRAW
// ------------------//
void draw()
{
 background(r,g,b);
 fill(118,92,18);
 rect((_width/2f)-14f, _height-100f, 28, 55, 12);
 // tree position
 translate(_width/2f, _height/3f);
 //start tree
 xmasTree(0,0);                   
 translate(0,0);
 // grow tree branches
 branchTree(_width/12f,_height/9f);
 translate(0, -38f);
 // add star
 oneStar(0, 0, 33, 14, 222, 222, 0, 255);
 oneStar(0, 0, 22, 7, 222, 33, 12, 128);
 translate(0,0);
}


// ----------------- //
//       TREE
// ------------------//

void branchTree( float w, float h )
{
  h *= 0.85f;              // decrease branches
 if (h > _height/32)       // exit condition
 {
    // Right side
    fill(111,222,111,44);
    pushMatrix();             
      rotate(treeTheta);           
      xmasTree(w/2f,h);         
      translate(w/2f,h);       
      branchTree(w,h);   
    popMatrix();                 
    
    // Left side
    fill(111,222,111,44);
    pushMatrix();
      rotate(-treeTheta);
      xmasTree(-w/2f,h);
      translate(-w/2f,h);
      branchTree(w,h);
    popMatrix();
  }
  noStroke();
  
  // decorate the tree!
  fill(random(111,166),222,random(0,255), 222);  // candle sticks
  ellipse(0,-8, random(4,0), 12);                // glow effect
  
  fill(255,55,0, 128);                           // candle flame
  ellipse(0,-16, random(1,11), 20);              // random flickers on draw()
}

// tree shapes
void xmasTree(float w, float h)
{ 
 // chunky green
 fill(11,66,33,222);
 stroke(11,88,33,222);
 strokeWeight(3);
 // stick branches
 beginShape(LINES);       
  vertex(w, h);
  vertex( 0,-33);
 endShape();
 // spikey pine needles
 stroke(11,200,0, 88);   
 strokeWeight(10);
 beginShape(TRIANGLES);
   vertex(w/2f, -h);
   vertex(0, 0);
   vertex(w,-19);
 endShape();
 beginShape(TRIANGLES);
   vertex(w/2f, h/2f);
   vertex(0, 0);
   vertex(w, -19f);
 endShape();
}

// star
void oneStar(float x, float y, float outersize, float innersize, int r, int g, int b, int a)
{
 float angle = TWO_PI/5f;                          
 float half = angle/2f; 
 noStroke();  
 fill(r,g,b,a);
  beginShape();
  for ( float theta = 0f; theta < TWO_PI; theta = angle + theta )
   {
     vertex(x + cos(theta) * outersize,  y + sin(theta) * outersize);
     vertex(x + cos(theta + half) * innersize,  y + sin(theta + half) * innersize);
   }
   endShape(CLOSE);
}
