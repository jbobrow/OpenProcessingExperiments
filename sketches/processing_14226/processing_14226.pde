
float inc = 0.0;

void setup(){
  size(700,700);
  noStroke();
  smooth();
  frameRate(12);
}

void draw(){
background(0);
tenacle(width/2,height/2,-7,.01);
tenacle(width/2,height/2,7,.01);
tenacle(width/2,height/2,-7,.02);
tenacle(width/2,height/2,7,.02);
tenacle(width/2,height/2,-7,.04);
tenacle(width/2,height/2,7,.04);
tenacle(width/2,height/2,-7,.08);
tenacle(width/2,height/2,7,.08);
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

