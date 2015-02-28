
float small = 0;
float medium = 0;
float largex1 = 0;
float largex2 = 0;
float largex3 = 0;
float largey1 = 0;
float largey2 = 0;
float largey3 = 0;


float smallspeed = 1;
float mediumspeed = 1;
float largex1speed = 1;
float largex2speed = 1;
float largex3speed = 1;
float largey1speed = 1;
float largey2speed = 1;
float largey3speed = 1;


void setup(){
  size(500,500);
  background(150);
  small = random(500);
  smallspeed = .5;
  medium = random(500);
  mediumspeed = 2;
  largex1 = random(500);
  largex2 = random(500);
  largex3 = random(500);  
  largex1speed = 10;
  largex2speed = 10;
  largex3speed = 10;
  largey1 = random(500);
  largey2 = random(500);
  largey3 = random(500);
  largey1speed = 10;
  largey2speed = 10;
  largey3speed = 10;
  
}

void draw(){
  background(150);
  
  if (small<=0+10){
    smallspeed = smallspeed *-1;
  }
  if (small>=500-10){
    smallspeed = smallspeed*-1;
  }
  small = small+smallspeed;
  noStroke();
  fill(204,234,250,25);
  ellipse(small,150,20,20);
  
  
  
  if (medium<=0){
    mediumspeed = mediumspeed *-1;
  }
  if (medium>=500-40){
    mediumspeed = mediumspeed*-1;
  }
   medium = medium+mediumspeed;
   fill(87,175,114);
   rect(250,medium,40,40);
   
   
   if (largex1<=0){
    largex1speed = largex1speed *-1;
  }
  if (largex1>=500){
    largex1speed = largex1speed*-1;
  }
  if (largex2<=0){
    largex2speed = largex2speed *-1;
  }
  if (largex2>=500){
    largex2speed = largex2speed*-1;
  }
  if (largex3<=0){
    largex3speed = largex3speed *-1;
  }
  if (largex3>=500){
    largex3speed = largex3speed*-1;
  }
  if (largey1<=0){
    largey1speed = largey1speed *-1;
  }
  if (largey1>=500){
    largey1speed = largey1speed*-1;

  }
  if (largey2<=0){
    largey2speed = largey2speed *-1;
  }
  if (largey2>=500){
    largey2speed = largey2speed*-1;

  }
   if (largey3<=0){
    largey3speed = largey3speed *-1;
  }
  if (largey3>=500){
    largey3speed = largey3speed*-1;

  }
  largex1 = largex1+largex1speed;
  largex2 = largex2+largex2speed;
  largex3 = largex3+largex3speed;
  largey1 = largey1+largey1speed;
  largey2 = largey2+largey2speed;
  largey3 = largey3+largey3speed;
   stroke(0);
   fill(210,49,51);
   triangle(largex1,largey1,largex2,largey2,largex3,largey3);
}

