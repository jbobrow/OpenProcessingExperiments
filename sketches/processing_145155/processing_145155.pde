
float x,y,distance;
void setup(){
  size(600,600);
  //noCursor();
  colorMode(HSB);
}
void draw(){
  background(200);
  for(int j=25; j<600; j+=25){
  for(int i=25; i<600; i+=25){
    
    x=abs(i-mouseX);
    y=abs(j-mouseY);
    distance=abs(sqrt(sq(x)+sq(y)));
    strokeWeight(abs((300/distance)*sin(distance/50)));
    stroke((abs(300*sin(distance/50))),240,240);
    if(100/distance>=1){
    strokeWeight(1);
  }
  ellipse(i,j,15,15);
  if(distance<=100){
    strokeWeight(100/distance);
    if(100/distance>=7){
    strokeWeight(8);
  }
  strokeWeight(5);
    point(i,j);
  }
}
}
  if(key=='d'){
    mouseX+=10;
  }
  if(key=='a'){
    mouseX-=10;
  }
  if(key=='s'){
    mouseY+=10;
  }
  if(key=='w'){
    mouseY-=10;
  }
}
