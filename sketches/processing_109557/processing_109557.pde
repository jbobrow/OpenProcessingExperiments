
void setup() {

size(640, 360);
background(#309bee);
noStroke();

// road

stroke(0); 
line(45, 283, 600, 283) ;
noStroke();

// body

fill(#1aac25);
triangle(52, 268, 572, 261, 433, 167);

// wheels

fill(0);
ellipse(137, 267, 32, 32);

fill(0);
ellipse(480, 260, 48, 48);

//centers

fill(#dcdcdc);
ellipse(480, 260, 9, 9);

fill(#dcdcdc);
ellipse(137, 267, 8, 8);

// clouds

fill(255);
ellipse(137, 67, 100, 22);

fill(255);
ellipse(187, 78, 95, 25);

fill(255);
ellipse(327, 47, 180, 35);

fill(255);
ellipse(437, 57, 165, 20);

fill(250);
ellipse(612, 97, 65, 20);

fill(250);
ellipse(622, 88, 65, 20);

fill(250);
ellipse(12, 18, 65, 20);

// window outline

//vertical
stroke(0); 
line(433, 168, 425, 210) ;
noStroke();

//horizontal
stroke(0); 
line(425, 211, 268, 211) ;
noStroke();

// window

fill(#d0f6f2);
triangle(268, 211, 425, 210, 433, 168) ;



}

// leave this part alone!!!
void draw() {
  println(mouseX + ", " + mouseY) ;
}


