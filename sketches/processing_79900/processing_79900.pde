
/*PGraphics t;
PGraphics i;
PGraphics d;*/
Bioform bf;
void setup() {
  size(350, 350);
  smooth();
  noStroke();
  noLoop();
 // bf= new Bioform();
}
void draw(){
//Bioform.draw();
}


class Bioform{

  // fields
  //PGraphics img;
float [] p1x;
float [] p1y;
float [] p2x;
float [] p2y;
float [] c1x;
float [] c1y;
float [] c2x;
float [] c2y;

//constructor
  /*
  float k = random(70, 100); //left point y value
  float k2 = random(70, 100); //right point y value
  float b = random(50, 90); //top point x value
  float b2=random(60, 110); //bottom point x value
  float p = random(10, 30); // top side vertex and curve y value
  float q = random(140, 190); // right side vertex and curve x value
  float r = random(120, 170); //bottom side vertex and curve y value
  float s = random(5, 40); //left side vertex and curve x value
  */

Bioform(float w, float h){
 p1x = new float[4];
 p1x[0] = w/2+random(-w/4,w/4); 
 p1x[1] = w+random(-w/4,w/4); 
 p1x[2] =  w/2+random(w/2-w/4,w/2+w/4);
 p1x[3] = random(-w/4,w/4);
 
 p1y = new float[4];
 p1y[0] = 0+random(-h/4,h/4);
 p1y[1] = h/2+random(-h/4,h/4);
 p1y[2] = h+random(-h/4,h/4);
 p1y[3] = h/2+random(-h/4,h/4);
 
 
  p2x = new float[4];
 p2x[0] =  w+random(-w/4,w/4); 
 p2x[1] =  w/2+random(w/2-w/4,w/2+w/4);
 p2x[2] = random(-w/4,w/4);
 p2x[3] = w/2+random(-w/4,w/4);
 
 p2y = new float[4];
 p2y[0] = h/2+random(-h/4,h/4);
 p2y[1] = h+random(-h/4,h/4);
 p2y[2] = h/2+random(-h/4,h/4);
 p2y[3] = 0+random(-h/4,h/4);
 
 
 c1x = new float[4];
 c1x[0] = (3*w)/4+random(-w/4,w/4);
  c1x[1] = w+random(-w/4,w/4); 
  c1x[2] = w/4+random(-w/4,w/4);
  c1x[3] = random(-w/4,w/4);
  
 c1y = new float[4];
 c1y[0] = random(-h/4,h/4);
  c1y[1] = (3*h)/4+random(-h/4,h/4);
  c1y[2] = h+random(-h/4,h/4);
  c1y[3] = h/4+random(-h/4,h/4);
 
 
 
 c2x = new float[4];
 c2x[0] = w+random(-w/4,w/4); 
  c2x[1] = (3*w)/4+random(-w/4,w/4);
  c2x[2] = random(-w/4,w/4);
  c2x[3] = w/4+random(-w/4,w/4);
  
 c2y = new float[4];
 c2y[0] = h/4+random(-h/4,h/4);
  c2y[1] = h+random(-h/4,h/4);
  c2y[2] = (3*h)/4+random(-h/4,h/4);
  c2y[3] = random(-h/4,h/4);
  // methods
}



// draw it!
void draw(){
  for(int i=0;i<4;i++){
  beginShape();
  vertex(p1x[i],p1y[i]);
  bezierVertex(c1x[i],c1y[i],c2x[i],c2y[i],p2x[i],p2y[i]);
  endShape();

}
}}

