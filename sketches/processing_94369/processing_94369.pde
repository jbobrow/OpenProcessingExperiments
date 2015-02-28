
Square[] squares;
int quadsize = 90;
int quadspace = 30;
int horizontalquads;
int verticalquads;
int totalquads;

void setup(){
  size(800, 600);
  horizontalquads = width/(quadsize+quadspace);
  verticalquads = height/(quadsize+quadspace);
  totalquads = horizontalquads*verticalquads;
  squares = new Square[totalquads];
  for (int i = 0; i < verticalquads; i++) {
    for (int j = 0; j < horizontalquads; j++) {
      squares[i*horizontalquads+j] = new Square((quadspace+quadsize)*j+quadspace, (quadspace+quadsize)*i+quadspace, quadsize);
    }    
  }
  noCursor();
  background(255);
}

void draw(){
  background(255);
  for (int i = 0; i < totalquads; i++) {
    squares[i].update();
    squares[i].display();
  }
}

boolean sketchFullScreen() {
  return true;
}

class Square{
  float squarewidth;
  float squareheight;
  float originx;
  float originy;
  color squarecolor;
  int colorspeed = int(random(5)) - 1;
  Square(){
    squarewidth = 40;
    squareheight = 40;
    //originx = width/2;
    //originy = height/2;
    originx = random(0, width);
    originy = random(0, height);
  }
  Square(float _squarewidth, float _squareheight){
    squarewidth = _squarewidth;
    squareheight = _squareheight;
  }
  Square(float _originx, float _originy, float _squaresize){
    originx = _originx;
    originy = _originy;
    squarewidth = _squaresize;
    squareheight = _squaresize;
    squarecolor = color((int) random(0,255), (int) random(0,255), (int) random(0,255));
  }
  void update(){
    int red = (int)(red(squarecolor)+colorspeed);
    int green = (int)(green(squarecolor)+colorspeed);
    int blue = (int)(blue(squarecolor)+colorspeed);
    squarecolor = color(red, green, blue);
    if(red(squarecolor)<=0||green(squarecolor)<=0||blue(squarecolor)<=0){
      colorspeed = colorspeed*-1;
    }else if(red(squarecolor)>=255||green(squarecolor)>=255||blue(squarecolor)>=255){
      colorspeed = colorspeed*-1;
    }
    originx = originx + random(-2, 2);
    originy = originy + random(-2, 2);
  }
  void display(){
    rectMode(CORNER);
    fill(squarecolor);
    noStroke();
    rect(originx, originy, squarewidth, squareheight);
  }
}
