
int x = 224;
int y = 232;
int b = 300;

void setup(){
size(1000,800);
background(0);
}
void draw(){
  frameRate(5);
strokeWeight(random (1,600));
fill(random (200,250),random (45,100),random(45,100));
rect(mouseX,mouseY,b,b);
strokeWeight(random (1,800));
fill(random(100,150), random(200,250), random (20,40));
rect(X,mouseY,b,b);
strokeWeight(random (1,800));
fill(random (x),random (y),(b));
rect(mouseX,Y,b,b);
stroke(random (0,95));
strokeWeight(random (10,200));
point(100,100);

point(800,600);
point(500,300);
point(200,700);
strokeWeight (random (1,800));
point(400,200);
}
void mousePressed(){
  background(255);
}



