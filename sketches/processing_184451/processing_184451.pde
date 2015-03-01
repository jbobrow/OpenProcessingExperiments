
//-------------------------------------//
//Purple Points with Light//
//By Brandon Messner//
//02.05.15//

void setup() {
  size(700,700);
  background(0);
}

void draw() {
  for (int x=0; x<705; x=x+10) {
    for (int y=0; y<705; y=y+10) {
    strokeWeight(8);
    stroke(x,0,y);
    point(x,y);
    }
  }
  for (int a=750; a>-100; a=a-20) {
    stroke(255);
    strokeWeight(2);
    line(500,0,a,700);
  }
}


