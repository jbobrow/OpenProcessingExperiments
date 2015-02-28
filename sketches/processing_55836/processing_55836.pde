
color sky = color(10, 80, 180);
int n_squares=10;

void setup(){
  size(300, 300);
  frameRate(30);
  smooth();
  background(0);  
}
int i=0; 
void draw(){
  fill(0,20);
  rect(0,0,width,height);
  if (i<width){
    fill(sky);
    rect(sin(radians(i))*width, 75, 100, 100);
    i +=n_squares;
  } 
  else{
    i=0;
  }
}

