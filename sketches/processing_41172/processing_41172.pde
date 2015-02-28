
float x;
int xEllipse=0;
int yEllipse=0;


void setup (){
size (400,400);
background(150);
smooth();

  
}
 
void draw(){
  x = random(100);
  
  println(x);
  
noStroke();
fill(200,2);
rect(0,0,width,height);

fill(x);

if (mousePressed && dist(xEllipse, yEllipse, mouseX, mouseY) < 50){
  xEllipse = mouseX;
  yEllipse = mouseY;
}

ellipse(xEllipse, yEllipse, x, x);
}

