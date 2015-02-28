
int branchNum = 10;               // number of root branches (generating from main trunk)
ArrayList branches;               // for holding branches objects
boolean FADE = false;             // tell whether to fade or not
boolean TREE_DRAWN = false;       // test if whole tree is drawn
int pix[];                        // array to hold pixel colors for redrawing 
float wind;                       // decide horizontal movement of falling flowers
boolean AUTUMN = false;           // tells if falling has started
boolean FIRST_FALL = true;        // tells if left mouse is already clicked once or not
int flrDensity;                   // decide how many flowers to fall (decrease with each click)
String mode = "singleColor";      // which type of tree to draw

//================================================================================================

void setup()
{
  size(800,600,P3D);
  smooth();
  colorMode(HSB);  
  background(255);
  pix = new int[width*height];  
  reset();
}

//================================================================================================

void draw()
{
  int branchesGrowing = 0;  // counts number of branches left in arraylist  

  // checks if autumn is goin on and tree is already completed and than draw tree again
  if(TREE_DRAWN == true && AUTUMN == true && !mode.equals("crying")) {
    wind = constrain(wind, -.9, .9); 
    wind += map(mouseX - (width/2), -width, width, -.09, .09);
    reload();
  }

  // responsible for drawing tree and for drawing falling leaves
  for (int i = 0 ; i<branches.size() ; i++)
  {
    Branch branch = (Branch) branches.get(i);
    if(branch.GROWING) {
      branchesGrowing++;
      branch.draw();
      branch.calculate();      
      if (random(100)>96) branches.add(new Branch(branch)); // 4% chances of generating a sub-branch during this loop
    }
    else if(branch.DROPPING) { 
      branch.shake(wind);
    }
  }

  //enter this block only once after whole tree is drawn and before autumn
  if(branchesGrowing == 0 && !TREE_DRAWN) {
    TREE_DRAWN = true;
    flrDensity = branches.size()/8;
  }
}

//======================================================================================================

/* draw a rectangle of white color of screen size whose
 transperency is equal to the argument passed in */
void fade(int trans)
{
  noStroke();
  fill(100,trans);
  rect(0,0,width,height);
}

//=======================================================================================================

void reset()
{
  /* test whether to fade previous screen or remove it */
  TREE_DRAWN = false;
  if (FADE) fade(60);
  else if (!FADE) background(255);

  /* adding Branchs objects to an array*/
  branches = new ArrayList();
  for (int i = 0 ; i<branchNum ; i++)
    branches.add(new Branch(mode));

  float MAX = height;

  /* setting MAX to minimum value of branch.pos.y of all Branch objects (but it is maximum
   value as per height is considered bcoz y decreases as height of a tree increases */
  for (int i = 0 ; i<branches.size() ; i++)
  {
    Branch branch = (Branch) branches.get(i); // downcasting to branch because array is returning Object type of object.
    if (branch.pos.y<MAX) MAX = branch.pos.y;
  }

  /* draw main trunk of the tree */
  stroke(0);
  fill(0);
  beginShape();
  vertex(width/2-5,height);
  vertex(width/2+5,height);
  vertex(width/2-1,MAX);
  vertex(width/2+1,MAX);
  endShape();
}

//=======================================================================================================================

void reload() {
  loadPixels();
  for (int k = 0; k < (width*height); k++) {
    pixels[k] = pix[k];
  }
  updatePixels();
}

//========================================================================================================================

void keyPressed()
{
  if (key=='p'||key=='P') println(branches.size());
  if (key=='f'||key=='F') FADE=!FADE;
  if (key=='s'||key=='S') {
    mode="singleColor";
    AUTUMN = false;
    FIRST_FALL = true;
    reset();
  }
  if (key=='m'||key=='M') {
    mode="multiColor";
    AUTUMN = false;
    FIRST_FALL = true;
    reset();
  }
}

//========================================================================================================================

void mousePressed()
{
  // restart new tree on right click
  if(mouseButton == RIGHT) {
    AUTUMN = false;
    FIRST_FALL = true;
    reset();
  }

  // starts autumn on left click
  if(mouseButton == LEFT) {       
    if(TREE_DRAWN) {
      AUTUMN = true;

      // save the whole tree only one time into an array after it is completely drawn
      if(FIRST_FALL) {
        for (int h = 0; h < height; h++) {
          for (int w = 0; w < width; w++) {
            color cp = get(w,h);
            pix[(width*h)+w] = cp;
          }
        }
        FIRST_FALL = false;
      }

      // randomly choose flowers to shed
      for(int j=0; j < flrDensity; j++) {
        int i = (int) random(0,branches.size());
        Branch branch = (Branch) branches.get(i);
        branch.DROPPING = true;
      }
      flrDensity = flrDensity/4; // reduce density of flowers to shed after every left click
    }
  }
}

//==============================================================================================================================


