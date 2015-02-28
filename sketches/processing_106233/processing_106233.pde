
void setup(){
  size(1024,500);
  background(0);
  rectMode(CENTER);
}

void draw(){
   

}
void mouseDragged()
{
  float tmp1 = dist(mouseX,mouseY,width/2,0);
  //println(tmp);
  float red = map(tmp1,0,714,0,255);
  float tmp2 = dist(mouseX,mouseY,0,height/2);
  //println(tmp);
  float blue = map(tmp2,0,1060,0,255);
  float tmp3 = dist(mouseX,mouseY,width/2,height/2);
  //println(tmp);
  float green = map(tmp3,0,575,0,255);
  
  
  float speed = dist(pmouseX,pmouseY,mouseX,mouseY);
  speed = constrain(speed,0,100);
  speed = map(speed,0,100,0,30);
  
  
  float lineWidth = map(speed,0,30,1,10);
  lineWidth = constrain(lineWidth,0,10);
  
  noStroke();
  fill(0, speed);
  rect(width/2,height/2,width,height);

  stroke(red,green,blue, 255);
  strokeWeight(lineWidth);
  line(pmouseX,pmouseY,mouseX,mouseY);  
}


