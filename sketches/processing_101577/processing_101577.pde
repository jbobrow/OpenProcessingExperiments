
int counter=1;

void setup() {
  size(1200,800);
  background(#FFFFFF);
  fill(255,255,255,100);
  noStroke();
  rect(0,0,width, height/6);
  rect(0,0,width/6, height);
  rect(5*(width/6), 0, width/6, height);
  rect(0,5*(height/6), width, height/6);  
  fill(0,0,0,(height/(mouseY+1))*20);
  frameRate(25);
  strokeWeight(2);
  stroke(0,0,0,20);
  
}

void draw() {
translate(random(width/2), random(height/2));
rotate(2*PI/random(5));

  rect(random(mouseX), random(mouseY), 2*mouseX, 2*mouseY);
}

void mousePressed() {
  if (counter%2 != 1){
    stroke(255,255,255,(height/(mouseY+1))*20);
  fill(255,255,255,(height/(mouseY+1))*20);
  }
  else{
    stroke(0,0,0,(height/(mouseY+1))*20);
  fill(0,0,0,(height/(mouseY+1))*20);
  }
  counter = counter+1;
}

void keyPressed() {
 if (key == ' ') {
 noLoop();}
}
