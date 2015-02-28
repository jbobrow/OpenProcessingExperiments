
int dim = 400; //Default size

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  rectMode(CENTER);
  ellipseMode(CENTER);
  maketail();
  makefeet();
  makeface();
  makemouth();
  makeantennae();
  noLoop();
}

void maketail() {
  stroke(0);
  //Make the tail point
  fill(255);
  arc(dim-dim/8,3*dim/4+dim/32,dim/8,dim/8,PI+HALF_PI,TWO_PI);
  //Add spike ball (square + two triangles)
  fill(0);
  rect(dim-dim/16,3*dim/4+dim/16, dim/16, dim/16);
  triangle(dim-dim/8+dim/50, 3*dim/4+dim/16, dim-dim/50, 3*dim/4+dim/16,dim-dim/16,3*dim/4+dim/50);
  triangle(dim-dim/8+dim/50, 3*dim/4+dim/16, dim-dim/50, 3*dim/4+dim/16,dim-dim/16,3*dim/4+dim/8-dim/50);
  //Make the tail length
  for (int i = 0; i < 200; i++) {
    //Random color for each elipse
    fill(darkgreenchoose());
    //Limit elipses to dim/2 to dim and dim/2 to 3dim/4
    //Make triangle with limit k > .5*j+dim*.25
    int j = floor(random(3*dim/4)+dim/4-dim/8);
    int k = floor(random(dim/4)+dim/2);
    if (k >= .5*j+dim/4) {
      ellipse(j,k,dim/8,dim/8);
    }
  }
}

void makefeet() {
  stroke(0);
  //Choose legs
  fill(midgreenchoose());
  ellipse(dim/8,3*dim/4,dim/8,dim/3);
  ellipse(3*dim/8,3*dim/4,dim/8,dim/3);
  //Choose feet
  fill(midgreenchoose());
  ellipse(dim/8,7*dim/8,dim/6,dim/10);
  ellipse(3*dim/8,7*dim/8,dim/6,dim/10);
  fill(midgreenchoose());
  for (int i = 0; i < 3; i++) {
    ellipse(dim/8-dim/16+i*dim/16,15*dim/16,dim/10,dim/12);
    ellipse(3*dim/8-dim/16+i*dim/16,15*dim/16,dim/10,dim/12);
  }
} 

void makeface() {
  stroke(0);
  for (int i = 0; i < 200; i++) {
    //Random color for each elipse
    fill(greenchoose());
    //Limit elipses to 0 to dim/2 and dim/4 to 3dim/4
    //Make circular with limit x^2+y^2< (dim/4)^2
    int j = floor(random(dim/2)+dim/16);
    int k = floor(random(dim/2)+dim/4);
    if (sq(j-dim/4)+sq(k-dim/2) <= sq(dim/4)) {
      ellipse(j,k,dim/8,dim/8);
    }
  }
}

void makemouth() {
  stroke(0);
  //Green elipse face
  fill(greenchoose());
  ellipse(dim/4, dim/2, dim/3, dim/3);
  //black mouth square in center of face
  fill(0);
  rect(dim/4, dim/2, dim/4, dim/8);
  //red tongue
  fill(floor(random(128)+128),0,0);
  ellipse(dim/4,17*dim/32,dim/8,dim/16);
  //white teeth
  fill(255);
  for (int i = 0; i < 4; i++) {
    triangle(dim/8+dim*i/16,9*dim/16,3*dim/16+dim*i/16,9*dim/16,5*dim/32+dim*i/16,dim/2);
    triangle(dim/8+dim*i/16,7*dim/16,3*dim/16+dim*i/16,7*dim/16,5*dim/32+dim*i/16,dim/2);
  }
}

void makeantennae() {
  //Makes a pair of black lines for eyebrows
  //centered around dim/8,dim/2-3dim/16 and 3dim/8,dim/2-3dim/16
  stroke(0);
  fill(0);
  line(dim/8-dim/12,dim/2-3*dim/16-dim/12,dim/8+dim/12,dim/2-3*dim/16+dim/12);
  line(3*dim/8-dim/12,dim/2-3*dim/16+dim/12,3*dim/8+dim/12,dim/2-3*dim/16-dim/12);
}

color greenchoose() {
  return color(floor(random(128)),floor(random(128)+128),floor(random(128)));
}

color midgreenchoose() {
  return color(floor(random(96)),floor(random(96)+96),floor(random(96)));
}

color darkgreenchoose() {
  return color(floor(random(64)),floor(random(64)+64),floor(random(64)));
}
