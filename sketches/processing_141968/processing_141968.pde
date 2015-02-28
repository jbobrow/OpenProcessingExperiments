



void setup() {
  size(500,500);
  background(0);
  smooth();
  frameRate(20);
  colorMode(RGB,255);

  

}

void drawCircle(int x,int y,int r){

  doSquiggles(x,y,r);
  doSquiggles(x,y,r);

  
}



void draw(){

  stroke(107,197,154,100);
  drawCircle( 250,250, 200);
  stroke(238,239,140,100);
  drawCircle( 250,250, 150);
  stroke(107,197,154,100);
  drawCircle( 250,250, 100);
   stroke(238,239,140,100);
  drawCircle( 250,250, 250);
   stroke(107,197,154,100);
   drawCircle( 250,250, 250);
}


float getX(int center, int radius, float deg){
  return center + cos( radians(deg)) * radius;
}


float getY(int center, int radius, float deg){
  return center + sin( radians(deg)) * radius;
}

void doSquiggles(int centerx,int centery, int lineRadius ){
 
  
  strokeWeight(random(3));
  float a = random(180,225);
  float b = random(225,270);
  float c = random(135,180);
  float d = random(270,315);
  float e = random(90,135);
  float f = random(315,360);
  float g = random(45,90);
  float h = random(0,45);
  
  //int center = 100;
  //int lineRadius = 50;
  
  line(getX(centerx,lineRadius,a), getY(centery,lineRadius,a), getX(centerx,lineRadius,b), getY(centery,lineRadius,b));
  line(getX(centerx,lineRadius,b), getY(centery,lineRadius,b), getX(centerx,lineRadius,c), getY(centery,lineRadius,c));
  line(getX(centerx,lineRadius,c), getY(centery,lineRadius,c), getX(centerx,lineRadius,d), getY(centery,lineRadius,d));
  line(getX(centerx,lineRadius,d), getY(centery,lineRadius,d), getX(centerx,lineRadius,e), getY(centery,lineRadius,e));
  line(getX(centerx,lineRadius,e), getY(centery,lineRadius,e), getX(centerx,lineRadius,f), getY(centery,lineRadius,f));
  line(getX(centerx,lineRadius,f), getY(centery,lineRadius,f), getX(centerx,lineRadius,g), getY(centery,lineRadius,g));
  line(getX(centerx,lineRadius,g), getY(centery,lineRadius,g), getX(centerx,lineRadius,h), getY(centery,lineRadius,h));
}
