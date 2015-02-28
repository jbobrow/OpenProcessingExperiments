
/**
A PShape tutorial by <a href="http://www.local-guru.net/blog"> guru</a>
*/

PShape fig;

PShape body;
PShape left_arm;
PShape left_elbow;
PShape right_arm;
PShape right_elbow;
PShape left_leg;
PShape left_knee; //.5
PShape right_leg;
PShape right_knee; //.5


void setup()
{
//  hint(ENABLE_STROKE_PURE); //
  size(500,500);

  fig = loadShape( "figure2.svg" );
  console.log(fig);

  body = fig.getChild( "body" );
  left_arm = fig.getChild( "left_arm" );
  left_elbow = fig.getChild( "left_elbow" );
  right_arm = fig.getChild( "right_arm" );
  right_elbow = fig.getChild( "right_elbow" );
  left_leg = fig.getChild( "left_leg" );
  left_knee = fig.getChild( "left_knee" ); //.5
  right_leg = fig.getChild( "right_leg" );
  right_knee = fig.getChild( "right_knee" ); //.5
//  left_arm.getChild( "pivot_left_arm").setVisible( false );
  noLoop();
}

void draw() {
  background(200);
  shape( fig, 50, 0 );
}

float r_arm = 0;
float r_leg = 0;

void mouseMoved()
{
  float a = radians(mouseY - pmouseY);
  
  if ( r_arm+a < HALF_PI && r_arm+a > -HALF_PI ) {
    r_arm += a;
    rotateShape( left_arm, "pivot_left_arm", a);
    rotateShape( left_elbow, "pivot_left_elbow", a);
    rotateShape( right_arm, "pivot_right_arm", -a);
    rotateShape( right_elbow, "pivot_right_elbow", -a);
  }
  
  if ( r_leg+a < 0 && r_leg+a > -PI/3 ) {
    r_leg += a;
    rotateShape( left_leg, "pivot_left_leg", a);  
    rotateShape( left_knee, "pivot_left_knee", -a); //.5  
    rotateShape( right_leg, "pivot_right_leg", -a);  
    rotateShape( right_knee, "pivot_right_knee", a);  //.5
  }
  redraw();
}

void rotateShape( PShape s, String pivot, float a ) {
//  var p = s.getChild( pivot );
//  console.log(p);

  PShape p = s.getChild( pivot );
  console.log(p);
  float px = p.params[0];
  float py = p.params[1];
  s.translate( px, py );
  s.rotate( a );
  s.translate( -px, -py );
}


