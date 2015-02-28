
float a,b,ainc,binc,weight,l;

void setup(){
  size(400,400);
  frameRate(500);
  ainc=random(.001,.1);
  binc=random(.001,.01);
  weight=random(.1,.6);
  l=200;
  strokeWeight(weight);
  smooth();
  background(255);
}

void draw(){
  translate(width/2,height/2);
  rotate(b);
  line(0+l*cos(a),0,0,0+l*sin(a));
  a=a+ainc;
  b=b+binc;  
}

void keyPressed(){
  a=0;
  b=0;
    ainc=random(.001,.1);
  binc=random(.001,.01);
  weight=random(.1,.6);
  l=200;
  strokeWeight(weight);
  background(255);
}


