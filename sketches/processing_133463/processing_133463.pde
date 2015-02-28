
float col = 100;
void setup() {
size(500, 500);
background(0);
noFill();
colorMode(RGB);
translate(width/2,height/2);
rectMode(CENTER);
drawRect(0,0, 250,250); //half size fills screen (maybe go a little in for a frame?)
noLoop();
}
 
void drawRect(float x,float y, float w,float h){
if(w > 1){
stroke(noise(col)*255,0,0);
col+= 0.005; //the larger the number the more modules show up (almost like a gradient)
    
rect(x,y,w,h);
PVector vecA,vecB,vecC,vecD;
int vhwp = w/2; //vector half width positive
int vhhp = h/2; //vector half height positive
int vhwn = -w/2; // vector half width negative
int vhhn = -h/2; // vector half height negative

//PVector is the x,y coordinates 
vecA = new PVector(x,y);
vecA.add(vhwp,vhhp,0);
vecB = new PVector(x,y);
vecB.add(vhwn,vhhn,0);
vecC = new PVector(x,y);
vecC.add(vhwn,vhhp,0);
vecD = new PVector(x,y);
vecD.add(vhwp,vhhn,0);

//all w and h are halfed beyond this point
w = w/2;
h = h/2;

//basicly creates the framework in which the drawRect draws upon
rect(vecA.x,vecA.y,w,h);
rect(vecB.x,vecB.y,w,h);
rect(vecC.x,vecC.y,w,h);
rect(vecD.x,vecD.y,w,h);

//creates rectangles based on the new vector values
drawRect(vecA.x,vecA.y,w,h);
drawRect(vecB.x,vecB.y,w,h);
drawRect(vecC.x,vecC.y,w,h);
drawRect(vecD.x,vecD.y,w,h);
  }
}
  void mousePressed() {
  redraw();
}


