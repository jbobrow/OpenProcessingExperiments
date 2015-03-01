
Arm[] segments = new Arm[150];

float headSize = 1;
float headGrow = .1;
float headEase = 1;
int blinkdel = 25;


void setup(){
  size(800,800);
  background(255);
  

  
  for(int i = 0; i < segments.length; i++){

    segments[i] = new Arm(width/2,height/2,0+(i/5),0+(i/3));
  
  }
  
}

  void draw()
  {
  
//  noCursor();
  background(0);
  

  
  

  for(int i = 0; i < segments.length; i++){

    if(i > 1){
     float px = segments[i-1].folX;
     float py = segments[i-1].folY;    
     segments[i].update(px,py);     
    }else{
     segments[i].update(0,0);
    } 
//  segments[i].display(100,15,width/2,height/2);  //visual 
  }
  
  
  for(int i = 0; i < segments.length; i++){
  
    for(int j = 0; j < 360; j+= 20){
    
  segments[i].display(i,0,width/2,height/2,j);  //visual
    }

  
  }
  
  headSize+=headGrow;
  if(headSize >= 1.5){
    headGrow = -.01;
  }
  if(headSize <= .5){
    headGrow = .01;
  }
  
  headEase += (headSize - headEase) * .1;
  
  float rando = random(250);
  int blink = 10;
  blinkdel++;

  if(rando <= 1){
    blinkdel = 0;
  }
  if(blinkdel < 15){
    blink = 0;
  }else{
    blink = 10;
  }
  
 
 kittyHead(width/2,height/2,headEase,blink);

  
} 

void kittyHead(int x, int y, float s, int b){ 

  pushMatrix();
  translate(x,y);
  scale(s);
  fill(15);
  stroke(75);
  strokeWeight(12);
  ellipse(0,0,125,125);
  triangle(-70,-70,-30,-50,-50,-30);
  triangle(70,-70,30,-50,50,-30);
  
  noStroke();
  ellipse(0,0,125,125);
  triangle(-70,-70,-30,-50,-50,-30);
  triangle(70,-70,30,-50,50,-30);
  
  fill(125,200,0);
  ellipse(-27,0,15,b);
  ellipse(27,0,15,b);
  
  fill(0);
  ellipse(-27,0,5,b+2);
  ellipse(27,0,5,b+2);
  
  stroke(75);
  strokeWeight(1);
  fill(75);
  triangle(-8,22,0,30,8,22);
  
  popMatrix();
  noStroke();

  
}

class Arm{
  
  PVector loc = new PVector();
  float a = 6;
  
  float sinAngle;
  
  float cX;
  float cY;
  float cX2;
  float cY2;

  float plo = 0;
  float ploCol;
  
  float folX;
  float folY;
  float easing = .75;
  
  float radius;

  
  Arm(float tx, float ty, float tr, float tsa){
    
    loc.x = tx;
    loc.y = ty;
    radius=tr;
    sinAngle = tsa;
    
  }
  
  void update(float tx, float ty){
    
    
    loc.x = tx;
    loc.y = ty;
    
    float sinval = sin(sinAngle);  
    float wave = map(sinval, -1, 1, -width*2, width*2);
    sinAngle += .1;
    
    float angle = atan2(height,wave);
    cX = (a * cos(angle)) + loc.x;
    cY = (a * sin(angle)) + loc.y;
    
    folX = cX;
    folY = cY;
    
    
  }
  
  void display(int c, int l, float tx, float ty, float tr){
    pushMatrix();
 
    translate(tx,ty);
    rotate(radians(tr));
    stroke(c/2,c*2,0);
    strokeWeight(radius+l);
    line(loc.x,loc.y,folX,folY);
    popMatrix();
    
  }
  
}


