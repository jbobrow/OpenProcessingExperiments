
void setup(){
  size(297,420);  
}
void draw(){
  float b=0;
  background(0);
  noStroke();
  for(int a=0; a<360*70; a=a+8){
  point(148,210);
  ellipse(148+b*sin(radians(a)),210+b*cos(radians(a)),10,10);
  b=b+0.2;
  }
}

void keyPressed(){ 
save("aaa1.jpg"); 
} 
