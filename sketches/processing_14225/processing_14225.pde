
float inc = 0.0;

void setup(){
  size(900,700);
  noStroke();
  smooth();
  frameRate(24);
}

void draw(){
background(0);
tenacle(width/2,height/2,-4,.01);
tenacle(width/2,height/2,4,.01);
tenacle(width/2,height/2,-4,.02);
tenacle(width/2,height/2,4,.02);
tenacle(width/2,height/2,-4,.03);
tenacle(width/2,height/2,4,.03);
tenacle(width/2,height/2,-4,.04);
tenacle(width/2,height/2,4,.04);
}

void tenacle(int x, int y, int seg, float incr){
  inc+=incr;
  float angle = sin(inc*1.2)/10.0+cos(inc*1.7)/20.0;
  pushMatrix();
  translate(x,y);
  for(int i = 100;i>0;i-=10){
    for(int j=0;j<=300;j+=30){
    stroke(j,0,0,j);
    strokeWeight(i);
    line(0,0,0,-seg);
    translate(0,-seg);
    rotate(angle);
    }
  }
  popMatrix();
  rotate(.4*angle);
  
}

