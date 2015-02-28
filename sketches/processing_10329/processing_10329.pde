
//todo get away from frame count ex: mymyFrameCount++, homescreen
  float myFrameCount;
  
  
  PImage metal;
  PFont ocr;
  float magnitude;
  float anchorY;
  float anchorX;
  float ghostX;
  float ghostY;
  float speed;
  float health;
  
  float collisionHue;
  float pointIntensityM;
  float pointIntensityG;
  
  
  boolean lose;
  boolean startScreen;
  boolean ball;
  
  
  int hits;
  
  float ballX;
  float ballY;
  int invisiball=2;//1=regular,2=sin fill, 3=invisible
  
  float ghostLineDist;
  float mouseLineDist;

  int score;

void setup(){
  health=100;
  size(500,500); 
  smooth();
  colorMode(HSB,1);
  metal=loadImage("northstar.png");
  ocr=loadFont("OCRAExtended-48.vlw");
  score=1;
  myFrameCount=1;
  lose=false;
  startScreen=true;
  textFont(ocr);
  ball=false;
  hits=0;
  
  
}

void draw(){

  myFrameCount++;
  speed=450-constrain(10*log(myFrameCount*myFrameCount),0,380);//should speed up

 // background(cos(myFrameCount/50.0),.7,.4,.2);
  
  
  fill(1,0,.92,.02);
  //ellipse(250,250,width,height); 
  metal();
  if(hits>health&&!lose){lose=true;myFrameCount=0;}
  if(lose){lose();startOver();}
  orbit(speed);
  if(startScreen){startScreen();}

  if(ball){ball();}
  
  
  if(collision(ballX,ballY)&&!lose&&!startScreen){
    background(collisionHue,1,1);
     hits++;
  }
  println(hits);
  
  if(!lose){
  score+=ghostLineDist/100;
  score+=mouseLineDist/100;
  damage();
}
  score();
}
void orbit(float speed){
   magnitude=height/2;//circumscribes path to stage
   anchorY=sin(myFrameCount/speed)*magnitude+250;//add 250 to displace center of orbit to center of screen
   anchorX=cos(myFrameCount/speed)*magnitude+250;
   ghostY=width-mouseX;
   ghostX=height-mouseY;
   
   mouseLineDist=dist(mouseX,mouseY,anchorX,anchorY);
   ghostLineDist=dist(ghostX,ghostY,anchorY,anchorX);
   
   pointIntensityM=map(mouseLineDist,0,height,0,1);
   pointIntensityG=map(ghostLineDist,0,height,0,1);
   stroke(pointIntensityM,1,1);
  line(mouseX,mouseY, anchorX,anchorY);
  stroke(pointIntensityG,1,1);
  line(ghostX,ghostY,anchorY,anchorX);
  noStroke();
}
void lose(){
  speed=log(myFrameCount/90);
  
}

void startScreen(){
  fill(1,.5);
  textSize(48);
  if(myFrameCount<300&&startScreen==true&&lose==false){
  text("A stary night...   perfect for a laser show",30,30,width-230,height-50); 
  }
  if(myFrameCount>300&&myFrameCount<600&&startScreen==true&&lose==false){
  textSize(30);
  text("except for that punk with a jet pack and a mirror. Dont get let him reflect you in the eyes!",30,300,width-30,height-350);
  }
  if(myFrameCount>360){
    ball=true;
  }
  if(myFrameCount>599){
    startScreen=false;
  }
  
}
void metal(){
  tint(#FFFFFF,.05);
  image(metal,0,0);
  noTint();
}
void startOver(){
  textSize(20);
  fill(1);
  text("GAME OVER", width-300, height-30);
  text("Press 's' to start over",width/2-150,height-5);
 if (keyPressed){
   if(key=='s'||key=='S'){
     myFrameCount=0;
     lose=false;
     score=0;
     hits=0;
     ball=false;
     startScreen=true;
   }
 } 
}

void damage(){
 stroke((hits/health)/30,hits/health,1,.05);
 strokeWeight(50);
 line(0,height,(hits/health)*width,height);
 textSize(15);
 fill(0);
 text("damage",5,height-5);
 strokeWeight(1);
}

void score(){
  fill(1);
  textSize(20);
  text("Score:"+score,20,height-30);
}

void ball(){
  if(invisiball==1){
    fill(0);}
  else if(invisiball==2){
    fill(sin(myFrameCount/speed));}
  else if(invisiball==3){
    fill(1,0,.92);}
  
  float ballMag=cos(myFrameCount/90.0)*height/3;//(myFrameCount%height)/2.7;//2.7 keeps ball inside arean at all times, prevents impossible edge contact
  float speeed=50;
  ballX=-sin(myFrameCount/speed)*ballMag+250+sin(myFrameCount/20.0)*20;
  ballY=cos(myFrameCount/speed)*ballMag+250+sin(myFrameCount/20.0)*20;
  //ballX=-sin(ballMag);
  //ballY=cos(ballMag);
  ellipse(ballX,ballY,10,10); 
}

boolean collision( float ballX,  float ballY){
  if (circleLineIntersect(mouseX,mouseY,anchorX,anchorY,ballX,ballY,10)){
    collisionHue=pointIntensityM;
    return true;   
  }
  if(circleLineIntersect(ghostX,ghostY,anchorY,anchorX,ballX,ballY,10)){
     collisionHue=pointIntensityG;
     return true;
  }
  else{
    return false;
  }
 
}

// Code adapted from Paul Bourke:
// http://local.wasp.uwa.edu.au/~pbourke/geometry/sphereline/raysphere.c
boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr ) {
  float dx = x2 - x1;
  float dy = y2 - y1;
  float a = dx * dx + dy * dy;
  float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy));
  float c = cx * cx + cy * cy;
  c += x1 * x1 + y1 * y1;
  c -= 2 * (cx * x1 + cy * y1);
  c -= cr * cr;
  float bb4ac = b * b - 4 * a * c;
 
  //println(bb4ac);
 
  if (bb4ac < 0) {  // Not intersecting
    return false;
  }
  else {
     
    float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a);
    float ix1 = x1 + mu*(dx);
    float iy1 = y1 + mu*(dy);
    mu = (-b - sqrt(b*b - 4*a*c )) / (2*a);
    float ix2 = x1 + mu*(dx);
    float iy2 = y1 + mu*(dy);
 
    // The intersection points
    //ellipse(ix1, iy1, 10, 10);
    //ellipse(ix2, iy2, 10, 10);
     
    float testX;
    float testY;
    // Figure out which point is closer to the circle
    if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy)) {
      testX = x2;
      testY = y2;
    } else {
      testX = x1;
      testY = y1;
    }
     
    if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2)) {
      return true;
    } else {
      return false;
    }
  }
}


