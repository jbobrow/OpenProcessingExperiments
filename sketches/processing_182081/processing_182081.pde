
//declare variables house 1
float house1W=random(20, 50);
float house1H=house1W*1.25;
float house1X;
float house1Y;
float door1W=house1W*.1875;
float door1H=house1H*.25;
float door1X;
float door1Y;
float window1H=house1H*.125;
float window1W=house1W*.125;
float window1X;
float window1Y;

//declare variables house 2
float house2W=house1W*.8;
float house2H=house2W*.9;
float house2X;
float house2Y;
float door2W=house2W*.1875;
float door2H=house2H*.25;
float door2X;
float door2Y;
float window2H=house2H*.125;
float window2W=house2W*.125;
float window2X;
float window2Y;


//balloon time
float balloonH=house1H*.5;
float balloonW=house1W*.5;
float balloonX=random(0,300);
float balloonY=random(0,300);
float balloonspeedX=2;
float balloonspeedY=1;

float balloonColorR;
float balloonColorG;
float balloonColorB;

void setup()
{
  size(300,300);
  
  //locate first house
  house1X=width-house1W*2;
  house1Y=height-house1W*2;
  
  //locate first door
  door1X=width-house1W*2+house1W*.625;
  door1Y=height-house1W*2+(house1H-door1H);
  
  //locate first window
  window1X=width-house1W*2+house1W*.125;
  window1Y=height-house1W*2+house1H*.125;
  
  //locate second house
  house2X=width-house2W*4;
  house2Y=height-house2H*6;
  
    //locate second door
  door2X=width-house2W*4+house2W*.625;
  door2Y=height-house2H*6+(house2H-door2H);
  
  //locate second window
  window2X=width-house2W*4+house2W*.125;
  window2Y=height-house2H*6+house2H*.125;


balloonColorR=(random(255));
balloonColorG=(random(255));
balloonColorB=(random(255));


}

void draw(){
  background(255,255,255);
  
  //draw balloon
fill(balloonColorR,balloonColorG,balloonColorB);
line(balloonX,balloonY,balloonX+balloonW*2,balloonY+balloonH*2);
ellipse(balloonX,balloonY,balloonH,balloonW);

  //balloon control
  
  balloonX=balloonX+balloonspeedX;
  balloonY=balloonY+balloonspeedY;
  if (balloonX>width){
    balloonspeedX=balloonspeedX*-1;
  }
    
      if (balloonY>height){
    balloonspeedY=balloonspeedY*-1;
  }
        if (balloonY<0){
    balloonspeedY=balloonspeedY*-1;
  }
        if (balloonX<0){
    balloonspeedX=balloonspeedX*-1;
  }
  
//draw house1
fill(255,255,255);
  rect(house1X,house1Y,house1W,house1H);
//door1
rect(door1X,door1Y,door1W,door1H);
//window1
rect(window1X,window1Y,window1W,window1H);
//roof1
triangle(house1X,house1Y,house1X+house1W,house1Y,house1X+house1W/2,house1Y-house1H*.2);

//draw house2
fill(255,255,255);
  rect(house2X,house2Y,house2W,house2H);
//door2
rect(door2X,door2Y,door2W,door2H);
//window2
rect(window2X,window2Y,window2W,window2H);
//roof2
triangle(house2X,house2Y,house2X+house2W,house2Y,house2X+house2W/2,house2Y-house2H*.2);





}


