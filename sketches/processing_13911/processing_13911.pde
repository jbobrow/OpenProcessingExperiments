
//////////////////////////////////////////////////
//////////////////////////////////////////////////
// occilate between symmetrical and asymmetrical 
// drawing generation with mouseY and mouseX, as
// well as dragging a control point to different
// quadrants of a square. Press any key to restart
// drawing. 
// indebted to fractal baton sketch, found at
// http://www.openprocessing.org/visuals/?visualID=12418






//////////////////////////////////////////////////
//////////////////////////////LOOPY DRAW VARIABLES
float speed = 0.003;
float r = 3.5;
float branchLength = 10;
int numBranches = 3;
int xpos = width;
color lineColor = 0x11FF00FF;
int smEllipseD = 2;

//////////////////////////////////////////////////
///////////////////////////BOX CONTROLLER VARIABLES
int ellX = 60;
int ellY = 60;
int ellD = 10;
boolean shapeIsDragged = false;

///////////////////////////////////////////////////
/////////////////////////////////////////BASIC SETUP
void setup()
{
  size(1000,800);
  int xpos = width;
  smooth();
  background(#ffff00);
}
 
void draw()
{

////////////////////////////////////////////////////
///////////////////////////////// BEG BOX CONTROLLER 

  //CONSTRAIN DOT WITHIN BOX
  int contEllX = constrain(ellX, 20, 100);
  int contEllY = constrain(ellY, 20, 100);

  // IF DOT ON LEFT OR RIGHT
  if (contEllX < 55){
    branchLength = 200;
    smEllipseD = 1;
    color lineColor = 0x22ffff00;
//  println(hex(lineColor));
    stroke(lineColor);
  }else if(contEllX > 55){
    branchLength = 100;
    smEllipseD = 3;
    color lineColor = 0x22ff00ff;
//  println(hex(lineColor));
    stroke(lineColor);
  }
  // IF POINT ON TOP OR BOTOOM
  if (contEllY <= 55){
    numBranches = 3;
    }else if(contEllY > 55){
      numBranches = 4;
  }
    
  // DRAW CONTROLLER BOX
  rectMode(CORNER);
  noStroke();
  fill(#dddd00);
  rect(10, 10, 100, 100);
  // DRAW CROSSHAIRS
  stroke(#ffff00);
  strokeWeight(3);
  line(59, 10, 59, 110);
  line(10, 59, 110, 59);
  
  // CONTROLLER POINT
  // CHANGE CONTROLLER POINT BASED ON MOUSE STATE
  noStroke();
  if(shapeIsDragged){
    fill(#FF00FF);
  } else {
    fill(#ffff00);
  }
  // DRAW CONTROLLER POINT
  rectMode(CENTER);
  rect(contEllX, contEllY, ellD, ellD);
  
/////////////////////////////////////////////////////  
///////////////////////////////////END BOX CONTROLLER
  
// LOOPY DRAW
  fractal(width/2, 550, -PI, numBranches);
  r += speed;

/////////////////////////////////////////////////////
///////////////////////////////////////// CLEAR SLATE
if (keyPressed == true){
background(#ffff00);
}
  
}

/////////////////////////////////////////////////////
///////////////////////////////// LOOPY DRAW FUNCTION
void fractal(float x, float y, float a, int c){
  int dia = int(random(1, 3));
  float nx = x + branchLength  * sin(a);
  float ny = y + branchLength  * cos(a);
  
  if (c >= 1 && c != 6) {
    strokeWeight(.5);
    stroke(lineColor);
    line(x, y, nx, ny);
  }
  if (c < numBranches) {
    ////// BIG ELLIPSE
    // INCREASE ELLIPSE DIAMETER BASED ON MOUSE_X
    if (mouseY > 400){
      stroke(0x22000000);
    } else {
      stroke(0xccffff00);
    }
    noFill();
    ellipse(x, y, mouseX/10, mouseX/10);
    noStroke();
    // SMALL ELLIPSE
       if (mouseY > 500){
         fill(0xff000000);
       } else {
         stroke(0xffffff00);
    }
    fill(#000000);
    ellipse(x, y, smEllipseD, smEllipseD);
  }
  if (c > 0) {
    fractal(nx, ny, (a + r / 2) * -2, c - 1);
    fractal(nx, ny, (a - r / 4) * -4, c - 1);
  }
}

///////////////////////////////////////////////////////
///////////////////////////////////CONTROLLER FUNCTIONS
void mousePressed(){
  if((mouseX >= ellX) && (mouseX < ellX + ellD) && (mouseY >= ellY) && (mouseY < ellY + ellD)){
    // SET TO TRUE
    shapeIsDragged = true;
  }
}
void mouseReleased(){
  // SET TO FALSE
  shapeIsDragged = false;
}

void mouseDragged(){
  // IF DRAGGED, NEW CONTROL POINT X and Y
    if(shapeIsDragged){
      // CENTER POINT
      ellX = mouseX - ellD/2;
      ellY = mouseY - ellD/2;
    }
}


