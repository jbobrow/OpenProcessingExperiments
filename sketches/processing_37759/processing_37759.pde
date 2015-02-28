
//My first sketch

void setup() {
  size(400,400);  // Set the size of the window
  smooth();
}

void draw() {
  background(255);  // Draw a white background

ellipseMode(CENTER);
rectMode(CENTER);

// red square
noStroke();
fill (210,14,2);
rect(100,100,200,200);

// blue square
noStroke();
fill (0,120,214);
rect(300,100,200,200);

// green square
noStroke();
fill (111,166,44);
rect(100,300,200,200);

// orange square
noStroke();
fill (240,135,8);
rect(300,300,200,200);

//red face ears
stroke (0);
fill (255);
ellipse(150,100,20,20);

stroke (0);
fill (255);
ellipse(50,100,20,20);

// red face
stroke(0);
fill (255);
ellipse (100,100,100,100);

line(70, 80, 130, 80);

arc(100,106, 55, 55, PI/2, PI);

//red spots
noStroke ();
fill (210,14,2);
ellipse (70,110,10,10);

noStroke ();
fill (210,14,2);
ellipse (130,110,10,10);

// red nose
fill (0);
ellipse(100,100,10,5);

//Blue face ears
stroke (0);
fill (255);
ellipse(250,100,20,20);

stroke (0);
fill (255);
ellipse(349,100,20,20);

// blue face
stroke(0);
fill (255);
ellipse(300,100,100,100);

arc(300,106, 55, 55, PI/10, PI);

// blue eyes
ellipse (280,90,20,20);
ellipse (320,90,20,20);

ellipse (280,90,15,15);
ellipse (320,90,15,15);

ellipse (280,90,10,10);
ellipse (320,90,10,10);

ellipse (280,90,5,5);
ellipse (320,90,5,5);

// blue nose
fill (0);
ellipse(300,105,10,5);

// blue Spots
noStroke ();
fill (0,120,214);
ellipse (269,110,10,10);

noStroke ();
fill (0,120,214);
ellipse (330,110,10,10);

//green face ears
stroke (0);
fill (255);
ellipse(150,300,20,20);

stroke (0);
fill (255);
ellipse(50,300,20,20);

// green face
stroke(0);
fill (255);
ellipse(100,300,100,100);

line(70, 325, 130, 325);

// green eyes

fill(255);
rect(100,275,60,20);

fill (255);
ellipse (80,285,20,20);
ellipse (120,285,20,20);

ellipse (80,285,18,18);
ellipse (120,285,18,18);


// green nose
fill (0);
ellipse(100,300,10,5);

//green spots
noStroke ();
fill (111,166,44);
ellipse (70,305,10,10);

noStroke ();
fill (111,166,44);
ellipse (130,305,10,10);

//orange face ears
stroke (0);
fill (255);
ellipse(250,300,20,20);

stroke (0);
fill (255);
ellipse(349,300,20,20);

// orange face
stroke(0);
fill (255);
ellipse(300,300,100,100);

ellipse (300,320,20,20);

// orange nose
fill (0);
ellipse(300,300,10,5);

// orange eyes
fill (255);
ellipse (280,285,20,20);
ellipse (320,285,20,20);

fill (0);
ellipse (280,285,5,5);
ellipse (320,285,5,5);

// orange Spots
noStroke ();
fill (240,135,8);
ellipse (269,305,10,10);

noStroke ();
fill (240,135,8);
ellipse (330,305,10,10);

fill(0);
rect (mouseX,mouseY,60,30);

fill(0);
rect (mouseX,mouseY-20,20,30);

}


