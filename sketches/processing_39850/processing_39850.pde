
float rsize = 50.0;
int angle;
int speed;
float rcolor = 0.0;
int x;
int y;

void setup() {
  size(800,800);
  smooth();
  background(0);
  stroke(255,10);
  frameRate(24);
}

void draw() {
  
  angle = angle + 1;
  speed = speed + 40;
  
  if(rcolor < 200){
    rcolor = rcolor + 0.2;
  }
  
  fill(255,5);
  
  /*
  
  if(rsize < 25){
    rsize = rsize + 0.1;
  }else{
    rsize = 0;
  }
  
  */
  
  println("rsize"+rsize);
  
  if( x < width ){
    x = x + 1;
  }else{
    x = 0;
  }
  
  pushMatrix();
  
  translate(x,height/2);
  
  rotate(radians(angle+speed));
  
  rect(0,0,rsize,rsize);
  
  line(0,0,width,height);
  
  popMatrix();
  
}


