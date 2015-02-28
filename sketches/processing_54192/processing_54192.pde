
//darkblue//
float posX1 = 0;
float posY1 = 240;
float circleSize1 = 40;
color circleColor1 = color(105,116,137);

//greypurple// 
float posX2 = 0;
float posY2 = 100;
float circleSize2 = 140;
color circleColor2 = color(167,156,162);

//darkgreen//
float posX3 = 0;
float posY3 = 300;
float circleSize3 = 60;
color circleColor3 = color(187,187,179);

//lightgreen//
float posX4 = 0;
float posY4 = 400;
float circleSize4 = 200;
color circleColor4 = color(220,220,193);
 
void setup(){
  size(640,480);
}
 
void draw(){
  background(234,227,217);
 
  noStroke();
  ellipseMode(CENTER);
  fill(circleColor1);
  ellipse(posX1,posY1,circleSize1,circleSize1);
  fill(circleColor2);
  ellipse(posX2,posY2,circleSize2,circleSize2);
  fill(circleColor3);
  ellipse(posX3,posY3,circleSize3,circleSize3);
  fill(circleColor4);
  ellipse(posX4,posY4,circleSize4,circleSize4);

  if(posX4<width){
    posX4 += 1;
  } else{
    posX4 = 0;
  }
   
  if(posX3<width){
    posX3 += 5;
  } else{
    posX3 = 0;
  }
 
  if(posX2<width){
    posX2 += 8;
  } else{
    posX2 = 0;
  }
  if(posX1<width){
    posX1 += 2;
  } else{
    posX1 = 0;
  }
 
}

