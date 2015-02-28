
void setup() {
  size (900,700);
  background(0);
}

void draw(){
stroke(random(255),random(255),random(255));
strokeWeight(random(5));
line(450,350,random(900),random(700));
point(random(900),random(700));  

noStroke();
fill(random(255), random(255), random(255));
float radius = random(0, 50);
float angle = random(-TWO_PI, TWO_PI);
float x = radius * cos(angle) + 450;
float y = radius * sin(angle) + 350;
ellipse(x, y, random(50), random(50));

 
radius = random(150, 160);
angle = random(-TWO_PI, TWO_PI);
x = radius * cos(angle) + 450;
y = radius * sin(angle) + 350;
rectMode(CENTER);
rect(x,y,random(100),random(100));

radius = random(200,220);
angle = random(-TWO_PI, TWO_PI);
x = radius * cos(angle) + 450;
y = radius * sin(angle) + 350;
ellipseMode(CENTER);
fill(random(255),random(255),random(255),80);
ellipse(random(900),random(700),random(200),random(200));
line(random(900),random(700),random(900),random(700));
fill(random(200),random(200),random(200),70);
quad(0,0,900,0,900,700,0,700);
triangle(450, 350, random(900),random(700),random(900),random(700));


}



