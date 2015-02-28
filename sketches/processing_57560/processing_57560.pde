
//variables
float x;
float y;
float easing = 0.02;
int a = 276;
int b = 140;
int r = 4;


void setup(){
size(600, 480);
smooth();
strokeWeight(2);

ellipseMode(RADIUS);

}

void draw(){
  int targetX = mouseX;
a += (targetX - a) *easing;
background(255,204,102);
 

// Antennae
line(a, b, a-30,b+50); // Left antennae
line(a, b, a+30, b-40); // Right antennae

// Body
noStroke();
fill(102); // Set fill to grey
arc(a-1, b+105, 45, 45, 0, 3.14);  // lower body
fill(0); // Set fill to black
rect(a-46, b+30, 90, 70); // upper body
// Head
fill(255);
arc(a, b+15, 45, 45, 3.14, 6.28);  // Head
fill(153); // Set fill to light gray
ellipse(a-13, b-2, r, r); // Small eye 1
ellipse(a+20, b-2, r, r); // Small eye 2
// Arms
fill(255); // White arms
triangle(a-56, b+30, a-41, b+30, a-1, b+80);  // Left arm
triangle(a+54, b+30, a+69, b+30, a+24, b+80);  // Right arm



if(mousePressed){
   background(255,204,102); 
  // Antennae
line(a, b, a-30,b+50); // Left antennae
line(a, b, a+30, b-40); // Right antennae

// Body
noStroke();
fill(102); // Set fill to grey
arc(a-1, b+105, 45, 45, 0, 3.14);  // lower body
fill(0); // Set fill to black
rect(a-46, b+30, 90, 70); // upper body
// Head
fill(255);
arc(a, b+15, 45, 45, 3.14, 6.28);  // Head
//eye
fill(153);
strokeWeight(2);
ellipse(a-13, b-2, r, r); // Small eye 1
ellipse(a+20, b-2, r, r); // Small eye 2
 // Arms
fill(255); // White arms 
  triangle(a-56,b+30, a-41, b+30, 50, 100);  // Left arm
  triangle(a+54, b+30, a+69, b+30, 300, 100);  // Right arm 
  

}
}







