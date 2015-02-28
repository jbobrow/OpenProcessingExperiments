
//drawing program
//by maria fang
//week1 jan18 2010

void setup(){
  size(600,600);
  smooth();
  background(60);
}

void draw(){
  fill(225,50);
  noStroke();
  ellipse(mouseX,mouseY,30,30);
  println("x:" + mouseX);
  println(mouseY);
  
  fill(116,0,0,5);
  arc(10, 60, mouseX, mouseY, 0, PI/2);
  stroke(255,0,0,60);
  
  fill(116,0,0,5);
  arc(60, 10, mouseX, mouseY, 0, PI/2);
  stroke(255,0,0,60);
  
  fill(255,239,116);
  ellipse(mouseX + random(-50, 50),mouseY + random(-50, 50), 10, 10);

  
}


