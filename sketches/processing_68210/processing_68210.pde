
// For puff head
float headX;
float headY;
float speedX = .9;
float speedY = .9;

// For puff body
int cells = 1;
float[]px= new float[cells];
float[]py= new float[cells];
float[]radiiX = new float[cells];
float[]radiiY = new float[cells];
float[]angle = new float[cells];
float[]frequency = new float[cells];
float[]cellRadius = new float[cells];

void setup(){
  
  size(int(screen.width*.80), int(screen.height*.80));
  
  // Begin in the center
  headX = width/5;
  headY = height/5;

  // Fill body arrays
  for (int i=0; i< cells; i++){
    radiiX[i] = random(-7, 7); 
    radiiY[i] = random(-4, 4);
    frequency[i]= random(-5, 9);
    cellRadius[i] = random(16, 30);
  }
  frameRate(30);
}

void draw(){
  background(3);
  noStroke();
  fill(255, 255, 100, 300);

  // Follow the leader
  for (int i =0; i< cells; i++){
    if (i==0){
      px[i] = headX+sin(radians(angle[i]))*radiiX[i];
      py[i] = headY+cos(radians(angle[i]))*radiiY[i];
    } 
    else{
      px[i] = px[i-1]+cos(radians(angle[i]))*radiiX[i];
      py[i] = py[i-1]+sin(radians(angle[i]))*radiiY[i];

      // Check collision of body
      if (px[i] >= width-cellRadius[i]/2 || px[i] <= cellRadius[i]/2){
        radiiX[i]*=-1;
        cellRadius[i] = random(1, 40);
        frequency[i]= random(-13, 13);
      }
      if (py[i] >= height-cellRadius[i]/2 || py[i] <= cellRadius[i]/2){
        radiiY[i]*=-1;
        cellRadius[i] = random(1, 40);
        frequency[i]= random(-9, 9);
      }
    }
    // Draw puff
    ellipse(px[i],  py[i],  cellRadius[i],  cellRadius[i]);
    // Set speed of body
    angle[i]+=frequency[i];
  }

  // Set velocity of head
  headX+=speedX;
  headY+=speedY;

  // Check boundary collision of head
  if (headX >= width-cellRadius[0]/2 || headX <=cellRadius[0]/2){
    speedX*=-8;
  }
  if (headY >= height-cellRadius[0]/2 || headY <= cellRadius[0]/2){
    speedY*=-8;
  }
}
