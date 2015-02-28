
int y = 0;
float z = random(25);
float x = random(50) + z;


void setup() {
  background(255);
  size(400,400);
  smooth();
}

void draw() {
  keyPressed();
  
  //generate random lines w/ varying stroke weight & grey
  strokeWeight(random(5));
  stroke(random(255));
    line(random(400),random(400),random(400),random(400));
  
  //generate random unfilled curve w/ yellow stroke color & varying strokeWeight & opacity   
  if(random(10)>7) {
    stroke(255,255,0,random(255));
    noFill();
    curve(mouseX,mouseY,random(400),random(400),random(400),random(400),pmouseX,pmouseY);
  }
  
  //generate white ellipses at random locations
  if(mousePressed == true) {
    if(mouseButton == LEFT) {
    fill(255,random(255));
    noStroke();
    ellipse(random(400),random(400),x,x);
    
    }
  } 
  
  //reset w/ white background
  if(mousePressed == true) {
    if(mouseButton == RIGHT) {
      background(255);
      noStroke();
  
    }
  }
  
  //make background black, reset black
  if(keyPressed == true) {
    if(key == ENTER) {
    background(0); 
  }
 }
 
 //generates random bezier curve from position of mouse
 if(keyPressed == true) {
   if(key == TAB) {
     if(random(10)>5) {
   stroke(0,0,255,random(255));
   strokeWeight(1);
   noFill();
   bezier(mouseX,mouseY,random(400),random(400),random(400),random(400),pmouseX,pmouseY);  
  
      }
    }
  }
}

