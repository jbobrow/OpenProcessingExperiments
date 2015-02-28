
//my program
//Hannah Lingle

//setup runs once at start up
void setup(){
  size(800,600);
  smooth();
}

//draw runs 60 fps
void draw(){
  noStroke();
  background(255);
  rectMode(CENTER);
  fill(12,25,242,100);
  rect(400,300,200,200);
  ellipseMode(CENTER);
  fill(242,12,124);
  ellipse(400,300,100,100);
  fill(2,160,50);
  arc(mouseX,mouseY,70, 70, PI, PI+QUARTER_PI);
  fill(255,146,3);
  arc(mouseX,mouseY, 50, 50, 0, HALF_PI);
  arc(width/2, height/2, 60, 60, HALF_PI, PI);
  arc(width/2, height/2, 70, 70, PI, PI+QUARTER_PI);
  arc(width/2, height/2, 80, 80, PI+QUARTER_PI, TWO_PI);
  println(mouseX);
  
}

