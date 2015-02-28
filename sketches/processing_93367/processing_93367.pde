
float r = 100;
float g = 150;
float b = 200;
float a = 200;

float diam = 20;
float x = 200;
float y = 100;
float circle = 20;

void setup(){
  size(400,300);
  fill(150);
  smooth();
  strokeWeight(2);
background(0);
}

void draw(){

}


void keyPressed(){
  fill(r,g,b,a);
  x=int(random(0,400));
  y=int(random(0,400));
  r=int(random(0,500));
  g=int(random(0,500));
  b=int(random(0,500));
  diam=int(random(1,40));
  rect(x,y,diam,diam);
 
}

void mousePressed(){
    noStroke();
    fill(r,g,b);
  r=int(random(0,500));
  g=int(random(0,500));
  b=int(random(0,500));
   circle =int (random(10,50));
   ellipse(mouseX,mouseY, circle, circle);

}



