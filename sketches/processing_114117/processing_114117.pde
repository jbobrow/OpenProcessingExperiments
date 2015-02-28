
int diameter=100;
int positionX =50;

void setup(){
  size(400,400);

}
  
void draw(){
  background(192);
  diameter = diameter+2;
  if(diameter>=200){
  fill(111,47,92);
  ellipse(100,100,diameter,diameter);
  }else if (diameter<200) {
    fill(250,255,0);
    rect(100,100,diameter,diameter);
  }
  
  println(diameter);
  
}


