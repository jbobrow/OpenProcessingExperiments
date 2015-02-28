
//Homework 5_1
//Melissa Diamond

void setup() {
  size (400, 400);
  noFill();
  background(0);
  smooth();
}

void draw() {
  for(int a = 0; a<width; a += 60){
    for(int b = 0; b<width; b+=60){
      shapes (a,b);
    }
  }
  
  for(int c = 5; c<width; c += 30){
    for(int d = 5; d<width; d +=30){
      shapes (c,d);
    }
  }
  
  noLoop();
}

void shapes (float c, float d){  //creates overlapping grid of circles
  pushMatrix();
  translate(0,0);
  strokeWeight(random(5)); //creates random stroke weight
  stroke(200, random(width), random(width), random(width)); //creates random color
  ellipse(c,d,40,40); 
  popMatrix();
}


