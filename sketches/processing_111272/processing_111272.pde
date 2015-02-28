
int x;
float y;

void setup(){
  size(1200,600);
  frameRate(10);
  background(255,255,255);
}

void draw(){
  y = mouseY;
  x = mouseX;
 //noStroke : remove stroke
 noStroke();
 //fill(r,g,b,a); -> color for shapes after this fuction
 fill(random(255),random(255),random(255),random(100));
 rect(x,y,100,100);
 fill(random(255),0,0,random(100));
 ellipse(random(width),random(height),200,200);
}

//event function
void mousePressed(){
  background(255,255,255);
}
void keyPressed(){
  background(0,0,0);
}
