

int myStrokeWeight = 20;
boolean isDrawing = true;
int rotation = 0;

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
  if (isDrawing == true){
    doDrawing();
  }
  
}


void mousePressed() {
  
  isDrawing = !isDrawing;
  
  if (isDrawing == true){
    if(myStrokeWeight == 20){
      myStrokeWeight = 10;
    }else if (myStrokeWeight == 10){
      myStrokeWeight = 5;
      
    }else if (myStrokeWeight == 5){
      myStrokeWeight = 3;
      
    }else{
      myStrokeWeight = 20;
      
    }
    
    
  }

}

void keyPressed() {
  
  if (key == 'c'){
     fill(0);
     rect(0,0,width,height);
  }else if(key == 's'){
     saveFrame("line-######.png");
  }else if(key == 'h'){
    isDrawing = !isDrawing;
  }else if(key == 'r'){
    rotation = rotation + 45;
    rotate(rotation);
  }
 
  
}



void doDrawing(){
  stroke(65,32,61,random(100));
   drawCircle( 250,250, 200);
  stroke(168,219,168,random(100));
  drawCircle( 250,250, 200);
   stroke(65,60,90, random(100));
  drawCircle( 250,250, 200);
  stroke(65,104,86, random(100));
  drawCircle( 250,250, 150);
  stroke(59,134,134,random(100));
  drawCircle( 250,250, 100);
  stroke(65,32,61,random(100));
  drawCircle( 250,250, 60);
  stroke(65,60,90, random(100));
  drawCircle( 250,250, 250);
 stroke(65,104,86, random(100));
  drawCircle( 250,250, 250);
  stroke(168,219,168,random(100));
  // stroke(59,134,134,random(100));
  drawCircle( 250,250, 60);
  
}


float getX(int center, int radius, float deg){
  return center + cos( radians(deg)) * radius;
}


float getY(int center, int radius, float deg){
  return center + sin( radians(deg)) * radius;
}

void doSquiggles(int centerx,int centery, int lineRadius ){
 
  
  strokeWeight(random(myStrokeWeight));
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
