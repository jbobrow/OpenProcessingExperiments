
void setup() {
  size(400, 400);
  background(255);
  noStroke();
 // frameRate(10);
}
float x=0, y=0;
float d=20;

void draw() {
fill(random(200,255),random(255),random(255),100);

  rect(x, y, d, d);
  x+=d;

  if (x>width) {
    x=0;
    y+=30;
  }
  if(y>height){
   x=0;y=0; 
   background(255);
  }
  
  d=map(mouseX,0,width,5,30);
}

