
float glowLight,angle,x,y,cos,sin,radians,ellSize;
int i,dir;
PImage myImg;
int trailNum = 200;
int prevx[];
int prevy[];
float counter;
float counter2;
//int trailNum and prevx/y, plus counter are similar to codes from Noah Loock
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
void setup(){
  size(700,700);
  colorMode(HSB,360,100,100,100);
  myImg = loadImage("LOL.png");
  ellSize = 0;
  prevx = new int[trailNum];
  prevy = new int[trailNum];
  
  counter = 0.0;
  counter2 = 0.0;
  smooth();
 
}

//#################################################################
void draw(){

  counter ++;
  counter2 --;
  //******************************************************************
for(int i = 1; i < trailNum; i++){
  prevx[i - 1] = prevx[i];
  prevy[i - 1] = prevy[i];
}
  prevx[trailNum - 1] = mouseX;
  prevy[trailNum - 1] = mouseY;
  for(int i = 0; i < trailNum; i ++){
    ellipse(prevx[i], prevy[i], 15, 15);
  }

//********************************************************************
if(millis() > 25000 && millis() < 30000){
  
  rotate(counter*((TWO_PI/360)*10));
  imageMode(CENTER);
  image(myImg,width/2,height/2);
  
/* if(millis() > 30000 && millis() < 40000){
   translate(700,700);
   rotate(counter2*TWO_PI/360);
   image(myImg,width,height);
  */
  //this didnt work
  
 }
 
//two pi stuff was made possible with help from Noah Loock

  //******************************************************************
  
  x=5*cos(radians(angle+5))*sin(radians(angle));
  y=200*sin(radians(angle))*cos(radians(angle+3));
  ellipse(x+width,y+height/2,90,90);
  ellipse(x+width/2,y+height,90,90);
  ellipse(x+width,y+height,90,90);
  ellipse(x+width/2,y+height/2,90,90);
  ellipse(x,y+height/2,90,90);
  ellipse(x,y+height,90,90);
  ellipse(x,y,90,90);
  ellipse(width/2,y,90,90);
  ellipse(width,y,90,90);
  noFill();
  //*******************************************************************
  //background(0);
    if (dist(mouseX,mouseY,350,350)< 50){
    //(mouseX < 360 && mouseY < 360 && mouseX > 340 && mouseY > 340){
    
    }    
  
  myTri
  (mouseX,mouseY);
}

//*********************************************************************
void myTri(float posX, float posY){
 line(posX,posY,posX+10,posY+20);
 line(posX+10,posY+20,posX+30,posY+12);
 line(posX,posY,posX+30,posY+12);
 stroke(random(360),100,100);
//*********************************************************************
glowLight=abs(150*sin(radians(angle)));
  fill(glowLight,131,65,95);
  ellipse(width/2,height/2,5,5);
  angle+=60; 
//*********************************************************************
 noFill();
 i+=dir;
  ellipse(height/2,width/2,i,i++);
  //line(mouseX,mouseY,pmouseX,pmouseY);
  stroke(random(255),random(255),random(255));
  fill(#CEFC59);
  if(i > 250){
    dir=-5;
  }
  if(i < 1000){
    dir=1;
  }

//*******************************************************************
 noFill();
 i+=dir;
  ellipse(height/2,width/2,ellSize,ellSize);
  ellSize ++;
  
  if (ellSize > 500){
    ellSize = -ellSize;
  stroke(50);
  fill(#CEFC59);
  }


//*******************************************************************
if(millis() > 15000 && millis() < 22000){
  background(255);
  ellipse(350,175,ellSize,ellSize);
  ellipse(350,525,ellSize,ellSize);
  fill(0);
  ellipse(175,350,ellSize,ellSize);
  ellipse(525,350,ellSize,ellSize);
  ellSize ++;
  line(mouseX,mouseY,pmouseX,pmouseY);
  stroke(255);
}
}

//*******************************************************************



