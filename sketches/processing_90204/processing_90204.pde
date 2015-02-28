
float circleX;
float circleY;

void setup (){
  size(350, 600);
  circleX = width/2;
  circleY = height/2;
}

void draw(){
  println(dist(circleX, circleY, mouseX, mouseY) + "radius:" +100);
  //rollover state
  if(dist(circleX, circleY, mouseX, mouseY)<100){
    if(mousePressed==true){
    fill(0,0,242);
    fill(0,0,242);
  }else{
  fill(40, 160, 20);
  }
  }
  else{
    fill(200, 30, 169);
  }
  ellipse(circleX, circleY, 200, 200);
}
