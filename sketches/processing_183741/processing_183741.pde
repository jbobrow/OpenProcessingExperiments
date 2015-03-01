
void setup(){
  size (300,300);
  background(46,139,87);
  noStroke();
  frameRate(30);
  smooth();
}


void draw(){
  flash();
}

void flash(){
  for(int x=0; x<=600;x+=50) {
    for(int y=0;y<600; y=y+50){
      
      float a=random(255);
      float b=random(50);
      float c=random(45);
      float d=random(255);
      
      fill(a,b,c,d);
      ellipse(150,150,x,y);
    }}}
    
