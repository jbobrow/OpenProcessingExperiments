
void setup() {

size(640, 360);
background(#309bee);
noStroke();

stroke(0); 
line(85, 331, 600, 331) ;
noStroke();

fill(#1aac25);
triangle(52, 261, 560, 261, 433, 167);

fill(0);
ellipse(480, 267, 42, 42);

fill(0);
ellipse(137, 267, 32, 32);

// clouds

fill(255);
ellipse(137, 67, 100, 22);


}

// leave this part alone!!!
void draw() {
  println(mouseX + ", " + mouseY) ;
}


