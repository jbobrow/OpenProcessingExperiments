
//declare-&-initialise global parameters
  float X = 700; float Y = 450; //co-ordinates of the root of the tree
  float A0 = -PI/2; //direction of axis of the tree
  float V = PI/4.2; //angle subtended by all (N) branches
  int N = 4; //number of daughter-branches at each LVL
  float D = 80; //length of a branch
  float T = 10; //thickness
  int LVL = 5; //total number of (branching-)levels the tree shall have
  PVector F = new PVector(0, 0); //force
 
void setup() {
  size(1000,500);
  smooth();
  strokeCap(ROUND);
  /*textFont(loadFont("Sunya-11.vlw"),11);*/
}
 
void draw() {
  background(245);
  //declare-&-initialise local parameters
    float x = X;
    float y = Y; //co-ordinates of the base of a branch (when in a recursive loop)
    float a0 = A0; //direction of the axis of a branch (when in a recirsive loop)
    float v = $v(V,LVL); //angle subtended by all (n) branches
    int n = N; //number of daughter-branches at each lvl
    float d = branchLength(D); //length of a branch
    float t = branchThickness(T); //thickness
    int lvl = 1; //level we are currently at (to track our level/position in a recursive loop)
    PVector f = new PVector(F.x, F.y);
  //create world && worldly factors
    world();
  //compute force acting on the tree
    f.x += wind;
    f.y += gravity;
  //draw branch (and recursively: the tree)
    if (lvl<LVL)
      tree(x, y, a0, v, n, d, t, lvl, f);
  //show menu
    showMenu();
  if(keyPressed == true) if(key == 'p' || key == 'P') save("tree.png");
}
 
color treebrown = color(50,35,0);
 
void world() {
  //worldly factors
    factors_world();
  //sky
    fill(int( map ($rainfall.value,0,1,127,0) ), int( map ($rainfall.value,0,1,127,0) ), int( map($rainfall.value,0,1,127,255) ), 25);
    noStroke();
    rect(0, 0, width, height);
  //sun (at mousePosn)
    fill(255, 160, 0); noStroke();
    float dia = 200 - 200*max(abs(mouseX-X), abs(mouseY-Y))/width;
//    ellipse(mouseX, mouseY, dia, dia);
  //ground
    fill(0); noStroke();
    float rad = max(width,height);
    //ellipse(X, Y + rad, 2*rad, 2*rad);
    rect(0, Y, width, height-Y);
}
 
void tree(float x, float y, float a0, float v, int n, float d, float t, int lvl, PVector f) {
  pushMatrix();
  translate(x, y);
  rotate(a0);
  f = $rotate_f(f,a0);
  f = $f(f,lvl,d); //branches are thinner at higher lvl's.. the effect of a force on them is thus different.
  for (int i=0; i<n; i++) {
    if(n>1) a0 = (v/2) - (i*v/(n-1)); else break;
    x = d * cos(a0) + f.x;
    y = d * sin(a0) + f.y;
    //draw this branch:
      strokeWeight(t); stroke(0); strokeCap(PROJECT); noFill();
      line(0, 0, x, y);
    //draw foliage:
      if(lvl>1)
        foliage(x, y, t, lvl);
    //recurse for daughter branches:
      if(lvl<LVL)
        tree(x, y, a0, $v(v,lvl), $n(n), d*$D, t*$T, lvl+1, f);
  }
  //to show force, f —> strokeWeight(t+1); stroke(255,0,0); line(0, 0, f.x, f.y);
  popMatrix();
}
 
//incomplete. this function should help change the number of branches at any point, thus making the tree behave much more organically.
int $n(int n) {
  return n;
}
 
//ensure that force continues to act in the same direction as before, irrespective of rotation (a0)
PVector $rotate_f(PVector f, float a0) {
  PVector f2 = new PVector(f.x, f.y);
  f2.x = f.x * cos(a0) + f.y * sin(a0);
  f2.y = f.y * cos(a0) - f.x * sin(a0);
  return f2;
}

