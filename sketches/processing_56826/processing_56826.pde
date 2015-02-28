
float angle = 0.0; 
float angleDirection = 1; 
float speed = 0.0005;
float x = 150;
float y = 290;
int z = 100;

void setup () {
  size(800, 800); 
  smooth(); 
  strokeWeight(9); 
  background(204, 0, 7); 
  ellipseMode(RADIUS);
}  
  
void draw() { 
  background(204); 
  translate(400, 85); // Move to start position 
  rotate(angle); 
  strokeWeight(12); 
  line(20, 20, 40, 0); 
  translate(40, 0);	// Move to next joint 
  rotate(angle * 2.0); 
  strokeWeight(6); 
  line(0, 0, 30, 0); 
  //translate(30, 0);	// Move to next joint 
  //rotate(angle * 2.5); 
  //strokeWeight(3); 
  //line(0, 0, 20, 0);

angle += speed * angleDirection; 
if ((angle > QUARTER_PI) || (angle < 0)) {
  angleDirection *= -1;

}

// Head 
fill(255, 5, 82); // Set fill to pink
ellipse(y, x, 44, 44); //nose
fill(0); // Set fill to black
ellipse(y, x, 3, 3); // Pupilxxxxxr
fill(153); // Set fill to light gray
noStroke();
ellipse(263, x, 9, 9); // Small eye 1 
ellipse(296, 130, 9, 9); // Small eye 2

//body
noStroke();
fill(0, 6, 199); // Set fill to blue
ellipse(z*3, z*3, z, z); 

// legs
stroke(0, 255, 0); // Set stroke to green
line(320, z*4, 320, z*5); // Left  leg
line(280, z*4, 280, z*5); // Right leg
//line(220, 220, 220, 230); // arm 
//line(220, 220, 240, 230); // arm 

//body
noStroke();
fill(0, 6, 199); // Set fill to blue
ellipse(z*3, z*3, z, z); 

}




//if (d < radius) {
//}
//radius++;
//fill(0); } else {
//fill(255); ellipse(x, y, radius, radius);


