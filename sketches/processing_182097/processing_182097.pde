
float houseW=200;
  float houseH=houseW*1.25;

 float  houseX;
 float houseY;
 float doorH=houseH*.25;
 float doorW=houseW*.2;
 float doorX;
 float doorY;
 float porchstepH=doorH*.25;
 float porchstepW=doorW*1.25;
 float porchstepX;
 float porchstepY;
 float garageH=houseH*.6;
 float garageW=houseW*.8;
 float garageX;
 float garageY;
 float garagedoorH=garageH*.8;
 float garagedoorW=garageW*.85;
 float garagedoorX;
 float garagedoorY;
 float window1H=doorH*.6;
 float window1W=houseW/3;
 float window1X;
 float window1Y;
 float window2H=doorH/2;
 float window2W=window2H;
 float window2X;
 float window2Y;
 
void setup(){
  size(800,600);
  

 houseX= width - houseW*2; houseY=height-houseH;
  
  doorX= houseX+houseW/4; doorY=houseY+houseH/1.5;
  
porchstepX= houseX+houseW/4-doorW*.1; porchstepY=houseY+houseH/1.5+doorH;
  
  garageX=houseX-garageW; garageY=houseY+(houseH-garageH);

 garagedoorX=garageX+garageW*.05; garagedoorY=garageY+garageW*.16;

window1X=houseX+houseW/3; window1Y=houseY+houseH*.2;

window2X=houseX+houseW*.75; window2Y=houseY+houseH*.75;
}
 
  
 
   
void draw(){

  //background
  fill(#7AD1F2);
  rect(0,0,800,300);
  fill(#70BC67);
  rect(0,300,800,300);
  
  //house

fill(#CBA9E3);
  rect(houseX,houseY,houseW,houseH);
//door
fill(#B4997E);
  rect(doorX,doorY,doorW,doorH);
//roof
fill(#767471);
triangle(houseX,houseY,houseX+houseW/2,height-houseH*1.25,houseX+houseW,houseY);
//porchstep
fill(#767471);
rect(porchstepX,porchstepY,porchstepW,porchstepH);
//porchroof
fill(#817E7A);
triangle(doorX-doorW*.25,doorY,doorX+doorW*1.25,doorY,doorX+doorW/2,doorY-.2*doorH);
//garage
fill(#CBA9E3);
rect(garageX,garageY,garageW,garageH);
//garage roof
fill(#817E7A);
triangle(garageX-garageW*.05,garageY,garageX+garageW,garageY,garageX+garageW,garageY-garageH*.25);
//garage door
fill(#DED5CC);
rect(garagedoorX,garagedoorY,garagedoorW,garagedoorH);
//window1
fill(#BCD7E5);
rect(window1X,window1Y,window1W,window1H);
//window2
fill(#BCD7E5);
ellipse(window2X,window2Y,window2W,window2H);
}

