
void setup() {
  size(600,600);
  smooth();
}

void draw() {
  background(255);
  noStroke();

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
  
  ellipse(300,200,250,250);

  for(int i=0; i<12;i++) {
    pushMatrix();
    translate(300,200);  
    rotate(radians(40*i));
    fill(160,81,35);
    ellipse(100,100,100,100);
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
}


