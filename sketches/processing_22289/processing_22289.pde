
void setup() {
  size (700,700);
background (0);
}

void draw () {
noStroke();
fill(random(255),random(150),random(200));  
color(150,60,100);
triangle(20,600,30,650,20,650);

fill(random(255));
triangle(670,650,350,40,670,40);
}

void mouseDragged() {
  fill(random(255),random(255),random(255),75);
   triangle(mouseX+random(30),mouseY+random(30),random(40), random(40), random(40), random(40));
     fill(random(255),random(255),random(255),90);
  triangle(mouseX+random(30),mouseY+random(30),random(40), random(40), random(40), random(40));
  stroke(random(10,50),random(10,50),random(10,50),30);
  line(mouseX,mouseY+20,mouseX+50,mouseY+50);
}
