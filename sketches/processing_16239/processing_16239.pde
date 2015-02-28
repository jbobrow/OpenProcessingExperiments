
void setup() {
  size(600,600);
  smooth();
  background(255);
  noStroke();
}

void draw() {
lion(-50,0,100,100,100,250, 0.2);
lion(-20,0,100,100,100,250, 0.5);
  lion(0,0,150,150,100,400,2);
  
}

//fur1=100, fur2=100, fur3=100, face=250, point1=300, point2=200
void lion(int x, int y, int fur1, int fur2, int fur3, int face, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  //body
  fill(255,222,0);
  beginShape();
  vertex(200,300);
  vertex(400,300);
  vertex(350,500);
  vertex(310,500);
  vertex(310,410);
  vertex(290,410);
  vertex(290,500);
  vertex(250,500);
  endShape();

  //face

    ellipse(300,200,face,face);

  for(int i=0; i<12;i++) {
    pushMatrix();
    translate(300,200);  
    rotate(radians(40*i));
    fill(160,81,35);
    ellipse(fur2,fur3,fur1,fur1);
    popMatrix();
  }

  //eyes & mouth & nose
  fill(0);
  ellipse(250,180,20,20);
  ellipse(350,180,20,20);
  //fill(241,86,51);
  //triangle(270,255,330,255,300,290);
  fill(255);
  ellipse(270,240,70,70);
  ellipse(330,240,70,70);
  fill(82,57,18);
  ellipse(300,210,50,30);
  popMatrix();
}


