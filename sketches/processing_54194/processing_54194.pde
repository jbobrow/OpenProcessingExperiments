
//darkblue//
float posX1 = 320;
float posX2 = 230;
float posX3 = 140;
float posX4 = 410;
float posX5 = 500;
float posY1 = 480;
float circleSize1 = 80;
color circleColor1 = color(114,130,150);

//mediumblue//
float posX6 = 320;
float posX7 = 240;
float posX8 = 160;
float posX9 = 400;
float posX10 = 480;
float posY2 = 480;
float circleSize2 = 70;
color circleColor2 = color(67,154,171);

//lightblue//
float posX11 = 320;
float posX12 = 250;
float posX13 = 190;
float posX14 = 390;
float posX15 = 460;
float posY3 = 480;
float circleSize3 = 60;
color circleColor3 = color(0,202,189);

//red//
float posX16 = 320;
float posX17 = 280;
float posX18 = 240;
float posX19 = 360;
float posX20 = 400;
float posY4 = 480;
float circleSize4 = 30;
color circleColor4 = color(255,91,0);
 
void setup(){
  size(640,480);
}
 
void draw(){
  background(0);

  noStroke();
  ellipseMode(CENTER);
  fill(circleColor4);
  ellipse(posX16,posY4,circleSize4,circleSize4);
  ellipse(posX17,posY4,circleSize4,circleSize4);
  ellipse(posX18,posY4,circleSize4,circleSize4);
  ellipse(posX19,posY4,circleSize4,circleSize4);
  ellipse(posX20,posY4,circleSize4,circleSize4);
  
    noStroke();
  ellipseMode(CENTER);
  fill(circleColor3);
  ellipse(posX11,posY3,circleSize3,circleSize3);
  ellipse(posX12,posY3,circleSize3,circleSize3);
  ellipse(posX13,posY3,circleSize3,circleSize3);
  ellipse(posX14,posY3,circleSize3,circleSize3);
  ellipse(posX15,posY3,circleSize3,circleSize3);
  
  
  noStroke();
  ellipseMode(CENTER);
  fill(circleColor2);
  ellipse(posX6,posY2,circleSize2,circleSize2);
  ellipse(posX7,posY2,circleSize2,circleSize2);
  ellipse(posX8,posY2,circleSize2,circleSize2);
  ellipse(posX9,posY2,circleSize2,circleSize2);
  ellipse(posX10,posY2,circleSize2,circleSize2);
  
   
  noStroke();
  ellipseMode(CENTER);
  fill(circleColor1);
  ellipse(posX1,posY1,circleSize1,circleSize1);
  fill(circleColor1);
  ellipse(posX2,posY1,circleSize1,circleSize1);
  fill(circleColor1);
  ellipse(posX3,posY1,circleSize1,circleSize1);
  fill(circleColor1);
  ellipse(posX4,posY1,circleSize1,circleSize1);
  fill(circleColor1);
  ellipse(posX5,posY1,circleSize1,circleSize1);


  if(posY1>-80){
    posY1 -= 1;
  } else{
    posY1 = 480+80;
  }

/*  if(posY2>-70){
    posY2 -= 2;
  } else{
    posY2 = 480+70;
  } */
  
    if(posY2>posY1){
    posY2 -= 2;
  } else{
    posY2 = 480+70;
  }

  if(posY3>posY2){
    posY3 -= 3;
  } else{
    posY3 = 480+60;
  }

  if(posY4>posY3){
    posY4 -= 4;
  } else{
    posY4 = 480+30;
  }

}

