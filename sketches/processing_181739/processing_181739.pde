
void setup() { 
  size(600, 600);
  background(255, 200, 200); 
}

void draw() { 
fill(500, 500, 0);
ellipse(300, 300, 400, 400);
fill(0);
ellipse(319, 250, 20, 65);
ellipse(269, 250, 20, 65);
fill(0);
strokeWeight(4);
line(250, 350, 450, 350);
arc(300, 350, 300, 200, 0, PI / 2.0);

}
