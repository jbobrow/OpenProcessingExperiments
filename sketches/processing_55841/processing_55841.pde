
color sky = color(10, 80, 180);
color blood = color(200,80,80);
color chartreuse = color(0,190,10);
int n_squares=2;

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
    rect(sin(radians(i))*width, 75, 25, 25);
    fill(blood);
    rect(50, sin(radians(i))*height, 25,25);
    fill(chartreuse);
    rect(cos(radians(i/2))*width,125,25,25);
    i +=n_squares;
  } 
  else{
    i=0;
  }
}

