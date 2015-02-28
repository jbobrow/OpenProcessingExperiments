
void setup(){
  size(200,200);
  background(100);    // Setting the background to white
stroke(255);          // Setting the outline (stroke) to black
line(0,0,150,150);

//fill(150);          // Setting the interior of a shape (fill) to grey 
stroke(0); 
noFill();
rect(50,50,75,100); // Drawing the rectangle

// example of RGB
background(255);  
noStroke(); 

// Bright red
fill(255,0,0);
ellipse(20,20,16,16);

// Dark red
fill(127,0,0);
ellipse(40,20,16,16);

// Pink (pale red)
fill(255,200,200);
ellipse(60,20,16,16);

//example of ALpha transparency
size(200,200);
background(0);
noStroke();

// No fourth argument means 100% opacity.
fill(0,0,255);
rect(0,0,100,200);

// 255 means 100% opacity.
fill(255,0,0,255);
rect(0,0,200,40);

// 75% opacity.
fill(255,0,0,191);
rect(0,50,200,40);

// 55% opacity.
fill(255,0,0,127);
rect(0,100,200,40);

// 25% opacity.
fill(255,0,0,63);
rect(0,150,200,40);




}

