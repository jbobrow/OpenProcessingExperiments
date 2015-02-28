
// PS1 - 2
// Ryanne Hollies


// cute

void setup() {
  size(400, 400);
  smooth();
  
}

void draw() {
 
 background(245, 143, 199);
 
 
 //head
 noStroke();
 fill(255);
 ellipse(200, 100, 80, 80);
 
 
 //left ear
 fill(255);
  noStroke();
 triangle(168, 80, 185, 63, 168, 45);


// right ear
fill(255);
 noStroke();
 triangle(232, 76, 214, 64, 232, 45); 
 
 //body
  fill(255);
  ellipse(200, 235, 220, 200);
  
 fill(150);
 ellipse(170, 335, 40, 30);
 ellipse(240, 335, 40, 30);
 ellipse(170, 200, 40, 30);
 
 fill(255);
 rectMode(CENTER);
 rect(170, 182, 40, 30);

// right paw
fill(150); 
ellipse(240, 200, 40, 30); 
 fill(255);
 rectMode(CENTER);
 rect(240, 182, 40, 30);

 //tail
 stroke(255);
 strokeWeight(25);
 line(280, 270, 360, 200);
 
 //eyes + nose
 fill(0);
 ellipse(185, 90, 7, 7);
 ellipse(207, 90, 7, 7);
 noStroke();
 fill(224, 143, 188);
 triangle(195, 105, 200, 115, 205, 105);

//whiskers
 stroke(0);
 strokeWeight(1);
 line(190, 110, 155, 105);
 line(190, 110, 155, 115);
 line (210, 110, 245, 105);
 line(210, 110, 245, 115);

 
 
  
}

