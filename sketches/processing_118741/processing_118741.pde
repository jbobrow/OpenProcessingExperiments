
float x = 0.0;
float y = 0.0;
float t = 0.0;
float t2 = 0.0;
int frame = 1;
void setup(){
  size(600,600);
  stroke(255);
  strokeWeight(1);
  background(100);
  smooth();
  frameRate(300);
}
void draw(){
  //if(frame<300){
    translate(300,300);
    spin();
    inc();
    fill(255);
    Line();
    println(frame);
    //saveFrame("spiral-###.png");
}

void inc(){
  x+=.05;
  y+=.05;
  t+=.01;
  t2-=.01;
  frame ++;
}
void spin(){
  rotate(PI/4*cos(t));
}

void Line(){
  stroke(255,10);
  line(x,y,x,-y);
  line(-x,-y,-x,y);
  stroke(0,10);
  line(x,y,-x,y);
  line(-x,-y,x,-y);
}


