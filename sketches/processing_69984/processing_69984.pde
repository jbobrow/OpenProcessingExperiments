
float r=500;
void setup(){
  size(1000,1000);
  background(255);
  ellipseMode(CENTER);
  frameRate(60);
  
}

void draw(){
  int a; 
  float d = dist(mouseX,mouseY,500,500);
   if(d>r){
   a=0;
 }else{
   a=int((1.0-(d/r))*255);
   
 }
 stroke(0,0,0,a);
  line(mouseX,mouseY,500,500);
 stroke(255);   ///Ellipse in the middle
 ellipse(500,500,100,100);
}
