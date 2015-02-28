

//zoog

//colours
float r;
float g;
float b;
float a;

//line
int x;
int y;
int x2;
int y2;

void setup() {
  size(300,300);
  smooth();
  frameRate(30);
}

void draw() {
  background(1); //white background
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Line generator
  strokeWeight(3);
 
  x = int(random(300));
  y = int(random(300));
  line(x,y,mouseX,mouseY);
  stroke(r,g,b,a);
  
  x = int(random(300));
  y = int(random(300));
  line(x,y,mouseX,mouseY);
  stroke(r,g,b,a);
  
  x = int(random(300));
  y = int(random(300));
  line(x,y,mouseX,mouseY);
  stroke(r,g,b,a);
  
  x = int(random(300));
  y = int(random(300));
  line(x,y,mouseX,mouseY);
  stroke(r,g,b,a);
  
  x = int(random(300));
  y = int(random(300));
  line(x,y,mouseX,mouseY);
  stroke(r,g,b,a);
  
  x = int(random(300));
  y = int(random(300));
  line(x,y,mouseX,mouseY);
  stroke(r,g,b,a);
  
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  stroke(r,g,b,a);
  line(150,0,mouseX,mouseY);
  stroke(r,g,b,a);
  line(0,300,mouseX,mouseY);
  stroke(r,g,b,a);
  line(300,300,mouseX,mouseY);
  
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  stroke(r,g,b,a);
  line(0,0,mouseX,mouseY);
  stroke(r,g,b,a);
  line(300,300,mouseX,mouseY);
  stroke(r,g,b,a);
  line(150,300,mouseX,mouseY);
  
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  stroke(r,g,b,a);
  line(300,0,mouseX,mouseY);
  stroke(r,g,b,a);
  line(0,150,mouseX,mouseY);
  stroke(r,g,b,a);
  line(300,150,mouseX,mouseY);
  
  //body
  strokeWeight(1);
  stroke(255);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  fill(r,g,b,a);
  rect(mouseX,mouseY,20,100);
  //head
  stroke(255);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  //eyes
  stroke(0);
  fill(mouseX-50,mouseY+100,pmouseX-pmouseY); //eye colour is determined by mouse
  ellipse(mouseX-15,mouseY-32,16,32);
  ellipse(mouseX+15,mouseY-32,16,32);
  //legs
  stroke(255);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  
  
}

//User clicks to generate random lines
void mousePressed() {
  println("Take me to your leader!");
  
  //LINE GENERATOR
  strokeWeight(3);
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  stroke(r,g,b,a);
  line(150,0,mouseX,mouseY);
  stroke(r,g,b,a);
  line(0,300,mouseX,mouseY);
  stroke(r,g,b,a);
  line(300,300,mouseX,mouseY);
  
  x = int(random(300));
  y = int(random(300));
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  stroke(r,g,b,a);
  line(150,0,x,y);
  stroke(r,g,b,a);
  line(0,300,x,y);
  stroke(r,g,b,a);
  line(300,300,x,y);
  
  x = int(random(300));
  y = int(random(300));
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  stroke(r,g,b,a);
  line(150,0,x,y);
  stroke(r,g,b,a);
  line(0,300,x,y);
  stroke(r,g,b,a);
  line(300,300,x,y);
  x = int(random(300));
  y = int(random(300));
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  stroke(r,g,b,a);
  line(150,0,x,y);
  stroke(r,g,b,a);
  line(0,300,x,y);
  stroke(r,g,b,a);
  line(300,300,x,y);
  
  x = int(random(300));
  y = int(random(300));
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  stroke(r,g,b,a);
  line(150,0,x,y);
  stroke(r,g,b,a);
  line(0,300,x,y);
  stroke(r,g,b,a);
  line(300,300,x,y);
  
  x = int(random(300));
  y = int(random(300));
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  stroke(r,g,b,a);
  line(150,0,x,y);
  stroke(r,g,b,a);
  line(0,300,x,y);
  stroke(r,g,b,a);
  line(300,300,x,y);

  
}

