
float aDistance; 	
float bDistance; 
float cDistance; 
float bAngle;
void setup() {
  size(500, 500);
  ;
  background(128);
  smooth();
  fill(255);
  PFont font;
  font = loadFont("Dialog.bold-48.vlw");
  textFont(font,16); 
  noFill(); 
}

void draw(){
  background(128);
  aDistance = trigFunctionSolveForA(200, mouseX, mouseY, mouseX, height*0.50);
  trigFunctionSolveForBTangent(mouseX-aDistance, height*0.50, mouseX, mouseY, mouseX, height*0.50);
  triangle_dt(mouseX-aDistance, height*0.50, mouseX, mouseY, mouseX, height*0.50);
}


void triangle_dt(float x1, float y1,float x2, float y2,float x3, float y3)
{
  y2 = constrain(y2, y3-200, y3+200);
  triangle(x1, y1, x2, y2, x3, y3);

  cDistance = dist(x1, y1, x2, y2);
  textAlign(RIGHT);
  text("c) " + 200, lerp(x1, x2, 0.5),lerp(y1, y2, 0.5)); 

  bDistance = int(dist(x2, y2, x3, y3));

  if (mouseY>y1){ // if mouseY is below b
    bDistance= (bDistance *-1); //negate bDistance
  }
  textAlign(LEFT);
  text(" b) " + int(bDistance), lerp(x2, x3, 0.5),lerp(y2, y3, 0.5)); 

  aDistance = int(dist(x1, y1, x3, y3));
  textAlign(CENTER);
  text("a) " + int(aDistance), lerp(x1, x3, 0.5),y1+(textAscent()*1.3)); 

}

float trigFunctionSolveForBTangent(float x1, float y1, float x2, float y2, float x3, float y3){

  bDistance = int(dist(x2, y2, x3, y3));

  if (y2>y1){ // if mouseY is below b
    bDistance= (bDistance *-1); //negate bDistance
  }

  aDistance = int(dist(x1, y1, x3, y3));

  // Solve for bTangent Formula: 
  // (TOA) Tangent = Opposite / Adjacent
  // Angle in Radians = The ArcTangent of Tangent
  float bAngle = (atan(bDistance/aDistance))*-1;   // negate the result of the formula

if (aDistance>25){
  arc(x1, y1, 50, 50, 0, bAngle);   //Draw Arc To Visualise Angle

    if (y2<y1){
    arc(x1, y1, 50, 50, bAngle, 0);
  }
}

  bAngle = (degrees(bAngle));
  textAlign(RIGHT);
  text(int(bAngle) + "˚", x1,y1+(textAscent()*0.5)); 

  return bAngle;
}


float trigFunctionSolveForA(float hyp, float x2, float y2, float x3, float y3){
  cDistance = hyp;
  bDistance = dist(x2, y2, x3, y3);
  aDistance = (sqrt((cDistance*cDistance)-(bDistance*bDistance)));
  return aDistance;
}









