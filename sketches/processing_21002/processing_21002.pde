
float xStart;
float yStart;
float angle;
float angleInc;
float scaler;
float diameter;


void setup(){
  size(500,500);
  smooth();
  xStart=250;
  yStart = 250;
  angle=0;
  angleInc=80;
  scaler=180;
  diameter=120;
  fill(#ec008c);
  stroke(#00ff00);
  strokeWeight(10);
  background(#ec008c);
  frameRate(90);
  
}

void draw(){
 
  float xWave=xStart + (cos(radians(angle))*scaler);
  float yWave =yStart +(sin(radians(angle))*scaler);
  ellipse(xWave,yWave,diameter,diameter);
   xWave +=.5; 
  angle-=angleInc;
  //stops incrementing diameter once the pattern I like is acheived
   if(diameter <= -360){
    diameter += 0;
  } else{
    diameter -=1.2;
    
  }

  //println(diameter);
  

}

