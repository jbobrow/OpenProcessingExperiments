
int count;
boolean isDrawing = true;
//float displacement = random(120);
int mode = 1;
int parameter = 120;

void setup() {
  size(600,600);
  background(0);
  smooth();
  frameRate(20);
  colorMode(RGB,255);
 
   
 
}
 
void drawCircle(int x,int y,int r){
 
  doSquiggles(x,y,r);
  doSquiggles(x,y,r);
 
   
}

void drawCircle2(int x,int y,int r){
 
  doSquiggles(x,y,r);

 
   
}

void mousePressed() {
  
  //isDrawing = !isDrawing;
  
  //if (isDrawing == true){
    // 
    
    
  //}

}

void keyPressed() {
  
  if (key == 'c'){
     background(0);
  }else if(key == 's'){
     saveFrame("planet-######.png");
  }else if(key == 't'){
    isDrawing = !isDrawing;
  }else if(key == 'n'){
    if(parameter == 120){
      println("parameter is 220");
      parameter = 220;
    }else  if(parameter == 220){
      parameter = 360;
      println("parameter is 360");
    }else{
      parameter = 120;
      println("parameter is 120");
    }
      
  }else if(key == 'd'){
    fill(0,0,0,50);
    rect(0,0,width,height);
  }
 
  
}
 
 
 
void draw(){
  
   if(isDrawing == true){
   stroke(242,243,244,10);
   drawCircle( 300,300, 250);

   
   noFill();
   stroke(0,0,0,50);
   ellipse(300,300,500,500);
   }
   

}
 
 
float getX(int center, int radius, float deg){
  return center + cos( radians(deg)) * radius;
}
 
 
float getY(int center, int radius, float deg){
  return center + sin( radians(deg)) * radius;
}
 
void doSquiggles(int centerx,int centery, int lineRadius ){
  
   
  //strokeWeight(random(6)); 60.120,360,220
 float displacement = random(120);
  
  strokeWeight(random(3));
  float a = random(180,225);
  float b = random(225,270);
  float c = random(135,180);
  float d = random(270,315);
  float e = random(90,135);
  float f = random(315,360);
  float g = random(45,90);
  float h = random(0,45);
  
  a+= displacement;
  b+= displacement;
  c+= displacement;
  d+= displacement;
  e+= displacement;
  f+= displacement;
  g+= displacement;
  h+= displacement;
   
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

