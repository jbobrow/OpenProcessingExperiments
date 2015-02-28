
float radius=230;
float hubXi;
float hubYi;
float deltaX, deltaY;
float rotAngle=0;
float rotAngleDeg=0;
PFont font;
float RandomX = 100+random(200), RandomY= 100+random(200);
kaleido scope;

void setup() {
  smooth();
  background(255);
  size(650, 500, P3D);
  hubXi=0;
  hubYi= height/2;

  font = loadFont("Helvetica-30.vlw");
  }
  
void draw() {
  
  translate(width/2+60, height/2);
  stroke(0);
  strokeWeight(3);
  ellipse(0, 0, radius*2, radius*2);
  noStroke();

}

void mouseMoved() {

  background(255);
  stroke(0);
  strokeWeight(3);
  ellipse(0, 0, radius*2, radius*2);
  noStroke();

  deltaX = mouseX - hubXi;
  deltaY = mouseY - hubYi;
  
  if ((deltaY!=0) && (deltaX!=0)) {
    rotAngle = (atan2(deltaY, deltaX));
   // println(rotAngle + " mouseX=" + mouseX + " deltaX=" + deltaX + 
   //   "mouseY= " + mouseY + "deltaY=" + deltaY);
    rotAngleDeg = map(rotAngle, -PI/2, PI/2, 10, 45);
    int tempAng = int(rotAngleDeg);
    
    //print(tempAng + " ");
    rotAngleDeg= multipleof360 (tempAng);
    println(rotAngleDeg);
    smallSlice(rotAngleDeg); 
    
    scope = new kaleido(rotAngleDeg, RandomX, RandomY);
      System.out.println(scope.getSliceNum());
      scope.drawAllSlices(); 
    }

}

void mouseReleased() {
  RandomX=random (200) + 100;
  RandomY=random(200) + 100;
  background(255);
  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(0, 0, radius*2, radius*2);
  noStroke();
  smallSlice(rotAngleDeg); 
  scope = new kaleido(rotAngleDeg, RandomX, RandomY);
  scope.drawAllSlices(); 
}

int multipleof360(int deg) {
  int tempUp = deg, tempDown = deg;  
  while(true) { 
     tempUp++;
     tempDown--; 
     if (360%tempUp==0 && (360/tempUp)%2==0)
      return tempUp;
     else if (360%tempDown==0 && (360/tempDown)%2==0)
      return tempDown;

  }   
}

void smallSlice(float degree){
  pushMatrix();
  translate(-width/2-60, -height/2);
  
  float deg = degree;
  fill(0);
  triangle (hubXi, hubYi, hubXi +50*cos (0), hubYi + 50* sin(0), 
    hubXi + 50*cos (radians(deg)), hubYi + 50*sin (radians(deg)));
  textFont(font); 
  text(int(deg) + "°", hubXi+2, hubYi-10); 
  noFill();
  popMatrix();
}

