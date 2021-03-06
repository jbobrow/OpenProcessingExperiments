
Leg lefty, righty, lefty2, righty2;

float theGround;

float dir;

float easing = .1;
float armeasing = .75;

float scaled;

float ranVal;

float posX, posY;

float bodyLength = 250;

int dd = 1;

float jumptime = 0;


Arm[] segments = new Arm[55];



void setup(){
  //size of sketch, initial bgcolor
  size(800,500);
//  background(100,0,200);
  
   for(int i = 0; i < segments.length; i++){

    segments[i] = new Arm(width/2,height/2,45-(i/3));
  
  }
  
  theGround = height+height/2;
  
  posX = -width/2;
  
  posY = theGround;
  


  lefty = new Leg(posX,posY,0,theGround,25);
  righty = new Leg(posX,posY,PI,theGround,0);
  
  lefty2 = new Leg(posX-bodyLength,posY,0-(PI/4),theGround,25);
  righty2 = new Leg(posX-bodyLength,posY,PI-(PI/4),theGround,0);
  
  dir = .05;
  ranVal = random(.1,.3);
  
  scaled = random(.9,1.1);
   
  textSize(25);
   
}

void draw(){
  

 pushMatrix(); 
  
  scale(-.5,.5);
 // scale(.5);  
  

  background(0);
  fill(255);
  noStroke();
  rect(0,theGround,-9999,999);
  
 

  
float mp = 1.125;
  
 
 
  float hipx = (lefty.fx + righty.fx) / 2;
  float hipy = (lefty.fy + righty.fy) / 2;
  
  float hipx2 = (lefty2.fx + righty2.fx) / 2;
  float hipy2 = (lefty2.fy + righty2.fy) / 2;
  
  
  
  
    
    if(keyPressed && (key == CODED)){
    
       easing = .075;
      

 ///////////////////////////

 if(keyCode == DOWN){
 
lefty.sit(0);   
righty.sit(0);
 
    }
    
    
 else if(keyCode == UP){
 

   
   int jumpscale = 75;
   
println(jumptime);
jumptime++;




if(jumptime < jumpscale*.6){
  lefty.update(posX);
  righty.update(posX);
  lefty2.update(posX-(bodyLength*dd));
  righty2.update(posX-(bodyLength*dd));
  posX-=10*dd;
  
  lefty.speed = .0;
 lefty.a2speed = .0;
 righty.speed = .0;
 righty.a2speed = .0;
   lefty2.speed = .0;
 lefty2.a2speed = .0;
 righty2.speed = .0;
 righty2.a2speed = .0;
  
}
   
   if(jumptime < jumpscale*.1){
lefty.jump1(0);   
righty.jump1(0);
   }
   if(jumptime < jumpscale*.1){
lefty2.jump1(1);   
righty2.jump1(1);
   }
   if(jumptime > jumpscale*.15 && jumptime < jumpscale*.4){
lefty.jump2(0);   
righty.jump2(0);
   }
   if(jumptime > jumpscale*.1 && jumptime < jumpscale*.35){
lefty2.jump2(1);   
righty2.jump2(1);
   }
   if(jumptime > jumpscale*.4 && jumptime < jumpscale*.6){
     armeasing = .85;
lefty.jump3(0);   
righty.jump3(0);
   }
   if(jumptime > jumpscale*.35 && jumptime < jumpscale*.6){
     armeasing = .85;
lefty2.jump3(1);   
righty2.jump3(1);
   }
  
 
   if(jumptime >= jumpscale*.6){
 lefty.stand(0);   
righty.stand(0);
lefty2.stand(0);   
righty2.stand(0);

   }
   
 
    }else{
      armeasing = .75;
      jumptime = 0;
        lefty.update(posX);
  righty.update(posX);
    }
  
   if(keyCode == LEFT){
     
     dd = -1;
 lefty.speed = .1;
 lefty.a2speed = .1;
 righty.speed = .1;
 righty.a2speed = .1;
 
  lefty.a2offsetx = lefty.x;
  righty.a2offsetx = righty.x;

 lefty2.a2offsetx = lefty2.x;
 righty2.a2offsetx = righty2.x; 

 
 lefty2.speed = .1;
 lefty2.a2speed = .1;
 righty2.speed = .1;
 righty2.a2speed = .1;
 
 posX+=5;
 
   lefty2.update(posX+bodyLength);
  righty2.update(posX+bodyLength);
    }
   if(keyCode == RIGHT){
     
     dd = 1;
 lefty.speed = -.1;
 lefty.a2speed = -.1;
 righty.speed = -.1;
 righty.a2speed = -.1;
 
 lefty.a2offsetx = lefty.x;
 righty.a2offsetx = righty.x;
 
 
 
 lefty2.speed = -.1;
 lefty2.a2speed = -.1;
 righty2.speed = -.1;
 righty2.a2speed = -.1;
 
 posX-=5;
 
    lefty2.update(posX-bodyLength);
  righty2.update(posX-bodyLength);
    }
  
  
    }else{
      
       easing = .1;
       jumptime = 0;
       
 
 lefty.stand(posX);
 righty.stand(posX);
 
 lefty2.stand(posX-bodyLength);
 righty2.stand(posX-bodyLength);
    }
 




fill(200,150,75);
stroke(0);
strokeWeight(45); 
lefty.display(dd,2);

righty.display(dd,2);

lefty2.display(dd,1);

righty2.display(dd,1);

//////////////////////  
 
 for(int i = 0; i < segments.length; i++){

    if(i > 1){
     float px = segments[i-1].folX;
     float py = segments[i-1].folY;    
     segments[i].update(px,py);     
    }else{
     segments[i].update(hipx,hipy);
    } 

  }
  
  
  for(int i = 0; i < segments.length; i++){
  segments[i].display(0,0);  //visual
  }
 
 
  
line(lefty.fx,lefty.fy,righty.fx,righty.fy);
  
ellipse(hipx,hipy,25,25); 
//line(lefty.fx,lefty.fy,hipx,hipy-50);
//line(righty.fx,righty.fy,hipx,hipy-50);


line(lefty2.fx,lefty2.fy,righty2.fx,righty2.fy);  
//ellipse(hipx2,hipy2,45,45);
//line(lefty2.fx,lefty2.fy,hipx2,hipy-50);
//line(righty2.fx,righty2.fy,hipx2,hipy-50);

line(hipx2,hipy2,hipx2-(35*dd),hipy2-100);
line(hipx2+(25*dd),hipy2,hipx2-(35*dd),hipy2-100);
line(hipx2-(15*dd),hipy2,hipx2-(35*dd),hipy2-100);
strokeWeight(10);

//ellipse(hipx2+(25*dd),hipy2-15,100,75);

ellipse(hipx2-(45*dd),hipy2-100,100,100);
arc(hipx2-(80*dd),hipy2-90,65,75,radians(0),radians(180));
ellipse(hipx2-(80*dd),hipy2-90,65,25);

triangle(hipx2-(45*dd),hipy2-120,hipx2-(65*dd),hipy2-200,hipx2-(3*dd),hipy2-120);
//triangle(hipx2-(65*dd),hipy2-120,hipx2-(75*dd),hipy2-190,hipx2,hipy2-120);


//arc((hipx2+hipx)/2,(hipy2+hipy)/2,abs(hipx-hipx2)*1.2,125,radians(0),radians(180));



strokeWeight(95);
line(hipx,hipy,hipx2+(dd*10),hipy2); 

//////////////////////////////////////////////////////////////


stroke(200,150,75);
strokeWeight(35); 
lefty.display(dd,2);

righty.display(dd,2);

lefty2.display(dd,1);

righty2.display(dd,1);



//////////////////////  
 
 
    for(int i = 0; i < segments.length; i++){
  segments[i].display(0,0);  //visual
  }
 
 
  
line(lefty.fx,lefty.fy,righty.fx,righty.fy);
  
ellipse(hipx,hipy,25,25); 
//line(lefty.fx,lefty.fy,hipx,hipy-50);
//line(righty.fx,righty.fy,hipx,hipy-50);


line(lefty2.fx,lefty2.fy,righty2.fx,righty2.fy);  
//ellipse(hipx2,hipy2,45,45);
//line(lefty2.fx,lefty2.fy,hipx2,hipy-50);
//line(righty2.fx,righty2.fy,hipx2,hipy-50);

line(hipx2,hipy2,hipx2-(35*dd),hipy2-100);
line(hipx2+(25*dd),hipy2,hipx2-(35*dd),hipy2-100);
line(hipx2-(15*dd),hipy2,hipx2-(35*dd),hipy2-100);


noStroke();

//ellipse(hipx2+(25*dd),hipy2-15,100,75);

ellipse(hipx2-(45*dd),hipy2-100,100,100);
arc(hipx2-(80*dd),hipy2-90,65,75,radians(0),radians(180));
ellipse(hipx2-(80*dd),hipy2-90,65,25);

triangle(hipx2-(45*dd),hipy2-120,hipx2-(65*dd),hipy2-200,hipx2-(3*dd),hipy2-120);
//triangle(hipx2-(65*dd),hipy2-120,hipx2-(75*dd),hipy2-190,hipx2,hipy2-120);

//arc((hipx2+hipx)/2,(hipy2+hipy)/2,abs(hipx-hipx2)*1.2,125,radians(0),radians(180));

stroke(200,150,75);
strokeWeight(85);
line(hipx,hipy,hipx2+(dd*10),hipy2); 
 
 
  popMatrix();

if(mousePressed){
  fill(255);  
  text("Use [left] and [right] to walk.",(width/2)-150,height/8);
  text("Use [down] to sit and [up] to jump.",(width/2)-200,height/8+50);
}
  
  fill(0);


}

