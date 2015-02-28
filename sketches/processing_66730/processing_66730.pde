
PFont myFont;
int fontPosY = 250;
float circleX;
float circleY;
float vel;
float velx;

void setup() {
size(500,500);
noStroke();
smooth();

circleX = 0;
circleY = 0;
vel = 30;
velx = 50;
frameRate(60);
}

void draw(){
 background(240,240,240);
 myFont= loadFont("CooperBlackStd-Italic-48.vlw");
 textFont(myFont);
 fill(250,220,20);
 text("CATCH ME!", 100,fontPosY+30);
  fill(mouseX,mouseY,100);
  ellipse(circleX,circleY,50,50);
  
  circleY +=vel;
  circleX +=velx;
  
  if((circleY<0)||(circleY>height)){
    vel = vel* -1;
}

 if((circleX<0)||(circleX>width)){
   velx*= -1;
}


}

