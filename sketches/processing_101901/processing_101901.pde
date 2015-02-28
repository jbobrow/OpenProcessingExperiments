
// Happy memories of my old toy "SpiroDesign".
// (c) Sugimoto_kun 2013

float smallTheta = 0; 
int maxDenominator = 20;
int resolution = 200;
int pointsFor1Draw = 20000;
boolean resetTheta = false;
int frame_rate = 30;
  
void setup() {
  size(1000, 1000);
  noFill();
  frameRate(30);
  ellipseMode(CENTER);  
}

float fraction(int i) {
  return( abs(round(mouseY / height * i) - (mouseY / height * i)) / i );
}

void draw() {
  float thetaStep = PI / resolution;
  float largeRadius = width / 2 - 10;
  float largeTheta = 0;
  float smallRadius = largeRadius / 5;
  int denominator = 0;
  String additional = "?????";
  
  translate(width/2, height/2); 
  background(220);  

  if (resetTheta) {
    smallTheta = 0;
  }
  float penPosition = mouseX / width;
  float minimumFraction = fraction(2);
  denominator = 2;
  for (int i = 3; i <= maxDenominator; i++) {
    if ( fraction(i) < minimumFraction ) {
      minimumFraction = fraction(i);
      denominator = i;
    }
  }
  if (mousePressed == true) {
    if (mouseY * maxDenominator < height) {
      smallRadius = largeRadius / maxDenominator;
      denominator = maxDenominator;
    }
    else {
      smallRadius = largeRadius * round(mouseY * denominator / height ) / denominator;
    }
    additional = "Radius ratio is ";
  }
  else {
    smallRadius = largeRadius * mouseY / height;
    additional = "Radius ratio is around ";
    text("Click left and drag!", -width/2 + 15, -height /2 + 15); 
  }
  int ratioOfRadiuses[] = {round(smallRadius * denominator / largeRadius ), denominator};
  String str1[] = {additional, join(nf(ratioOfRadiuses, 2), "/")};
  String str2 = join(str1, "");
  fill(0, 102, 153);
  text(str2, -width/2 + 15, -height /2 + 30); 
  
  noFill();  stroke(#FF00FF);
  ellipse(0, 0, largeRadius * 2, largeRadius * 2);
  ellipse(largeRadius - smallRadius, 0, smallRadius * 2, smallRadius * 2);
  ellipse(largeRadius - smallRadius * (1 - penPosition), 0, width/100, width/100) ;

  text(": maxDenominator +D/-d", -width/2 + 80 , -height /2 + 45); 
  text(nf(maxDenominator, 8), -width/2 + 15, -height /2 + 45);
  text(": resolution     +R/-r", -width/2 + 80, -height /2 + 60); 
  text(nf(resolution, 8), -width/2 + 15, -height /2 + 60);
  text(": pointsPerDraw +P/-p", -width/2 + 80, -height /2 + 75); 
  text(nf(pointsFor1Draw, 8), -width/2 + 15, -height /2 + 75);
  text(": frameRate +F/-f", -width/2 + 80, -height /2 + 90); 
  text(nf(frame_rate, 8), -width/2 + 15, -height /2 + 90);
  text(": resetEveryDraw     toggled by SP", -width/2 + 80, -height /2 + 105); 
  if (resetTheta) {
    text("true", -width/2 + 15, -height /2 + 105);
  }
  else {
    text("false", -width/2 + 15, -height /2 + 105);
  }
  
  stroke(15);
  for (int i = 0; i < pointsFor1Draw; i++) {
    smallTheta += thetaStep;
    largeTheta = smallTheta * smallRadius / largeRadius;
    float pointX = (largeRadius - smallRadius) * cos(largeTheta) + smallRadius * penPosition * cos(smallTheta);
    float pointY = (largeRadius - smallRadius) * sin(largeTheta) - smallRadius * penPosition * sin(smallTheta);
    point(pointX, pointY);
  }
}

void keyPressed() {
    switch(key) {
      case 'D': maxDenominator *= 2; break;
      case 'd': maxDenominator = round(maxDenominator / 2 + 0.5); break;
      case 'R': resolution *= 2; break;      
      case 'r': resolution = round(resolution / 2 + 0.5); break;      
      case 'P': pointsFor1Draw *= 2; break;      
      case 'p': pointsFor1Draw = round(pointsFor1Draw / 2 + 0.5); break;
      case 'F': frame_rate *= 2; break;      
      case 'f': frame_rate = round(frame_rate / 2 + 0.5); break;      
      case ' ': resetTheta = !resetTheta; break;      
      default: 
    }
}

