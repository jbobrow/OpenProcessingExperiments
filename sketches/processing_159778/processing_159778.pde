
int squareSize;
ArrayList <Square> squares;
ArrayList <Field> fields;

void setup(){
  size(800, 600);
  squareSize = 40;
  squares = new ArrayList <Square> ();
  fields = new ArrayList <Field> ();
  int nX = width / squareSize;
  int nY = height / squareSize;
  for(int i = 0; i < nX * nY; i++){
    int xPos = (i%nX)*squareSize + int(squareSize/2);
    int yPos = (i/nX)*squareSize + int(squareSize/2);
    squares.add(new Square(new PVector(xPos, yPos), 40));
  }
  for(int i = 0; i < 6;i++){
    fields.add(new Field());
  }
}

void draw(){
  background(#0E576C);
  for(Square s : squares){
    s.update();
    s.display();
  }
  for(Field f : fields){
    f.update();
    //f.display();
  }
}

class Field{
  PVector location;
  PVector speed;
  int radius;
  Field(){
    radius = 150;
    location = new PVector(random(width), random(height));
    speed = new PVector(random(6)-3, random(6)-3);
  }
  
  void display(){
    pushMatrix();
    translate(location.x, location.y);
    fill(255, 0, 0);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
  
  void update(){
    location.add(speed);
    if(location.x > width+radius/2) location.x = 0-radius/2;
    if(location.x < 0-radius/2) location.x = width+radius/2;
    if(location.y > height+radius/2) location.y = 0-radius/2;
    if(location.y < 0-radius/2) location.y = height+radius/2;
  }
  
  boolean inRadius(PVector _location){
    if(dist(location.x, location.y, _location.x, _location.y) <= radius){
      return true;
    }else{
      return false;
    }
  }
}

class Square{
  color baseColor = color(#248CAA);
  color alteredColor = color(255, 0, 0);
  
  PVector location;
  int size;
  float scaleFactor;
  color fillColor;
  color strokeColor;
  Square(PVector _location, int _size){
    fillColor = baseColor;
    strokeColor = color(#2CA9CE);
    size = _size;
    location = _location;
    scaleFactor = 0;
  }
  
  void display(){
    fill(fillColor);
    stroke(strokeColor);
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rect(0, 0, size*(1-scaleFactor), size*(1-scaleFactor));
    scaleFactor = 0;
    popMatrix();
  }
  
  void update(){
    for(Field f : fields){
      if(f.inRadius(this.location)){
        scaleFactor += 1-dist(location.x, location.y, f.location.x, f.location.y)/f.radius;
        //fillColor = alteredColor;
      }else{
        fillColor = baseColor;
      }
    }
  }
}
