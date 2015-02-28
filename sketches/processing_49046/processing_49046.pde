
void setup(){
  size(640,480);
  smooth();
  frameRate(30);
  background(0);
}
void draw(){
  
  colorMode(RGB);
  ellipseMode(CENTER);

  //head,blue
  fill(26,84,183);
  noStroke();
  rect(300,200,30,25);
  fill(0,255,0);
  arc(315,200,10,8,radians(180),radians(360));
  stroke(255);
  line(315,195,315,192);
  noFill();
  ellipse(315,188,8,8);

  //eyes
  fill(0,255,0);
  noStroke();
  ellipse(310,210,7,7);
  ellipse(320,210,7,7);

  //body
  fill(26,84,183);
  noStroke();
  ellipse(315,230,15,28);
  
  //hands
  fill(26,84,183);
  rect(303,230,3,5);
  rect(324,230,3,5);
  
  //legs
  fill(26,84,183);
  noStroke();
  ellipse(310,245,5,5);
  ellipse(320,245,5,5);
}
void mousePressed(){
  stroke(255);
  noFill();
  arc(mouseX,mouseY,mouseY/2,mouseY/2,radians(0),radians(180));
  
}
void keyPressed(){
  background(255);
}

