
Circle[] _circleArr = {};
Circle[] _smallCircleArr = {};
Rectangle[] _rectArr = {};
float rectRows = 7;
float rectCols = 7;
float rectWidth;
float rectHeight;

float radius;
float radiusSmall;

void setup() {
  size(500, 500);
  //orange
  background(211,84,0);
  
  rectWidth = width / rectRows;
  rectHeight = height / rectCols;

  radius = rectWidth / 2;
  radiusSmall = radius / 2;

  setUpShapes();
}

void draw() {
  background(211,84,0);
  for(int i = 0;i < rectCols * rectRows;i++){
    _rectArr[i].updateMe();
    _circleArr[i].updateMe();
    _smallCircleArr[i].updateMe();
  }
}


void setUpShapes(){
  PVector rectanglePos = new PVector(0,0);
  PVector circlePos = new PVector(0,0);
  PVector smallCirclePos = new PVector(0,0);
  PVector offsetRadius = new PVector(radius,radius);

  for(int i = 0;i < rectCols;i++){
    for(int j = 0;j < rectRows;j++){
      //Rectangle
      rectanglePos = new PVector(j * rectWidth,i * rectHeight);
      Rectangle rectangle = new Rectangle(rectanglePos,rectWidth);
      rectangle.drawMe();
      _rectArr = (Rectangle [])append(_rectArr,rectangle);
      
      //copy from Rectangle
      circlePos = rectanglePos.get();
      //move
      circlePos.add(offsetRadius);
      Circle circle = new Circle(circlePos,radius);
      circle.drawMe();
      _circleArr = (Circle [])append(_circleArr,circle);

      //copy
      smallCirclePos = circlePos.get();
      //move
      smallCirclePos.add(offsetRadius);
      Circle smallCircle = new Circle(smallCirclePos,radiusSmall);
      smallCircle.drawMe();
      _smallCircleArr = (Circle [])append(_smallCircleArr,smallCircle);
    }
  }
}

class Circle{
  PVector position;
  float radius;
  float initRadius;
  float radiusSpeed = 1;
  
  Circle(PVector position,float r){
    this.position = position;
    this.radius = r;
    this.initRadius = r;
  }
  
  void drawMe(){
    stroke(135,54,0);
    noFill();
    ellipse(position.x,position.y,radius * 2,radius * 2);
  }

  void updateMe(){
    radius += radiusSpeed;

    if(radius > initRadius * 4 || radius < initRadius / 4){
      radiusSpeed *= -1;
    }

    drawMe();
  }
}

class Rectangle{
  PVector position;
  float rectSize;
  float initWidth;
  float widthSpeed = -0.5;
  
  Rectangle(PVector position,float rectSize){
    this.position = position;
    this.rectSize = rectSize;
    this.initWidth = rectSize;
  }
  
  void drawMe(){
    stroke(211,137,0);
    noFill();
    rect(position.x,position.y,rectSize,rectSize);
  }

  void updateMe(){
    rectSize += widthSpeed;

    if(rectSize > initWidth || rectSize < 0){
      widthSpeed *= -1;
    }

    drawMe();
  }
}

