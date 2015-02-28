

void setup(){
  size(100,600);
}

void draw(){
  translate(0,mouseY-50);
  background(0,185,255);
  strokeWeight(5);
  
  //te
  pushMatrix();
  translate(25,50);
  rotate(map(mouseY,0,100,0,3.14));
  line(0,0,0,35);
  popMatrix();
  
  pushMatrix();
  translate(75,50);
  rotate(map(mouseY,0,100,0,-3.14));
  line(0,0,0,35);
  popMatrix();
  
  //ashi
  line(45,72,45,95);
  line(55,72,55,95);
  
  //doutai 
  ellipse(50,50,50,50);
  
  //kao
  strokeWeight(2);
  line(30,35,70,35);
  line(25,45,75,45);
  rect(32,40,15,10,7);
  rect(53,40,15,10,7);
}


