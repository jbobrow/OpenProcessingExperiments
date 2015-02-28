
int counter;

void setup(){
  size(400, 400);
  background(230,220,146);
}
void draw(){;
  background(240,50);
  stroke(255,178,229);
  strokeWeight(2);
  //fill(225,250,119);
  ellipse(width/2,height/2,100,100);
  ellipse(width/4,height/4,100,100);
  ellipse(3*width/4,3*height/4,100,100);
  if(mousePressed == true){
    fill(255,255,255);
  }else{
    fill(255,137,216);
 
}
}
