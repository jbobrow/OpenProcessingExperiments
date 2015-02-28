


// this happens once at the start
void setup() 
{
  size(500, 500); 
  
  background(255, 255, 255);
}

// this happens over and over
void draw() 
{  
  // Random R,G,B & transparency=32
  fill(random(0, 256), random(0, 256), random(0, 256), 32);

  // draw rect at random position & size
  rect(random(0, 500), random(0, 500), random(0, 30), random(0, 30));
}


