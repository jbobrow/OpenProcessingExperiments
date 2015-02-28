
// For puff head
float headX;
float headY;
float speedX = .9;
float speedY = .9;
float mx;
float my;
float poscount = 0;
int diff=0;
int tired = 255;
int r1, r2, g1, g2, b1, b2;

// For puff body
int cells = 255;
float[]px= new float[cells];
float[]py= new float[cells];
float[]radiiX = new float[cells];
float[]radiiY = new float[cells];
float[]angle = new float[cells];
float[]frequency = new float[cells];
float[]cellRadius = new float[cells];

int sw = 800;
int sh = 800;
  size(800, 800, P2D);  

void setup(){
  
  // Begin in the center
  headX = width/2;
  headY = height/2;

  // Fill body arrays
  for (int i=0; i< cells; i++){
    radiiX[i] = random(-7, 7); 
    radiiY[i] = random(-4, 4);
    frequency[i]= random(-9, 9);
    cellRadius[i] = random(1, 50);
  }
  frameRate(60);
}

void draw(){
  background(0);
  noStroke();

  mx = mouseX;
  my = mouseY;
  if ((mx==pmouseX) && (my==pmouseY)) {
    if (poscount < tired) {
       poscount++;
    }
    if (poscount == tired) {
      noCursor();
    }
  } else {
    poscount = 0;
    cursor();
  }
  
  // rainbow color sequence
  if ((r1 == r2) && (g1 == g2) && (b1 == b2)) {
    r1 = int(random(0, 255));
    g1 = int(random(0, 255));
    b1 = int(random(0, 255));
  } else {
    if (r1 < r2) { r2--; } else if (r1 > r2) {r2++;}
    if (g1 < g2) { g2--; } else if (g1 > g2) {g2++;}
    if (b1 < b2) { b2--; } else if (b1 > b2) {b2++;}
  }


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
        cellRadius[i] = random(1, 100);
        frequency[i]= random(-9, 9);
      }
    }
    // Draw puff
    diff = int(abs(mx-px[i])/2)+int(abs(my-py[i])/2);
    fill(255-i/(diff+1)-r2/5, 255-diff+poscount/2-g2/5, 128+i/(diff+1)+poscount/2-b2/5, 5);
    ellipse(px[i],  py[i],  cellRadius[i],  cellRadius[i]);
    // Set speed of body
    angle[i]+=frequency[i];
  }

  // Set velocity of head
  headX+=speedX;
  headY+=speedY;

  // Check boundary collision of head
  if (headX >= width-cellRadius[0]/2 || headX <=cellRadius[0]/2){
    speedX*=-1;
  }
  if (headY >= height-cellRadius[0]/2 || headY <= cellRadius[0]/2){
    speedY*=-1;
  }
  if (poscount < tired) { 
    if (headX < mx) {headX+=(mx-headX)/30;} else if (headX > mx) {headX-=(headX-mx)/30;}
    if (headY < my) {headY+=(my-headY)/30;} else if (headY > my) {headY-=(headY-my)/30;}
    fill(255, 255, 255, 127);
    ellipse(mouseX,  mouseY, 10, 10);
  }
  
}
