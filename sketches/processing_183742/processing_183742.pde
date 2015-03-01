
void setup () { 
  background(200, 100, 200);
  size (400,400);}
void draw() {
line(0,0,random(400),random(400));
line(random(100),random(100),random(100),random(100));
fill (random(255),0,random(255));
triangle(random(200), random(75), random(100), random(20), random(86), random(75));

line(100,100,random(100,200),random(100,200));
line(random(100,200),random(100,200),random(100,200),random(100,200));
fill (random(255),0,random(255));
triangle(random(400,200), random(50,230), random(140,350), random(100,250), random(115,186), random(175,400));
}

