
//Globals
int drop = 0;
int start = second();

//Setup
void setup() {
  size(800, 1000);
  noStroke();
  smooth();
}

//Draw
void draw() {
  background(255);
  fill(0);

  if(second()-start <= 5){
    rect(width/2,(height/2)+(drop/2), 20,20);
    drop++;
  }

}

void mousePressed(){
  drop = 0;
  start = second();
}
