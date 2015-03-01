
//Happy Valentines Day, Louisa!!
//<3 Bryan

Arm[] segments = new Arm[75];

//PFont h=createFont("Arial",9);

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
 // background(255);
  fill(0,5);
  rect(0,0,width,height);

  
  

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
  
    for(int j = 0; j < 360; j+= 10){
    
  segments[i].display(i,0,width/2,height/2,j);  //visual
    }

  
  }
  
  headSize+=headGrow;
  if(headSize >= 1.5){
    headGrow = -.01;
  }
  if(headSize <= .3){
    headGrow = .01;
  }
  
  headEase += (headSize - headEase) * .05;
  
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
  

 
 
 
 kittyHead(width/2,height/2,headEase*headEase*headEase*headEase,blink);
kittyHead(width/2,height/2,headEase*headEase*headEase,blink);
  kittyHead(width/2,height/2,headEase*headEase,blink);
  kittyHead(width/2,height/2,headEase,blink);
} 

void kittyHead(int x, int y, float s, int b){ 


  
    

  pushMatrix();
  translate(x,y);
  rotate(map(s,.75,1.5,-PI,1));
  scale(s*1.06);
  
  fill(0,50);
  textSize(700);
  text("♥",-200,250);
  
  popMatrix();
  noStroke();
  
  pushMatrix();
  translate(x,y);
  rotate(map(s,.75,1.5,0,-.5));
  scale(s);
  
  fill(255,0,255,50);
  textSize(700);
  text("♥",-200,250);
  
  fill(255);
  textSize(50);
  
  
  popMatrix();
  noStroke();
  
  pushMatrix();
  translate(x,y);
  rotate(map(s,.75,1.5,-.5,.5));
  scale(s*s*s);
  
  fill(255,75);
  textSize(50);
  text("bjc♥leh",-80,20);
  
  
  popMatrix();
  noStroke();

  
}


class Arm{
  
  PVector loc = new PVector();
  float a = 14;
  
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
    float wave = map(sinval, -1, 1, -width*3, width*3);
    sinAngle += .05;
    
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
    stroke(0,c,c);
    strokeWeight(radius+l);
    line(loc.x,loc.y,folX,folY);
    popMatrix();
    
  }
  
}
