
void setup() {
  size(400,400);
  background(0);
  smooth();
}
 
void draw() {
  float cl = random(0,255);
  stroke(cl,cl,cl);

  for(float a=random(10,400); a>0; a=(a-0.5)%10){
    line(0,200,a,a);
    line(400,200,a,a);
    line(200,0,a,a);
    line(200,400,a,a);
    line(400,0,a,a);
    line(0,400,a,a);
    line(0,0,a,a);
    line(400,400,a,a);
  }
}





           
                
