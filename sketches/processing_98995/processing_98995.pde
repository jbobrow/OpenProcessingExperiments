
//THIS DRAWING IS MADE TNROUGHOUT MANY PATTERNS LIKE CIRCLES AN BEZIER LINES IN FACT, THERE'S NOTHING MORE THAN NICE SHAPES POSITIONING

circleDrawer[] circles;
Balloons[] balloons;
int numOfCircles = 10;

void setup(){
  size(500,500);
  frameRate(5);
  background(0,155,259);
  float angle = PI/6;
  int i, x1, x2, y1, y2;
  float mod;
  circles = new circleDrawer[numOfCircles];
  circles[0] = new circleDrawer(250, 250, 184, 184, 36, 31, 20);
  circles[1] = new circleDrawer(207, 225, 42, 42, 131, 130, 134);
  circles[2] = new circleDrawer(293, 225, 42, 42, 131, 130, 134);
  circles[3] = new circleDrawer(210, 220, 31, 31, 255, 255, 255);
  circles[4] = new circleDrawer(289, 220, 31, 31, 255, 255, 255);
  circles[5] = new circleDrawer(215, 220, 10, 10, 36, 31, 20);
  circles[6] = new circleDrawer(281, 220, 10, 10, 36, 31, 20);
  circles[7] = new circleDrawer(250, 192, 31, 31, 255, 255, 255);
  circles[8] = new circleDrawer(250, 316, 114, 49, 131, 130, 134);
  circles[9] = new circleDrawer(250, 316, 114, 49, 131, 130, 134);
  balloons = new Balloons[13];
  for(i = 0; i < 13; i++){
    balloons[i] = new Balloons(30, 100);
    balloons[i].drawBallon();
  }
  
  
  for(i = 0; i<numOfCircles; i++){
    circles[i].Circle();    
  }
    noFill();
    stroke(198, 114, 58);
    strokeWeight(10);
    strokeCap(SQUARE);
    line(220, 205, 168, 182);
    line(280, 205, 332, 182);
    stroke(36, 31, 20);
    strokeWeight(17);
    bezier(250, 165, 225, 155, 255, 125, 260, 125);
    stroke(198, 114, 58);
    strokeWeight(12);
    bezier(252, 135, 245, 128, 254, 127, 255, 127);
    noStroke();
    
    beginShape();
    fill(215, 172, 74);
    vertex(250, 286);
    vertex(276, 255);
    vertex(250, 230);
    vertex(224, 255);
    endShape(CLOSE);
    stroke(36, 31 , 20);
    strokeWeight(2);
    bezier(221, 258, 250, 215, 250, 215, 279, 258);
    bezier(224, 258, 250, 250, 250, 250, 276, 258);

    
  return;
}
/*
void draw() {
  background(255);
  int j;
  for(j = 0; j<13; j++){
    balloons[j].drawBallon();
    balloons[j].fullFill();
  }
  renderBird();
}
*/
class circleDrawer{
  int yCenter;
  int xCenter;
  int Width;
  int Height;
  int r,g,b;
  
  circleDrawer(int _xCenter, int _yCenter, int _Width, int _Height, int _r, int _g, int _b){
    
    yCenter = _yCenter;
    xCenter = _xCenter;
    Width = _Width;
    Height = _Height;
    r = _r;
    g = _g;
    b = _b;
  }
  void Circle(){
    stroke(0);
    fill(r,g,b);
    ellipse(xCenter, yCenter, Width, Height);
    return;
}
 
}

class Balloons{
  int yCenter;
  int xCenter;
  int minWidth, maxWidth, proportion;
  int r,g,b;
  
  Balloons( int _minWidth, int _maxWidth){
    
    minWidth = _minWidth;
    maxWidth = _maxWidth;
    yCenter = int(random(0, height));
    xCenter = int(random(0, width));
    proportion = int(random(minWidth, maxWidth));
    
  }
  
  
  
  void drawBallon(){
    noStroke();
    fill(3,37,64, 195);
    ellipse(xCenter, yCenter, proportion, proportion);
    fill(255,255,255);
    ellipse(xCenter, yCenter, 2, 2);
    return;
  }
  
  void fullFill(){
    noStroke();
    fill(3,37,64, 195);
    return;
  }
  
  
}

void renderBird(){
  int i;
  for(i = 0; i<numOfCircles; i++){
    circles[i].Circle();    
  }
    noFill();
    stroke(198, 114, 58);
    strokeWeight(10);
    strokeCap(SQUARE);
    line(220, 205, 168, 182);
    line(280, 205, 332, 182);
    stroke(36, 31, 20);
    strokeWeight(17);
    bezier(250, 165, 225, 155, 255, 125, 260, 125);
    stroke(198, 114, 58);
    strokeWeight(12);
    bezier(252, 135, 245, 128, 254, 127, 255, 127);
    noStroke();
    
    beginShape();
    fill(215, 172, 74);
    vertex(250, 286);
    vertex(276, 255);
    vertex(250, 230);
    vertex(224, 255);
    endShape(CLOSE);
    stroke(36, 31 , 20);
    strokeWeight(2);
    bezier(221, 258, 250, 215, 250, 215, 279, 258);
    bezier(224, 258, 250, 250, 250, 250, 276, 258);
    return;
}


