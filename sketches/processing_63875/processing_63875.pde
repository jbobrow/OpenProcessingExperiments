
int cBreite = 10;
int cHoehe = 10;

void setup() {
  size (500,500);
  smooth();
  
}

void draw() {

  background(0,0,255);
  frameRate(20);
  fill(cBreite,255,50);
  ellipse(250,250, cBreite, cHoehe);
  
}

void mousePressed() {

  cBreite = cBreite + 5;
  cHoehe = cHoehe + 5;
  
}

 
void keyPressed(){
  cBreite =  10;
  cHoehe =  10;
 
} 

