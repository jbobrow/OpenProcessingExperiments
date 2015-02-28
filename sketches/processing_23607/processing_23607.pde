
void setup() {
  smooth();
  size(300,300);
  background(0);
}

void draw() {
  background(0);
  fill(255);
  smooth();
  stroke(255);
  fill(255,255,0);
  ellipseMode(CORNER);
  ellipse(mouseX,mouseY,60,60);
  noFill();
  stroke(0);
  triangle(25,25,45,25,35,5);
  triangle(55,25,75,25,65,5);
  fill(0);
  ellipseMode(CENTER);
  fill(255);
  stroke(0);
  ellipse(50,50,40,40);

  line(30,80,70,80);
  line(60,80,58,72);
  line(58,72,65,72);
  line(65,72,63,80);//mouth/teeth;
  
  if(mousePressed) {
  {stroke(255,0,0);
  line(50,50,60,60);
  line(50,30,45,60);
  line(60,50,68,55);
  line(65,55,69,55);
  line(65,55,69,55);
  line(38,50,45,55);
  line(35,60,39,67);
  line(40,53,43,57);
  line(42,33,48,36);
  line(40,42,42,45);
  line(38,38,38,40);

  
  stroke(0);
  line(35,30,65,30);//eyebrow;
}
    
  }else{
    fill(255);
  }
  stroke(0);
  fill(0);
  ellipse(50,50,mouseX,mouseY);
}


