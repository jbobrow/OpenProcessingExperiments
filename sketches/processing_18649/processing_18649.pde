
void setup(){
  size(400,400);
  colorMode(HSB,width);
  frameRate(30);
}

 int x= (width);
 int y= (height);
void draw(){

  fill(x,width,width);
  rectMode(CENTER);
 rect(x,y,x,y);
 x++;
 y++;
}

