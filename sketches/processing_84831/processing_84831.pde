
float nxScale;
float nyScale;
float n;
float t;
float mouseSpeed;
float mx;
float framerate;
 
void setup(){
  frameRate(200);
  size(800, 400);
  strokeWeight(5);
  smooth();
  noFill();
}
 
void draw(){
  background(56, 115, 157, 50);
  
  for(int j=0; j < height*2.1; j+=3){
    beginShape(POLYGON);
    for(int i=0; i < width; i+=3){
      nxScale = height*1.5;
      nyScale = width/3.2;
      n = noise(i/nxScale, j/nyScale, t/nxScale)*255;   
      stroke(62, 153, 187, n);   
//      stroke(37, 92, 120, n);   
      curveVertex(i, j+n-height*1.2);
    }
    endShape();
  }
  
  mouseSpeed = dist(mouseX, mouseY, pmouseX, pmouseY)/2;
  mx = 30;
  if(mouseSpeed > 0){
//    mx = mouseSpeed;
    framerate = mouseSpeed*2;
  }
  else{
    framerate -= 1;
  }
  
  if(framerate < 60){
    framerate = 60;
  }
  
  t+=mx;
//  println(framerate);
}

//inspiration and reference: http://www.openprocessing.org/sketch/17846

