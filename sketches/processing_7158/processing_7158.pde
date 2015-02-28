

//LEFT EYE
/////////////////////////////////////////////
float x=200;
float y=230;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
/////////////////////////////////////////////
//RIGHT EYE
/////////////////////////////////////////////
float rx=440;
float ry=230;
float rx1;
float ry1;
float rx2;
float ry2;
float rx3;
float ry3;
/////////////////////////////////////////////
float easing = 0.04;
//Left Eye center - 200, 230
// Right Eye center - 440,230



//LEFT EYE
/////////////////////////////////////////////
float LEx = 200;
float LEy = 230;
//TOP LEFT
float tx = x-35;
float ty = y-40;
//BOTTOM LEFT
float tx3 = x-35;
float ty3 = y+40;
//BOTTOM RIGHT
float tx1 = x+35;
float ty1 = y+40;
//TOP RIGHT
float tx2 = x+35;
float ty2 = y-40;
/////////////////////////////////////////////
//RIGHT EYE
/////////////////////////////////////////////
float REx = 440;
float REy = 230;
//TOP LEFT
float rtx = rx-35;
float rty = ry-40;
//BOTTOM LEFT
float rtx3 = rx-35;
float rty3 = ry+40;
//BOTTOM RIGHT
float rtx1 = rx+35;
float rty1 = ry+40;
//TOP RIGHT
float rtx2 = rx+35;
float rty2 = ry-40;
/////////////////////////////////////////////
PImage shadow;
PImage border;
////////////////////
void setup(){
size(640,480);
smooth();
noStroke();
fill(255);

//PImage shadow;
shadow = loadImage("shadow.png");
//image(shadow,640,480);
//noLoop();

//PImage border;
border = loadImage("border.png");
//image(border,640,480);
}


