
//purpleleft//
float posX1 = 320;
float posY1 = 0;
float rectSize1 = (320);
float rectSize2 = (120);
color rectColor1 = color(76,27,51);

//purpleright//
float posX2 = 0;
float posY2 = 0;

//yellowleft//
float posX3 = 320;
float posY3 = 120;
float rectSize3 = (320);
float rectSize4 = (50);
color rectColor2 = color(239,230,114);

//yellowright//
float posX4 = 0;
float posY4 = 120;

//greenleft//
float posX5 = 320;
float posY5 = 170;
float rectSize5 = (320);
float rectSize6 = (90);
color rectColor3 = color(152,169,66);

//greenright//
float posX6 = 0;
float posY6 = 170;

//blueleft//
float posX7 = 320;
float posY7 = 260;
float rectSize7 = (320);
float rectSize8 = (160);
color rectColor4 = color(45,105,96);

//blueright//
float posX8 = 0;
float posY8 = 260;

//darkgreenleft//
float posX9 = 320;
float posY9 = 420;
float rectSize9 = (320);
float rectSize10 = (60);
color rectColor5 = color(20,29,20);

//darkgreenright//
float posX10 = 0;
float posY10 = 420;
void setup(){
  size(640,480);
}
 
void draw(){
  background(0);  
     
  noStroke();
  rectMode(CORNER);
  //purple//
  fill(rectColor1);
  rect(posX1,posY1,rectSize1,rectSize2);
  rect(posX2,posY2,rectSize1,rectSize2);
  //yellow//
  fill(rectColor2);
  rect(posX3,posY3,rectSize3,rectSize4);
  rect(posX4,posY4,rectSize3,rectSize4);
  //green//
  fill(rectColor3);
  rect(posX5,posY5,rectSize5,rectSize6);
  rect(posX6,posY6,rectSize5,rectSize6);
  //blue//
  fill(rectColor4);
  rect(posX7,posY7,rectSize7,rectSize8);
  rect(posX8,posY8,rectSize7,rectSize8);
  //darkgreen//
  fill(rectColor5);
  rect(posX9,posY9,rectSize9,rectSize10);
  rect(posX10,posY10,rectSize9,rectSize10);
    
  
//animatepurple//
  if(posX1<640){
    posX1 += 3;
  } else{
    posX1 = 320;
  }

  if(posX2>0-320){
    posX2 -= 3;
  } else{
    posX2 = 0;
  }
  
//animateyellow//
  if(posX3<640){
    posX3 += 4;
  } else{
    posX3 = 320;
  }

  if(posX4>0-320){
    posX4 -= 4;
  } else{
    posX4 = 0;
  }
  
//animategreen//
  if(posX5<640){
    posX5 += 2;
  } else{
    posX5 = 320;
  }

  if(posX6>0-320){
    posX6 -= 2;
  } else{
    posX6 = 0;
  }
    
//animateblue//
  if(posX7<640){
    posX7 += 5;
  } else{
    posX7 = 320;
  }

  if(posX8>0-320){
    posX8 -= 5;
  } else{
    posX8 = 0;
  }
  //animatedarkgreen//
  if(posX9<640){
    posX9 += 1;
  } else{
    posX9 = 320;
  }

  if(posX10>0-320){
    posX10 -= 1;
  } else{
    posX10 = 0;
  }
  


}

