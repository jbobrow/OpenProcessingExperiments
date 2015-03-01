
int winSize=400;
int center=winSize/2;
int targetWidth=200;
int triangleSize=50;
int rectSize=50;

  float targetW=50;
  float targetH=50;
  float rectWidth=targetW/2;
  float rectHeight=targetW/2;
  float circleStart=0;
  float circleEnd=0;
  boolean rebuildCircle=true;
  float circleSpeed=PI/32;


int x=200;
int y=200;

void setup(){
  size(400,400);
}

void draw(){
  strokeWeight(1);
    stroke(0, 0, 0);
    
    fill(255,255,255);
    rect(0,0,width,height);    
    
    fill(255, 0, 0);
    // ellipse(x,y,targetW,targetH);
    for (float i=circleStart; i<circleEnd; i+=circleSpeed) {
      fill(255, (int)(abs((float)(PI-i))*100), 0);
      arc(x, y, targetW, targetH, i, i+PI/8);
    }

    fill(0, 255, 0);

    if (rebuildCircle) {
      circleEnd+=circleSpeed;
    } else {
      circleStart+=circleSpeed;
    }
    if (circleStart>2*PI) {
      circleEnd=0;
      circleStart=0;
      rebuildCircle=true;
    }
    if (circleEnd>2*PI-PI/8) {
      //circleEnd=2*PI-PI/8;
      rebuildCircle=false;
    }
    // fill(255,(int)(abs((float)(PI-handlePos))*100),darken);
    //arc(x,y,targetW,targetH,handlePos,handlePos+PI/8); 

    fill(0, 0, 255, 80);

    triangle(x, y-rectHeight, 
    x+rectWidth*sin(PI/3), y+rectHeight*sin(PI/3), 
    x-rectWidth*sin(PI/3), y+rectHeight*sin(PI/3));
  
    fill(0, 255, 0, 80);    

    rect(x-rectWidth/2, y-rectHeight/2, rectWidth, rectHeight);

    fill(0, 0, 0);

    line(x-rectWidth, y, x+rectWidth, y);
}


