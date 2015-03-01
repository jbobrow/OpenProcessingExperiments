

float d;
int score=0;
void setup(){
 size(500,500); 
}

void draw(){
  background(255);
  noStroke();
  smooth();
  d = dist(width/2,height/2, mouseX, mouseY);
println(d);
if(d > 50){
  fill(0,255,255,20);
}else{
  fill(255,0,0,20);
    
}

  ellipse(width/2, height/2,100,100); //(width location ,height location,object width, object height)
  fill(0);
  ellipse(width/2,height/2,10,50);
  text(score,100,100);
}
