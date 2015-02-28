



ArrayList<PVector> points;

int maxNum = 365;

void setup(){
size(300,300);
smooth();

   points = new ArrayList<PVector>();
 for(int i=70; i< maxNum; i++){
   PVector p = new PVector(random(0,width), random(0,height));
   points.add(p);
  }
}
void draw(){
  background(0);
  stroke(139);
  noFill();
  
  float mouseMax = map(mouseY,0,height,0,1);
  float progress = map(mouseX,0,width,0,points.size()-1);
 
  int index = floor(progress); 
  
 PVector startPoint = points.get(index);
 PVector endPoint =   points.get(index+1); 
 
 float x = lerp(startPoint.x,endPoint.x,progress-index);
 float y = lerp(startPoint.y,endPoint.y,progress-index);
 
  ellipse(x,y,40,40);
  beginShape();
 
  for(int i=10; i< points.size()*mouseMax; i++){
   PVector p = points.get(i);
   vertex(p.x,p.y);
   }
   endShape();
 
 for(int i=10; i< points.size()*mouseMax; i++){
  PVector p = points.get(i);
      ellipse(p.x,p.y,100,100);

  }



}


