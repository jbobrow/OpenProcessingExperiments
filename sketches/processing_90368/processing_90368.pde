
void setup(){
  size(400,400);
  smooth();
}

void draw(){
fill(255);
ellipse(200,200,310,310);
fill(0);
ellipse(200,200,300,300);
fill(84,143,203);
ellipse(200,200,175,175);

fill(255);
arc(200, 200,175,175, 0, HALF_PI);
fill(255);
arc(200,200,175,175,PI,PI+HALF_PI);
}
