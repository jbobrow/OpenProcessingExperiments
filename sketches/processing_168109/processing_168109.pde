
float num, pathR, pathG, pathB;

float num, pathA, pathB, pathC;
int backgroundColor = 0;
boolean change = true;
float delta = 8; 
void setup() {
  size(640, 640, P3D);
  background(0);
}
 
void draw() {
  fill(backgroundColor,20);
  
  rect(-1,-1, width+1, height+1);
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=2) {
    
    float angle = sin(i+num)*50;
  
    float x = sin(radians(i))*(150+angle);
    float y = cos(radians(i))*(150+angle);
 //making the flower shape
   
    PVector X = new PVector (sin(radians(i))*(150+angle),cos(radians(i))*(150+angle));
    PVector Y = new PVector (sin(radians(i+1))*(150+angle),cos(radians(i+1))*(150+angle));
    float Xr = sqrt(X.x*X.x+X.y*X.y);
    float Yr = sqrt(Y.x*Y.x+Y.y*Y.y);
    float alpha = PVector.angleBetween(X,Y);
    float o = Xr*Yr*sin(alpha);
    float oz = abs(o);
    float c = map(oz, 0,1000,0,255);
    
    
    pathA = (((float)255/width)*mouseX)+125*sin(i+num*3);
    pathB = 125*sin(i+num*3);
    pathC = (((float)255/height)*mouseY)+125*sin(i+num*3);
     
    
    fill(c, pathB , c);
   
    ellipse(x, y, angle/2, angle/2);
   noStroke();
 // making the filling color with vector  
   
  }
  num+=0.01;
   sphere(15);
   //making the sphere in the center point
}
 
 
  
void mousePressed(){
  if(change && backgroundColor == 255){
    backgroundColor = 0;
    change = false;
  }
  if(change && backgroundColor == 0){
    backgroundColor = 255;
    change = false;
  }
}


 
void mouseReleased(){
  change = true;
}// express the day and night
