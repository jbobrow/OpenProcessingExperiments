
int worktime = 360; // Total minutes of work and breaks planned for the day
int focusblock = 25; // Focus block length in minutes
int breaklength = 5; // Break length in minutes
int blocksize = 5;
int blocks = worktime/blocksize;
void setup()
{
 

  size(1000,400);
  smooth();
  background(255);
}

void draw() {
  strokeWeight(0.25);
  
 translate(20,20);
  textAlign(CENTER);
  
  // Schedule
  
  for (int i = 0; i < worktime+1; i +=blocksize, i++) {
  rect(i, 0, blocksize, 20);
  fill(200);
  noStroke();
  if (i0 == 0) { // If number is a multiple of 30 (one hour) then do below
  text(i, i, 40);
  text("blocks" +  blocks, 20, 100);
  }

  }

}

