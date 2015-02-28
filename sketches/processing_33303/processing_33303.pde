
int x = 0;
int y = 10;

void setup() {
  size(600,600);
  noStroke();
  smooth();
}

void draw() {
  background(0);
  for( int i = 10; i <= width-10; i+=25 ) { 
    //do stuff
    for(int j=10; j <= height-10; j+=25) {
      ellipse(i, j, 20, 20);
    }
  } 

//  fill(random(255));
//  ellipse(width/2, height/2,100,100);
}

