
 //Artificial Horizon+Compass by Adrian Fernandez 4-19-2013
//Built with Processing 1.5.1
int W=800; //My Laptop's screen width
int H=800;  //My Laptop's screen height
float Pitch;
float Bank;
float Azimuth;

float CompassMagnificationFactor=0.5;
float SpanAngle=120;
int NumberOfScaleMajorDivisions;
int NumberOfScaleMinorDivisions;
PVector v1, v2; //For testing only
void setup()
{
  size(W, H);
  rectMode(CENTER);
  smooth();
  //strokeCap(SQUARE);//Optional
}
void draw()
{
  background(0);
  translate(400, 400); 
  
  MakeAnglesDependentOnMouse();
 
  scale(0.5);
  Compass();
  ShowAzimuth();
}
void MakeAnglesDependentOnMouse() //For testing only.
{
  v2= new PVector();
  v1= new PVector(W/2, H/2);
  v2.x=mouseX;
  v2.y=mouseY;
  Bank = PVector.angleBetween(v1, v2);
  Pitch=mouseY-H/2;
  Azimuth=(180/PI*10*Bank)%360;
}

void ShowAzimuth()
{
  fill(50);
  noStroke();

  int Azimuth1=round(Azimuth);
  textAlign(CORNER);
  textSize(35);
  fill(255);
  text("Azimuth:  "+Azimuth1+" Deg", 80, 477, 500, 60);
}
void Compass()
{
  translate(200/200);

  noFill();
  stroke(100);
  strokeWeight(80);
  ellipse(0, 0, 350, 350);
  strokeWeight(50);
  stroke(50);
  fill(0, 0, 40);
  ellipse(0, 0, 210, 210);
  for (int k=255;k>0;k=k-5)
  {
    noStroke();
    fill(0, 0, 255-k);
    ellipse(0, 0, 2*k, 2*k);
  }
  strokeWeight(20);
  NumberOfScaleMajorDivisions=18;
  NumberOfScaleMinorDivisions=36; 
  SpanAngle=180;
  CircularScale();
  rotate(PI);
  SpanAngle=180;
  CircularScale();
  rotate(-PI);
  fill(255);
  textSize(60);
  textAlign(CENTER);
  text("W", -300, 0, 100, 80);
  text("E", 300, 0, 100, 80);
  text("N", 0, -365, 100, 80);
  text("S", 0, 375, 100, 80);
 

  rotate(PI/4);
  textSize(40);
  text("NW", -370, 0, 100, 50);
  text("SE", 365, 0, 100, 50);
  text("NE", 0, -355, 100, 50);
  text("SW", 0, 365, 100, 50);
  rotate(-PI/4);
  CompassPointer();
}
void CompassPointer()
{
  rotate(PI+radians(Azimuth)); 
  stroke(0);
  strokeWeight(4);
  fill(100, 255, 100);
  triangle(-20, -210, 20, -210, 0, 270);
  triangle(-15, 210, 15, 210, 0, 270);
  ellipse(0, 0, 45, 45);  
  fill(0, 0, 50);
  noStroke();
  ellipse(0, 0, 10, 10);
  triangle(-20, -213, 20, -213, 0, -190);
  triangle(-15, -215, 15, -215, 0, -200);
  rotate(-PI-radians(Azimuth));
}

void CircularScale()
{
  float GaugeWidth=800; 
  textSize(GaugeWidth/30);
  float StrokeWidth=1;
  float an;
  float DivxPhasorCloser;
  float DivxPhasorDistal;
  float DivyPhasorCloser;
  float DivyPhasorDistal;
  strokeWeight(2*StrokeWidth);
  stroke(255);
  float DivCloserPhasorLenght=GaugeWidth/2-GaugeWidth/9-StrokeWidth;
  float DivDistalPhasorLenght=GaugeWidth/2-GaugeWidth/7.5-StrokeWidth;
  for (int Division=0;Division<NumberOfScaleMinorDivisions+1;Division++)
  {
    an=SpanAngle/2+Division*SpanAngle/NumberOfScaleMinorDivisions; 
    DivxPhasorCloser=DivCloserPhasorLenght*cos(radians(an));
    DivxPhasorDistal=DivDistalPhasorLenght*cos(radians(an));
    DivyPhasorCloser=DivCloserPhasorLenght*sin(radians(an));
    DivyPhasorDistal=DivDistalPhasorLenght*sin(radians(an));  
    line(DivxPhasorCloser, DivyPhasorCloser, DivxPhasorDistal, DivyPhasorDistal);
  }
  DivCloserPhasorLenght=GaugeWidth/2-GaugeWidth/10-StrokeWidth;
  DivDistalPhasorLenght=GaugeWidth/2-GaugeWidth/7.4-StrokeWidth;
  for (int Division=0;Division<NumberOfScaleMajorDivisions+1;Division++)
  {
    an=SpanAngle/2+Division*SpanAngle/NumberOfScaleMajorDivisions; 
    DivxPhasorCloser=DivCloserPhasorLenght*cos(radians(an));
    DivxPhasorDistal=DivDistalPhasorLenght*cos(radians(an));
    DivyPhasorCloser=DivCloserPhasorLenght*sin(radians(an));
    DivyPhasorDistal=DivDistalPhasorLenght*sin(radians(an));
    if (Division==NumberOfScaleMajorDivisions/2|Division==0|Division==NumberOfScaleMajorDivisions)
    {
      strokeWeight(15);
      stroke(0);
      line(DivxPhasorCloser, DivyPhasorCloser, DivxPhasorDistal, DivyPhasorDistal);
      strokeWeight(8);
      stroke(100, 255, 100);
      line(DivxPhasorCloser, DivyPhasorCloser, DivxPhasorDistal, DivyPhasorDistal);
    }
    else
    {
      strokeWeight(3);
      stroke(255);
      line(DivxPhasorCloser, DivyPhasorCloser, DivxPhasorDistal, DivyPhasorDistal);
    }
  }
}

void ShowAngles()
{
  textSize(30);
  fill(50);
  noStroke();
  rect(-150, 400, 280, 40);
  rect(150, 400, 280, 40);
  fill(255);
  Pitch=Pitch/5;
  int Pitch1=round(Pitch);
  Bank=Bank*180/PI;
  int Bank1=round(Bank);
  
}