//color menublue  = color(25,155,255);
//color menubrown = color(175,75,25);
//color menugreen = color(125,175,0);
color defaultMenuColour = color(127);
 
int boxHeight = 35;
int boxWidth = 275;
int barHeight = 15;
float barWidth = 100; //needs to be "float", i.e., the same type as Menu.value, so that when value is calculated under Menu.use(), it is a float. if barWidth is an int, then value will be calculated as an int, and (being a fraction bewtttn 0-1), value gets rounded off to 0.
int barLeft = 25;
int barRight = barLeft + int(barWidth);
int boxAndBarGap = (boxHeight-barHeight)/2;
 
class Menu {
  String factorName;
  int index;
  float value;
  float boxTop, barTop, barBottom;
  float barPos;
  color menuColour;
   
  Menu(int _index, String _factorName, float _defaultValue) {
    factorName = _factorName;
    index = _index;
    value = _defaultValue; //random(.33,.75);
    menuColour = defaultMenuColour;
  }
   
  void show() {
    boxTop = index * boxHeight;
    barTop = boxTop + boxAndBarGap;
    barBottom = barTop + barHeight;
    barPos = value * barWidth;
    //box
      fill(0);
      noStroke();
      rect(0, boxTop, boxWidth, boxHeight);
    //bar (underlying)
      fill(menuColour,63);
      noStroke();
      rect(barLeft, barTop, barWidth, barHeight);
    //bar (value|bar)
      fill(menuColour);
      noStroke();
      rect(barLeft, barTop, barPos, barHeight);
    //text
      fill(menuColour);
      noStroke();
      text(factorName, 25+barWidth+25, barTop+1, boxWidth-(25+barWidth+25)-25, barHeight);
    //thin line
      noFill();
      stroke(skyColour);  strokeWeight(.5); strokeCap(SQUARE);
      line(0, boxTop, boxWidth, boxTop);
  }
   
  void use() {
    if( (mouseX>=barLeft) && (mouseX<=barRight) && (mouseY>=barTop) && (mouseY<=barBottom) ) {
      value = ((mouseX-barLeft)/barWidth);
      menuColour = color(255);
      println(factorName + " = " + int(value*100)/100.00);
    }
    else menuColour = defaultMenuColour;
  }
}

void foliage(float x, float y, float t, int lvl) { //we are located at the base of the branch, and want to leafy-fy it upto its tip @(x,y)
  //leaf colour
    float opacity = 255 * map((lvl/LVL),0,1,0.5,1) * map($leafDensity.value,0,1,0.5,1);
    stroke(0,opacity); strokeWeight($leafSize.value);
    color leafRed = int( 200 * map($rainfall.value,0,1,1,0) );
    color leafGreen = int( 100 * random(.80,1.2) );
    color leafBlue = 0;
    fill(leafRed, leafGreen, leafBlue, opacity);
  //leaf size
    float scaleFactor = (lvl*1.00/LVL*1.00) * $leafSize.value * map($treeSize.value,0,1,0.5,2) * map(abs(map($windSpeed.value,0,1,-1,1)),0,1,1,0.75) * map($rainfall.value,0,1,0.75,1.5);
  //to draw leaves along the branch:
  pushMatrix();
  float angle = atan2(y,x); //calculate the angle of the branch (we do not take a0, since f.x and f.y had changed x&y after they were calculated using a0)
  rotate(angle); //the x-axis now runs along the dir of the branch
  float d = mag(x,y); //calculate the length of the branch
  for(float i=d; i>0; ) {
    pushMatrix();
    translate(i, random(-t/2,+t/2));
    rotate(random(-PI/3, +PI/3));
    //draw leaf
      ellipseMode(CENTER);
      ellipse(0, 0, 20*scaleFactor, 8*scaleFactor);
      line(-20*scaleFactor/2,0,+20*scaleFactor/2,0);
    popMatrix();
    i = i - (10 * (LVL/lvl) * (map($leafDensity.value,0,1,1.25,.1)));
  }
  popMatrix();
}
 
