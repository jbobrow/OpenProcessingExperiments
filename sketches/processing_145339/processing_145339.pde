

void setup(){
  size(400,400);
}

void draw(){
  float r1 = random(400);
  float r2 = random(400);
  float r3 = random(50);
  float r4 = random(50);
  float r5 = random(100);
  //pink 255,0,255
  //yellow 255,255,0
  //cyan 0,255,255
  
  stroke(random(255), random(0), random(255));  //circles border color
  strokeWeight(3);      //circles border thickness
  
  fill(random(255), random(255), random(0));
  ellipse(mouseX,mouseY,r5,r5);
  
  stroke(random(0),random(255),random(255));   //lines color
  //line(mouseX,mouseY,random(400),random(400));   //lines
  line(mouseX,mouseY,r1,r2);
  
  stroke(random(255),random(0),random(255));   //lines color
  line(r1,r2,r3,r4);

color from = color(204, 230, 0);
color to = color(0, 102, 153);
color interA = lerpColor(from, to, .33);
color interB = lerpColor(from, to, .66);
}


