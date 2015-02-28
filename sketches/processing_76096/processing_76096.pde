
float angle = 0;
int distance = 5;
int number_of_elements = 3;
float increment_value = TWO_PI / number_of_elements;
int circ_size = 15;
float start_angle = 0;
float rotate_speed = .8;
void setup() {
  size(500, 500);
  background(255);
}

void draw() {


  
    noFill();
  rect(31,15,50,95);
  fill( random(247), random(0), random(134));
  ellipse(56,40,25,25);
  beginShape();//begin drawing the shape -- It's a big star
     vertex(56,69);
     vertex(61,79);
     vertex(72,80);
     vertex(64,88);
     vertex(66,98);
     vertex(56,93);
     vertex(47,98);
     vertex(49,88);
     vertex(41,80);
     vertex(52,79);
     vertex(56,69);
     endShape();
       noStroke();
       if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);

  ellipse(mouseX + cos(angle) * distance, mouseY + sin(angle) * distance, circ_size, circ_size);


 
  }
}
