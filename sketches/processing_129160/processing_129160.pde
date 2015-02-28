
float a = 20;
float b =1;
float c = 10;
void setup(){
 size(600,600);
background(#FF4B4B); 
}

void draw(){
  while(a<800){
  noFill();
  stroke(#4BD0FF);
  strokeWeight(b);
ellipse(300,300,a,c);
a=a*1.33;
b = b*1.33;
c = c *1.5;
}
}


