
//practice of 20130925
//by N76021107@mail.ncku.tw

void setup() {
size(600,600);
background(130, 20, 20);
}

void draw() {
fill(255);
ellipse(300, 300, 600, 600);
fill(0);
arc(300, 300, 600, 600, HALF_PI, 3*HALF_PI);
fill(255);
arc(300, 450, 300, 300, HALF_PI, 3*HALF_PI);
fill(1);
arc(300, 150, 300, 300, -HALF_PI, HALF_PI);
fill(255);
ellipse(300, 150, 75, 75);
fill(1);
ellipse(300, 450, 75, 75);
}


