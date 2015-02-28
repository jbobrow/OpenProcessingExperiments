
float number = 1;
float last,last2;
float[] fibs= new float [1];
 
float px,py,r,degree;
float[] xpos = new float[0];
float[] ypos = new float[0];
 
float spacing = 6;
int startWeight = 2;
int maxWeight = 5;
float weight = startWeight;
float guldenSnede = ((sqrt(5) - 1 ) / 2);
 
float lastX, lastY;
 
void setup()
{
  size(1280, 800);
  background(255);
  smooth();
  stroke(0);
  frameRate(30);
  px = width/2;
  py = height/2;
}
 
void draw()
{
    lastX = px;
    lastY = py;
    degree = (frameCount * guldenSnede) * 360;
    r = sqrt(frameCount)*spacing;
    calculatePoint(width/2, height/2, r, (degree % 360));
    strokeWeight(weight);
    point(px,py);
    //line(lastX, lastY, px,py);
    weight += 0.00015;
    println(degree % 360);
    //spacing += 0.00075;
}
 
void calculatePoint(float x, float y, float r, float graden){
  px = x + cos(radians(graden))*(r/2);
  py = y + sin(radians(graden))*(r/2);
}
