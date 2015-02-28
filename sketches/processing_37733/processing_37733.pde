
//Homework 4.3
//Melissa Diamond

size(300, 300);
noFill();
background(0);
stroke(170);

for(int i = 0; i < 360; i +=10){
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(i));
  translate(100,0);
  ellipse(0, 0, 200, 200);
  ellipse(0, 0, 100, 100);
  ellipse(0, 0, 50, 50);
  line(0, 40, 40, 40);
  popMatrix();
}



