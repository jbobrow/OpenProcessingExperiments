
float fil; 
float filPercnt;

void setup() {
  size( 300, 300);
  smooth();
  
  fil = 0;
  filPercnt = 0;
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  rect(50, height/2 - 20, 200, 20);
  if( fil > 200) {
    fil += 0;
  }
  if(fil < 200) {
    fil += 0.66;
  }
  fill(255);
  rect(50, height/2 -20, fil, 20);
  filPercnt = int(map(fil, 0, 200, 0, 100));
  text("LOADING "+filPercnt+"%", 50, height/2-30);
}

void mouseClicked() {
  if( fil > 199) {
    fil = 0;
  }
}
