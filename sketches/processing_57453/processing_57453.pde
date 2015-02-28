

Ball[][] ballCircles;
int[] ballTotal = { 15, 30, 45, 60 };


void setup() {
  size(400,400);
  smooth();
  ballCircles = new Ball[12][];
  for( int t = 0; t < ballTotal.length; t ++ ){
    ballCircles[t] = new Ball[ballTotal[t]];
    for( int c = 0; c < ballTotal[t]; c ++ ){
      ballCircles[t][c] = 
      new Ball( 
                (width/2) + cos(radians((360/ballTotal[t])*c))*(ballTotal[t]*2.5) , 
                (height/2) + sin(radians((360/ballTotal[t])*c))*(ballTotal[t]*2.5), 
                (360/ballTotal.length)*t, 
                2);
    } 
  }
}
void draw(){
  rectMode(CORNER);
  fill(255);
  noStroke();
  rect( 0,0, width, height);
  rectMode( CENTER);
  ellipseMode(CENTER);
  //ballCircles = new Ball[12];
  for( int t = 0; t < ballTotal.length; t ++ ){
    for( int c = 0; c < ballTotal[t]; c ++ ){
        ballCircles[t][c].update();
    }
  }
}

class Ball { 
  float ypos, xpos, angle, bDiameter; 
  Ball (float y, float x, float a , float d) {  
    ypos = y; 
    xpos = x;
    angle = a; 
    bDiameter = d;
  } 
  public void update() { 
    angle ++; 
    if( angle > 360 ) angle -= 360;
    noStroke();
    fill( 0 , 25, 170 );
    float cDist = dist( xpos , ypos , mouseX , mouseY );
    float d = map(cDist, 1 , 400 , -70, -5  );//(20+(cDist/20)) / (cDist/20) ;
    //float d = bDiameter - (cDist/5);
    pushMatrix();
    translate( xpos, ypos );
    rotate( radians( angle ) );

    ellipse( 0, 0, d, d );
    //fill(255,0,0);
    //rect(0,0,cos(45)*(d),cos(45)*(d));
    noFill();
    stroke(255);
    //line(0, -bDiameter/2, 0, bDiameter/2); 
    //line(-bDiameter/2, 0, bDiameter/2, 0); 
    popMatrix();
  } 
}

