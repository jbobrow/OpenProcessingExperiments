
float x1=0;
float x2;
float y1=0;
float y2;
int radiusCard = 50;
int radiusCirc = 170; 
int r=214, g=112, bl=112;
int angle=0;

void setup(){
  smooth();
  background(255);
  size(400, 400);
  stroke(r, g, bl);
  translate (width/2, height/2);
 
  noFill();
  stroke(r, g, bl, 100);
  strokeWeight(0);
 // ellipse(0,0, radiusCirc*2, radiusCirc*2);
}
void draw() {
  strokeWeight(0);
  frameRate(20);
   translate (width/2, height/2);
    rotate(-PI/2);
  //for (int angle=0; angle <=360; angle+=3) {
    
    x2 = radiusCard * (2*cos(radians(angle)) - cos(2*radians(angle)));
    y2 = radiusCard * (2*sin(radians(angle)) - sin(2*radians(angle)));
  
    //line(x1, y1, x2, y2);
    drawLine(x1, y1, x2, y2);
    x1 = x2;
    y1 = y2;
    angle+=2;
    if (frameCount> 180)
      noLoop();
  System.out.println(frameCount);

  
}

void drawLine(float x1, float y1, float x2, float y2){
  strokeWeight(0);
  float slope=0;
  float b=0;
  float xi, yi;
  float xf, yf;
  slope = (y2-y1) / (x2-x1);
  b = y1 - slope*(x1);
  xi =  -width/2-11;
  yi = slope * xi + b;
  float a=250;
  if ((x2-x1)!=0){
    for (float i = -width/2-10; i<width/2+10; i+=0.2) {
      xf = i;
      yf = slope * i + b;
       if (!isLineinCircle(xi, yi, xf,yf)) {
          //stroke(121, 137, 240, 200);
          stroke(20); 
     }
      line (xi, yi, xf, yf);
      xi = xf;
      yi = yf;
      a-=0.05;
      stroke(r, g, bl, a);
    }
   }
 }
boolean isLineinCircle (float xinit, float yinit, float xfinal, float yfinal) {
  if (dist(0, 0, xfinal, yfinal )  <=radiusCirc && (dist(0, 0, xinit, yinit)) 
    <=radiusCirc)
    return true;
  else 
    return false;
}  

  