class Arm{
  
  PVector loc = new PVector();
  float a = 5;
  
  float sinAngle = 0.0;
  
  float cX;
  float cY;
  float cX2;
  float cY2;

  float plo = 0;
  float ploCol;
  
  float folX;
  float folY;
  
  
  float radius;
  
  float wave;

  
  Arm(float tx, float ty, float tr){
    
    loc.x = tx;
    loc.y = ty;
    radius=tr;
    
  }
  
  void update(float tx, float ty){
     
    loc.x = tx;
    loc.y = ty;
    
    float sinval = sin(sinAngle);  
    
    
    if(dd==-1){
    wave = map(sinval, -1, 3, -width, width);
    }else{
    wave = map(sinval, 3, -1, -width, width);
    }
    
    
    sinAngle += .1;
    
    float angle = atan2(-height,wave);
    cX = (a * cos(angle)) + loc.x;
    cY = (a * sin(angle)) + loc.y;
    
    folX += (cX - folX) * armeasing;
    folY += (cY - folY) * armeasing;
    
    
  }
  
  void display(int c, int l){
    

    line(loc.x,loc.y,folX,folY);

  }
  
}
class Leg{
float angle = 0.0; 
float offsetx; 
float offsety; 
float scalarx = 60; 
float scalary = 30;
float speed = 0.05;

float a2angle = 0.0; 
float a2offsetx; 
float a2offsety; 
float a2scalarx = 90; 
float a2scalary = 110;
float a2speed = 0.05;

float ground;

float x,y;

float my = 0;

int counter = 0;

float xcheck1,xcheck2;

float x2,y2,a2x2,a2y2;

float xtravel;

float fx,fy,fx2,fy2,fa2x2,fmy;



float neasing = 0;

int c;
  
