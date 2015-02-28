
//todo get away from frame count ex: myframecount++, homescreen
float magnitude;
  float anchorY;
  float anchorX;
  float ghostX;
  float ghostY;
  float speed;
  
  float ballX;
  float ballY;
  int invisiball=2;//1=regular,2=sin fill, 3=invisible
  
  float ghostLineDist;
  float mouseLineDist;

  float score;

void setup(){
  size(500,500); 
  smooth();
  colorMode(HSB,1);
  score=1;
  
  
}

void draw(){
  speed=400-constrain(20*log(frameCount*frameCount),0,380);//should speed up
  println(20*log(frameCount*frameCount));
 // background(cos(frameCount/50.0),.7,.4,.2);
  
  
  fill(1,0,.92,.02);
  ellipse(250,250,width,height); 
  
  //fill(0,0,0,1);
  orbit(speed);
  score+=ghostLineDist/100;
  score+=mouseLineDist/100;
  ball();
  
  if(collision(ballX,ballY)){
    background(0);
  }

}
void orbit(float speed){
   magnitude=height/2;//circumscribes path to stage
   anchorY=sin(frameCount/speed)*magnitude+250;//add 250 to displace center of orbit to center of screen
   anchorX=cos(frameCount/speed)*magnitude+250;
   ghostY=width-mouseX;
   ghostX=height-mouseY;
   
   mouseLineDist=dist(mouseX,mouseY,anchorX,anchorY);
   ghostLineDist=dist(ghostX,ghostY,anchorY,anchorX);
   
   float pointIntensityM=map(mouseLineDist,0,height,0,1);
   float pointIntensityG=map(ghostLineDist,0,height,0,1);
   stroke(pointIntensityM,1,1);
  line(mouseX,mouseY, anchorX,anchorY);
  stroke(pointIntensityG,1,1);
  line(ghostX,ghostY,anchorY,anchorX);
  noStroke();
}

void ball(){
  if(invisiball==1){
    fill(0);}
  else if(invisiball==2){
    fill(sin(frameCount/speed));}
  else if(invisiball==3){
    fill(1,0,.92);}
  
  float ballMag=cos(frameCount/90.0)*height/3;//(frameCount%height)/2.7;//2.7 keeps ball inside arean at all times, prevents impossible edge contact
  float speeed=50;
  ballX=-sin(frameCount/speed)*ballMag+250+sin(frameCount/20.0)*20;
  ballY=cos(frameCount/speed)*ballMag+250+sin(frameCount/20.0)*20;
  //ballX=-sin(ballMag);
  //ballY=cos(ballMag);
  ellipse(ballX,ballY,10,10); 
}

boolean collision( float ballX,  float ballY){
  if (circleLineIntersect(mouseX,mouseY,anchorX,anchorY,ballX,ballY,10)||circleLineIntersect(ghostX,ghostY,anchorY,anchorX,ballX,ballY,10)){
    return true;
  }
  else{
    return false;
  }
 
}

// Code adapted from Paul Bourke:
// http://local.wasp.uwa.edu.au/~pbourke/geometry/sphereline/raysphere.c
boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr ) {
  float dx = x2 - x1;
  float dy = y2 - y1;
  float a = dx * dx + dy * dy;
  float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy));
  float c = cx * cx + cy * cy;
  c += x1 * x1 + y1 * y1;
  c -= 2 * (cx * x1 + cy * y1);
  c -= cr * cr;
  float bb4ac = b * b - 4 * a * c;
 
  //println(bb4ac);
 
  if (bb4ac < 0) {  // Not intersecting
    return false;
  }
  else {
     
    float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a);
    float ix1 = x1 + mu*(dx);
    float iy1 = y1 + mu*(dy);
    mu = (-b - sqrt(b*b - 4*a*c )) / (2*a);
    float ix2 = x1 + mu*(dx);
    float iy2 = y1 + mu*(dy);
 
    // The intersection points
    //ellipse(ix1, iy1, 10, 10);
    //ellipse(ix2, iy2, 10, 10);
     
    float testX;
    float testY;
    // Figure out which point is closer to the circle
    if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy)) {
      testX = x2;
      testY = y2;
    } else {
      testX = x1;
      testY = y1;
    }
     
    if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2)) {
      return true;
    } else {
      return false;
    }
  }
}


