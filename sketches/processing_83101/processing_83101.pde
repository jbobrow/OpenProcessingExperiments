
ArrayList<PVector> points;

int maxNum = 365;

void setup(){
size(500,500);
smooth();

 points = new ArrayList<PVector>();
 
 for(int i=0; i< maxNum; i++){
   PVector p = new PVector(random(0,width), random(0,height));
   points.add(p);
 }

}

void draw(){
  background(0);
  stroke(255);
  noFill();
  
  float mouseMax = map(mouseY,0,height,0,1);
  float progress = map(mouseX,0,width,0,points.size()-1);
  
  int index = floor(progress); // round the number
  
  PVector startPoint = points.get(index);
  PVector endPoint =   points.get(index+1); 
  
  float x = lerp(startPoint.x,endPoint.x,progress-index);
  float y = lerp(startPoint.y,endPoint.y,progress-index);
   
  ellipse(x,y,20,20);
  beginShape();
  
  for(int i=0; i< points.size()*mouseMax; i++){
    PVector p = points.get(i);
    vertex(p.x,p.y);
  }
  endShape();
 
 for(int i=0; i< points.size()*mouseMax; i++){
      PVector p = points.get(i);
      
  
      
      
      ellipse(p.x,p.y,10,10);

  }
 
 
 

}


