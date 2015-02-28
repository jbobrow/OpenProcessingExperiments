
void setup(){
size (400,400);
}

void draw(){
background(180);
  smooth();
stroke(100,100);
strokeWeight(50);
  line(200,100,200,300);
strokeWeight(10);
ellipse(150,150,50,mouseX);
ellipse(250,150,50,mouseX);
ellipse(200,250,100,mouseY);
}

