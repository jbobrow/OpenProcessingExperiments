
//Spiral of Ellipses
//Max Spears

//initial setup
 void setup() {
  size(800, 800);
  noFill();
  background(#ffffff);
  frameRate(120);
  smooth();
}
 
//variables
float x = 0;
float y = 0;
float rotat = 1;
float pointsize = 1;
int count = 0;

//spiral 
void draw() {
  x+=y;
  strokeWeight(pointsize);
  translate(width/2, height/2);
  rotate(rotat);
  point(x,y);
    x=y+0.03; //distance between points
    y=x+0.03; //distance between points
    rotat = rotat + 0.1; //degree of rotation
    pointsize = pointsize + 0.006; //size of ellipse stroke
    count ++;
    if (count > 3000) {noLoop();}
  println(count);
}

