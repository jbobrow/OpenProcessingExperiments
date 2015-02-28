
int diameter=100;

void setup(){
  size(200,200);

}
  
void draw(){
  background(192);
  diameter = mouseX*2;
  if(diameter>=50){
  fill(111,47,92);
  }else fill(250,255,0);
  ellipse(100,100,diameter,diameter);
  
}


