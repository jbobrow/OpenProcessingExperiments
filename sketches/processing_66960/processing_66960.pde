
float Count;
float t;



void setup(){
  smooth();
  background(255);
  size(300,300);
  noFill();
  strokeCap(SQUARE);
  frameRate(120);
}


void draw(){
   
  background(255);
  if (frameCount>=360){
     for (int i=frameCount-360;i<=frameCount;i+=20){
        float angle=radians(i);
        t=255 - 255*(frameCount-i)/360 ;
        noFill();
        strokeWeight(20);
        stroke(#484848,t);
        arc(150,150,100,100,angle,angle+PI/20);
  } 
  }

  if (frameCount<360){
    for (int i=0;i<=frameCount;i+=20){
      float angle=radians(i);
      t=255 - 255*(frameCount-i)/( frameCount+1);
      noFill();
      strokeWeight(20);
      stroke(#484848,t);
      arc(150,150,100,100,angle,angle+PI/20);
  }
  }
  
  println(frameCount);
}

