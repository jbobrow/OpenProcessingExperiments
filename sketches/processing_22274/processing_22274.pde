
void setup() {
  size(600,600);
  background(5,4,28,100);
}

void draw() {


noStroke();
fill(250,176,78,10);
ellipse(mouseX,mouseY,10,40);

noStroke();
fill(250,176,78,10);
ellipse(mouseX+random(70),mouseY+random(70),30,10);

noStroke();
fill(250,176,78,10);
ellipse(mouseX+random(30),mouseY+random(30),10,40);


noStroke();
fill(250,176,78,10);
ellipse(mouseX+random(30),mouseY+random(30),10,40);


noStroke();
fill(245,239,47,10);
triangle(mouseX+random(50)-random(50),mouseY+random(70)-random(70),280,280,300,300);



noStroke();
fill(250,176,78,10);
ellipse(mouseX+random(100)-random(100),mouseY+random(100)-random(100),10,40);
}

