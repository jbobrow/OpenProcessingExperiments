
float angle = 0.0;
float x=50;
float y=50;
float a,b;

void setup(){
  size(480,480);
  background(0);
}
void draw(){
  text("Click the mouse button! Left button make blue rose, the other one make red rose :)",0,0,80,240);
  
   pushMatrix();
   a = mouseX;
   b = mouseY;
   translate(width/2,height/2);
   stroke(200,100);
   fill(250,255,random(50),random(50));
   smooth();
   
   rotate(angle);
   rect(0,0,x,x);
   
   
  for(int i=0; i<100; i++){
    float r = random(30);
    x = random(r*2);
    angle +=0.0005;
  }
  
  popMatrix();
  
  if(mousePressed){
  
  if(mouseButton ==LEFT){
    pushMatrix();
    //stroke(0,255,0,255);
    strokeWeight(0.1);
    //line(width/2,height/2,a,b);
    stroke(0,255,0,random(50));
    translate(a,b);
    fill(random(255),255,255,random(50));
     
    rotate(angle);
    rect(0,0,x,x);
    
   
    for(int i=0; i<100; i++){
      float r = random(30);
      x = random(r*2);
      angle +=0.0005;
     }
    popMatrix();
  }
 
   if(mouseButton == RIGHT){
    pushMatrix();
    //stroke(0,255,0,255);
    strokeWeight(0.1);
    //line(width/2,height/2,a,b);
    stroke(255,0,255,random(50));
    translate(a,b);
    fill(255,random(255),225,random(50));
     
    rotate(angle);
    rect(0,0,x,x);
    
   
    for(int i=0; i<100; i++){
      float r = random(30);
      x = random(r*2);
      angle +=0.0005;
     }
    popMatrix(); 
  }
  
  }
  if(keyPressed){
    background(0);
  }
}
  


