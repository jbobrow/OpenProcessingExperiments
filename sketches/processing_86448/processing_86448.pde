
float a = 0.02;
void setup(){
  size(600,600,OPENGL);
  background(0);
  noStroke();
}

void draw(){
translate(300,300);
  fill(200,10);
  rect(-300,-300,width,height);
  rotateY(a*PI);
  rotateX(a*PI);
  fill(random(255),90);
rect(0,0,random(200),random(200));
rotateY(a*PI*(-1));
  rotateX(a*PI*(-1));
  rect(0,0,random(200),random(200));
a += (random(1))/10;
}