 Leg(float tx, float ty, float a,float g, int tc){
   
   c = tc;
   
   angle=a;
   a2angle=a;
   
   x = tx;
   y = ty-height;
  
  offsetx = tx;
  offsety = ty-100;
  
  a2offsetx = tx;
  a2offsety = ty+100;
  
  ground = g;
 
 } 
  
  void update(float tx){
    
    if(y >= y2){
    y=0;
    }
    
   x = tx;
  
  offsetx = tx;
  
  a2offsetx = tx;
    
    /////////
    
   x2 = offsetx + cos(angle) * scalarx;  
   y2 = offsety + sin(angle) * scalary;  
   angle += speed; 
  
  /////////////////////////////////////
  
    a2x2 = a2offsetx + cos(a2angle) * a2scalarx;  
   a2y2 = a2offsety + sin(a2angle) * a2scalary;  
   a2angle += a2speed; 
    
  ////////////////////////////////////
  
  float shin = dist(x2,y2,a2x2,a2y2);
  
  
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
  
    my = a2y2;
  
  
  
  fx += (x - fx) * easing;
  fx2 += (x2 - fx2) * (easing);
  fa2x2 += (a2x2 - fa2x2) * (easing);
  
  fy += (y - fy) * easing;
  fy2 += (y2 - fy2) * (easing);
  fmy += (my - fmy) * easing;
  
  }
  
  
   void stand(float tx){
     
  
  y=0;
  
  
  
     
    
   x2 = offsetx + cos(PI/2) * scalarx;  
   y2 = offsety + sin(PI/2) * scalary;  
  // angle = PI/2; 
  
  /////////////////////////////////////
  
   a2x2 = a2offsetx + cos(PI/2) * a2scalarx;  
   a2y2 = a2offsety + sin(PI/2) * a2scalary;  
  // a2angle = PI/2; 
    
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
 

    
    my = a2y2;
 
  
  
  fx += (x - fx) * easing;
  fx2 += (x2 - fx2) * (easing);
  fa2x2 += (a2x2 - fa2x2) * (easing);
  
  fy += (y - fy) * easing;
  fy2 += (y2 - fy2) * (easing);
  fmy += (my - fmy) * easing;
  
  }
  
  
  