void draw(){
background (0);
cursor(CROSS);
//println(x);
fill(255);
noStroke();
image(shadow,0,0);

float backd = dist(mouseX,mouseY,320,240);

/////////// FILL COLOR//////////
float R = map(backd,0,240,10,255);
float G = map(backd,0,240,0,100);
float B = map(backd,0,240,255,10);
float T = map(backd,0,300,250,255);

fill(R,G,B,T);

//////////////// BACKGROUND WHITE DOTS
//////////////// LEFT EYE////////////////
for (int i = 110; i < 300; i = i+30) {
  for (int j = 140; j < 350; j = j+30) {
      
   float m = map(backd,0,480,3,20);

    ellipse(i, j, m,m);
  }
}

//////////////// RIGHT EYE////////////////
for (int k = 350; k < 600; k = k+30) {
  for (int l = 140; l < 350; l = l+30) {
   
    float n = map(backd,0,480,20,3);
    ellipse(k, l, n,n);
  }
}
////////////////
image(border,0,0);
/////////////////
/////COLOR RINGS
stroke(252,R,G,20);
strokeWeight(30);
noFill();
float mx = constrain(mouseX,200,440);
float my = constrain(mouseY,230,230);

float ix= 440-mouseX;
float iy= 440-mouseY;

float iix= constrain(ix,220,440);
float iiy= constrain(iy,200,440);

ellipse(mx,240,my,my);
ellipse(iix,240,iiy,iiy);

//////////////////
noStroke();
fill(R,G,B,T);


//////////
float LEd = dist(mouseX, mouseY, LEx, LEy);
float REd = dist(mouseX, mouseY, REx, REy);


//LEFT EYE
/////////////////////////////////////////////
 if (LEd<50){
    fill(0,0,255,100);
  //easing
  float targetX = tx;
  float targetY = ty;
  //
  float targetX1 = tx1;
  float targetY1 = ty1;
  //
  float targetX2 = tx2;
  float targetY2 = ty2;
  //
  float targetX3 = tx3;
  float targetY3 = ty3;
  //LEFT EYE
/////////////////////////////////////////////
  x += (targetX -x)*easing;
  y += (targetY -y)*easing;
  x1 += (targetX1 -x1)*easing;
  y1 += (targetY1 -y1)*easing;
  x2 += (targetX2 -x2)*easing;
  y2 += (targetY2 -y2)*easing;
  x3 += (targetX3 -x3)*easing;
  y3 += (targetY3 -y3)*easing;
/////////////////////////////////////////////
}else{
//LEFT EYE
/////////////////////////////////////////////  
 x = 200;
 y = 230;
 x1 = 200;
 y1 = 230;
 x2 = 200;
 y2 = 230;
 x3 = 200;
 y3 = 230;
}

/////////////////////////////////////////////
/////////////////////////////////////////////
//RIGHT EYE
/////////////////////////////////////////////
 if (REd<50){
  fill(255,0,0,100);
  //easing
  float targetrX = rtx;
  float targetrY = rty;
  //
  float targetrX1 = rtx1;
  float targetrY1 = rty1;
  //
  float targetrX2 = rtx2;
  float targetrY2 = rty2;
  //
  float targetrX3 = rtx3;
  float targetrY3 = rty3;
 
//RIGHT EYE
/////////////////////////////////////////////
  rx += (targetrX -rx)*easing;
  ry += (targetrY -ry)*easing;
  rx1 += (targetrX1 -rx1)*easing;
  ry1 += (targetrY1 -ry1)*easing;
  rx2 += (targetrX2 -rx2)*easing;
  ry2 += (targetrY2 -ry2)*easing;
  rx3 += (targetrX3 -rx3)*easing;
  ry3 += (targetrY3 -ry3)*easing;
/////////////////////////////////////////////
}else{
//RIGHT EYE
/////////////////////////////////////////////  
 rx = 440;
 ry = 230;
 rx1 = 440;
 ry1 = 230;
 rx2 = 440;
 ry2 = 230;
 rx3 = 440;
 ry3 = 230;
}




///////////////////////////////////////////// 
if(mousePressed) {
fill(0,255);
triangle(320,267,-100,50,740,50);
//float rad = radians(20);
//translate(200,160);
//rotate(rad);
//rectMode(CENTER);
//rect(0,0,275,80);

//////RIGHT
//translate(220,-80);
//float rad1 = radians(140);
//rotate(rad1);
//rectMode(CENTER);
//rect(0,0,275,80);
}



//LEFT EYE
/////////////////////////////////////////////
//TOP LEFT
 ellipse(x,y,20,20);
 ellipse(x-30,y-30,20,20);
 ellipse(x-60,y-60,20,20);
//BOTTOM RIGHT
 ellipse(x1,y1,20,20);
 ellipse(x1+30,y1+30,20,20);
 ellipse(x1+60,y1+60,20,20);
 //TOP RIGHT
 ellipse(x2,y2,20,20);
 ellipse(x2+30,y2-30,20,20);
 ellipse(x2+60,y2-60,20,20);
 //BOTTOM LEFT
 ellipse(x3,y3,20,20);
 ellipse(x3-30,y3+30,20,20);
 ellipse(x3-60,y3+60,20,20);
/////////////////////////////////////////////
//RIGHT EYE
/////////////////////////////////////////////
//TOP LEFT
 ellipse(rx,ry,20,20);
 ellipse(rx-30,ry-30,20,20);
 ellipse(rx-60,ry-60,20,20);
//BOTTOM RIGHT
 ellipse(rx1,ry1,20,20);
 ellipse(rx1+30,ry1+30,20,20);
 ellipse(rx1+60,ry1+60,20,20);
 //TOP RIGHT
 ellipse(rx2,ry2,20,20);
 ellipse(rx2+30,ry2-30,20,20);
 ellipse(rx2+60,ry2-60,20,20);
 //BOTTOM LEFT
 ellipse(rx3,ry3,20,20);
 ellipse(rx3-30,ry3+30,20,20);
 ellipse(rx3-60,ry3+60,20,20);
/////////////////////////////////////////////
  
}   



