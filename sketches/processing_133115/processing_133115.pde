
void setup(){
  size (400,400);
  //noStroke();
  background(255);
  smooth();
  line(50,200,150,200);
  line(50,200,50,300);
}
void draw(){
  //background(255);
  for (int x=50; x<400; x+=1) {
    float r=random(400);
    ellipse(x,200+r,20,20); 
  }
}
  
