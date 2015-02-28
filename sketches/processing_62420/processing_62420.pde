

void setup() {
  size(400,400);
  smooth();
  cursor(CROSS);
}

void draw() {

  background(#F0EDDA);
  noStroke();
   
  fill(#11348B);
  float rectL = mouseX/float(width);
  rect(0,30,100,400); //left big
  rect(110,pow(rectL, 2)*width,8,400); //left thin
  rect(150,0,8,pow(rectL, .3)*width); //right thin
  rect(166,0,pow(rectL, 4)*width,300); //right thinner
   
  fill(#F5BC2A);
  float angle = map(mouseX/20,mouseY/50,width,0,PI);
  pushMatrix();
    translate(10,10);
    rotate(angle);
    triangle(400,45,220,115,275,400);
  popMatrix();
  
  fill(#CB4202);
  ellipse(315+mouseX/5,95-mouseY/10,150,150);
  ellipse(200-pmouseY/8,380-mouseX/20,50,50);
   
  stroke(0);
  strokeWeight(1);
  line(0,350,335,90);
  line(0,310,338,400);


}

