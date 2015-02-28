
void setup () {
  size(300, 300);
}

void draw() {
  //sky
  background(255,255,mouseX);
  
    //sun
  fill(#F08E33);
  ellipse(250,mouseX,50,50);
  
  //ground
  fill(0,255,0);
  rect(0,150,width,height);
  
  //road
  fill(0);
  rect(0,175,width,50);
  
  //car
  noStroke();
  fill(200);
  rect(mouseX+5,190,40,10);
  rect(mouseX,200,50,20);
  stroke(255);
  fill(0);
  ellipse(mouseX+5,220,10,10);
  ellipse(mouseX+40,220,10,10);

  
}

