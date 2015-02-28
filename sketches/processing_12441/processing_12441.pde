
//Stretchy-thingy dancing

//Use variable for shot size so colors are scaleable
int sizeX = 1024;
int sizeY = 768; 
//call an array of amoebas
Amoeba[] moebas = new Amoeba [50];
//call mouse positions
int []xpos = new int [50];
int []ypos = new int [50];

int pos = 49;
 
//Not sure I need this yet:
//boolean moebaClicked = false;

////////// setup //////////

void setup(){
  size (sizeX, sizeY);
  smooth ();
  
  //set up xpos, ypos, and values to be zero throughout
  for (int i=0; i < xpos.length; i++){
    xpos[i] = 0;
    ypos[i] = 0;               
  }
  
    
  for (int i = 0; i<moebas.length; i++){
    moebas[i] = new Amoeba(random (1, sizeX), random(1, sizeY), 40, 60,
                            random(.01, 8), random(0.1, 8),
                            200, 200, 
                            random (.01, 8), random(.01, 8));    
  }
  
}

void draw (){
  background (255); 

  for (int i= 0; i<xpos.length-1; i++){
    xpos[i]= xpos[i+1];
    ypos[i]= ypos[i+1];

  
    moebas[i].move();
    moebas[i].display (0, 0, 0);
  }
  

  
}





 

  
////amoeba/////////////////////////////
class Amoeba{
  float centerX;//center of each form
  float centerY;//center of each form
  float xRate; //speed ofX
  float yRate; //speed ofY
  float scalePoint;//location of each point initially...this is symmetrical, so each point will be, say, 25 points from center
  float scaleCurve;//location of control points, again symmetrical...lower numbers make steeper curves
  float curveRate = .2;
  float pointRate = 1;
  int curveBounce = 500;
  int pointBounce = 500;
  

  
  Amoeba(float _centerX, float _centerY, 
          float _scalePoint, float _scaleCurve, 
          float _pointRate, float _curveRate, 
          int _pointBounce, int _curveBounce, float _xRate, float _yRate){
    centerX = _centerX;
    centerY = _centerY;
    scaleCurve = _scaleCurve;
    scalePoint = _scalePoint;
    pointRate = _pointRate;
    curveRate = _curveRate;
    pointBounce = _pointBounce;
    curveBounce = _curveBounce;
    xRate = _xRate;
    yRate = _yRate;
  }
  
  void display (int r, int g, int b){
    float aX = centerX-scalePoint;
    float aY = centerY-scalePoint;
    float bX = centerX+scalePoint;
    float bY = centerY-scalePoint;
    float cX = centerX+scalePoint;
    float cY = centerY+scalePoint;
    float dX = centerX-scalePoint;
    float dY = centerY+scalePoint;
    
    float abX = centerX-scaleCurve; //the conrol point for point a and the line that connects it to b
    float abY = centerY-scaleCurve;
    float baX = centerX+scaleCurve; //the control point for point b and the line that connects it to a
    float baY = centerY-scaleCurve;
    float bcX = centerX+scaleCurve;
    float bcY = centerY-scaleCurve;
    float cbX = centerX+scaleCurve;
    float cbY = centerY+scaleCurve;
    float cdX = centerX+scaleCurve;
    float cdY = centerY+scaleCurve;
    float dcX = centerX-scaleCurve;
    float dcY = centerY+scaleCurve;
    float daX = centerX-scaleCurve;
    float daY = centerY+scaleCurve;
    float adX = centerX-scaleCurve;
    float adY = centerY-scaleCurve;
    
    float stretch;
    stretch = constrain((dist(aX, aY, abX, abY)), 0, 255); //brightness changes with scale
    
    float bright = 255-stretch;


    //Set up points a, b, c, d in a small square at middle
    beginShape();
    fill (r, g, b, bright);
    noStroke();
    vertex (aX, aY);
    bezierVertex (abX, abY, baX, baY, bX, bY);
    bezierVertex (bcX, bcY, cbX, cbY, cX, cY);
    bezierVertex (cdX, cdY, dcX, dcY, dX, dY);
    bezierVertex (daX, daY, adX, adY, aX, aY);
    endShape ();
    
    //set points and curves in motion
    scaleCurve = scaleCurve+curveRate;
    scalePoint = scalePoint+pointRate;
    
  
    
    //Use this to look at boundries
  /*  stroke(0);
    noFill();
    ellipse(500, 500, pointBounce, pointBounce);
    
    stroke (175);
    noFill();
    ellipse (500, 500, curveBounce, curveBounce);*/
    
    if (scalePoint > pointBounce || scalePoint < -pointBounce){
     pointRate = pointRate*-1;
    }
    
    if (scaleCurve >  curveBounce || scaleCurve < -curveBounce){
      curveRate = curveRate*-1;
    }
    

  }
  void move (){ 
    centerX = centerX + xRate;
    centerY = centerY + yRate;

    if (centerX > width || centerX < 0){
    xRate = xRate * -1;
    }

    if (centerY > height || centerY < 0) {
    yRate = yRate * -1;

}
}
  

}


