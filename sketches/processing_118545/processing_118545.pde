
int rectX = 380;
int rectY = 365;
boolean left= false;
boolean right= false;
boolean up= false;
boolean down= false;
PImage UFO;
PImage bg;
PImage Sten;
float y= 0;
float MeteorX = random(0,865);
float y2= 0;
float MeteorX2 = random(0,865);
float y3= 0;
float MeteorX3 = random(0,865);
float y4= 0;
float MeteorX4 = random(0,865);
float y5= 0;
float MeteorX5 = random(0,865);

/*@pjs preload="moonwalk.jpg";*/


void setup(){
  size(870,400);
  
  frameRate(60);
  bg= loadImage("freshbackground.jpg");
  UFO= loadImage("UFO.png");
  Sten= loadImage("Meteor1.png");
  
}

void draw(){
 
    background(bg);
     
   //UFO'en
    noFill();
    image(UFO,rectX,rectY);
    
    
 
    //Meteor1
    image(Sten,MeteorX,y);
    
    y = y + 3;
    
    if (y>400) {
      y=-1;
      MeteorX=random(0,865);
    }
    if (point_distance(MeteorX,y,rectX,rectY)<25){
        exit();
      }
    
    //Meteor2
    image(Sten,MeteorX2,y2);
    
    y2 = y2 + 3;
    
    if (y2>400) {
      y2=-1;
      MeteorX2=random(0,865);
    }
    if (point_distance(MeteorX2,y2,rectX,rectY)<25){
        exit();
      }
    
    //Meteor3
    image(Sten,MeteorX3,y3);
    
    y3 = y3 + 3;
    
    if (y3>400) {
      y3=-1;
      MeteorX3=random(0,865);
    }
    if (point_distance(MeteorX3,y3,rectX,rectY)<25){
        exit();
      }
    
    //Meteor4
    image(Sten,MeteorX4,y4);
    
    y4 = y4 + 3;
    
    if (y4>400) {
      y4=-1;
      MeteorX4=random(0,865);
    }
    if (point_distance(MeteorX4,y4,rectX,rectY)<25){
        exit();
      }
    
    //Meteor5
    image(Sten,MeteorX5,y5);
    
    y5 = y5 + 3;
    
    if (y5>400) {
      y5=-1;
      MeteorX5=random(0,865);
    }
    if (point_distance(MeteorX5,y5,rectX,rectY)<25){
        exit();
      }
    
    
    
  //border  
    if (left==true){
      rectX=rectX-2;
    }
    if (right==true){
      rectX=rectX+2;
    }
    if (up==true){
      rectY=rectY-2;
    }
    if (down==true){
      rectY=rectY+2;
    }
     if (rectX<0) {rectX+=819;}
     if (rectX>=820) {rectX=0;}
     if (rectY<0) {rectY+=374;}
     if (rectY>=380) {rectY=0;}
}
float point_distance(float x1, float y1, float x2, float y2) {
  float dis = abs(sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)));
  return dis;
}
void keyPressed() {
  if (key=='a'||key=='A') {
    left = true;
  }  
  if (key=='d'||key=='D') {
    right = true;
  }
   if (key=='w'||key=='W') {
    up = true;
  }
  if (key=='s'||key=='S') {
    down = true;
  }
}

void keyReleased() {
  if (key=='a'||key=='A') {
    left = false;
  }
  if (key=='d'||key=='D') {
    right = false;
  }
  if (key=='w'||key=='W') {
    up = false;
  }
  if (key=='s'||key=='S') {
    down = false;
  }
}


