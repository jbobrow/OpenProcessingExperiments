
Arm[] segments = new Arm[75];

float mouseX2;
float mouseY2;

void setup(){
  size(800,800);
  background(100,255,0);
  
  for(int i = 0; i < segments.length; i++){

    segments[i] = new Arm(width/2,height/2,45-(i/3));
  
  }
  
}

  void draw()
  {
  
  noCursor();
  background(175,255,75);
  

  
  mouseX2 += (mouseX - mouseX2) * .05;
  mouseY2 += (mouseY - mouseY2) * .05;
  

  for(int i = 0; i < segments.length; i++){

    if(i > 1){
     float px = segments[i-1].folX;
     float py = segments[i-1].folY;    
     segments[i].update(px,py);     
    }else{
     segments[i].update(map(mouseX2,0,width,125,width-125),map(mouseY2,0,height,125,height-125));
    } 
  segments[i].display(100,15);  //visual 
  }
  
  
  for(int i = 0; i < segments.length; i++){
  segments[i].display(35,0);  //visual
  }
  
  
  
  
  strokeWeight(7);
  stroke(100);
  fill(35);
  ellipse(map(mouseX2,0,width,75,width-75),map(mouseY2,0,height,75,height-75),175,175);
  strokeWeight(15);
  kittyHead(mouseX2,mouseY2);
  noStroke();
  kittyHead(mouseX2,mouseY2);
  fill(255);
  ellipse(map(mouseX2,0,width,-25,width+25)-25,map(mouseY2,0,height,-35,height+35),15,10);
  ellipse(map(mouseX2,0,width,-25,width+25)+25,map(mouseY2,0,height,-35,height+35),15,10);

 
 

   
} 

void kittyHead(int x, int y){ 
  pushMatrix();
  translate(x,y);  
  ellipse(0,0,125,125);
  triangle(-70,-70,-30,-50,-50,-30);
  triangle(70,-70,30,-50,50,-30);
  popMatrix();  
}

class Arm{
  
  PVector loc = new PVector();
  float a = 3;
  
  float sinAngle = 0.0;
  
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

  
  Arm(float tx, float ty, float tr){
    
    loc.x = tx;
    loc.y = ty;
    radius=tr;
    
  }
  
  void update(float tx, float ty){
     
    loc.x = tx;
    loc.y = ty;
    
    float sinval = sin(sinAngle);  
    float wave = map(sinval, -1, 1, -width, width);
    sinAngle += .1;
    
    float angle = atan2(height-mouseY*2,wave);
    cX = (a * cos(angle)) + loc.x;
    cY = (a * sin(angle)) + loc.y;
    
    folX += (cX - folX) * easing;
    folY += (cY - folY) * easing;
    
    
  }
  
  void display(int c, int l){
    
    stroke(c);
    strokeWeight(radius+l);
    line(loc.x,loc.y,folX,folY);
    
  }
  
}
