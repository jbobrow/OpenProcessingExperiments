
void setup() {
  size(1000,1000);
  smooth(120); 
}

void draw() {
  noStroke();
  int green = round(map(pmouseX,100,255,100,255));
  fill(40,green,random(50,100));
  ellipse(mouseX,250,60,60);
  
  int green2 = round(map(-mouseX,100,255,100,255));
  fill(40,green2,random(50,100));
  int x = round(map(mouseX,width,-width,0,2000));
  ellipse(x,200,60,60);
  
  int blue = round(map(mouseX,50,255,50,100));
  fill(random(100,255),green2,blue);
  rect(mouseX,mouseY,-pmouseX,pmouseY);
  
  int y = round(map(mouseY,0,height,0,2000));
  fill(random(0,55),random(22,30),random(45,255));
  rect(random(0,1000),mouseY,random(40,80),y);
  
  
  int x2 = round(map(mouseX,60,100,0,500));
  stroke(10);
  line(x2,mouseY,pmouseX,pmouseY);
  
}


