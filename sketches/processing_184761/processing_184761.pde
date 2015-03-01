
Tentacle[] tent = new Tentacle[1];  //declare and name array

void setup(){
  //size of sketch, initial bgcolor
  size(800,800);
  background(255);
 
  for(int i = 0; i < tent.length; i++){
  tent[i] = new Tentacle(width/2,height/2); 
  }
    
}

void draw(){
  //draw background
  background(255);
  noCursor();

  for(int i = 0; i < tent.length; i++){
  tent[i].update(mouseX,mouseY);  //math
  stroke(0);
  tent[i].display(7);  //visual
  } 
  
  fill(75,200,0);
  strokeWeight(3.5);
  ellipse(mouseX,mouseY-50,200,200);
  
  for(int i = 0; i < tent.length; i++){
  stroke(75,200,0);
  tent[i].display(0);  //visual
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
  float easing = .5;  //easing value
  
//Other variables
  float size; //size of segment
  float bumpSize;
  float bumpPos;
  float stretch;
  
  int randomBump;
  
//class constructor (initial values)
//arguements: x position, y position, size, length
  Limb(float x, float y, float s, float ta){
    
    a = ta;
    cX = x;
    cX = y;
    size = s;
    bumpSize = s/2;
    randomBump = int(random(2));
    bumpPos = random(-bumpSize,bumpSize);
    
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

    folX += (eX - folX) * easing;
    folY += (eY - folY) * easing;
    
    stretch = dist(cX,cX,folX,folY);
    
    
  }
  
//display (draw) method
  
  void display(int sw){  

    strokeWeight(size+sw);
    line(cX,cY,folX,folY);    
    strokeWeight(bumpSize+sw);
    if(randomBump<2){
     point(cX+(bumpPos),cY);
    }
  
  }
  
}  
Limb[] segments = new Limb[25];

class Tentacle{
  
  Tentacle(float x, float y){
     
     for(int i = 0; i < segments.length; i++){
       //arguements: x position, y position, size, length
       segments[i] = new Limb(x,y,segments.length-(i*1.5)+25,15);
     }
  
  }
  
  void update(float x, float y){    
    for(int i = 0; i < segments.length; i++){
  
    if(i == 0){
    segments[i].update(x,y);
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


