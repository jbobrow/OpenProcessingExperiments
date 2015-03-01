
Paper[] planes = new Paper[7];

void setup(){
  //size of sketch, initial bgcolor
  size(800,800);
  background(0);
  
  for(int i = 0; i < planes.length; i++){
   planes[i] = new Paper();
  }

 
   
}

void draw(){
  //background(0);
 
 fill(0,5);
 rect(0,0,width,height);

 for(int i = 0; i < planes.length; i++){
  
   
   if(i == 0){
  planes[i].update(mouseX,mouseY+800);  //math 
   }else{
   
  translate(-planes[i-1].tailx,-planes[i-1].taily);
  
  planes[i].update(planes[i-1].x,planes[i-1].y);  //math 
   }
   
  
  
  
  planes[i].display();  //visual 
}
 
  
}

class Paper{
  
float x,y,fx,fy,angle,angle2,fangle,deltaX,deltaY,speed,ranSpeed;

int counter;

int wavecount,waveMax;

float xcheck1,ycheck1,xcheck2,ycheck2,scaled,linew;

float yStart;

float tailx, taily;

  Paper(){
    
    yStart = random(height);
    
  ranSpeed = random(2,15);
  speed = ranSpeed;
  x = random(width);
  y = height+yStart;
  
  fx = x;
  fy = y+height;
  
  waveMax = 25;
  wavecount = 0;
  
  
  
    
  }
  
  void update(float tx, float ty){
      if(wavecount < waveMax){
    wavecount++;
  }else{
 //   x+=random(-250,250);
    waveMax = int(random(15,100));
    wavecount = 0;
  }
  
//  y-=speed;
  
  
  
//  if(fy <= (0-75)){
//    y = height;
//    fy = height + yStart;
//    x = random(width);
//    fx = x;
//    ranSpeed = random(2,15);
//  }

x = tx;
y = ty;
  
  fy += (y - fy) * .1;
  fx += (x - fx) * .1;
  
if(counter==0){
  counter++;
  xcheck1 = fx;
  ycheck1 = fy;
}else{
  xcheck2 = fx;
  ycheck2 = fy;
deltaY = (ycheck2 - ycheck1);
deltaX = (xcheck2 - xcheck1);
  counter = 0;
}
 

  
  

  angle = atan2(deltaY, deltaX) * 180 / PI;
 
  
  fangle += (angle - fangle) * 1;










scaled = map(fy,height,0,150,5);

linew = map(fy,height,0,5,.5);

speed = map(fy,height,0,ranSpeed,1);

tailx = 0;

taily = scaled;


  }
  
  void display(){    
pushMatrix();
translate(fx,fy);
//pushMatrix();
rotate(radians(-270+fangle));
noStroke();
fill(154,264,168,75);
triangle(0,0,scaled,scaled,-scaled,scaled);


popMatrix();
  }
  
  
}


