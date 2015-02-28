
void setup() {
  size(400, 400);
  background(0);
  smooth();
}
 
void draw() {
  if(mousePressed){
  
    float durchmesser = random(200);
    
  
    fill(34,34,56, 50);
    stroke(0,255,0);
    
    random (100);
    ellipse(mouseX, mouseY,random(130,400),random(130,400));
    
  }else{
    
     fill(200,255,0,40);
     stroke(0,60);
     ellipse(mouseX,mouseY,100,20);
    
    
    
  }
}
