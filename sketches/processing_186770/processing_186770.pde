
Leg lefty, righty;

float theGround;

float dir;

float easing = .1;

float scaled;

float ranVal;


void setup(){
  //size of sketch, initial bgcolor
  size(800,450);
  background(100,0,200);
  
  theGround = height-100;

  lefty = new Leg(0,theGround,25);
  righty = new Leg(PI,theGround,0);
  
  dir = random(.1,.3);
  ranVal = random(.1,.3);
  
  scaled = random(.9,1.1);
   
}

void draw(){
  

  background(75,100,200);
  
float mp = 1.125;
  
  if(lefty.a2y2 > theGround){
    lefty.x+=lefty.xtravel*mp;
    lefty.x2+=lefty.xtravel*mp;
    lefty.a2x2+=lefty.xtravel*mp;
    lefty.offsetx+=lefty.xtravel*mp;
    lefty.a2offsetx+=lefty.xtravel*mp;

    
    righty.x+=lefty.xtravel*mp;
    righty.x2+=lefty.xtravel*mp;
    righty.a2x2+=lefty.xtravel*mp;
    righty.offsetx+=lefty.xtravel*mp;
    righty.a2offsetx+=lefty.xtravel*mp;

  }
    if(righty.a2y2 > theGround){

    righty.x+=righty.xtravel*mp;
    righty.x2+=righty.xtravel*mp;
    righty.a2x2+=righty.xtravel*mp;
    righty.offsetx+=righty.xtravel*mp;
    righty.a2offsetx+=righty.xtravel*mp;

    
    lefty.x+=(righty.xtravel*mp)*scaled;
    lefty.x2+=(righty.xtravel*mp)*scaled;
    lefty.a2x2+=(righty.xtravel*mp)*scaled;
    lefty.offsetx+=(righty.xtravel*mp)*scaled;
    lefty.a2offsetx+=(righty.xtravel*mp)*scaled;

  }
 
  float hipx = (lefty.fx + righty.fx) / 2;
  float hipy = (lefty.fy + righty.fy) / 2;
  
  if(hipx > width+125){
  dir = -ranVal;
  }
  if(hipx < -75){
  dir = ranVal;
  scaled = random(.9,1.1);
  ranVal = random(.08,.2);
  }
  
    lefty.speed=dir;
    righty.speed=dir;
    lefty.a2speed=dir;
    righty.a2speed=dir;
    
  lefty.update();
  righty.update();


fill(0);
stroke(255);
strokeWeight(20); 
lefty.display();
  
fill(0);
stroke(0);
strokeWeight(15); 
lefty.display();
 //////////////////////  
   
 fill(0);
stroke(255);
strokeWeight(20); 
righty.display();
  
line(lefty.fx,lefty.fy,righty.fx,righty.fy);
  
ellipse(hipx,hipy-50,25,25);
  
line(lefty.fx,lefty.fy,hipx,hipy-50);
line(righty.fx,righty.fy,hipx,hipy-50);


fill(0);
stroke(0);
strokeWeight(15);
righty.display();

line(lefty.fx,lefty.fy,righty.fx,righty.fy);
  
ellipse(hipx,hipy-50,25,25);
  
line(lefty.fx,lefty.fy,hipx,hipy-50);
line(righty.fx,righty.fy,hipx,hipy-50);  
   
   
 /////////////////////   
fill(0);
stroke(255);
strokeWeight(20); 
righty.display();

fill(0);
stroke(0);
strokeWeight(15);
righty.display();




}

class Leg{
float angle = 0.0; 
float offsetx; 
float offsety; 
float scalarx = 60; 
float scalary = 30;
float speed = 0.2;

float a2angle = 0.0; 
float a2offsetx; 
float a2offsety; 
float a2scalarx = 90; 
float a2scalary = 110;
float a2speed = 0.2;

float ground;

float x,y;

float my = 0;

int counter = 0;

float xcheck1,xcheck2;

float x2,y2,a2x2,a2y2;

float xtravel;

float fx,fy,fx2,fy2,fa2x2,fmy;

int c;
  
 Leg(float a,float g, int tc){
   
   c = tc;
   
   angle=a;
   a2angle=a;
   
   x = 0;
  y = -50;
  
  offsetx = 0;
  offsety = height-200;
  
  a2offsetx = 0;
  a2offsety = height-100;
  
  ground = g;
 
 } 
  
  void update(){
    
   x2 = offsetx + cos(angle) * scalarx;  
   y2 = offsety + sin(angle) * scalary;  
   angle += speed; 
  

  
  /////////////////////////////////////
  
    a2x2 = a2offsetx + cos(a2angle) * a2scalarx;  
   a2y2 = a2offsety + sin(a2angle) * a2scalary;  
   a2angle += a2speed; 
 

    
  ////////////////////////////////////
  
  float shin = dist(x2,y2,a2x2,a2y2);
 
   
  //a2scalary = map(shin,100,126,30,60);
  
  
  ///////////////////////////////////
  
  float d = dist(x,y,x2,y2);
  
  float d2 = dist(a2x2,a2y2,x2,y2);
  
  float m = 100-d;
  
  float m2 = 100-d2;
  
  float w = mouseX - pmouseX;
  
  if(a2y2 > y2){
   a2y2+=m2;
  }else{
   a2y2-=m2;
  }   
  
  
  
  
      
  
  if(y2 > y){
   y-=m;
  }else{
   y+=m;
  }
 
   if(counter < 1){
    xcheck1 = a2x2; 
    counter++;
  }else{
    xcheck2 = a2x2;
    counter=0;
  }
  xtravel = (xcheck1 - xcheck2);
 
 
  
  if(a2y2 > ground){
    
    a2x2-=xtravel;
    my = ground;
 //   x-=w;
    
    
  }else{
    
    my = a2y2;
  }
  
  
  fx += (x - fx) * easing;
  fx2 += (x2 - fx2) * (easing*.75);
  fa2x2 += (a2x2 - fa2x2) * (easing*1.5);
  
  fy += (y - fy) * easing;
  fy2 += (y2 - fy2) * (easing*.75);
  fmy += (my - fmy) * easing;
  
  }
  
  void display(){
    


ellipse(fx,fy,25,25);

line(fx2,fy2,fx,fy);
line(fx2,fy2,fa2x2,fmy);
  
ellipse(fx2,fy2,25,25);

//fill(255,0,0);
arc(fa2x2, fmy, 50, 50,radians(-180),0); 
ellipse(fa2x2, fmy, 50, 15);



  
  }
  
}