   void sit(float tl){
     
   y = ground;
   
   fx += ((x-(100*dd)) - fx) * easing;
  
   //fx += (x - fx) * easing; 
    
   x2 = x-(dd*150);  
   y2 = y;  
  // angle = PI/2; 
  
  /////////////////////////////////////
  
   a2x2 = x2 - (30*dd);  
   a2y2 = y2 + 30;  
  // a2angle = PI/2; 
    
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
//   a2y2+=m2;
  }else{
//   a2y2-=m2;
  }   
  
  if(y2 > y){
 //  y-=m;
  }else{
//   y+=m;
  }
 

    
    my = a2y2;
 
  
  
  
  fx2 += (x2 - fx2) * (easing);
  fa2x2 += (a2x2 - fa2x2) * (easing);
  
  fy += (y - fy) * easing;
  fy2 += (y2 - fy2) * (easing);
  fmy += (my - fmy) * easing;
  
  }
  
   
  
   void jump1(float tl){
     
    
     
   if(tl == 0){
     
     
   y = ground-100;
   
   fx += ((x-(25*dd)) - fx) * easing;
  
   //fx += (x - fx) * easing; 
    
  // x2 = x-(dd*100);  
   y2 = (a2y2+y)/2;  
  // angle = PI/2; 
  
  /////////////////////////////////////
  
   //a2x2 = x2 - (30*dd);  
   //a2y2 = ground+25;  
  // a2angle = PI/2; 
   }else{
    y = ground-125;
   
   fx += ((x-(25*dd)) - fx) * easing;
  
   //fx += (x - fx) * easing; 
    
  // x2 = x-(dd*100);  
   y2 = (a2y2+y)/2;  
  // angle = PI/2; 
  
  /////////////////////////////////////
  
   //a2x2 = x2 - (30*dd);  
   //a2y2 = ground+25;  
  // a2angle = PI/2; 
   }
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
//   a2y2+=m2;
  }else{
//   a2y2-=m2;
  }   
  
  if(y2 > y){
 //  y-=m;
  }else{
//   y+=m;
  }
 

    
    my = a2y2;
 
  
  
  
  fx2 += (x2 - fx2) * (easing);
  fa2x2 += (a2x2 - fa2x2) * (easing);
  
  fy += (y - fy) * easing;
  fy2 += (y2 - fy2) * (easing);
  fmy += (my - fmy) * easing;

     
  
  }
  
  
  void jump2(float tl){
    
  
 
   if(tl == 0){
     neasing = .1;
     int high = 600;
     
   y = ground-high;
   
   fx += ((x-(25*dd)) - fx) * neasing;
  
   //fx += (x - fx) * easing; 
    
  // x2 = x-(dd*100);  
   y2 = ground-(high);  
  // angle = PI/2; 
  
  /////////////////////////////////////
  
   //a2x2 = x2 - (30*dd);  
   a2y2 = ground-(high-160);  
  // a2angle = PI/2; 
  
   }else{
     neasing = .1;
    int high = 700;
     
   y = ground-high;
   
   fx += ((x-(25*dd)) - fx) * neasing;
  
   //fx += (x - fx) * easing; 
    
  // x2 = x-(dd*100);  
   y2 = ground-(high-80);  
  // angle = PI/2; 
  
  /////////////////////////////////////
  
   //a2x2 = x2 - (30*dd);  
   a2y2 = ground-(high-160);  
  // a2angle = PI/2; 
  
   }
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
//   a2y2+=m2;
  }else{
//   a2y2-=m2;
  }   
  
  if(y2 > y){
 //  y-=m;
  }else{
//   y+=m;
  }
 

    
    my = a2y2;
 
  
  
  
  fx2 += (x2 - fx2) * (neasing);
  fa2x2 += (a2x2 - fa2x2) * (neasing);
  
  fy += (y - fy) * neasing;
  fy2 += (y2 - fy2) * (neasing);
  fmy += (my - fmy) * neasing;

  }
  
  
  void jump3(float tl){
    
  neasing = .15;
 
  if(tl == 0){
    
   y = ground-100;
   
   fx += ((x-(25*dd)) - fx) * neasing;
  
   //fx += (x - fx) * easing; 
    
  // x2 = x-(dd*100);  
   y2 = (a2y2+y)/2;  
  // angle = PI/2; 
  
  /////////////////////////////////////
  
   //a2x2 = x2 - (30*dd);  
   a2y2 = ground+25;  
  // a2angle = PI/2; 
   }else{
     
    y = ground-125;
   
   fx += ((x-(25*dd)) - fx) * neasing;
  
   //fx += (x - fx) * easing; 
    
  // x2 = x-(dd*100);  
   y2 = (a2y2+y)/2;  
  // angle = PI/2; 
  
  /////////////////////////////////////
  
   //a2x2 = x2 - (30*dd);  
   a2y2 = ground+25;  
  // a2angle = PI/2; 
   }
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
//   a2y2+=m2;
  }else{
//   a2y2-=m2;
  }   
  
  if(y2 > y){
 //  y-=m;
  }else{
//   y+=m;
  }
 

    
    my = a2y2;
 
  
  
  
  fx2 += (x2 - fx2) * (neasing);
  fa2x2 += (a2x2 - fa2x2) * (neasing);
  
  fy += (y - fy) * neasing;
  fy2 += (y2 - fy2) * (neasing);
  fmy += (my - fmy) * neasing;

      
  
  }
  
  void display(int d, int l){



//line(fx2+(25*d),fy2,fx,fy);
//line(fx2+(25*d),fy2,fa2x2,fmy);

  
if(l == 2){

float bendy = (fy2+fmy)/2;


line(fx2-(15*d),fy2-25,fx,fy);
line(fx2-(15*d),fy2-25,fx+(10*d),fy);
line(fx2-(15*d),fy2-25,fx-(20*d),fy);

line(fx2-(15*d),fy2-25,fx2+(25*d),bendy);
line(fx2+(25*d),bendy,fa2x2,fmy);

line(fa2x2,fmy,fa2x2-(15*d),fmy);

}

  
if(l == 1){


line(fx2+(35*d),fy2,fx,fy);

line(fx2+(35*d),fy2,fx+(20*d),fy);

line(fx2+(35*d),fy2,fa2x2,fmy);

line(fa2x2,fmy,fa2x2-(15*d),fmy);

}

  
  }
  
}