float branchLength(float D) {
   return D * map($treeSize.value,0,1,0.75,1.75);
}
 
float branchThickness(float T) {
   return T * map($treeSize.value,0,1,0.5,1.5) * map($treeBulk.value,0,1,0.5,2);
}
 
float $v(float v, int lvl) {
  v = v * map($branchSpread.value,0,1,1,2) * map(lvl,0,LVL,1,.5); //the 'lvl' parameter ensures that, at lower levels, the tree's branches open-up (spread) a bit more quickly. at higher lvl's, the branches are already quite dialated, and further dialated by forces, so it is fine if this $v() function makes a lesser effort to spread them out.
  return(min(v,PI));
}
 
PVector $f(PVector f, int lvl, float d) {
  float forceMult = map(lvl,0,LVL,0,1) * map($treeBulk.value,0,1,2,0) * map($rainfall.value,0,1,1,0);
  f.x = f.x * ( 1 + forceMult );
  f.y = f.y * ( 1 + forceMult );
  f.limit(d/$D); //the force should not make theforce the tip of the branch to be TOO far away from the base. because otherwise the branches near the top (where the force is felt the maximum) were becoming TOO long. so i'm limiting the change-in-length-due-to-force to be equal to the length of the previous-level-branch.
  // !!!!!!!!!! ps. i have my doubts whether the limit is properly calibered. $treeBulk and f.limit don't seem to behave organically with each other
  return f;
}

//tree factors
  float $D = 2.75/4; //factor for d (default value = 2.75/4)
  float $T = 2.50/4; //factor for t
  float $V = 4.00/3; //factor for v
 
//world factors
  color skyColour = color(127);
  float gravity, wind;
  void factors_world() {
    gravity = map($gravity.value,0,1,-5,+10); //along Y-dir (downward when +ve)
    wind = map($windSpeed.value,0,1,-20,+20) * random(0.95,1.05); //wind: along X-dir. maxWindSpeed = 20. random() makes the wind slightly erratic, and the tree "sways" in the wind.
  }
 
 
Menu $treeSize      = new Menu(  3 ,   "Tree Size (Bonsai)"   , 0.70 );
Menu $treeBulk      = new Menu(  4 ,   "Tree Bulk"            , 0.60 );
Menu $branchSpread  = new Menu(  5 ,   "Branch Spread"        , 0.75 );
Menu $leafDensity   = new Menu(  6 ,   "Leaf Density"         , 0.50 );
Menu $leafSize      = new Menu(  7 ,   "Leaf Size"            , 0.75 );
Menu $gravity       = new Menu(  0 ,   "Gravity"              , 0.70 );
Menu $windSpeed     = new Menu(  1 ,   "Wind"                 , 0.15 );
Menu $rainfall      = new Menu(  2 ,   "Rainfall (Nutrition)" , 0.55 );
 
 
//instead of:
//void mouseReleased() { //mouseReleased() was used for temporary purposes only
//use (a)
void mouseDragged() {
  $treeSize.use();
  $treeBulk.use();
  $branchSpread.use();
  $leafSize.use();
  $leafDensity.use();
  $gravity.use();
  $windSpeed.use();
  $rainfall.use();
}
//&& (b)
void mousePressed() {
  $treeSize.use();
  $treeBulk.use();
  $branchSpread.use();
  $leafSize.use();
  $leafDensity.use();
  $gravity.use();
  $windSpeed.use();
  $rainfall.use();
}
 
void showMenu() {
  $treeSize.show();
  $treeBulk.show();
  $branchSpread.show();
  $leafSize.show();
  $leafDensity.show();
  $gravity.show();
  $windSpeed.show();
  $rainfall.show();
}



