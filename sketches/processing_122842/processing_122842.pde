
void setup() {
  size(500, 500);
}


void draw() {
  background(255, 255, 255);
//gezien vanuit het monster

//hoofd
  stroke(0);
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX+255,mouseY+175,150,50);

//torso
  stroke(0);
  strokeWeight(3);
  fill(255, 0, 0);
  triangle(mouseX+210,mouseY+200,mouseX+300,mouseY+200,mouseX+255,mouseY+400);

//linkerarm
  line(mouseX+295,mouseY+220,mouseX+380,mouseY+175);

//rechterarm
  line(mouseX+215,mouseY+220,mouseX+140,mouseY+175);

//linkerhand
  triangle(mouseX+380,mouseY+175,mouseX+350,mouseY+100,mouseX+410,mouseY+100);

//rechterhand
  triangle(mouseX+140,mouseY+175,mouseX+160,mouseY+100,mouseX+100,mouseY+100);

//rechterbeen 
  line(mouseX+243,mouseY+349,mouseX+178,mouseY+413);

//linkerbeen
  line(mouseX+267,mouseY+349,mouseX+338,mouseY+413);

//rechtervoet  
  triangle(mouseX+178,mouseY+413,mouseX+137,mouseY+471,mouseX+208,mouseY+471);
  
//linkervoet
  triangle(mouseX+338,mouseY+413,mouseX+310,mouseY+471,mouseX+375,mouseY+471);
  
  println("x" + mouseX);
  println("y" + mouseY);
}
