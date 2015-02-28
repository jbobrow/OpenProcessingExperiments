
void setup() {
  size(500, 809);
  
}

void draw() {
  background(0,0,70,2);
  ellipse(random(0,500),random(0,100),random(1-100),random(1-100));
  ellipse(random(0,75),random(0,809),random(1-100),random(1-100));
   ellipse(random(0,500),random(740,809),random(1-100),random(1-100));
   ellipse(random(425,500),random(0,809),random(1-100),random(1-100));


rectMode(CENTER);
stroke(0);
fill(20,10,150);
rect(250,404,100,161);


}


