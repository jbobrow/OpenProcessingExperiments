
ArrayList veinpopulation;
ArrayList leafpopulation;

void setup(){
 size(900, 450);
 //background(241);
 smooth();
 int w = 60;
 veinpopulation = new ArrayList();
 for( int i=0; i<25; i++ ){
  veinpopulation.add( new vein( int(random(w, width-w)), int(random(7, 51)) ));
 }
}

void draw(){
 background(241);
 noLoop();
 for( int i=0; i<veinpopulation.size(); i++ ){
  vein v = (vein) veinpopulation.get(i);
  v.render();
  for( int j=0; j<leafpopulation.size(); j++ ){
   leaf f = (leaf) leafpopulation.get(j);
   f.render();
  }
 }
}
//---------------------------------------


//---------------------------------------
class vein{
//variables
int x, leafNum;
int strokeColor = color( int(random(150,221)), int(random(71,180)), 0, int(random(69,255)) );
//constructor
vein( int _x, int _leafNum ){
 x = _x;
 leafNum = _leafNum;
}

void render(){
 strokeWeight(1);
 stroke( strokeColor );
 line( x, 0, x, height );
 int gap = height /leafNum;
 int r = int(random(gap));
 int direction = 1;
 leafpopulation = new ArrayList();
 for( int i=0; i<leafNum; i++ ){
  int fillColor = color( int(random(150,221)), int(random(71,180)), 0,   int(random(69,255)) );
  leafpopulation.add( new leaf( x, gap*i +r, int(random(7, 41)), direction, fillColor ));
  direction = -direction;
 }
}
}
//---------------------------------------


//---------------------------------------
class leaf{
//variables
int x, y, leafSize, leafDir, leafSpeed, leafColor;
//constructor
leaf( int _x, int _y, int _leafSize, int _leafDir, int _leafColor ){
 x = _x;
 y = _y;
 leafSize = _leafSize;
 leafDir = _leafDir;
 leafColor = _leafColor;
}

void render(){
 noStroke();
 fill( leafColor );
 pushMatrix();
 translate(x, y);   //move to position
 scale( leafSize );   //scale to size
 beginShape();   //draw the shape
 vertex( leafDir, -0.6875 );
 bezierVertex( leafDir, -0.6875, leafDir*0.4375, -1.03125, 0, 0 );
 bezierVertex( 0, 0, leafDir, 0.375, leafDir, -0.6875 );
 endShape();
 popMatrix();
}
}
