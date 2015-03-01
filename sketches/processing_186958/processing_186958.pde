
Tentacle[] tent = new Tentacle[5];  //declare and name array

float pDist;
float pDistMapped;
float smile;

int frameCheck;

float x0;
float y0;
float x;
float y;
float px;
float py;

float fx;
float fy;

float speed = 5;

float mOpen = 0;
float fmOpen = 0;

int blinkdel = 25;

void setup(){
  //size of sketch, initial bgcolor
  
  size(800,800);
  background(15,120,115);
  
  x0 = width/2;
  y0 = height/2;
  x = width/2;
  y = height/2; 
  px = x;
  py = y;
  fx = width/2;
  fy = height/2;
 
  for(int i = 0; i < tent.length; i++){
  tent[i] = new Tentacle((width/2)-200,height/2,i*80); 
  }
    
}

void draw(){

scale(.5);
  //draw background
  background(255);
 // noCursor();
  
  for(int i = 0; i < tent.length; i++){
  
  int j = abs(2-i);
  int k = map(j,0,2,30,10); 
  
  tent[i].update(fx-160,fy+k);  //math
//  stroke(0);
  tent[i].display(7);  //visual
  } 
  
//  fill(75,200,0);
//  strokeWeight(3.5);
  

  
  ellipse(fx,fy,400,150);
  ellipse(fx,fy,400,150);
  arc(fx,fy,400,400,radians(180),radians(360));
  

  
  
  for(int i = 0; i < tent.length; i++){
 // stroke(75,200,0);
  tent[i].display(0);  //visual
  }
  
  if(mousePressed){
    x0 = mouseX*2;
    y0 = mouseY*2;
  }
  

    
  if(x < x0){
    x+=speed;
  }
  if(x > x0){
    x-=speed;
  }
  if(y < y0){
    y+=speed;
  }
  if(y > y0){
    y-=speed;
  }
    
  
 
  frameCheck++;
  if(frameCheck > 1){
    frameCheck = 0;
  px = x;
  py = y;
  }
  

  
  if(dist(fx,fy,x0,y0)<250 && dist(fx,fy,x0,y0)>=15){
    
    mOpen = 100;
  }else{
    mOpen = 0;
  }
  
 
  fmOpen += (mOpen - fmOpen) * .1;
  

  pDist = x - px;
  pDistMapped = map(pDist,-9,9,-180,180);
   
  smile += (pDistMapped - smile) * .01;

  fx += (x - fx) * .05;
  fy += (y - fy) * .05;
  
  
  //blink stuff
  int rando = int(random(500));
  int blink = 10;
  blinkdel++;

  if(rando <= 1){
    blinkdel = 0;
  }
  if(blinkdel < 7){
    blink = 5;
  }else{
    blink = 15;
  }
  
  
  println(pDist);
  

  
  //mouth inside
//  strokeWeight(10);
  stroke(0);
  strokeWeight(3);
  noFill();
  arc(fx,fy-35,373,147,radians(0-smile),radians(180-smile));



//teeth
//  noStroke();
//  fill(255);
  arc(fx,fy-(35+(fmOpen/6)),350,100,radians(10-smile),radians(170-smile));
  
  //mouth front
//  noStroke();



 // noStroke();
 // fill(75,200,0);
  ellipse(fx,fy-35,375,135-fmOpen);




//  fill(75,200,0);
  //stroke(0);  
  arc(fx,fy-35,375,150,radians(180-smile),radians(360));
  arc(fx,fy-35,375,150,radians(180),radians(360-smile));
  

  //eyes
 //  fill(75,200,0);
 // strokeWeight(blink);
 // stroke(0);
 // ellipse(mouseX,mouseY-100,355,125);
  arc(fx,fy-(100+(fmOpen/3)),355,125,radians(70-smile),radians(110-smile));
  
  //eyeSpace
 // fill(75,200,0);
//  strokeWeight(45);
//  stroke(75,200,0);
  arc(fx,fy-(100+(fmOpen/3)),355,125,radians(80-smile),radians(100-smile));

    if(dist(fx,fy,x0,y0)>=15){
//  strokeWeight(3);
//  stroke(0);
 // fill(255,100,0);
  ellipse(x0,y0+15,15,15);
  }
  
  
}


//class for each "segment" of the Limb
//begin class block:
class Limb{

//Vector variables:
  float a; //amplitude (length)
  float cX; //center x position
  float cY; //center y position
  float eX;
  float eY;
  
//Easing variables
  float folX; //follower for x
  float folY; //follower for y
  float easing;  //easing value
  
//Other variables
  float size; //size of segment
  float bumpSize;
  float bumpPos;
  float stretch;
  int randomBump;
  
  
//class constructor (initial values)
//arguements: x position, y position, size, length, easing
  Limb(float x, float y, float s, float ta, float e){
    
    easing = e;
    a = ta;
    cX = x;
    cY = y;
    size = s;
    bumpSize = s/2;
    randomBump = int(random(2));
    bumpPos = random(-bumpSize,bumpSize);
    folX = cX;
    folY = cY;
    
  }
  
//update method
//arguements: x position, y position, parent x, parent y, size, easing
//parent x,y is the "parent" link's position
  void update(float x, float y){//, float x2, float y2, float s, float e){
//update x,y values
    cX = x;
    cY = y;
    eX = x;
    eY = y+a;
 //   stretch = map(dist(cX,cX,folX,folY),a,width,5,0);
    
    
    folX += (eX - folX) * easing;
    
    if(cY <= (height*2) - (size/2)){    
    folY += (eY - folY) * easing;
    } 
          
  }
  
//display (draw) method
  void display(int sw){  
 //   strokeWeight(size+sw);
    line(cX,cY,folX,folY);    
//    strokeWeight(bumpSize+sw);
    if(randomBump<2){
 //    ellipse(cX+(bumpPos),cY,bumpSize+sw,bumpSize+sw);
    }  
  }  
}  
class Tentacle{
  
Limb[] segments = new Limb[25];

int space;
float ranLen;
float ranEase;
  
  Tentacle(float x, float y, int sp){
    ranLen = random(-5,5);
    ranEase = random(.1,.15);
    space = sp;
    
     for(int i = 0; i < segments.length; i++){
       //arguements: x position, y position, size, length
       segments[i] = new Limb(x,y,segments.length-(i*1.5)+25,15+ranLen,ranEase);
     }  
  }
  
  void update(float x, float y){    
    for(int i = 0; i < segments.length; i++){  
    if(i == 0){
    segments[i].update(x+(space),y);
    }else{
    segments[i].update(segments[i-1].folX,segments[i-1].folY); 
    }
    }
  }
  
  void display(int sw){
for(int i = 0; i < segments.length; i++){   
    segments[i].display(sw);
    }    
  }
  
  
  
}
