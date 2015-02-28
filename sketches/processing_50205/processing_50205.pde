
float rotValue= .02;
float rotInc=.05;

void setup() {
  size(600, 600);
  smooth();
  frameRate(30);
  background(0);
}

void mouseClicked(){
  background(0);
}

void draw(){
  translate(width/2, height/2);
  drawStars();
  drawPlanet();
  
  
}

void drawPlanet(){
    int numStars=10;
  int grid_size = width/5;
  
  for (int i=0; i < numStars; i++){
    pushMatrix();
    fill(i+(mouseX*random(50)), i+(mouseY*(random(50))), random(mouseX,mouseY));
    rotate(rotValue*(frameCount));
    float x= map(mouseX, 0, width, 0, 1)*(grid_size);
    float y=map(mouseY, 0, height, 0, 1)*(grid_size);
    rect(i+(x*2), i+(y*2), x, y);
    fill(random(200),random(200),random(200), random(100));
    ellipse(i,i, 400-(mouseX/2), 400-(mouseX/2));
    popMatrix();
  }
}
  
void drawStars(){
  int numStars=50;
  int grid_size=width/3;
  
  for (int i=0; i<numStars; i++){
    pushMatrix();
    fill(random(200,255), random(200,255), random(200,255));
    rotate(rotValue*(frameCount));
    float x=map(mouseX, 0, width, 0, 1)*(grid_size);
    float y=map(mouseY, 0, height, 0, 1)*(grid_size);
    ellipse(i*random(-x, x), i*random(-y,y), random(3),random(3));
    popMatrix();
  
  
  }
}

