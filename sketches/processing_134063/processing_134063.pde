

Curl myCurls;

void setup(){
  size(600,400);
  frameRate(60);
  
  myCurls = new Curl(300,200);
  colorMode(HSB, 255);
  background (0,0,0);
  
}

void draw(){
  myCurls.run();
}


void mousePressed(){
  myCurls.reset();
}
class Curl {
  //GlobalVariables
  
float number = 1;
float last,last1;
float[] fibs= new float [1];
 
float px,py,r,degree;
float[] xpos = new float[0];
float[] ypos = new float[0];
 
float spacing = 14;
int startWeight = 6;
int maxWeight = 6;
float weight = startWeight;
float spiral = ((sqrt(2) - 4 ) / 2);
float lastX, lastY;
float x= width/1, y= height/1;
float steps = 0;
color strokeColor;

//Conrtuctor
Curl(float px, float py){
  x = px;
  y = py;
  reset();
 }
 
//functions
 void run(){
   display();
   move();
   calculatePoint(x,y,r,degree);

}

void reset(){
  steps = 0;
  strokeColor = color( random(255), 255, 255 );
}

//functions
void move(){
  px = width/2;
  py = height/2;
  steps++;
}
 
 //Functions
void display(){
    //translate (width/-10,7);
    lastX = px;
    lastY = py;
    degree = (steps * spiral) * 10;
    r = sqrt(steps) * spacing;
    calculatePoint(width/2, height/2, r, (degree % 360));
    strokeWeight(weight);
    stroke(strokeColor);
    point(px,py);
    width +=  0.000015;
   

    
}
 //Functions
void calculatePoint(float x, float y, float r, float angle){
  px = x + cos(radians(angle))*(r/2);
  py = y + sin(radians(angle))*(r/2);
  
  }

} 


