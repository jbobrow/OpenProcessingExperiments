
void setup(){
    background(0,12,40); 
  size(900,900);
  smooth();
}
void draw (){
  frameRate(10);

  soothingcircle(300,300);
  soothingcircle(600,300);
  soothingcircle(450,600);
}
void soothingcircle(int h,int w){
  int x= int(random(0,255));
  int y= int(random(0,500));
  noStroke();
  fill(0,x,x,70);
  ellipse(h,w,y,y);
}

