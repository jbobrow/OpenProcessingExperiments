

float[][][] curves;

float theta_decay = (5.0/6.0);
float stroke_decay = (2.0/3.0);

float radius = 300.0;

int num_curves = 3;

boolean constrainAngle = false;

void makeCurve(int i)
{
  curves[i][0][0] = random(TWO_PI);
  if( constrainAngle ) {
    curves[i][0][1] = random((2.0/3.0)*PI,(1.0/4.0)*PI);
    curves[i][0][2] = 0.0;
  } else {
    curves[i][0][1] = random(HALF_PI);
    curves[i][0][2] = curves[i][0][1] + random(PI/4.0);
  }
  curves[i][1][0] = random(0.2,0.5)*radius;
  curves[i][1][1] = random(0.5,0.8)*radius;
  curves[i][1][2] = random(0.8,1.0)*radius;
  curves[i][2][0] = /*random(width*0.4,width*0.6)*/ width/2;
  curves[i][2][1] = /*random(height*0.4,height*0.6)*/ height/2;
  curves[i][2][2] = 0;
}

void setup()
{
  size(600,600,JAVA2D);
  //size(min(screen.width,screen.height),min(screen.width,screen.height),JAVA2D);
  //radius = min(screen.width,screen.height)/2.0;
  smooth();
  curves = new float[num_curves][3][3];
  for( int i = 0; i < num_curves; ++i) {
    makeCurve(i);
  }
  background(0);
  strokeWeight(3.0);
  noFill();
  frameRate(30);
}

void mousePressed()
{
  constrainAngle = !constrainAngle;
}

void draw()
{
  fill(0,0,0,6);
  noStroke();
  rect(0,0,width,height);
  noFill();
  if( frameCount % 3 == 0 ) { 
    for(int i = 0; i < num_curves; ++i) {
      stroke(255.0,255.0,255.0, 255.0*pow(stroke_decay,curves[i][2][2]));
      bezier(curves[i][2][0],
             curves[i][2][1],
             curves[i][2][0] + curves[i][1][0]*cos(curves[i][0][0]),
             curves[i][2][1] + curves[i][1][0]*sin(curves[i][0][0]),
             curves[i][2][0] + curves[i][1][1]*cos(curves[i][0][0] + curves[i][0][1]),
             curves[i][2][1] + curves[i][1][1]*sin(curves[i][0][0] + curves[i][0][1]),
             curves[i][2][0] + curves[i][1][2]*cos(curves[i][0][0] + curves[i][0][2]),
             curves[i][2][1] + curves[i][1][2]*sin(curves[i][0][0] + curves[i][0][2])
            );
      curves[i][0][1] *= theta_decay;
      curves[i][0][2] *= theta_decay;
      curves[i][2][2] += 1;
      if( curves[i][2][2] > int(random(7.0,11.0)) ) {
        makeCurve(i);
      }
    }
  }
}
    
  
  

