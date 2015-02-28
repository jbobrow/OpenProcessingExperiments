
int a;
int b;

void setup(){
  size(400,400);
  background(255,255,255);
  noCursor();
}

void draw(){
  a=10;
  b=200;
  while(a<25){
    a = a+1;
 ellipse(random(400),random(400),a+10,a+10);
 stroke(100,100,100);
 fill(random(200),random(200),255);
  if (b < mouseX){
    fill(random(50),random(255),random(255));
  }
} 
}

